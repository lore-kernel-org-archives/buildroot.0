Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B8CE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 04:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB42F40136;
	Wed, 20 Sep 2023 04:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB42F40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvjMm_nj20pu; Wed, 20 Sep 2023 04:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA524013D;
	Wed, 20 Sep 2023 04:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA524013D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F081BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78AF4035C
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78AF4035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQcq18OYBt4R for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 04:28:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 294E240296
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 04:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294E240296
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M5fIW-1qkShv2Cra-007Dd9 for <buildroot@buildroot.org>; Wed, 20 Sep 2023
 06:28:09 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 06:26:54 +0200
Message-ID: <20230920042655.35662-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:v27AmDfgcos3kcBsTawOT3GhGENZea64PfVgX4LrIFYv68j2FUh
 MPL2gJI01Ozk23oDwgla9bW5O8JHrgBzEt3QB6oTTs2/NWnqDEsFTIcq7bX/KyGKf5JnnhD
 pid6V2m6pFLv/6QUCNkKXBNxNwg3fsa6QaNUhJSWlYwCsHT9Gl4mdedxWrgaL2J0VLTwX0X
 Pc8Yk+GJUpah11LEBoE9w==
UI-OutboundReport: notjunk:1;M01:P0:1C2ex6jDlk0=;9pUYWovtBzGI22MLLTi6JE/Y0t7
 EO/XnWQHSusU95ndN6A+2mze28vvV+iAykSF/zLG5ON08P154vVhkpis2r3vKpkyqWawOP8cW
 llxZNmZOBYdteg8hei4+yl20IR3azxfnZ7EmL8BfO5ox60LPI+JmZqX7Oe5WIoSysVqTIMiN7
 ycxTinUFI+26KCNMHGI6csubFpfk1z3anXE95KbjoHdAyY93WU/Y3WvCEZxrjJ4Jd5kpCbwjx
 MU2N4CsWm47Sh7Jnm9tjhambMGBrwbR7CSmyJaprMtxElruj+ls/LG+YVSkBk9D7H9soJuXri
 ER7V4Kqax2flWRgb73VmJXAf3DTl4c2ap2rWpja9QUeGMKD6ZptB2lY2f+MyghYyXh7UUCnZa
 bpyhnC/S6R7TA+U5aoAWafkf65wOp/gbKt7dKa529aOpFofvCvBH/4spToObji0QFRiB5an+3
 XQoBvQVJuS6muIOIpgmRc2rZ/FI7e6OyytRlbEc81t3zCHhOqtEa1qDNrTmg9GtJdy1QcCJ6E
 IH9NWRiPH8tbzvnh4hB0FyRX4npopOVWSINz8c02U8+pkiMESJyqWD9QviI9hveej0SNzv46S
 6py7RZezKFNh5Tt3HNgUlldICgkT8geCrRe6mA1mJfwqjG4g2oSrjLYh++xec03zduivxt6gm
 KcmBjT6WY4TMssviVHra41gogxup634yR6pGUaZQi7Vz+joF25IHxMIfPNzbTrBYX6IISyqp3
 IlZuwGzqIXhmM0e5uEiN0qRaU4TqeX9XrrHEnKOco/bcCmH7ZNMQYYnzVIjs8Be3tYDJFHa0d
 /2aG3f45S/Zbzgan3PYIiDuSilvVcr9loe7ChXW7z4CMHCTSwTiLrHugKMWvOzpLfy6SQ2JQj
 P0yi+aaKLpWwlDrNc7iZoIa8bbnzS9+U6lwBHjSGxPxYb0Sj2b9luvYyDgL9ZmVmA6AquKxvw
 nSoZ2SrtpR0LrtBteeFLZ8qJ6EA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695184089; x=1695788889; i=dalang@gmx.at;
 bh=wMobjRPtz7Zahukolofz5oPJ1gU70cmDLWBxQrVYhTE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=A9cZAX+q1UCh5QqHLuBYOIaj74SQL5PZ/5yQ1pJv504FkgRrGJzb94fPQjXiSflqqopxtjP7Cvm
 sLidfLrnDvfi2P1Bl+TaHgu2lH+7b5No54HohG2e8RNbA4ONV3LIwwoG1IJOXTyDEDtFQEPttEjrX
 sxL6+nm/11y0cnzztxh0SzwMDCY49STK5MQQN+P1vwqBL7wx2EsdS1N+NfslBviFAKfXSEWRPwNAz
 qve4lD/QkjBG5TwVJSGTe6Kk9an8pyA9i3oOaR9/GXTpdlaC34dtHXxm0nk9O2XJD4UXrWhmdTSYt
 Nz35k9cKXYjDUjj63O3FSKdP4PiucASPtxig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=A9cZAX+q
Subject: [Buildroot] [PATCH] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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

As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b934ab3190..618b5b9278 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -14,8 +14,6 @@ BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
 BIND_SELINUX_MODULES = bind
-# Only applies to RHEL6.x with DNSSEC validation on
-BIND_IGNORE_CVES = CVE-2017-3139
 # Library CVE and not used by bind but used by ISC DHCP
 BIND_IGNORE_CVES += CVE-2019-6470
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
