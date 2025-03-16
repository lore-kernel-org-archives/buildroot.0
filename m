Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A318C35FF1
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A8D6085C;
	Sun, 16 Mar 2025 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSrZnhUiLD-K; Sun, 16 Mar 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E53360820
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E53360820;
	Sun, 16 Mar 2025 22:00:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D89D61
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 22:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0175B60820
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 22:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzyOvXgoThvY for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 22:00:00 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 16 Mar 2025 21:59:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68E3F60756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E3F60756
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68E3F60756
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:59:59 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal.fritz.box ([151.51.219.64]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.17.189]) with ESMTPSA (Nemesis) id
 1MLAF0-1tbibW3cFW-00Hc5q; Sun, 16 Mar 2025 22:54:52 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: paguilar@paguilar.org
Date: Sun, 16 Mar 2025 22:54:00 +0100
Message-Id: <20250316215400.6001-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:TmBc8qNhj7USo4/W+DXHAdtaNVGE7IEGLLZpOJz+fzZ4+Ro1W3S
 O3ebTqfpqySlUQ8Z0eyYeh8upxz8n247mY/ZGnXz9SrI8HWkfPNkqYzoauOv4ufc7qqPhT1
 PWxLXS6y2otzkSbFgNzN/utPKV/WEoxAgXbGc172DuRDf1yxy74rdQgT6L4qqoDiQP0+qhS
 io3cQMxtnFD4bFzCLuwhw==
UI-OutboundReport: notjunk:1;M01:P0:JpUXYUHo7Cw=;UJ48LZmEO8uYgbdXoiyo4UrgkAz
 6q6ZVNKP518dUnI6V5kBMdfLy4uKkDkPX2S58HGmCG717RphRb7f06A1DAMyhUyl9Mo9U8GRI
 T5ALWBATp6K8RDrVJYKTXXJAz6b5+9QnBj/4y8gzjZq4xY9ULmiOdQfz7SP0PaDta6M/tLSiC
 T/2pDuwKmQRK/c+/RphIWa9roSeKHqYB1s7d2gI4ryd1SstjasDDEPBRsraCeFZYHlgI6O6TZ
 nLC2LacQJG7nWUQgCWLeoW4FhlrrpXkbJi+eDhWb1GUaEk47fBFR1o1pwDAtyLLQDhYJejnOd
 dUl1/imTYDl0rWXkAjEAYrArXjH56YQ+zlZIqBxUXBQKT5Pip2ejlNxYrYoL4T0FDoqeXzvmh
 GFfC6l2xzw2GoW6IXl563i76q3zyw1eT6UqbdePDHPT/L+Zyd0Pq0+wOrZcFNSD39lMuu3ChV
 Alk8YXSnqOqpWN10t/JliwvA5C1lBl4Z7/L4ZwkGNKII2SKZMHEAFdeUAb75SHBoyZJu/QEPV
 mnFPoynqddpVCNJbPVoxcLHL7+8bdHgZsP0yiM0JaraqcKgQ81rKnIlefTnTzNe7Sl/6BJ9Sj
 kVw9CVMjEBC6LjbZ91LJu4gx2s279EukqbsXBebMxthLUj3jqYwPot/dj2e/go6Ze6px9eZcE
 Jl14d9mo3djaXq7FMjbWLbMapRoZkb7l8bYFtMEk/9uZ+mbzvYjnrsd7tgC0aAdiAn7iAHmon
 EhnH1PiO8/YkRBll7cPGJ9RMmsOEDUxirNcbeIkwZT0chyPJZb52PW7o4r3WzFbpb66b97bS4
 aNiSmp6vGxrGo+5am/DCbGYuHnM+AzM08/u8UG3YtCjF7zMYHPbQ+IaIILeUFaIe8F1Nduea3
 YYIbpeKUPySoTnoZUUJ61SSejATzQl6a1d25bKe/XzH0gmxrse9k0/nwfKpQiC2TJh+zKbi0o
 EEsEzAauWumgPx6CUUh9F5UClj1pUnbeW3vuEoBTeQ6sd3NIeqIDwwX0I+YVtPFS2wh2VtClO
 2yMRF5yofR16a54EoIDkifoBodv7TZtxowq17Lj+JX6HfPOncfEFJUSq67Ft7vH+KoJ7tcDHZ
 gM19seQ+AdpwFqjcTREw/+oP1NGwmhzERnGx8Wd2Wxwo9sRDbEu8PS/Il45FYf9aEW7HfJFPW
 FE6GSjZ8NiyLqbaCTKHEDkvPoFize8Z1lAaIPmEv7b97C+oATdxkEmPGTdgdxO9cV0XssHgQa
 xhA5gmhl5KQJ09n3xkAW1iv3VAOIeOhj4QsqDqn+3oPW1Q1V3nb/cpCHU+JQtDJf2RqKd+bLf
 ozufDyfJgWebRAaa5nsBtpjD+pD6P+IcUmBSjaidzQyyjHiFQ8bymTbmOy/ntjydrsMHcJ71e
 cO7KOO3WYC+65jRA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1742162397; x=1742767197; i=paguilar@paguilar.org;
 bh=JxruxSUx+m7u9rT0XqwTG4aiutDYNAG8LmeNTsJa8k8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Y7T6RUvs1gUQWVPX+Y4CZRtWZxGd5bWEWpQp/ce9dKl+nHwm1JGI9igtLGJYdJTX
 2YwlXTCNDcdKaRSumU6hDr51W9kvtggin4Ox+/wB/fz5PZLmLQ1uaqK0qQa5jm9zs
 BP8ismgr/rqqC/HRuQ2sbLqymCow5qPV1YzOC96PrHRhSjoei2syS+6VJi/l5spGO
 7x0HHFzNOxxvahfP9wBGBDmDEH3lWb2IgTIXoLy2KFRagjVkxmvgNOVydbWkXsQhq
 JjvLVCysCZQsOZUy11NT9y8blMDrLFEETlJ/WA3Y2IlG4tfb1DLAn69tJzV8rUXd2
 wfgwJJ+i/EtZVt4+Lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=Y7T6RUvs
