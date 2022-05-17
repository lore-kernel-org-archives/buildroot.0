Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3844760B20;
	Tue, 17 May 2022 20:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4a1OPjCQHw3T; Tue, 17 May 2022 20:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4363960AFE;
	Tue, 17 May 2022 20:28:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF021BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C73340143
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pwcwgC4h4oF for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:28:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DCDB400FB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:28:08 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id 3so138532ily.2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nv2++6FQZZSyF6Le5JrCdywYppLZlF/c9B7qPd4Oclg=;
 b=Eozz0KKtfZrAOYYqKEfgNMhcqDEk+5HgLZFtP/VZwS79OrJD4DzYvFvFU2dqzTiFfw
 74PyzPbn5EImhi2wIXKAB/awWlefqqKrFVOelzoNpKqJwcDTG6jMyl4h+HfdjcFoGF9C
 of/d183fBMOQkG6RkbERat5O54aiBxDNHg1juGOv7SxPX3hHxSYSsnAbrOxhHzOSbfSz
 LqKVWPk9lw9qMQRvNOSiUxbxDyyM4XH+qJs3kKRhyjsIi9+LD3i9lCxdf/FmdM8lgCAu
 Ovc3Oq9fmP2606UPmw/fpIfjQ/i5FsJ72BPmP6uU5PlmCByfj0ediax3RGPQXPkANPz8
 0AnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nv2++6FQZZSyF6Le5JrCdywYppLZlF/c9B7qPd4Oclg=;
 b=4jGyhKnEhJ/XZXTsh+kwVhX4jMcNoBvP0P9PpIgYc9Mz9QCQRDy1YltcmMGl6qBzgW
 iAflWyJVaJ/KuS/ywBTRn8+ZUh4p9p2RK+z99uxYK2x3UkdFCo+4prhjx6x8ywRAn0Hc
 uPa9NfqkuHtsqVXXxa5wMEch2+UYoNdp6j0SAJcxND8FvX0dClDxVmBHhpxf2l300ToN
 M1JvtDgAfdNwHPXtmQi/CywDdCHrLmpu6OgYKQ5k6DidMbDgxuRiiF0J2p4/sUXfuPDR
 71Tj17HEvUFtq2mseveBzo+i3I7dqKprmZmX52G5VbPpPskxfRhwv9/C7HjLDQl7gsyM
 6g3A==
X-Gm-Message-State: AOAM533lKXLfcTVsPX7SuHa+fW++rCZyMpjqwgvT0S7K8zYePcso54uv
 U0e5E70gTxxpZ0k+s1HcvCL8SyH9E6w=
X-Google-Smtp-Source: ABdhPJx+yjaMfvKqw31qQRL9RuGZH4jESip67jG9UunBPKrgI7K3wwBXr3hxFxP/XFO2pVJ21L+s8A==
X-Received: by 2002:a05:6e02:e04:b0:2d1:d92:7981 with SMTP id
 a4-20020a056e020e0400b002d10d927981mr8387185ilk.310.1652819287260; 
 Tue, 17 May 2022 13:28:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 c7-20020a0566022d0700b005e1729b55ccsm84723iow.1.2022.05.17.13.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:28:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:28:05 -0600
Message-Id: <20220517202805.1524501-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump to
 version 2.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash    | 6 +++---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index f1fe9775f5..4c2a701eb3 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
-md5	1f5781cf3e1a2b1aabda47a5b20d2073  Flask-SQLAlchemy-2.4.1.tar.gz
-sha256	6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d  Flask-SQLAlchemy-2.4.1.tar.gz
+md5  dcb6b62248ced71dab183f2cb2778583  Flask-SQLAlchemy-2.5.1.tar.gz
+sha256  2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912  Flask-SQLAlchemy-2.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index c6d0094b41..b1d00ad6c0 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 2.4.1
+PYTHON_FLASK_SQLALCHEMY_VERSION = 2.5.1
 PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/52/7a/35bacbedafdc652d5198b80eb22eacccae0c97a49740a45da828b05cc37b
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/35/f0/39dd2d8e7e5223f78a5206d7020dc0e16718a964acfb3564d89e9798ab9b
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
