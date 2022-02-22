Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFE3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 18:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF1040390;
	Tue, 22 Feb 2022 18:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5VxygR8IOzz; Tue, 22 Feb 2022 18:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B969F401CC;
	Tue, 22 Feb 2022 18:52:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B60D41BF376
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0BE60EE0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoNKPpQbo-sk for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 18:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6478160EEF
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 18:52:27 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.16.238])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AA0B5B00579;
 Tue, 22 Feb 2022 19:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645555944;
 bh=49HaqTohGFFUsZZnjfnbT7MX8jmC9mRxMCCL5e+mcNw=;
 h=From:To:Cc:Subject:Date:From;
 b=qMjWCt4Aa6XnrX2IgWCBRgErcdmuFnB3P65Ke0tjN53o+1ym3+vOSycXPCvaZECng
 JNO/NLXhjEBhSXtapIrcKqHXTRV46XXHrbDkkkWcxtiunkvN5Wq7BrzBYYE2GzvOY5
 Wp+yVl8iOnFRclJidSDjqUM0b8ZbkhbtSyl//tkuA5XARAme3SqaOw8/edxoorDaZS
 RCv2Y2tpdAFS4E2C3ixC4FFqA8wMbkBKN4XjvfDqSB0MHzG5CTLCP15GD8vqMa/a3v
 1/JEFs0bj00O5pdF7A3dm5/956Q/fpyk4r+SaYgAvd99DM7WYGS9n8smlHiKC7DxWr
 nBkAWAqJC8yNw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 19:52:06 +0100
Message-Id: <20220222185206.230318-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-distro: bump to version 1.7.0
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.6.0, see:
- https://github.com/python-distro/distro/releases/tag/v1.7.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:
support/testing/run-tests \
  -d dl -o output_folder -k \
  tests.package.test_python_distro.TestPythonPy3Distro
---
 package/python-distro/python-distro.hash | 2 +-
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index e2b3c0a444..8f09197156 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
+sha256  151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39  distro-1.7.0.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index 753e74d020..c69849b7ac 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.6.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
+PYTHON_DISTRO_VERSION = 1.7.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/b5/7e/ddfbd640ac9a82e60718558a3de7d5988a7d4648385cf00318f60a8b073a
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
