Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2F4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF9582EE1;
	Tue, 17 May 2022 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeKnYXB7e8cK; Tue, 17 May 2022 20:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C5C825B1;
	Tue, 17 May 2022 20:24:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFD71BF995
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E6038186B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5H9__xhzgqW for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:24:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92E5181852
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:24:25 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r27so72796iot.1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k32TxXZK21UwUFJYJjGwoTGsquqeD0oRxZv3q879130=;
 b=hmXYpHdQeao7sZfSSQRMuj2uwiPCMh1GM/8uFvAEAgaNvw6PQJFo2B982wHAsFpv3y
 hp1UrJYBWnawEUDwawH0mf+M9r5i/ttugwNy/5hJoyKIgTRQYV9PjUSRCt635oVecf0T
 qzL/cbQj1Owi1K8bEO40CBa0XeVvZ+HBEdNaWM8EVo3pk6Gdw7mUR8zCVx3GR7jnYXQs
 Nvyyd5lOoiSlKkY81lU2hjj7jg92jhlengQKdJGDL3SdFZ2sJZZyTANwd7DQgQLmcjcu
 PTh0MFBxHbgiZwU89Gvi4M+objwLUJHPTg5iAAynAxfA+olNao1RIqEQip0lvP3iUURY
 A6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k32TxXZK21UwUFJYJjGwoTGsquqeD0oRxZv3q879130=;
 b=DwAhuhHe/xlMj2UFPpYSJz1lnQnYZ4jfMeGMQRkENt1Wt/TKJT1YGiFmatQEn9kjCp
 0Fy4k+F9kHky4pr61i+kgSFfWrG+AMxdlCPVEqpB87rtCSaLH/jSznNveLD6i7sNAOlW
 HVXX3xmSHhiw30TpQWSdeWnT75zNOSFcGJJDpGaM7O3RdqN78/p58vvjz9sut3u/qcsY
 nB97QisDwMpG0rgdr8vLQ/PkHiaF1sMPaBuZ4IbD5IFU4MLZlNX/F6kebbNEdvtyNDnz
 NXsd63xfADXWymWhAFQZi0Afr85xgHochHzSM0MYqCshouQv+Kdz8VlmZ0/tY4pSGaRC
 39jg==
X-Gm-Message-State: AOAM5310Qi5Mb5Ljwi+afnFeg65375laHjPJbMR+Y13U3e5pAPOfz2WJ
 wNztALz1fVJqTdumKZH8Ycc8SNLQwEo=
X-Google-Smtp-Source: ABdhPJz9tL9Qf3nchnvXo2Ep9ALQGtACq4D+RWW9nGY7fbGaz1FIhxJWme3rlH7ZmFxj3T20M9tcJw==
X-Received: by 2002:a05:6602:14c2:b0:65d:d998:680c with SMTP id
 b2-20020a05660214c200b0065dd998680cmr10457562iow.132.1652819064486; 
 Tue, 17 May 2022 13:24:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056638060400b0032b3a7817c1sm12900jar.133.2022.05.17.13.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:24:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:24:22 -0600
Message-Id: <20220517202422.1522574-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to version
 1.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License moved and hash changed due to rename and removal of authors:
https://github.com/wtforms/flask-wtf/commit/d37c22b42202ccf4c8f96c445ceafe72c4c5ed46

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-wtf/python-flask-wtf.hash | 6 +++---
 package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 848d6d7783..01e4290950 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  920a5a476ecfb751952b5048cc05fcf8  Flask-WTF-0.15.1.tar.gz
-sha256  ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc  Flask-WTF-0.15.1.tar.gz
+md5  d86dbc0befe30fd577a623a51689b900  Flask-WTF-1.0.1.tar.gz
+sha256  34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9  Flask-WTF-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350  LICENSE
+sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index e2078103f5..97291e1b26 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 0.15.1
+PYTHON_FLASK_WTF_VERSION = 1.0.1
 PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/d9/38/d4798dd05be711d666e1befb08b1d3db57bd146d1a14d15657f60c88b446
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
-PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
+PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
