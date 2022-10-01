Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E3FC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9413583DF1;
	Sat,  1 Oct 2022 21:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9413583DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oM_NxLN9oZRw; Sat,  1 Oct 2022 21:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F6B83104;
	Sat,  1 Oct 2022 21:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F6B83104
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF0461BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 805DF60F47
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805DF60F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAD6O3yL4j6x for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE4A607FF
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE4A607FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B43A86743; Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 23:35:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66215faa5237e3704d55ff171537468079dda9c4
X-Git-Newrev: 0a397fa6381a4115be22ee9637746bf8c8e1194e
X-Patchwork-Hint: ignore
Message-Id: <20221001213928.6B43A86743@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: fix licensing information
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a397fa6381a4115be22ee9637746bf8c8e1194e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2.5.1, volk has been undergoing a relicensing from GPL-3.0+ to the
LGPL-3.0+, which is still not completely done 5by some large margin), so
it is still covered by the GPL-3.0+, but has parts already covered by
the LGPL-3.0+.

We so far only listed GPL-3.0+, but we also had the license file for the
LGPL-3.0+.

Add LGPL-3.0+ to the list of licenses; the COPYING file is the text of
the GPL-3.0+, so we already had it listed (note: the package has a
COPYING-GPL, but i's a symlink to COPYING).

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998@free.fr:
  - split out to its own patch
  - explain why we don't add COPYING-GPL
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/volk/volk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 1b36ea69c8..038b85ee86 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -9,7 +9,7 @@ VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
 # details on the licensing.
-VOLK_LICENSE = GPL-3.0+
+VOLK_LICENSE = GPL-3.0+ LGPL-3.0+
 VOLK_LICENSE_FILES = COPYING COPYING-LGPL
 
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
