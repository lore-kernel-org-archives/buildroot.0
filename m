Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC6EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 15:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29CC581E7A;
	Sun,  2 Jul 2023 15:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29CC581E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAeSsK4teELv; Sun,  2 Jul 2023 15:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64AF181E68;
	Sun,  2 Jul 2023 15:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64AF181E68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4DBC1BF283
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 15:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DFAE60BEE
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 15:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DFAE60BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61pERHxzplJz for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 15:02:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94307607D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94307607D6
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 15:02:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6F58A4C01A0;
 Sun,  2 Jul 2023 17:02:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37108)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFyau-0004zV-1G;
 Sun, 02 Jul 2023 17:02:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 17:02:32 +0200
Message-Id: <20230702150232.3414717-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688310152;
 bh=Y2POjFr9oHWm0mAzVfhoiOuQoCXYeXgqRe4/q9AkFvQ=;
 h=From:To:Cc:Subject:Date:From;
 b=tDdYimd/n2W5whxdS848q9Y+J9n8uAERRQkIaJ22PVl1hxpmq5UheAMoHj6jxwSly
 +yRpLiLNn0CU8/d0k4hTPGaNbyzVcPAFxFBD2ghMm9u9PSqI9cg2imo6YSw4Z8iVM/
 cstHi4eMJMoteCpdxdyT0hEHCg4Et8vVzfTpKRozZld9yY1qvPNlwDLCoh1+PWbdzj
 nvsmjzmBvkCrQYD8Tn7vMCHfF7Sjn8SHRCs5aSadWCw28RAse1vk47PKgHERqVpgJb
 ha2hAOfkhrwOuQHfq+/blkBLee/ZQ64NSG0wGaKHrFKAn495LkswZfDrYduxUxsqth
 KgY4cqCrMEPbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tDdYimd/
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: re-add dependency to
 pcre
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While pcre was an optional dependency with autoconf [1] upstream removed
the HAVE_LIBPCRE defines with the introduction of cmake [2] breaking the
build without pcre after buildroot switched to cmake with commit
8b42bbf30a914b0fd40a4518e61ac7bc511a7deb.

Fixes:
http://autobuild.buildroot.net/results/a15/a15db87c8cec195905b6bcc2cbd3da59ad8aa3b9/

[1] https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79
[2] https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 3040dddbbb..0e8a995090 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
 	  Sconeserver is a modular, object-orientated and extremely
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index bfbd5dc6ed..89abc8d3b2 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_PCRE),pcre) \
+	pcre \
 	zlib
 # disable image as it fails to build with ImageMagick
 # disable markdown module because its git submodule cmark
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
