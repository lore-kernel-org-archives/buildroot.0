Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11939C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 04:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9685641645;
	Wed,  2 Feb 2022 04:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iX2h8_oUeX6x; Wed,  2 Feb 2022 04:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E504164A;
	Wed,  2 Feb 2022 04:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369B71BF380
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 240414011C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wS9XdNqmoOLq for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 04:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B1F140019
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 04:20:26 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z4so16056485ilz.4
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 20:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+vB1Sq/Qw1lAmIGFewAxlaaZMLDoMkkvm9LYcqcgnU=;
 b=YgQIkb/XtEWZMFuqF8GLFY4rIiL6EAjgWra/q+ruW50LotSh6LsuVeNRWTX0+wMyno
 l/H7Wo7aFkYHH1glxoE4PgrvTwAqkoilgqyAkI+bBQcCVYloPuhumbDh29hbo2FBIuWy
 T74XQdQID/A2cZ3eSkebw0T5joYB2iQb8ZUeo6YEfbmD/cJtJx3bJm4TFG4nR3DdEzUY
 qK0lU9BU782Rwh6CrvLNVpFeyWJCvWpjX361M+55BUSaEi7xCVftiukV/QBo8CNUSFGF
 7fQ6k8xPD2qr+0+vRqQO4hASHkyV7bRYcr+m37RymHvHWjs8m9+dvDqWdC7aIbEPQ5hj
 RhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+vB1Sq/Qw1lAmIGFewAxlaaZMLDoMkkvm9LYcqcgnU=;
 b=ciEi5HCZGxv1C0o8B2svWzcdBPWMhhBAwJH0Y2vTVPiNwM5JMacQTS5JFAJCAi8Ukk
 xPXBBPF/aqVN1tcTSbxmvA9+YJJ+gTEDSrMY3owbs2iGsuoM24xnsD6ZWQNBkpPJ61RH
 +Xzl3g/bqzxig3DU5h60B00A3D7AQZlklQyG1sulsZKQLJyUqb2LrxpnpZnmBoli0a96
 Wa5DLuYjubxPYeSSG63lIq/3G6ib4x8YS82f72Rw0y0YrdeqfOHcZjYO4MZ2ieqG9+Nk
 NxCZfeQbixTygO60oi9Jh+BwZyFkY/P6QFSc0uBB7riSpkc0JcHxEK37HHHJlRxe4Q1v
 w95A==
X-Gm-Message-State: AOAM530Sxz+Cg/yVfj0IOFtSu8IolSspMw9Of+j2VjvVpiGiDVnACDAk
 VYzy7TBZSfRqyJ7v+DDoNurey4Lgqg0=
X-Google-Smtp-Source: ABdhPJx9PUqYsm70kUhLQo+NmP+1rafp5o1NgxgNH9TiqllZmtXC5nm0achN9LnsnbB8IvBcK/nshQ==
X-Received: by 2002:a92:d98b:: with SMTP id r11mr17547496iln.307.1643775625929; 
 Tue, 01 Feb 2022 20:20:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id e5sm20166610ilq.9.2022.02.01.20.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 20:20:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 21:20:24 -0700
Message-Id: <20220202042024.2202751-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 6.4.2
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
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 22b9afd2c2..934c505442 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  32918d8ac566360c21411e0b3556c695  setuptools_scm-6.3.2.tar.gz
-sha256  a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2  setuptools_scm-6.3.2.tar.gz
+md5  b4e02bf8e62ed49142ea7b42a68671d7  setuptools_scm-6.4.2.tar.gz
+sha256  6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30  setuptools_scm-6.4.2.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index b2990a56cb..8c5229e1a6 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 6.3.2
+PYTHON_SETUPTOOLS_SCM_VERSION = 6.4.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4b/0d/ecb9595fae02467edba5023eb8a23c688d2b438a6a8d1a9e2b8649faf23d
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4a/18/477d3d9eb2f88230ff2a41de9d8ffa3554b706352787d289f57f76bfba0b
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
