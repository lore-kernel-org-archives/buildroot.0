Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88DAD5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8261260851;
	Mon, 28 Oct 2024 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeomKnqD4GqZ; Mon, 28 Oct 2024 21:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F1360804
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F1360804;
	Mon, 28 Oct 2024 21:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29664AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE0980B5C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38zDGqjvfGpD for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 856798113D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856798113D
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F26884557; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:33:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f96b4c176f6e9d6c4374a0d322de672bf44c35bf
X-Git-Newrev: 10b4c31b812128f255e8ea58050879b953d58f0e
X-Patchwork-Hint: ignore
Message-Id: <20241028213823.7F26884557@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: remove leftover
 QEMU_IGNORE_CVES from Qemu 8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10b4c31b812128f255e8ea58050879b953d58f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Theses CVE are no longer listed by pkg-stats:

  https://nvd.nist.gov/vuln/detail/CVE-2023-4135
  https://nvd.nist.gov/vuln/detail/CVE-2023-3354
  https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 16cff13d18..a2d164d189 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -17,12 +17,6 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       individual source files.
 QEMU_CPE_ID_VENDOR = qemu
 
-# Need to ignore the following CVEs because the CPE database does
-# not have an entry for the 8.1.1 version yet.
-QEMU_IGNORE_CVES += CVE-2023-4135
-QEMU_IGNORE_CVES += CVE-2023-3354
-QEMU_IGNORE_CVES += CVE-2023-3180
-
 #-------------------------------------------------------------
 
 # The build system is now partly based on Meson.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
