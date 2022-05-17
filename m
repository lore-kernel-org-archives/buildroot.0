Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A49C83FB1;
	Tue, 17 May 2022 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKXbBQn2prA6; Tue, 17 May 2022 22:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D0583EAA;
	Tue, 17 May 2022 22:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4501BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5894983EAA
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahtqJAzpZllV for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 22:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 760FE83E90
 for <buildroot@buildroot.org>; Tue, 17 May 2022 22:02:57 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id s23so278206iog.13
 for <buildroot@buildroot.org>; Tue, 17 May 2022 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc+RAXh5sppetbo6dKHt3ybZA/DwrWON1FV9WNI+3mY=;
 b=DxtGPgxc7/CUCEeC1BY2z/GG/JG1LMx939ANzfPSP+Y/8gUBHO08L+oUhLpDueauRn
 K8KyM/QeCPvZX7/It3uRyo69hR+8gniO1vUUVmt0K4PQ7YEvZsnr4MgUbrIx2G2RBMGA
 SybNNw785aU7j3KRqBtjRMwMcPSv+loiF8PvadZ84D1HtTsN4JTNTBHLygQYkWoTzUXm
 DIrSMI6L5mgxsh501lTiHB4bSqv1u4frNY9Dtj2a++h+rBBfvN2MTTZxi2Ujp+vcLCE7
 rPkmoXwkJnur6b8CTiuvY1TqUuh9er18l1jrfs2UY6RDfo/fL25JlbmAgJgjk1igDw3u
 WH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc+RAXh5sppetbo6dKHt3ybZA/DwrWON1FV9WNI+3mY=;
 b=MIjiBbx7qodrfGifWppspDayX5DMSj9fNsUpJSvkqeWQKydicexArWAUXx508xACo2
 4HTc1EhcVwdG8QsD0n4qiCXWDXZim5LfHRZ9uNO4XTaZ5kwOqF9D8rEqsbN7KJeW6uYF
 uAo0t/fLi0gVtsMfSlwGvlDGRIwmGINLyAnhfKzFVF0ZYpjfvsy8auCEXGlplZMezUQZ
 wxFq1NgsSjQm46ogBrTNOAxzeyqhYuOSWodvqn0msx07rUHw37ppNYUHZkal4dCTL3CR
 ZZgQD73TZaBwu7Dy+nHCeSJo3RefQxDP2wqd352K5SZ7JdG0QYiEbcMMo5JBrEY8AsLC
 XZgA==
X-Gm-Message-State: AOAM532JzDsjiT9sSsjt4sNgwaTlSTTbr8FPbKB7P1egg6tC3xKgi2uD
 lqZU7oAJ2p+IFJ+Vi3KiSYE7WaQpot8=
X-Google-Smtp-Source: ABdhPJzZmZCtqW7772ncga6kVN6GvUSkk/8ViGpmqsmdtdRobAzOeT2VYuryq9qYquSnrmSzVxHZjg==
X-Received: by 2002:a05:6638:4123:b0:32e:52ae:e8c9 with SMTP id
 ay35-20020a056638412300b0032e52aee8c9mr3328903jab.26.1652824975989; 
 Tue, 17 May 2022 15:02:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 cn5-20020a0566383a0500b0032b3a78173fsm86154jab.3.2022.05.17.15.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 15:02:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 16:02:53 -0600
Message-Id: <20220517220253.1554088-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-expects-json: bump to
 version 1.7.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-flask-expects-json/python-flask-expects-json.hash  | 4 ++--
 .../python-flask-expects-json/python-flask-expects-json.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
index c023222fd7..e465bcb56a 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.hash
+++ b/package/python-flask-expects-json/python-flask-expects-json.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
-md5  c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
-sha256  0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
+md5  3a77c4059f21e6e37e652c9dbbdc2e7c  flask-expects-json-1.7.0.tar.gz
+sha256  4ef186a86f10572a21af82e549546deda024326628b4a96cd14d3a0f71754d62  flask-expects-json-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt
diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
index 487f15d4e5..55c9bc9571 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.mk
+++ b/package/python-flask-expects-json/python-flask-expects-json.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
+PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.7.0
 PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
-PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
+PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/12/a5/b27cf21d62c2b5a0a32e2f92bde9658e74c34fcc2e004bb0d591f1bf7627
 PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
 PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
 PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
