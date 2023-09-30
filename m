Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC695E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDA3417D3;
	Sat, 30 Sep 2023 15:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDA3417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDWPYPaMiuTt; Sat, 30 Sep 2023 15:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC2C417CC;
	Sat, 30 Sep 2023 15:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC2C417CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D40C61BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA1282A7F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA1282A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8N8fF_xhJTT for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:51:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5CEC8299E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CEC8299E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFD0E83B54; Sat, 30 Sep 2023 15:51:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 17:49:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d797ecc6f026e1f0af17f91df33e8cd44731a97f
X-Git-Newrev: b9300f70b26f15d4cc58c0d5cff17f86b6e43bf6
X-Patchwork-Hint: ignore
Message-Id: <20230930155140.CFD0E83B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix typo in Kconfig
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9300f70b26f15d4cc58c0d5cff17f86b6e43bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"NTPL" should read "NPTL" (Native POSIX Threads Library).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 4929e5d3d1..9d2de6c866 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -60,7 +60,7 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NPTL, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
