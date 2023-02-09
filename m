Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D3BC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27F0610F0;
	Thu,  9 Feb 2023 20:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27F0610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqJ_EwhePtHc; Thu,  9 Feb 2023 20:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A00060FFC;
	Thu,  9 Feb 2023 20:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A00060FFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2A81BF96B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0816C82012
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0816C82012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WmjR7UmnfNR for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CC582212
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CC582212
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F82E84925; Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:46:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4856c75b2fe0cbab36fcae7f5f223026b24e884f
X-Git-Newrev: 8cee8fb37c6ad0164d3f7bad8cfd0f812592ad6c
X-Patchwork-Hint: ignore
Message-Id: <20230209204741.1F82E84925@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsolv: add LIBSOLV_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cee8fb37c6ad0164d3f7bad8cfd0f812592ad6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:opensuse:libsolv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensuse%3Alibsolv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libsolv/libsolv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 144ce68a83..29f8a6a3d2 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -8,6 +8,7 @@ LIBSOLV_VERSION = 0.7.22
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
+LIBSOLV_CPE_ID_VENDOR = opensuse
 LIBSOLV_INSTALL_STAGING = YES
 LIBSOLV_DEPENDENCIES = zlib
 LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
