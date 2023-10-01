Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BDFE78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F8C981099;
	Sun,  1 Oct 2023 19:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8C981099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIc1D2BzmtPH; Sun,  1 Oct 2023 19:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56CEA81E74;
	Sun,  1 Oct 2023 19:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CEA81E74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40B5B1BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC5640467
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC5640467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D09UWxrsP-TT for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:07:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3D2C40383
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D2C40383
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N5mGH-1rg9Ma2sXr-017EKt for <buildroot@buildroot.org>; Sun, 01 Oct 2023
 21:07:51 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 21:06:39 +0200
Message-ID: <20231001190639.1391551-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:J3oBwx532gLovMHQBKsyAGLGXDaWIY+yeXdoHt9vE/C2I9PVLiI
 yaYqCHuTLjRb4tVM+caa6yc45FlvNTfKvf5N93S/7MAu+8rdsjL9lB/1nX9vO3/rZTrG4zY
 tDwxdXqj0+2l42R2/i2TuSNGHl+jM/SMBAcVjCAwqqkFKum1uSueZ/2sL9BCrGveYJX+O5U
 qUkZuBEuWHeLow+tqDy2A==
UI-OutboundReport: notjunk:1;M01:P0:tqLwsHxpcDc=;+i9Rde3ZXJVaXOn2/1+ULoDNSem
 N8SewM8cmniknc3862u9nPSKdup6G0QtrPZfcmIjIjzVmtoJp3mjmugFZ2DgJqVt5PfUVuqvW
 wyfB0wEo6eEFAQ76KOlNapKiuTh8VsTx1RPrN9ONGFUbd53W2Jabv2l2V3Q4H8HCtYI2HBZxV
 X2WuppPEFqHi0yenWALJGemfWlSkp5ZSqPfgtPdLkBUF2jsFMnkZ5UaWso7a1WYuaPJtdjqfI
 sFq4y0EDIPf1pHIKXD+B1NVfJBWNii45g6yq9Gc2rT2ebydkP8gfkbbwq0pVzgk3lIOBROOSY
 xbn8tjYBF3tsIayBusawM++wOp9iQalxC+y/xVcljD3pOG1mpR+d2M4Er3nRi2x/x1f9XwVKX
 rB0kAvvhnCoNHXWRf0eetrf+zQrP3NKmvWTWgukl57zjPDH60YG0tsIoRDO25BhefXNb1HL2S
 uo1zWFzPhSYVPPal8rJVAoYeJoUiQPTjqzVjUq//0opTTKa4fjpqNC5UBhKu+U5AvgSY4Qtrm
 3tH4XDZxXHE9fmR7q6P32oyULab+jU2koOUAeNzBTusCYoKfXaYJmdNcPpqs3gmQ/PjsDAohL
 rFm8/lQ0eUY3E32nv/sLHJds7ZTjj1+EuuWiEr4xgAWI4oRIpM4hY76ui3CtxgYVBx9kgu3ix
 gTnNndDY5+hjNfxxgK/Eti5VFOm/fg8CNXu2+3M2tTmpvGbGWJbsDR7FvYlADE2rJtv1D5ts5
 FJkTifJV5Lsg6RzXf8OI04yAX3afua1QC4JDtsgchT2bcqPAS2MT8sQOcG2h6RpkUP6go9VoK
 E7u7hWbNsKmnRsAkPMcCIJtXS9NMJHWQI6vVysOr5K5RZNzeUsx5Y87K27IuXWyjGVVe8h7L5
 NBe4a7/+92J9ZYSqKfzI6mDe8w7EX4Tsua5/E9D+xfBFrHhVwqyHS5h4cVDRZFh7ZkzLKFpft
 GAcvjcZskBsz2GGkDJrcByl6BnY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696187271; x=1696792071; i=dalang@gmx.at;
 bh=w33va8vfaonROVHPI7+RwMv7J0Z3uO6DHX++JogE7qI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=McNffdKui9W2+D6Y9myHtmkl3PiEu4yPvlAdwEcyB1oR6URGKXPL2onIvfbcQcc1jKXI7yZF5Ds
 BAy9tMPqUDqEzNTOhCnYNazYs7enFTdJrms6B/UwgXmkXxHqvFjWTlF07sA4LxNXDqN3m01X8yyeC
 uo/3kOL3f1UrqSWCd0U4IpbIhmr3sfSHhzS2Lu+AltW+3FjTsDp1afCi5Hc+w+Oak12eO865gzXL6
 tdVoUS2a9OWSUKj5jcLp39FyfMxP4yM6zdqQ/LGtCztBDicDvY3ndPj9hMzlOC/bVLXm1X8W0/xZ3
 l4HnnE1Jq2BUtfeRc8zxD92w8dc9rO9V81aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=McNffdKu
Subject: [Buildroot] [PATCH] package/netsnmp: security bump to version 5.9.4
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

CVE-2022-44792 handle_ipDefaultTTL in agent/mibgroup/ip-mib/ip_scalars.c
in Net-SNMP 5.8 through 5.9.3 has a NULL Pointer Exception bug that can
be used by a remote attacker (who has write access) to cause the
instance to crash via a crafted UDP packet, resulting in Denial of
Service.

CVE-2022-44793 handle_ipv6IpForwarding in
agent/mibgroup/ip-mib/ip_scalars.c in Net-SNMP 5.4.3 through 5.9.3 has a
NULL Pointer Exception bug that can be used by a remote attacker to
cause the instance to crash via a crafted UDP packet, resulting in
Denial of Service.

The pgp key was changed [0] as the old one expired [1].

[0]: https://sourceforge.net/p/net-snmp/htdocs/ci/90a6d98aae21fcdff06b5be139eb4d44ae96a9de/
[1]: https://github.com/net-snmp/net-snmp/issues/595

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/netsnmp/netsnmp.hash | 6 +++---
 package/netsnmp/netsnmp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e1e9d10898..7898941271 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.3/net-snmp-5.9.3.tar.gz.asc
-# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
-sha256  2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a  net-snmp-5.9.3.tar.gz
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.4/net-snmp-5.9.4.tar.gz.asc
+# using key 6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB
+sha256  8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544  net-snmp-5.9.4.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index c7df49f947..b0c35aa894 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9.3
+NETSNMP_VERSION = 5.9.4
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
