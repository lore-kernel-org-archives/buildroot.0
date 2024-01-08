Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B248C47073
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8257383B2A;
	Mon,  8 Jan 2024 20:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8257383B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iT9avoQN83K; Mon,  8 Jan 2024 20:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E427583B2F;
	Mon,  8 Jan 2024 20:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E427583B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA9D81BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DB6405A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DB6405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1RO0RXjrNUD for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:47:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BADE040132
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BADE040132
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF2784BD7; Mon,  8 Jan 2024 20:47:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 21:47:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2b8596873d53c52684e3056b655406aa40b58cc
X-Git-Newrev: f29cbc6ce3def37d7dc4d99fa2a5cbdadc6369e9
X-Patchwork-Hint: ignore
Message-Id: <20240108204729.9EF2784BD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/shim: security bump to version 15.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f29cbc6ce3def37d7dc4d99fa2a5cbdadc6369e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2022-28737: There's a possible overflow in handle_image() when shim
tries to load and execute crafted EFI executables

https://github.com/advisories/GHSA-hmxr-46w2-jjwh

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/shim/shim.hash | 2 +-
 boot/shim/shim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
index a0a9f06f35..c9c489fd2f 100644
--- a/boot/shim/shim.hash
+++ b/boot/shim/shim.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  8344473dd10569588b8238a4656b8fab226714eea9f5363f8c410aa8a5090297  shim-15.4.tar.bz2
+sha256  eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5  shim-15.6.tar.bz2
 sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index 0a6d1527aa..bbef81cfc4 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHIM_VERSION = 15.4
+SHIM_VERSION = 15.6
 SHIM_SITE = https://github.com/rhboot/shim/releases/download/$(SHIM_VERSION)
 SHIM_SOURCE = shim-$(SHIM_VERSION).tar.bz2
 SHIM_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
