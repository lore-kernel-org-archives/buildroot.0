Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEA5C4708E
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 10:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC10C4014D;
	Fri, 30 Dec 2022 10:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC10C4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtrjxAzzKZfW; Fri, 30 Dec 2022 10:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18FD340124;
	Fri, 30 Dec 2022 10:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FD340124
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5591BF2E5
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072D06066D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 10:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072D06066D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBBSoD5QsMxZ for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 10:37:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773B460640
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 773B460640
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 10:37:08 +0000 (UTC)
Received: from localhost ([31.220.114.204]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mofst-1oVU8f1YgD-00p8rq; Fri, 30 Dec 2022 11:32:00 +0100
Date: Fri, 30 Dec 2022 11:31:59 +0100
From: Andreas Klinger <ak@it-klinger.de>
To: buildroot@buildroot.org
Message-ID: <Y66+H1/D2lyfm6qU@arbad>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:/bWaX1Afl4hv4/bSd5TVCASHomeX3M7JHfC2SAsLG8r65fqGFaL
 Sw16yjs7dFLKV9QunfhiO4yhqM0vhpn9tAteuUT0bycV8U9n4lQDcL/XQW4plcIZLFlZLRf
 xaQVJSZzC+s2IVuF5vgF90Z9XtVlNttm8y20FKyrgdYf1Kx2rQtnO908/A2dlse6N4sgdti
 jliP272c6vJCxRvzgjgPg==
UI-OutboundReport: notjunk:1;M01:P0:XJiBlAvtHXk=;c12R6RiPkjNVk6q8XRCayLqbU2d
 F5to6UwDqN5E2jTOgAQHcNGQufi+mvnG18gG5DHcen29Uu9TN9ufB86AuWo+wrmM+DyUtPiuR
 CaUDcVrd0KVpCjZQz8+6hYn2Ds1/vX5zIl+QBUYftHK7e97ycMYJpMEJNs6jf+j2YWtERwJEr
 0vGyKnRE7z2h+DDIO81FN4CflXc8DCZNT5W7Fan05Zoev+D9wWsnI/Z0nI/vbn6SIT5O4xRIQ
 W6nY2Jemj61oqF55Ajky41PpICDISNTBRvyVJD5ZXEHyPg560PFYO2xmTgyccNtuIZzX10VUG
 tszCOfb7RQZLh+DuT3YjOIh8E3+I1kEirAmBrU4ZsTp11X5GBgRsf5pfmQwJngryCO3fbNANU
 KymgRng6/KCzy7s3j+4PBycE+aE4Uw3SulY+H6eSQV/s95AU3vgVTcICCOD1KTGAiGAYNSfcR
 fAEAWQ2p26AtoB+O3LtjcJ0ZHOrg1pKTgEhoOhHI+8Tnt68ALOEwTRVk+B8LHKVn4QZTqmrXw
 +6z/2GFquZXIbiD7edpBgtVZBsPQOMUKPr6I8CN2R1DFLxkDcUczkwzSopL7gmtpsa0ytxxNq
 QPoVrVzX/o10S4oMbKLyTLSdfgqPYY/rrUAs6s/2dWupWx6qLxCZAebnUtSBcS60cr+QIzLrd
 jBSaHqWkKRr1C4cnAu8p+LdJSuQUcIU13Cf9JWmFsQ==
Subject: [Buildroot] [PATCH 1/1] package/ply: add dependency on Linux
 headers >= 5.5
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
Cc: ak@it-klinger.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.3.0 of ply now requires Linux headers >= 5.5

This was missing in commit b9612601b037e6deb79af300e64e0557dda1be5c
("package/ply: bump to version 2.3.0")

Fixes:

  http://autobuild.buildroot.net/results/ce37039991cb0fb02b97d341d78327e54d0e1d26
  http://autobuild.buildroot.net/results/c00714847ae92dd609bc8990df318bee58be38b8

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index 0500e7883f..f7507095c1 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_x86_64
 
-comment "ply needs a toolchain w/ dynamic library, headers >= 4.14"
+comment "ply needs a toolchain w/ dynamic library, headers >= 5.5"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PLY
 	bool "ply"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 # BPF_JLT
 	depends on !BR2_STATIC_LIBS
 	help
 	  ply is a light-weight dynamic tracer for Linux. By means of
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
