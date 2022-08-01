Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7960FC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1931581DCA;
	Mon,  1 Aug 2022 17:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1931581DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7A7ZZzOK-f5; Mon,  1 Aug 2022 17:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5692C81D5C;
	Mon,  1 Aug 2022 17:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5692C81D5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD8AE1BF9AD
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C438D81D5C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C438D81D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mlk4fp4_DU5 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:01:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04D96819FC
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D96819FC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C4E786B1C; Mon,  1 Aug 2022 16:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 19:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b726ce46655ad402a8df9f399ea29fc6d4d585e
X-Git-Newrev: 6685b5ae643aa7f832cb1a5edf4e417125cb58ea
X-Patchwork-Hint: ignore
Message-Id: <20220801164743.0C4E786B1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeltrace2: fix host package
 build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=6685b5ae643aa7f832cb1a5edf4e417125cb58ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building host-babeltrace2 asciidoc python3 module is required but
Buildroot doesn't make it available, so let's --disable-man-pages for host
as we do for target.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeltrace2/babeltrace2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index eedfc72b8c..2b2ab7db40 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -17,7 +17,7 @@ BABELTRACE2_DEPENDENCIES = libglib2 host-pkgconf
 # options for host packages, just build support for it
 # unconditionally.
 HOST_BABELTRACE2_DEPENDENCIES = host-libglib2 host-pkgconf host-elfutils
-HOST_BABELTRACE2_CONF_OPTS += --enable-debug-info
+HOST_BABELTRACE2_CONF_OPTS += --disable-man-pages --enable-debug-info
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 BABELTRACE2_DEPENDENCIES += elfutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
