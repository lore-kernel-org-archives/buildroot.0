Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75A8C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F861818C2;
	Sat,  9 Aug 2025 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNcY8nQSra80; Sat,  9 Aug 2025 21:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04D3818E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04D3818E8;
	Sat,  9 Aug 2025 21:58:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6B831
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 706A281429
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhpnIK18lP7M for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88C3813B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C88C3813B6
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1177870D3; Sat,  9 Aug 2025 21:58:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 23:54:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 627af87bda2f14e42b127bb749ddeb4fd4a4f6b2
X-Git-Newrev: 38107ec40c4a66ed67d81a8e2bffd2673096a15a
X-Patchwork-Hint: ignore
Message-Id: <20250809215815.B1177870D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpuinfo: add thread requirement
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=38107ec40c4a66ed67d81a8e2bffd2673096a15a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the package was introduced in [1], it lacked a kconfig comment
indicating that it requires a toolchain with thread support.

[1] ea1cc1af55 package/cpuinfo: new package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
