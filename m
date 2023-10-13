Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66470CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205E380C27;
	Fri, 13 Oct 2023 06:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205E380C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HT4PTSYnaPxc; Fri, 13 Oct 2023 06:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C3F8282C;
	Fri, 13 Oct 2023 06:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C3F8282C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0101BF99A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36FF282344
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36FF282344
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNd82DcXSf9V for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E749821C5
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E749821C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EDFC846AC; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:05:15 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e1d045174bfc99ee8eaf0833805628a300765023
X-Git-Newrev: e3994a549fb995ff0176693d29285b926c0a955e
X-Patchwork-Hint: ignore
Message-Id: <20231013062403.6EDFC846AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pipewire: fix
 typo in Kconfig comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3994a549fb995ff0176693d29285b926c0a955e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

"NTPL" should read "NPTL" (Native POSIX Threads Library).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9300f70b26f15d4cc58c0d5cff17f86b6e43bf6)
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
