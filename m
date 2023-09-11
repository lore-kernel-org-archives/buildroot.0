Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB589EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918B14117A;
	Mon, 11 Sep 2023 19:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918B14117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQowojmisy1L; Mon, 11 Sep 2023 19:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F32414E9;
	Mon, 11 Sep 2023 19:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F32414E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1831BF964
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD54A4031C
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD54A4031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqPcogcDvFM2 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C46C240199
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46C240199
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B309686C8C; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:19:14 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 67a31a5575c2c0f8aa2c9bae45b429b00338bad7
X-Git-Newrev: 9c185ea3d5318346ee56d3fd4c31df343059880b
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.B309686C8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dracut: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c185ea3d5318346ee56d3fd4c31df343059880b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
