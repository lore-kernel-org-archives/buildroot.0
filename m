Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D02EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0C7414F7;
	Mon, 11 Sep 2023 19:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0C7414F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Tz2BQOBmq0p; Mon, 11 Sep 2023 19:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E69294151B;
	Mon, 11 Sep 2023 19:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69294151B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8E861BF479
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB4E813EB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB4E813EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQaq4LVNiHLL for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE86E81300
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE86E81300
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEC7D86CAF; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:19:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ecdfc9bb2faafb01e9c9c86bbf52ecfcad9dc5a6
X-Git-Newrev: 5b6e8f15e6b5965771ad7b5b844f27e1185a2c35
X-Patchwork-Hint: ignore
Message-Id: <20230911190853.CEC7D86CAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/dracut: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b6e8f15e6b5965771ad7b5b844f27e1185a2c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

dracut_project:dracut is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/8050B12A-93FB-453E-8459-9B8B9CC7544E?namingFormat=2.3&orderBy=CPEURI&keyword=dracut&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc2a530c5b8a700978e29eae2ef6deef3cefe20c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dracut/dracut.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 597492bc5e..3eb9bcc474 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -8,6 +8,7 @@ DRACUT_VERSION = 057
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
+DRACUT_CPE_ID_VENDOR = dracut_project
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
