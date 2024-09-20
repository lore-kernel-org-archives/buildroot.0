Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7634BC78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4825142E12;
	Fri, 20 Sep 2024 10:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mysaa8I4EIvZ; Fri, 20 Sep 2024 10:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B310C42D71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B310C42D71;
	Fri, 20 Sep 2024 10:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE941BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 553C584C42
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uPJ-OfgWqPK for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576C384CA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 576C384CA4
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543F884117; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:48 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e7ae0ea2d0aa9fd8de3a83a7fbef7dfed260a590
X-Git-Newrev: ecd1646cc8295a65bea08fc615361024a0aca069
X-Patchwork-Hint: ignore
Message-Id: <20240920103607.543F884117@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/nvidia-driver:
 fix targeting typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecd1646cc8295a65bea08fc615361024a0aca069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 812bb30412cb87f3c05048b6a1030af0e4aab40b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/0001-use-LDFLAGS.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/0001-use-LDFLAGS.patch b/package/nvidia-driver/0001-use-LDFLAGS.patch
index 9ce237f959..fe87cb0e3d 100644
--- a/package/nvidia-driver/0001-use-LDFLAGS.patch
+++ b/package/nvidia-driver/0001-use-LDFLAGS.patch
@@ -5,7 +5,7 @@ the default emulation is correct for the current architecture.
 
 However, that might not be the case when the toolchain default is not
 the same as the current arch. For example, if the toolchain defaults to
-i386 and is capable of x86_64, and we're targetting x86_64 (or the
+i386 and is capable of x86_64, and we're targeting x86_64 (or the
 opposite), the link would fail because the ld emulation is incorrect:
 
     .../i686-pc-linux-gnu-ld: Relocatable linking with relocations from
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
