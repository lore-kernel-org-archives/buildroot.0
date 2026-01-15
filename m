Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C1CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D508B81CBA;
	Mon, 19 Jan 2026 09:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhmji8ORynYh; Mon, 19 Jan 2026 09:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09ABC81CE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816746;
	bh=6eTeevbR8Q85iXc5gX99hQO3VCMmoiXJ1Gas+lYl0RM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JwD9+88zLDs9lP8rcIl/y4foTvJ97Gx3IdurYR1nSHLhS1ew6y0nImbS0wBGCZSnU
	 vi5aS2XyscegkK6MKvRHEqKS7AMotOYOZ5vhMlVmsZMaKS09QbC6XcshRBk7kOk/Vy
	 0RxYeRrzjY2jsl87DzP7Y6j/Fi+CfZFNJMk7o8+ZG3OyOhELotiT3rRhd2gEW15oK/
	 KoRsLGpzR+apNnPRuqq94m65KsEp1UkaUtW4Ztfy1I8ncxqQjCyVGBBJSJsPo817Op
	 G1wjF0HLhsAOdDlBV77JgUKRoN91MC75N9O99pj0YVNAK62VxTIPpxj/Nd7312jZor
	 O2exWcILyUG/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09ABC81CE3;
	Mon, 19 Jan 2026 09:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14EB4160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8299A40CE7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PfnCHHJfXYL for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8172640CEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8172640CEC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F4298867D; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:31:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 65c79510a982e23a0bec71c5d972416b83b05540
X-Git-Newrev: d64f13754f962920201362011aeeb5c12a307008
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.7F4298867D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bitcoin: broken
 on m68k
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6512513250670064808=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6512513250670064808==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d64f13754f962920201362011aeeb5c12a307008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit a3a88ff1c85ba0067af1028bc232f8f61b628979 bumped bitcoin
to version 26.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/b8401c3281978beed6198b2f9782b6a8dd35cbd7
causing an assertion on m68k:

/home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
 error: static assertion failed: Units of size ELEM_SIZE_ALIGN need to
 be able to store a ListNode
   92 |     static_assert(sizeof(ListNode) <= ELEM_ALIGN_BYTES, "Units
      |                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
 of size ELEM_SIZE_ALIGN need to be able to store a ListNode");

/home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
 note: the comparison reduces to '(4 <= 2)'

To fix the problem we disable bitcoin on m68k.

Fixes:
30.0: https://autobuild.buildroot.net/results/268/2688e4a2aa8dc34343f0218fd6727d0ae3adb132/
26.0: https://autobuild.buildroot.net/results/fb0/fb05401c7de289e0f87f5c9e3a7f92f5589b590b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 555114a0ecae0a62a4d4a5de9327eeaa0543eb53)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bitcoin/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 425e99ce8b..8a36ab4f86 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -6,6 +6,10 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	# support. BR2_TOOLCHAIN_HAS_ATOMIC does not provide a
 	# size-level granularity to express this dependency.
 	depends on !(BR2_arm || BR2_armeb) || BR2_USE_MMU
+	# error: static assertion failed: Units of size ELEM_SIZE_ALIGN
+	# need to be able to store a ListNode
+	# note: the comparison reduces to ‘(4 <= 2)’
+	depends on !BR2_m68k
 
 config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"

--===============6512513250670064808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6512513250670064808==--
