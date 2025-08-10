Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C34C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBEF760F1D;
	Sun, 10 Aug 2025 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ac1mcuEzbROD; Sun, 10 Aug 2025 14:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1907260EDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1907260EDA;
	Sun, 10 Aug 2025 14:06:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A157138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C3444014E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFW3vOkSUj-R for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C610400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C610400B8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B44870D4; Sun, 10 Aug 2025 14:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 16:03:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec12da7384b10344cae3835bb4e7aa43e7d01b21
X-Git-Newrev: 99df6586c5a86516b784a28da5388139592888fd
X-Patchwork-Hint: ignore
Message-Id: <20250810140605.41B44870D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: 2024.12 ARC gcc is in fact
 based on GCC 14.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99df6586c5a86516b784a28da5388139592888fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to what was done in
8ef2ba2ec3cedae92c585135d3a1c5ae3e0f63d8 ("package/{gcc, binutils,
gdb}: update ARC version to 2024.12"), the ARC gcc version 2024.12 is
in fact based on GCC 14.2. This can be verified at:

  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.12-release

Which states "GCC 14.2 with ARC patches".

Fixes: 8ef2ba2ec3cedae92c585135d3a1c5ae3e0f63d8 ("package/{gcc, binutils, gdb}: update ARC version to 2024.12")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2149846761..dc0867fa14 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,10 +10,10 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (15.1)"
+	bool "gcc arc (14.2)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
