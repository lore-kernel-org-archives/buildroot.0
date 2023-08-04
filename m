Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717FCC001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 18:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 228DD408B1;
	Fri,  4 Aug 2023 18:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228DD408B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVtZ41HrFyyb; Fri,  4 Aug 2023 18:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 441A34063C;
	Fri,  4 Aug 2023 18:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441A34063C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 301D81BF46D
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A6E260EAA
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6E260EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPgxM_tCljzA for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 18:33:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40B85608F5
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 18:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B85608F5
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 172A3A4C10A7
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:33:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45074)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRzc1-0000kx-1c
 for buildroot@buildroot.org; Fri, 04 Aug 2023 20:33:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 20:33:21 +0200
Message-Id: <20230804183321.1766262-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804183321.1766262-1-bernd@kuhls.net>
References: <20230804183321.1766262-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691174002;
 bh=SCtfJeeHPwb0RyS9iAgoCOnqey+9eWGzt8iPwO2uh6A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mlPdy5i2GGX7EhrOy7KPXdfptIsQ8HE8Ifi5PRv9n3B2M+8xJLse5XClBf/HufH0L
 xbgjpIzixiul6wkAqd6IeVr/GoBjxaFM6p1pQ6wXfzeSSdASPJKMAMkxWSAFC1QPOb
 sfpb1Ptbew9avjeikUhAh7NzH9lpWyLmRYieWFG2s7vYahlh7EWsFd0NFD7c22KRTi
 dNOvEDCX8QFdGdH46faCLzkp9FT2r7KupM5AugWehlVKrc/y1lTbFmDIvR5uqIlYP/
 rfJykFktfq/Y0xL1YuRGgHTELwTnY5mMTcfL/dXP0eNumZQ63XwEIBq4rYxc4+s+Iw
 JLJM01LJiCznA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mlPdy5i2
Subject: [Buildroot] [PATCH 3/3] package/stellarium: disable ShowMySky
 atmosphere model
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
stellarium which included these commits
https://github.com/Stellarium/stellarium/commit/b3f02beaec2a285251db1e1707abe2e423803834
https://github.com/Stellarium/stellarium/commit/5d5edd0e5f5630872628a1525685b77854b6e4b4

It downloads external packages during the build:

$ find output/build/stellarium-23.2/ -iname *.tar.*
output/build/stellarium-23.2/_deps/eigen3-subbuild/eigen3-populate-prefix/src/eigen-3.4.0.tar.bz2
output/build/stellarium-23.2/_deps/showmysky-qt5-subbuild/showmysky-qt5-populate-prefix/src/v0.3.1.tar.gz

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 7ee19c8b18..43c99413dd 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -18,6 +18,7 @@ STELLARIUM_DEPENDENCIES = \
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
 	-DENABLE_XLSX=OFF \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
