Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781E0EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E15F40B59;
	Mon, 21 Aug 2023 22:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E15F40B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taX8lZDmMh7P; Mon, 21 Aug 2023 22:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33A8740B4F;
	Mon, 21 Aug 2023 22:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33A8740B4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1F0C1BF94D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B811740948
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B811740948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJ139htzzK_x for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:11:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A742540931
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A742540931
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91B7A86077; Mon, 21 Aug 2023 22:11:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:08:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f1a048cc0a2a33bc72a9cfa1930274d19b9951e3
X-Git-Newrev: a9e36f73a76a079b6dde2eb4da776d7a3ddba677
X-Patchwork-Hint: ignore
Message-Id: <20230821221113.91B7A86077@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libassuan: update
 _SITE url to use https
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9e36f73a76a079b6dde2eb4da776d7a3ddba677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This new _SITE url matches the one published upstream at:
https://gnupg.org/download/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index f98c13b59f..0f69d1ba6b 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBASSUAN_VERSION = 2.5.5
-LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
+LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
