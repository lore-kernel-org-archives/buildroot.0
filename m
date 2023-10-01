Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3869CE748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E9A41780;
	Sun,  1 Oct 2023 18:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5E9A41780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZdbMTmvVcy2; Sun,  1 Oct 2023 18:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77C9417A0;
	Sun,  1 Oct 2023 18:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77C9417A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B22BE1BF592
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9632D401B7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9632D401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6fyn-LTOFB0 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:13:10 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE9C0400AF
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9C0400AF
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.100]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1ML9uK-1r5EJM1sd0-00IAC9; Sun, 01 Oct 2023 20:13:06 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 20:11:42 +0200
Message-ID: <20231001181141.1275330-3-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:00Hng4XzJzNPkX+kmXpkItCMw136YNy6lfvbxU+JagFkwo5AhCH
 yuhUDWsGbJ/ijbPOCXuYCTbXbTU06jvsmZGaQdzZ4ie8dXKJ6XZvPQmhTRY9Hjb0fkucyWf
 ilYekgWM/rqflU/gzaM+hlK0mLeX5lxe3CFQ0ZsG3x8MV+izbB5IhsfiQuRZnjyh+LgoC4U
 8ZhnzZ9tigWvuIt4uIFKw==
UI-OutboundReport: notjunk:1;M01:P0:80j7JQvuGrM=;ebHUgO5T2O8gTL/aXKopSL09seB
 WQRYVmqXTuI+0KbeGIRPaj1XWlXqmtpjzfDGYXb1C24MuLnNCn38ps1Xbz9S7Td4d4f60Ur9Z
 7tt8J1TWPk5cChM0+NsLTvGSvH4IFNG03sUS9knvd8p7HnBG46HUFRZvubs0RR+S2bBkvUifu
 uc3LgNxC5Hc4503foTxqQ+2C3VLQQoJQHW3cGuFOdV6lDvVHrLn6LPP4HekEdvvRoEKtIK86u
 Aspw31Yy7UyQEGtCV2WTAv/bO3XIxif8V2AtMeLdqEYpbE6zU4eAHGxjlNny1mwm2vunXT2VB
 mJT4k/23Z0+RT0Mba3qXf0O8sw4clBhr5+U3HqletHFtns8zHvstD2JQPDNi3fat3a5EokFYC
 kFmNRUTcRHkPBl/pDSxihjdo9iSK0WE6mgWHwd+CeQ9hXoiH38MfdyvHRE87bxeB5lTFEjR6q
 +m5D6bW53LA57alGCLbuhgMjbl2lMUP8CvI+ELsyzR281g566X/A1pQoXYiW/Lo51jwtThx7B
 BS7mzBjSi/FsJv2RBONZCidtp3PkK/optpByxNU87WOv0p8/AnE1+Xo4IuABQhSGJ30qJo6Pf
 BMav2BvZxtCDmcvuhFZepGXjnGe4y+oU1sRJ6b0r5LcYkBtM7pnc7pLkQ0UPhIcFG5jLbaKdD
 xf5W+hLeVkCiLs00fWG6lhfaA9no0dkCFltIxdK2YVctEb4uguZafMGtQtCeS+M2TG9DH2XKV
 vj25UTH/TesjBJxomemEiCkFJSnAdbYZ3aLwvoTQswVLf8GnGOJB0f0wiLcEefl1myA59WpiN
 yL/+NoEoLr4HtaqIFLaWiZ9yL3gjH5Goz2O7EXGoaM61S//2HS1oVJlSm3ALpSR4rs4NwWjjg
 taiVkXvs+EbkEY7aiVBuCn8Z+2up6SbDyrRvREYRXoU5fBxxIJP8FmjzbA5pr/jt2MLm4roj+
 ohlaBxEWgQnlaWPc3Xot/S3C4Yw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696183986; x=1696788786; i=dalang@gmx.at;
 bh=Gn7yOZaw7/95Pfxa0TalNohaxIOPG0onBefcKo8dpgI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=l9gOJNaq7Lhmxg1+ZabHzSodOxr2PvSlth2pW7ZfVxKF14SgFg0suTQKwrxW4+F9vE+uT+BnK+P
 wIM5eikZ+jUTFBx0tF3Yk7HI+yG/wpAksPkFLNSqYAjFT4bcuNyWEU/DvUbNzvgExwXynVcpJ0N1C
 d6qHJr/Na0z0AOW9e6GNOtFC3rVVKXXqrl7OuXwu2twZqGeIDvQgNl2fw+W/eZQglxrfBlnxdq7Mv
 Rv5aozD4/9J5n7dYJXSiaFKaeLpv5KgGMRw0OIIPnB3KO/sP6bbl4N3MoqfYEmNhyZ15P3nY3zqdD
 EKu6ktJPeiW3AqqxhF6brTlN7x0xRyzKB9VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=l9gOJNaq
Subject: [Buildroot] [PATCH] package/enlightenment: security bump to version
 0.25.4
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release which fixes a CVE.

See:
https://www.enlightenment.org/news/2022-09-15-enlightenment-0.25.4

CVE-2022-37706 "enlightenment_sys in Enlightenment before 0.25.4 allows
local users to gain privileges because it is setuid root, and the system
library function mishandles pathnames that begin with a /dev/..
substring."

Hashes were never part of the online news page, therefore mark them as
locally computed.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/enlightenment/enlightenment.hash | 5 +++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 2d977b86f7..ed5d6b24ef 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,5 @@
-# From https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1
-sha256  2cf05fe3d96ef35e823619dbc0ac513ecabcae2186800ecd804924a637112444  enlightenment-0.25.1.tar.xz
+# From https://www.enlightenment.org/news/2022-09-15-enlightenment-0.25.4
+sha256  56db5d206b821b9a8831d26e713e410ac70b2255a6f43fcdf7c01eefde23b7a2  enlightenment-0.25.4.tar.xz
+# Locally computed
 sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
 sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 95670e800d..836c6e581d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.25.1
+ENLIGHTENMENT_VERSION = 0.25.4
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
