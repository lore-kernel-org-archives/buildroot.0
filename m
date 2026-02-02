Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF6E7DF16
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2D88827F3;
	Mon,  2 Feb 2026 17:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FcBthjmGrC0; Mon,  2 Feb 2026 17:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB668289B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054262;
	bh=EJjBNmZJ9q2oaSMxdy/+JuNUtk6+ZrbUkiyHrFQzCd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rqQC7K7+vVGqsQOs6btRIM7VM7C2UCaLkGuvhJZC9E/z/PRxTTr2in8v2OSf3GPnU
	 cfDyPi0svGrivtQbdsAxecs/PGUtAYSHNJcPXoPwCJubFTZ0/lt3SMgBNzXdUE6Kb0
	 C+khVKlxYloEguGWQ5wgZKP3ESkuydUHTV70pEqm800Szx//ioSIC2aqOf06Nju/xj
	 4FhnrfXEau1y1wL18vlHdcT+4FhNwv/2/s23zDtfD1+2ZwHp40zVBOoVsYDStlRYjn
	 3AeGQSBA1uJLOibt2f0S1OcXfuiqNOt3CHY8KvZ1byfq6uzHiiGAJ80UVq8MnBAFik
	 aZ0AaxI0CoqAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB668289B;
	Mon,  2 Feb 2026 17:44:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CAB3149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C7E6077D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU2L7OXsjiMo for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FCD6077A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FCD6077A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE4A384C96; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77670c33d24b7766bf3d7a090510e2863180d286
X-Git-Newrev: d9999aeec913bbf8dedf96d8dabf07591838a0aa
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.CE4A384C96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] at91bootstrap3: Add support for custom
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9999aeec913bbf8dedf96d8dabf07591838a0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AT91Bootstrap3 package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Note that version 3.X of at91bootstrap didn't have an open source
license and no license file either. Keep that behavior.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/at91bootstrap3/Config.in         | 10 ++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 35bdb28162..b2f3e4e9b1 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -66,6 +66,16 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
+config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
+	string "AT91Bootstrap3 license files" if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "LICENSES/MIT.txt"
+	help
+	  A space-separated list of license files related to the
+	  AT91Bootstrap3 kernel package.
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 4bbe7cc718..2ed34f3de4 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -25,11 +25,12 @@ endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE = MIT
-AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
 AT91BOOTSTRAP3_LICENSE = Atmel License
 endif
 
+AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
+
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
