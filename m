Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC6C88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E6F41913;
	Mon, 12 Jun 2023 17:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E6F41913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ubtj0KCpqQpT; Mon, 12 Jun 2023 17:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 976624191C;
	Mon, 12 Jun 2023 17:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976624191C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6663D1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD3A82280
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD3A82280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVa63xAY26s6 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 17:01:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165018220C
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 165018220C
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:01:13 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id DA0211F449
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 19:01:10 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8kuk-0rGGKP0; Mon, 12 Jun 2023 19:01:10 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35118)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8kuk-00029M-1P
 for buildroot@buildroot.org; Mon, 12 Jun 2023 19:01:10 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 19:01:10 +0200
Message-Id: <20230612170110.1550878-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686589270-D9FF9DA8-91D803DB/0/0 CLEAN NORMAL
X-TOI-MSGID: af6e3a63-2bc1-4197-8908-d5eec7645818
Subject: [Buildroot] [PATCH 1/1] package/assimp: needs gcc >= 7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/d6c/d6caf3c2c0fd670e70950d3e89629df39f8ce596/

After adding various fixes for the autobuilder error and subsequent
build errors this build error can only be fixed by using gcc >= 7:

output/build/assimp-5.2.5/code/AssetLib/Obj/ObjFileParser.cpp:55:23:
 fatal error: string_view: No such file or directory

Usage of string_view was added in version 5.2.5 by upstream commit
https://github.com/assimp/assimp/commit/f6bcb160d08af267778fbc59b480ce5d9c52c92c
which was added to buildroot by commit
7d843d9cc0064d6690cfc000e579f575e2c0cc4d

Removed BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is only valid for gcc < 7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/assimp/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 5ffb50cd79..4bddb3598d 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
@@ -14,8 +14,6 @@ config BR2_PACKAGE_ASSIMP
 
 	  http://www.assimp.org
 
-comment "assimp needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-
-comment "assimp needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+comment "assimp needs a toolchain w/ C++, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
