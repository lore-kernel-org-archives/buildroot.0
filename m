Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBDAC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17518606EB;
	Sat, 13 Jan 2024 21:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17518606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adu905SU910f; Sat, 13 Jan 2024 21:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD1260F17;
	Sat, 13 Jan 2024 21:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD1260F17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0701BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5349483434
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5349483434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI4XnGFNnXKV for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE8183478
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE8183478
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A84F860AF; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:18:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8edf25ac86615b701378eef1d937cd1f3df9a47
X-Git-Newrev: 0d615aa138036ccf3fbba8351c5123a9d825ae37
X-Patchwork-Hint: ignore
Message-Id: <20240113213034.6A84F860AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaio: add LIBAIO_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d615aa138036ccf3fbba8351c5123a9d825ae37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libaio_project:libaio:-:*:*:*:*:*:*:*is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/detail/69B8039E-7837-4DE3-8DFE-C2E4D834EE78

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libaio/libaio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index e13e49346b..12cfbc4ef4 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -9,6 +9,7 @@ LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
+LIBAIO_CPE_ID_VENDOR = libaio_project
 
 LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
