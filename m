Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA24C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE5141BA9;
	Sat, 30 Jul 2022 12:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE5141BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAnDcUBK47aF; Sat, 30 Jul 2022 12:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8391241B95;
	Sat, 30 Jul 2022 12:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8391241B95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A35C41BF392
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E5F840145
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5F840145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aManPDmkQiyB for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:02:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDE5640217
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDE5640217
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D061B86896; Sat, 30 Jul 2022 11:49:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 12:34:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c857b8ff0e19c35807b58893931542bfdc7ac9fc
X-Git-Newrev: a2689d901b077cf7f45d23d359619c87dd80a759
X-Patchwork-Hint: ignore
Message-Id: <20220730114902.D061B86896@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/ccache-support.txt: expand
 explanation about ccache cache location
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2689d901b077cf7f45d23d359619c87dd80a759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual explanation seemed to imply that the cache is always in
~/.buildroot-ccache/, but it's just the default value. Clarify this
point.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/ccache-support.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index f6746ad7d8..ea64628615 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -15,10 +15,12 @@ speed up the build process.
 +Enable compiler cache+ in +Build options+. This will automatically
 build +ccache+ and use it for every host and target compilation.
 
-The cache is located in +$HOME/.buildroot-ccache+. It is stored
-outside of Buildroot output directory so that it can be shared by
-separate Buildroot builds. If you want to get rid of the cache, simply
-remove this directory.
+The cache is located in the directory defined by the +BR2_CCACHE_DIR+
+configuration option, which defaults to
++$HOME/.buildroot-ccache+. This default location is outside of
+Buildroot output directory so that it can be shared by separate
+Buildroot builds. If you want to get rid of the cache, simply remove
+this directory.
 
 You can get statistics on the cache (its size, number of hits,
 misses, etc.) by running +make ccache-stats+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
