Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB86FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D21760C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D21760C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4756067E;
	Tue,  3 Aug 2021 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmX9rOfLxb3z; Tue,  3 Aug 2021 21:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8001D605E0;
	Tue,  3 Aug 2021 21:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1F21BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD41A8356C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlmrN3tMIM1B for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49AC98350A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9395F85F62; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 21:45:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 68c8f889f8711098115f2ab84d0f77c8f3d5e451
X-Git-Newrev: 8f11388f4e60df88ffb210079f412736160474a5
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.9395F85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/assimp: depends on
 libzlib
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8f11388f4e60df88ffb210079f412736160474a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

assimp doesn't build with zlib-ng because Z_EXPORT and z_crc_t are used
by the bundled unzip source code

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/assimp/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 42bfee945d..c535240efc 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -13,4 +13,8 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++, wchar"
+	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+comment "assimp needs libzlib"
+	depends on !BR2_PACKAGE_LIBZLIB
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
