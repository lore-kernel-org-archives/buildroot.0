Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D58C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C60340863;
	Fri, 11 Mar 2022 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqwyQekapStY; Fri, 11 Mar 2022 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC42B4055D;
	Fri, 11 Mar 2022 21:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF49E1BF38E
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDB664055D
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PepfpHLBUGqS for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 21:39:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1292F4049C
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 21:38:59 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id k25so11582823iok.8
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIAf0WK9HJ96srZWb0YRmjKOF6XiqCzUqvxOLXpvjZo=;
 b=Jht3v75HEz2z/PI1ijJgpjkkKgO7GyJHaWUFQysCdMtblpNhXeMIYkUvQ25SkjNy08
 2EIEOdN8eX7hqCsH818d0gtuF71biPuCKCZPhihqPHJJ+fhHL0vv/lGQ2aVXV7RDrJby
 4lDlyNNqRSf99Fa81DrNVICrrGkHCftopYqVnuPepTQ5by9RcS3kAbFeoBv8pcVM5LNr
 IZ/oMGpPeC6yzUp4rRjUiLdu9jYv+gVAFQdU5+zZKANzU97JrYVMa79SqM2/GE+FfvS1
 fScEpW8mXXPBvtSPPOKEBQ3vFqC6EsgYIIeeHWf828XiP6Zff9Jbrn47HKCOgKZZeXSx
 Wysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIAf0WK9HJ96srZWb0YRmjKOF6XiqCzUqvxOLXpvjZo=;
 b=JcP0by9fQmH21PLtIjynnKEEjqFjU8cmgYfza92GDUdSihnzeqLBKqngWfJP1h0pGo
 uHxlWp3WpPFckH5hxerFRV08ghB0x1Gm4UHTfPYsuaBgJ5/F6BaNrg/B20fzk+XYIVKc
 1k/pX4k12uAyyu8DMcrgedWIABiZPcP9/PnzS2YRCU6pgFkyVhkM63upff3fPft3sU7u
 E2A3tmPayXgP9+4kcVqiW9+75MfrKNTN19N1OrEGzuMCnPXlDRC8NZQB8OuFC7SD9TJr
 XKPAo0m9ZOYSiPdPKCt1dvSe92g5VihAczc8EIVqML7ARuISiZJPY31aNSlSn3wCV173
 U2IQ==
X-Gm-Message-State: AOAM532Q+aZCCgE1tMbi/o5RzpLEHsRmENHjqABd1OWGgxfTzfeC2+CK
 CUtU93KDTMsnKWkCK2CBl8dLYG9TsMU=
X-Google-Smtp-Source: ABdhPJz4xPzm7EtlmSJb/6L4VbGOodc5CvXclVhcwqWTqGuOnpG6yATOA/QLxtKZ/PTQt2dcgKCMJQ==
X-Received: by 2002:a05:6638:1382:b0:314:72f6:18d7 with SMTP id
 w2-20020a056638138200b0031472f618d7mr9928051jad.25.1647034739017; 
 Fri, 11 Mar 2022 13:38:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 f1-20020a056e020b4100b002c68e176293sm3556525ilu.87.2022.03.11.13.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 13:38:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 14:38:57 -0700
Message-Id: <20220311213857.3962466-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-installer: bump to version
 0.5.1
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
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 68af457664..543bd0fa62 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  cf7b8f470620c54f2d28167fc80542a7  installer-0.4.0.tar.gz
-sha256  17d7ca174039fbd85f268e16042e3132ebb03d91e1bbe0f63b9ec6b40619414a  installer-0.4.0.tar.gz
+md5  bf17db5e6b58c4cfa33642f5348d3814  installer-0.5.1.tar.gz
+sha256  f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd5ac811953dc5d445  installer-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 82739a8003..862a251415 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.4.0
+PYTHON_INSTALLER_VERSION = 0.5.1
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d51336453e75f76b32de86b336ef26755c64119204f1f5b4388
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = distutils
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
