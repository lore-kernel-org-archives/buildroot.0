Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BFECA0FFF
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 17:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085EC41489;
	Mon,  1 Sep 2025 17:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKdIjzoURZYW; Mon,  1 Sep 2025 17:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A8241173
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A8241173;
	Mon,  1 Sep 2025 17:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DF1169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 17:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0837C60DCF
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 17:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR948FwAMZPW for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 17:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7043960DAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7043960DAD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7043960DAD
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 17:35:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.111.21]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1uJngA1GgS-00ca2i; Mon, 01
 Sep 2025 19:34:58 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	"Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  1 Sep 2025 19:34:38 +0200
Message-ID: <20250901173438.3769632-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HgZNKNq2cY/SE5uFmxUc3LJkmx/Y12tyg9ykC26bFtstKtnCi1V
 MuVXFG0jJox6EUDPmdU6PdXkliprs3oVbwUWV0C4QKd6dUG4dmqvoWGs2avI0iggusA7Tgj
 6IdyFZ973KuzV0PS94F5/goTRmgwgv4IaU9BHbYLZ20hxxCPs9mkreeppAOj23hL+oGPhXV
 ixefIV5zblrbSR2DGJrkg==
UI-OutboundReport: notjunk:1;M01:P0:yI4vwrgUFq8=;ymYHzuVZIUW2GteC2rSOGyOLKgW
 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
 d1qwG4AwFOmcOqPfRdT6i0A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756748098; x=1757352898; i=fiona.klute@gmx.de;
 bh=MzEbmBQJ1TpNrQP6T4siac2gKf8MkmiMmi6sNZkixIg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o16N5IDJ1B+sHP4VpkdhViilCdrNKComyHpui5/v4sUSSXQkVkJRmX3/FjboRPlq
 MJUrQCVCK0Js5bAdJxGs0AZTyt+rBI7ozsqs5G03sOFew1E5qBxm7x8Imtzvd22oH
 pkjd4mHjTojVQcH5BPnvPuCb5sQFszJwGeWdofh7UxBCq7sVEvXzzG4VeHBMSFI/H
 mMnzeGNJ60iIanxH61BYAPIIcobUhmAApYMAr+Wku7XYcjQdceqZ9RvYC09L+Cg+Y
 ocTNdtZb5wCF+tDt5HuEwAXPDdLUIbMotMDtUshO6MW2AhZpgm9SW8H6AyWXj7P6l
 d/8LkpbuSR9gSVCJ1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=o16N5IDJ
Subject: [Buildroot] [PATCH 1/1] package/libfreeglut: override minimum CMake
 version for CMake 4 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

With CMake 4 building package/libfreeglut 3.4.0 fails, because
CMAKE_MINIMUM_REQUIRED is set to 3.0.0:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Overriding the minimum version allows the package to build.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Tested with CMake version 4.1.1. Generally freeglut upstream seems to
try for wide CMake version compatibility, see the changes to
CMakeLists.txt since 3.4.0:

* increase requirement to 3.1:
  https://github.com/freeglut/freeglut/commit/f44eb886a513009b9b0c169ea274369c4dac9a04
* increase requirement to 3.11 (still significantly older than package/cmake):
  https://github.com/freeglut/freeglut/commit/cd60d728b807c590b16884387ace17d334f364e2
* restore backwards-compatibility with 3.1:
  https://github.com/freeglut/freeglut/commit/a9219b1cbf752bb1e963257ab04f3c70c0829c2e
* add 3.5 as supported minimum: https://github.com/freeglut/freeglut/commit/2294389397912c9a6505a88221abb7dca0a4fb79

Should make it safe to assume 3.5 is expected to work.

 package/libfreeglut/libfreeglut.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 09309aeceb..7c27113331 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -17,7 +17,8 @@ LIBFREEGLUT_DEPENDENCIES = \
 	xlib_libXrandr \
 	xlib_libXxf86vm
 
-LIBFREEGLUT_CONF_OPTS = -DFREEGLUT_BUILD_DEMOS=OFF
+LIBFREEGLUT_CONF_OPTS = -DFREEGLUT_BUILD_DEMOS=OFF \
+	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
 
 # package depends on X.org which depends on !BR2_STATIC_LIBS
 ifeq ($(BR2_SHARED_LIBS),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
