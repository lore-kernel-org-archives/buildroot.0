Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE1CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC70880D76;
	Thu, 14 Aug 2025 19:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFb_Fdj4cb1v; Thu, 14 Aug 2025 19:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB1AF80DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB1AF80DD9;
	Thu, 14 Aug 2025 19:56:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DFE1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE8A40479
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuzy4FYfXWoi for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB542404A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB542404A8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8E3487606; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 79a013c5eab26a0bbbaadc9c766b228804ecb3dc
X-Git-Newrev: 511f787734a97d06d8fb870f63a730def6bbf610
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.B8E3487606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpuinfo: add
 thread requirement comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=511f787734a97d06d8fb870f63a730def6bbf610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When the package was introduced in [1], it lacked a kconfig comment
indicating that it requires a toolchain with thread support.

[1] ea1cc1af55 package/cpuinfo: new package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 38107ec40c4a66ed67d81a8e2bffd2673096a15a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpuinfo/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
index 257480f068..64477c2bd7 100644
--- a/package/cpuinfo/Config.in
+++ b/package/cpuinfo/Config.in
@@ -15,3 +15,6 @@ config BR2_PACKAGE_CPUINFO
 	  host CPU.
 
 	  https://github.com/pytorch/cpuinfo
+
+comment "cpuinfo needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
