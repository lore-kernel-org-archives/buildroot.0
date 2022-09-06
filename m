Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBE1ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 11:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129B4417C3;
	Tue,  6 Sep 2022 11:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 129B4417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfLkmVxZCR1J; Tue,  6 Sep 2022 11:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08F8417BC;
	Tue,  6 Sep 2022 11:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08F8417BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B42D41BF9BA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF61600C7
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CF61600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ut8Esh9skmoo for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 11:45:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A40600BB
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 11:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A40600BB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8B1D7814C0; Tue,  6 Sep 2022 11:30:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 13:44:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b42c6b24755170a8eb015b3ea0b25e6d91e037cb
X-Git-Newrev: 73dedf735ed769e8dd2c6057b02ddf9fea0121e8
X-Patchwork-Hint: ignore
Message-Id: <20220906113039.8B1D7814C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: remove host-python-pillow
 build dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73dedf735ed769e8dd2c6057b02ddf9fea0121e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-pillow dependency was needed to build the STMicroelecronics
version during its rc versions but is is not needed anymore in the release.
It is then useless to keep this dependency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/optee-os/Config.in   | 7 -------
 boot/optee-os/optee-os.mk | 4 ----
 2 files changed, 11 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index db7a93c10c..5244700bc2 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -91,13 +91,6 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
-config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW
-	bool "OP-TEE OS needs host-python-pillow"
-	help
-	  Some specific OP-TEE OS versions may use python-pillow to
-	  build the Trusted User Interface feature.  Select this
-	  option if optee-os need python-pillow to be built.
-
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 136c4b2401..38b0d367ef 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -36,10 +36,6 @@ else
 OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
 endif
 
-ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW),y)
-OPTEE_OS_DEPENDENCIES += host-python-pillow
-endif
-
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
