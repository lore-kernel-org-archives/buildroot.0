Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949BCCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3EB852AD;
	Sun,  2 Nov 2025 13:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_YEV7AmTTlN; Sun,  2 Nov 2025 13:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABB3852A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ABB3852A7;
	Sun,  2 Nov 2025 13:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47C0222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6738423E1
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHSpzxj94tzx for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 924C2423DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 924C2423DD
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:02:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80F60839BA; Sun,  2 Nov 2025 13:02:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 13:41:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b1d8dd25d39df120700666942278b1a99fef416
X-Git-Newrev: da133c05c30e2fbed7eb74b9d942c7ccb72d9681
X-Patchwork-Hint: ignore
Message-Id: <20251102130248.80F60839BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/live555: switch _SITE to
 videolan.org
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da133c05c30e2fbed7eb74b9d942c7ccb72d9681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream site http://www.live555.com/liveMedia/public/ removes older
versions, use videolan.org instead.

Fixes:
https://autobuild.buildroot.net/results/7af/7af41a2774ba3ed7049e06fe290d3233e772ab19/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/live555/live555.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 56ed705783..1e1531ee53 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -6,7 +6,8 @@
 
 LIVE555_VERSION = 2021.05.03
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com/liveMedia/public
+# upstream site removes older versions, use videolan.org instead
+LIVE555_SITE = https://download.videolan.org/contrib/live555
 # There is a COPYING file with the GPL-3.0 license text, but none of
 # the source files appear to be released under GPL-3.0, and the
 # project web site says it's licensed under the LGPL:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
