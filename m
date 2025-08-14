Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C349CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA8B607CB;
	Thu, 14 Aug 2025 20:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BlusSps6-7y; Thu, 14 Aug 2025 20:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2474660738
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2474660738;
	Thu, 14 Aug 2025 20:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E62E1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B51DC80C93
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUNtGLXSO8MF for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171EF80C8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 171EF80C8A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 143308758C; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:16 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2d817766c344173cc401949aecc057c602a4c3e1
X-Git-Newrev: 31e1546b801b45bb1d5845d210965b1f5ea6d384
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.143308758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/cpuinfo: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=31e1546b801b45bb1d5845d210965b1f5ea6d384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
