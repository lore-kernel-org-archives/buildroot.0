Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D8C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26734194B;
	Sun, 12 Mar 2023 22:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F26734194B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Rt5WJHzI5y0; Sun, 12 Mar 2023 22:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E175241CA5;
	Sun, 12 Mar 2023 22:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E175241CA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A21231BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B710760E1A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B710760E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HM9_H_q_38Fs for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB05260C2A
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB05260C2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8FE087006; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 13:32:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e48f8358e519f9c24262a6549d8f6c78ee01add
X-Git-Newrev: af2cfc61a2a3e630824ac693d961b74f858c0407
X-Patchwork-Hint: ignore
Message-Id: <20230312214624.A8FE087006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: update _SITE url
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af2cfc61a2a3e630824ac693d961b74f858c0407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pcre2 url [1] is now redirecting to [2]. This change was
announced in upstream commit [3] which was already included in
pcre2 10.41.

This commit updates the PCRE2_SITE url accordingly. The package
version remains unchanged.

[1] https://github.com/PhilipHazel/pcre2
[2] https://github.com/PCRE2Project/pcre2
[3] https://github.com/PCRE2Project/pcre2/commit/66b3cb34dfe5411cb2bb939a8f4981081815d496

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index aba378cab6..c35056f8a2 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE2_VERSION = 10.42
-PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
+PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
