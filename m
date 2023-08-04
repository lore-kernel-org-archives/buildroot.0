Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF6CC001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 18:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3235405F0;
	Fri,  4 Aug 2023 18:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3235405F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVzAstqrLCBJ; Fri,  4 Aug 2023 18:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35DBE405B0;
	Fri,  4 Aug 2023 18:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35DBE405B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 740B71BF346
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9174D60E1D
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9174D60E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sirPOcbGkhfz for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 18:33:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B043F60E08
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 18:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B043F60E08
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE29AA4C0D76
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:33:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45074)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRzc1-0000kx-1S
 for buildroot@buildroot.org; Fri, 04 Aug 2023 20:33:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 20:33:20 +0200
Message-Id: <20230804183321.1766262-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804183321.1766262-1-bernd@kuhls.net>
References: <20230804183321.1766262-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691174001;
 bh=66HgxMTqubPE5tVVp+apX8kfeMb1wSjvxlKczfYx9ws=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f5uelnIt0/C3zfr1FNGckHyDnM4D55WiAJnh+nyb/AtoGKTdXdYr+nuG77Ou2FfPO
 z5RnmoKGksOc8j1unzJvsvpuesg4N45pbbXFhHrlCClE0QGf+wZY4YGENPvSTOpvo7
 T4KoSnu2Bn6WmImhAXxqQykUjT61Oy9lhpEXvQVI0BETgLK1B2esy+DoWZRBGO/QF5
 33QJ71hMEMZnCmLDL7F7BWwZJ9+VAn2rDDPgYIn4aU7oyNF4UEXxP/AAx+jqQjE59K
 InwPlafjAScNc1HWRxrbtZOuEVUjoN+I7raU6FSuTc3YiR4wg7DkdvWh9/qxeYEQKP
 aietoz3QUFEzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=f5uelnIt
Subject: [Buildroot] [PATCH 2/3] package/stellarium: disable xlsx support
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

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included this commit
https://github.com/Stellarium/stellarium/commit/186b06fa215bd28ea03cc291dc861b552af8d99a

It removed the previously bundled QXlsx source and lets stellarium
git-clone the sourcecode of the QXlsx package (not present in buildroot)
during the build:

$ find output/build/stellarium-23.2/ -iname .gitignore | grep qxl
output/build/stellarium-23.2/_deps/qxlsxqt5-src/.gitignore

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index cc25f91063..7ee19c8b18 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -20,6 +20,7 @@ STELLARIUM_CONF_OPTS = \
 	-DENABLE_NLS=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
+	-DENABLE_XLSX=OFF \
 	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