Subject: [Buildroot] [PATCH 1/1] package/libunistring: Skip 'tests' dir when
 building
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tests/ dir gives different types of linking errors when building
under different archs and with different C libs such as libc and musl.
This dir is not necessary when building and it can be safely skipped,
so let's remove it from the building process.

This fixes the building errors reported here:
https://autobuild.buildroot.org/results/770ac5653ee832a9117a7cd288a193750dfcfe29
https://autobuild.buildroot.org/results/a31d608388b0ff28334f674baeb501b023bdb4bf
https://autobuild.buildroot.org/results/f5a833a3dcd7094290fcbc6b8989620749bc6316
https://autobuild.buildroot.org/results/b572db1524de16006d55a42dca43a0a500f78ed0
https://autobuild.buildroot.org/results/a155a54b30f6cb02d74687992088f543fa63cb74
https://autobuild.buildroot.org/results/dfe061ddaa9ef0b6e39b2da20858baa36ae1fca2

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 .../0001-Makefile-do-not-build-tests-dir.patch        | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/libunistring/0001-Makefile-do-not-build-tests-dir.patch

diff --git a/package/libunistring/0001-Makefile-do-not-build-tests-dir.patch b/package/libunistring/0001-Makefile-do-not-build-tests-dir.patch
new file mode 100644
index 0000000000..b1ef642224
--- /dev/null
+++ b/package/libunistring/0001-Makefile-do-not-build-tests-dir.patch
@@ -0,0 +1,11 @@
+--- a/Makefile.in	2024-10-16 13:33:55.000000000 +0200
++++ b/Makefile.in	2025-03-16 18:40:35.108110641 +0100
+@@ -2351,7 +2351,7 @@
+ top_srcdir = @top_srcdir@
+ AUTOMAKE_OPTIONS = 1.5 gnu no-dependencies
+ ACLOCAL_AMFLAGS = -I m4 -I gnulib-m4
+-SUBDIRS = doc gnulib-local lib tests
++SUBDIRS = doc gnulib-local lib
+
+ # Allow users to use "gnulib-tool --update".
+
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
