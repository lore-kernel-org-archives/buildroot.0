Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E9CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26FA181191;
	Wed,  5 Feb 2025 11:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mvhxfty_rony; Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE728118F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE728118F;
	Wed,  5 Feb 2025 11:35:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F113CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EDE81184
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7Nk8xt8d-9J for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A98A81180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A98A81180
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A98A81180
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:35:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1thpY61hQO-004fFw; Wed, 05
 Feb 2025 12:35:42 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 12:35:30 +0100
Message-ID: <20250205113531.4161633-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250205113531.4161633-1-fiona.klute@gmx.de>
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:QenpFMbusF2gXffJYwTGNIvqPVYYbXy4Chbjo1tXo2qNYXABTHK
 u+PlzXpYQUB0eiHNM133Tbiccv99nlH8i1nyW+hWt6RMGIHLsnHxS3CdjFanY9p6rNJCw9F
 UGTutvU5W4lcR6Wj2NhzFJSlxbnoHik59vMa/RIVPFxHOzpbOi/7BsdA1Jp4AeHcwtcdusg
 Q/n4Hjf4aU7BqWzy838gg==
UI-OutboundReport: notjunk:1;M01:P0:3Gc7DcpB12g=;Xj+jWBsa7fCdyDQE+p0MAhq9WEL
 Bu9kNzgMVpSsMyqfx8UQNxK+WIPuBihnxtArylq7fHwuvPREEIZO8CbXS8pTezqFQUJg3WyO7
 /L7Qdkcj7uot5fP4tqtylt6iv3gTQqj6KqsaQq7pYYKMUAy4+lzFcOUZZn4rZHT5nkBK0PnDm
 dyUTsYlW1ou0N5uugPs+GBNu3KIZmyCBs1BNzEHChuHE+3aUtJppAep99XWd2d+1jAxVuKc8/
 VjCIwnAcecHydyhRfOAFCbtzvqkwkg3u712bVT0A1hmeJPCAfI08xRX8HWAWdAfTlfsMn8fb1
 Y4Aza5qbyvh753I/VJLkHqYp59wt3h0H114zxvWjPpSv+puNcRa+659JKcf9C2dU4z7JG78GO
 A+JAcy3ZuTptrFVtFj/XVZ1XPHehicCnBJHxMAtv3PPNuC6NO2ogvA+52Z1p+AAISh9bPIk8W
 sfEKXRTYhWV43fL68stV16ZG2D4umkSMiwA+ffpIEAMmo63UDpJDFgLnQU1UgTxGGhyaZhDbM
 7GLa49OvSkvD0UZUTf4tdEemDJsfLmYJUoYfMo0dJaNG8jJqOhWpLAd6ezSCo4YvPaHBQd1L4
 l606HpVKkZbgUG8tAHuw6EC5qNhsPvYb5ZTY5GAsVRPV6ddJrqgzM8tWq07a6E5394M83srcD
 ey/38JX62QbRbIm/Bsu+U9GKH+y5vNJ+aO4DCN6cPcyERlK1FeIb9FUb/i890QJbOD+ssXL7F
 JHLoIjaG9AKWMzcpXHXKPmhWs5K9Y8rQWVgg2NE2mP07eXz44+YnlHJuEGODdkHArI68D4Hoe
 qdHRimoEDee840CrzXg6d2zbIGb0eCNCrhaydHlHDJ/mR6Q8BK9jHEQaSVrlZnPL/JJ+Y19Ir
 MHFmUrYJHS6hT4jwlitq8vu4TfWIWrOenAeT03g87gHaoyPPeNYZ1JHKcEVyVf/2VWzRqL5j0
 kMtp8Sb21KAEct3mcUzcGeozWznHKyJWFHkIVNV+qXXW+u4O/MkrN1sEVXNXur6oDv1IUZR/A
 FVZF/br3goTB/xY99cv0sBAP+7N4XG1b+9+3J7C26o6JPT+3R+nhd1i8Cut6u+1Eg1z98WJG/
 8bswBf3Nw/GFiNfwG4ghOkYzl0+M0JeysF6r0qeb3NKp2WOGTnrmdpyx8CP5/UArzlhJn5Crw
 wgQo/QHZ0cwPDvRsCTysNqkZTmMj2b2XrwCe1kKD4enMOTmCx9JMZ/mc1Brosy+HmdxLvuV9s
 Sn6VXQknf7uaiwZrnnnsNel9TGL7KFrBs0FZjAr1j1IY5O7IfMXQ8f80z9Z1Rr1MkGZJuQb+X
 1stTzqP4RfeGAX3kdmO7AogFUsDJMxDAPUarAPoj15io9FvNr5Ztn7cKeWx/WuHOehyWwRJ6P
 wWgaYH9JRdkolVt6A6SHHErR1Glm+W/DSz5yHM9/L28zdFF8+82Zmi01xpT5ha0+eHfv2Fg9J
 BxBUt47mG5FTwmfNT0hAL3zdVdpGrVgrz7sb8DNkwhcRTj/5F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738755342; x=1739360142; i=fiona.klute@gmx.de;
 bh=Fv7TH4JAlOSQdvSQRRV2JeJP3pWmVEidWYkpPX2oimk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lNVtO3Uc+8Nw3z3PxRvCjvMuYd55+lqYQXgQ+xTQYahEWpcQE0MSygNVZQDz4yMf
 pDN+ZlYUSIRi6/F/8TkkObHrEPUgOnLAKFiV9qVh27wk3AhN2pDmzbIPEquKVHE8V
 fgl1g7nW0ONIo9hU0tibFROZgmAe5QAqs6BRe9rUq2yS76Wyp4hYQzmtDdx67DJAF
 l5AbmqE85hv347tTlPXTBkTSj90Enmn9hlb/KBmduwG5HSfrYvsETHccip8ZF4Qt1
 6mJPvKV6coiau5lFbHFVhKa4IxHXD0NcdP1/Rgm6r38C0+R891Tad6xdQIZgcK2fX
 W+LCmTp5U1DwwYFoiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lNVtO3Uc
Subject: [Buildroot] [PATCH v2 2/3] package/pkg-golang: do not force ld.gold
 on aarch64
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
Cc: yann.morin@orange.com, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Go forces use of the Gold linker on aarch64 due to a bug in BFD that
is fixed in Binutils >= 2.41 (that includes all versions provided by
Buildroot). Forcing Gold will break with toolchains that don't provide
it (like the Buildroot toolchains), so override the flag and use BFD.

See: https://github.com/golang/go/issues/22040

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/pkg-golang.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a3421af288..bdf8de4d66 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -118,6 +118,16 @@ $(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifeq ($(BR2_aarch64),y)
+# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
+# is fixed in Binutils >= 2.41 (that includes all versions provided by
+# Buildroot). Forcing Gold will break with toolchains that don't
+# provide it (like the Buildroot toolchains), so override the flag and
+# use BFD.
+# See: https://github.com/golang/go/issues/22040
+$(2)_EXTLDFLAGS += -fuse-ld=bfd
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
