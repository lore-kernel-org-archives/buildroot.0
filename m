Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E689CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC9E42B62;
	Mon,  8 Sep 2025 10:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kUlW1Ek5qVS; Mon,  8 Sep 2025 10:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE07425FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE07425FF;
	Mon,  8 Sep 2025 10:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 047551D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6FE841527
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dndsUdI2DOu6 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3F041516
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3F041516
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D63D83B51; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:25:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 83e1fd35648bef3475e9994e895bcac0889f423e
X-Git-Newrev: b6aad354dc64369d5118b1f06a85aea109eb34a9
X-Patchwork-Hint: ignore
Message-Id: <20250908105918.3D63D83B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] toolchain/Config.in: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
Content-Type: multipart/mixed; boundary="===============8415104256785381779=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8415104256785381779==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b6aad354dc64369d5118b1f06a85aea109eb34a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This will be needed to work around a GCC bug affecting python3. The
bug is reported at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567.

This bug affects GCC at least since 6.x, but we couldn't test earlier
versions, so we simply assume all GCC versions are affected. Even GCC
15.x is still affected, as reported to upstream GCC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1838d8e5ea7e5c3497cefc16980da330c38e7967)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 89eaa7b618..2d17860e30 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -243,6 +243,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567
+# error: unable to find a register to spill in class ‘R0_REGS’
+# The bug exists at least since gcc 6.x, so we are assuming it affects
+# all GCC versions.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_121567
+	bool
+	default y if BR2_sh
+	depends on BR2_OPTIMIZE_2 || \
+		   BR2_OPTIMIZE_3
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 

--===============8415104256785381779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8415104256785381779==--
