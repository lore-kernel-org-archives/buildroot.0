Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BD7CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5987581EB2;
	Mon, 19 Jan 2026 10:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYbMZ51xF5_i; Mon, 19 Jan 2026 10:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A9681E2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816875;
	bh=1z0ZQtAFXyqfbK+X29XMwwmXmwWGZ8SeR8TlV7ZVqbM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GC3RmulQyIFNCiUtB5vHZmFgd8tOVIXTViN5IhGl+rxBU27bPv0L0MuAzG2sY8Aqy
	 KJHz8Mw+2OHiWkiawjBBwHa8Z5lTXSOd12kn+OfV/DcBHGTUh9JgKnPZL1EvLumKAG
	 MYGpa7LL1H2HmDJ+Hfqs8DUrOECky3KmOKucKWHnmBKfE7XyabDhVXfaZjIGiExiA4
	 Cl6eDUk5dMH8srH3tk11oSAzBACeBEo0uJcm5mXT00iM9VK6au2BsDEvL/3xqWTSFw
	 QHwZqqU18DPOSj8nBv3xXKSKYfPYlqHbjdmGh3d41LDYIskfnTEIIAKz2hCSUtesvA
	 YHCdwv56200pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A9681E2E;
	Mon, 19 Jan 2026 10:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC57160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2644406DB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTxy9RVUBoPZ for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1ED5406DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1ED5406DC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F07EA88587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:31:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9eb3839f23841ab8d11673096d1be9458cee47f9
X-Git-Newrev: b9bb73c0eb282b9e7e1f6e425970a7b3a0255dcf
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.F07EA88587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/bitcoin: broken
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
Content-Type: multipart/mixed; boundary="===============6773262026990762550=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6773262026990762550==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b9bb73c0eb282b9e7e1f6e425970a7b3a0255dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index 3240462f56..eedb0897a5 100644
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

--===============6773262026990762550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6773262026990762550==--
