Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574ADC001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DC161182;
	Tue,  8 Aug 2023 15:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DC161182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dISYcgnLHv3M; Tue,  8 Aug 2023 15:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238056117C;
	Tue,  8 Aug 2023 15:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 238056117C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69CBD1BF37C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 15:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1B981FED
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 15:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1B981FED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHiOWZDUee0u for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 15:16:52 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Aug 2023 15:16:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A954781CE7
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A954781CE7
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 15:16:51 +0000 (UTC)
Received: from uxmal ([37.161.196.16]) by mrelayeu.kundenserver.de (mreue010
 [212.227.17.189]) with ESMTPSA (Nemesis) id 1Ma1kC-1qHFIK3j7c-00Vwxg; Tue, 08
 Aug 2023 17:11:45 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 17:11:03 +0200
Message-Id: <20230808151103.5597-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:PYD6auiiWC+ip4QTaIDzSILNwtRiu0DsZit9+hWHPdm9FreiWpc
 ikIrwnGmwc6ES/W2uuMu/Hcdx11vIJmNJk3A7QEDwXUF1ikUBJIosEahQVH+jvMslNmYJFM
 uXVyksyXts+esP7ZKqAVE4e7yAFlQ8C7OUzyKihtSGgV9zTmOxqMRiFNxyeM9Wvqq3q6kPJ
 IgeW1Cxr/k7amDizSxEBw==
UI-OutboundReport: notjunk:1;M01:P0:cfkiO2LmHjM=;5x6+YT5sxK8Hvj6xOi6EgGW/47s
 wJ1cGnjp2N1EDPp93c2b615Rf+1dntH13GWyVv0vBvXHbNTt3+ws8z5B3MfosK1xq5sDBlJQY
 muB5ntMWapMa/94A9T+bDaDKATNUUYuwWMa8FADomk9HTieAaifF0tY7GOEXXTnpykaJ3924C
 E90A30PRH9cRRFDNBQtnYVZ5mpvEi2tnzSyaFlkEUF7qe5G4XESSRU799hy/2Obw6V2tFPZCM
 huLqwmcjwubJK7kIYPohgM1k6PSP6xpFH2S/y0jcNz55DAKu6zRSwc0b6YU9JHJZEq8MSGUD/
 Ov7j+vxySou1BebtwfneK5SL03z3OYm8GVRhnRkwNXy99N5002mm2lQuRcxqSoI2OAEy2qVTc
 Uz0ZJhu53mOUcUv0YE4bQ+0qkFaDFTf1u764m1550g6nRGfX6ZYzOOxBrCd0i2TX6LVxHVIbZ
 TGY0nYto0HY3pNzcAWoCDH51r4Av5OzA3dmDTNfYtNlc9gnQANiahS0ydlpimDGciPVzGo/+K
 yEuXo1KtJLgFMYcUUwkHkoYpO9hAJKE0c2dAq74w+uDGY6JoTnO8TtLzqxt2G1duQivTR5Yq0
 AbYo99g5HR236+4rnrUDb3pDMSEk+R3eYLXKR5P0VxBUDVYrFbU4aWvZCZGh2rcYXlaAhKeWa
 w8IKBsjdhlGo4arlvLtbLQtSKl1EVhpB2p+aRLxGDLDj2p8l1mdayttsYWurrwHrsN2evnoqq
 M3B4xUQKEG0vQ7raSPfua6yFc3/2D0wQ+8BqZ6XUINkOj2gzE5NhSpZjG8Rbe+QhjBRBHHlXJ
 BgLhSER5IcIgHx88Lq3URHKHUisUud2eEV3Wp/DhPyXapfgiIOy7VDPFtRGP8/6Ib+4re5Nux
 7dBiKRKaU3bwUSQ==
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: Bump to version 8.2.4
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/ivmai/bdwgc/releases/tag/v8.2.4

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/bdwgc/bdwgc.hash | 2 +-
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 917089da08..8fa49b4585 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
+sha256  3d0d3cdbe077403d3106bb40f0cbb563413d6efdbb2a7e1cd6886595dec48fc2  gc-8.2.4.tar.gz
 sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index e776fb7458..bff703ee98 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.2
+BDWGC_VERSION = 8.2.4
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
