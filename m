Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A8C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE43070058;
	Tue, 21 Feb 2023 01:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE43070058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EePm0sn2P7F; Tue, 21 Feb 2023 01:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9F47005C;
	Tue, 21 Feb 2023 01:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9F47005C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 786591BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED0AD70018
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0AD70018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GphbZVCcatEM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11AF170010
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11AF170010
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A53828C8; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:46:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4856c75b2fe0cbab36fcae7f5f223026b24e884f
X-Git-Newrev: 8cee8fb37c6ad0164d3f7bad8cfd0f812592ad6c
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.02A53828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsolv: add
 LIBSOLV_CPE_ID_VENDOR
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
