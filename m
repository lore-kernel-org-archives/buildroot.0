Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955ADCA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 18:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C6F80E0D;
	Sun,  4 Oct 2026 18:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMuId4jIwEIX; Sun,  4 Oct 2026 18:28:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA58F80DC0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791138527;
	b=b9Ff8OnrHyYUyc2T1qzFwT5gaWgKVC9QHqhOPhw8c+JWZdvw/7/GItraCjxLLbfTOKbq
	 e+u+JXvfDDGo5LnSuuUXvKhnT3J9wyq/1oSErDSevAKqgKcPYmyzIugd6LfKK2EkkaYRU
	 nMCK713Ya5xOmFm/53fL4x8rFJR5rgbc7a3OEamXcZWoM6v1Clu+bKRiAZfFVxzdeSZ2z
	 Gh3ljOx6lNBX2uEwXXxa0ef5yXJOfftYacaHPTQ6dL4jhbOaAsCeATa3UvKE+2yqQjpq5
	 RiKS3UKm9AmEfXzjrkly0PvE8Grezd1LZg4/Iunq5/m6ROhqsfny+pxyTAOkOhUqRoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791138527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mVk2qT8l8qL6I9b2UU5zXBKlfylGbEoJPUOC1v0dzyw=;
	b=mahlukUfngD4qn4WkE5kY6IcZ9sP3pvolLH9nfPCpZoJQHTIQx+A6sSOSWJI1z2UAgH2
	 Ta939Z63Fq5Y1DgKZQX3UHCfzmHRSrnVxpXqb3o3XQsFpXzJ7lF/wBYhFmdVoyFnTp47/
	 JAGaCaSSFF7BCZfPNjvev8ukod4Q6vJYkKczvLAc0SBXGvYVAmBU6nubRyTET9bCI81sJ
	 10aykJb6e+ZBrdTKm2GMmLGK4EHvwLAyLWpr7vgLUkAiNMcdeU+uJjJg2QqLyUbCT5QSi
	 +w1OFJeTwBPswKm84YsUnDk419U+1JNq6vz6H0HomeLJovV6JiaJ9+uLFmJb+XEkTzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791138526;
	bh=mVk2qT8l8qL6I9b2UU5zXBKlfylGbEoJPUOC1v0dzyw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QbamqAwKIPEOa8rs5sGXxn7MqZoROcJCRR6cxM+feiHUgto2DKujIf4hCdridnNbQ
	 szgwVSGCbCZvJbpcQH9N8x/df3Xjzi5WJxOZu+hLJFLBfv1EDUXOfsSWPIIQb8eXhg
	 TdBpcryg8mLDOeZCAGNnl3jSPeOn036z3NAriiNurrt9bsrqe68MUDdZoTwIUx6jCb
	 TSaJg/Ick6n7VO7MBGWYMcGDNH4VZLUQmHF7ayqfq9wLr2O/RVbBzzCfDy1YBT2nmw
	 qvI4CDm/SdjebDWCUX8nvqEUbj2xlxaJzCKQSOTPKrLdjMXkK7wsk7tDH3CjUOwvdg
	 M6iHIX5OjKwRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA58F80DC0;
	Sun,  4 Oct 2026 18:28:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7EB22B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 240FF406A5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wTV83AbA3ra for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 18:28:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 152F2406A1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791138523;
 b=EV2+VMkwoyQMeFb1c/IRjzImadNT7aWVgXsO54lWKxF5D3amErLlgOF7EYAueDMgIGvG
 rLL/Sl/8glmuXzYlvd93EO3GGCsZOt9Fy8pk6qL9l7GIB1cADu65T8zbFdcOaF1wWjlVX
 O/Gla57gxborvFNeHHxZVF/LkILBeyBAYSzMsfnmRH0DWWgeUhavaR4aHoapF7VTkZlAb
 sWyCAZuD5htx7D09gS+OTpXBIIqQqnhWRArZZdcVDyGzDPxoUo1Q1gjFXPyJOesbPfWG9
 y6k9Ob7CXv2WZuXCD/bTFHloISKNF2BE7gu36WY98QJ2wSp1H8P5Gbh8/SQQoZpiHTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791138523;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mAFvB9VVVPeGgrkU+J6aAHETGTmaSJ2bnKzPSs+ui1o=;
 b=Ocjfy8F0EkdcYFKmp989f9sATOIZsyfeudszmHKhw/kNOAz1K/R02hZq7OLhMIYPW5wV
 x9pBPdzP6JynsF70Sw2EajTzA3x6mgHvgyW1mRMfRd0by7WiaPvmD7I5fLuwG1vCsiU0F
 A0j/Z+1tjB+/MD2sFXkcFgcrSa+vt47ApdEuKuVqegGDfCgzlb+HXsDNw51EnohsekHqC
 M7OE6hhs85S4DTS11IHhMC6G2ia6y5KOax2ah7gvCir5AGwGSKbG7N5MHnmXFrUpLx5Bp
 IiOynWxtjgHQ3xrDv0mAhOk3glitCU/UkJshWZi1e2WtNHLVV+FJAYv/C6Bxhe8Gu+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PVoWcFeB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PVoWcFeB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 152F2406A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791138519;
 bh=mAFvB9VVVPeGgrkU+J6aAHETGTmaSJ2bnKzPSs+ui1o=;
 h=From:To:Cc:Subject:Date:From;
 b=PVoWcFeBITScOlGwYSaTqqmhCyty4N6aIKiMO9zj1nTiQXvkHB+BYH9pQ8rbe4m6i
 15+Kh8I84TzGiJpn1jte8WvkvMrpdWhMyOHK0IES+GKZDsLuq1KDUUpuaCTwyYf3LF
 8mrjnbIPB7YtVd0wgu+hpWg2ly5b9d0/bUul+lQhAXg5NpjtKayBrFgx3Vscx8vNCa
 o5LBw7Y1lcy4op612ccTzewKMBgejeRxWp9lsZuccMZBvUdFLqZn5HVDXIkkc9jkht
 VrV2Dww13n8dnSB0GMFDFtvMocSxwMiQT19rIMGXEraXFnmfyR3XsgxjQrFRT7R2cN
 lHnCWjWwCoNqw==
X-KAS-Sym: v3:f51bdf72230551df:dxTGizojgIed2MDhDeyVPu3lvN0OPaq3mu0ERmbBX3G2Z
 qjenJMai5o5Ep6I1VJ4rXR8wxL39TST/lMX2dlP6ucpYlZc5IXPUe7WbHfr/sb+GXepjr/stY3l
 dYHSIpjfw5q2XDfi0uoNfBppnKk7FxjzymXekgcbsFPqwYITS7NgXJ1GnZeodgQ6aWLjekhZ2lC
 m/k7drVXQl6MtPgr7l/nf/AtJb5QNMeRIIMrPekTV7G73YDCPajIKZmhfWqva8evk1JtBmxE28E
 iGmEGdC1FdSJtIY9E0UsBNPFJDKAulQY49gr67XhLwklO72MiELUT5CxwBJdu8qj93Fnca/g==:
 FHm4JQmwi5sgEhM93kzX4SEbYKO6zz54C0Q/BflUz2hsOv3vDZ+iM81n7yTtZ7gpJdulSX0irFp
 mUnURr+vnZxuoE4/nmOdrHOjiZKGqxV/pksvp4CkTbb+o2CeKVDi5uJgEgihenOJcIxr7a9qN5d
 oyjDaUriSq0oNiKRaKgg7M9mNwkIIC6slOVUd8en4tI0d87chL+Y7eY1Vdxm1fzXpHVjBuPJPIC
 QmtnFWUbl2gRDhWDkRRRiwIEGC9bHXkDlougn0GYuOh37KHItZenCUXl95GihLGFo3SaPnMaXMm
 fxwXGGj69++3SfeSab2azYkyPMUOZsFimLXMHlKuL6dcQGfoSr4DxXop8aUGxX0Xa95AtPhetaC
 mC+5+sl20wYihw8rn1qTZEeBUzNfXpgzuStZjaDOQmjUty09NjxEVZ0ojv37W5URcKNKqsJtJQ5
 6gpH5PDNEfjccrrOiQo9fPMT4fVgRvThc2DC9fEvkJ272oDLzAOjJ1mTLWOqUrpcnRcfnhMu+SZ
 /cEqA6gfOkCXxFHNTBk9PaNVtPsckCeCAKn7DHX+VsOKS2X3+p5/69ujNE0LEYidgHwFs0ZnAzl
 ULHlTqkA1ULmORRb1i1dys6DfxtaNC+vc15+DmRape9G
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA808A4C52EC;
 Sun,  4 Oct 2026 20:28:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38486)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDQwx-000000004pq-2n6t;
 Sun, 04 Oct 2026 18:28:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sun,  4 Oct 2026 20:28:39 +0200
Message-ID: <20261004182839.2615667-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump to version 3.0.24
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

https://code.videolan.org/videolan/vlc/-/blob/3.0.24/NEWS
https://code.videolan.org/videolan/vlc/-/tags/3.0.24

https://www.videolan.org/vlc/releases/3.0.24.html
"Over 130 security fixes across VLC and its bundled libraries"

https://www.videolan.org/security/sb-vlc3024.html
"VLC 3.0.24 fixes over 50 security issues in VLC itself."

Upstream removed unmaintainted libschroediner library:
https://code.videolan.org/videolan/vlc/-/commit/614914f7bb7d4098bd5805724c0d8415d7fa32fa

Upstream removed support for mfx, which was disabled in buildroot, and
replaced it with optional support for libvpl:
https://code.videolan.org/videolan/vlc/-/commit/dcd1e9f447323a97ae230b9d86c7b8fd223426fb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/14754d73ba95dac50861e6fb609bbc0e8a81cb7e

with the exception of
bootlin-aarch64-glibc-old/build/vlc-3.0.24/.stamp_built which was broken
before:
https://gitlab.com/bkuhls/buildroot/-/commits/c66a31b0f7840c690de486941aa19b8d4d7b108e

No new build errors are introduced by this bump.

 package/vlc/vlc.hash |  7 +++----
 package/vlc/vlc.mk   | 11 ++++++++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 9634ba3f1f..4c9e67d1b8 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,6 @@
-# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
-sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
-# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
-sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
+# From https://get.videolan.org/vlc/3.0.24/vlc-3.0.24.tar.xz.sha{1,256}
+sha1  dae683b3939220eac4a5edfc816c44e00659e68f  vlc-3.0.24.tar.xz
+sha256  e7cab503d1d7d5849b89d2cf0e1ee60d0ef6d012407791b644b9cfc0cc225fdf  vlc-3.0.24.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 0ce6662353..1f6faa9a57 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.23
+VLC_VERSION = 3.0.24
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -66,7 +66,6 @@ VLC_CONF_OPTS += \
 	--disable-kva \
 	--disable-libplacebo \
 	--disable-linsys \
-	--disable-mfx \
 	--disable-microdns \
 	--disable-mmal \
 	--disable-mtp \
@@ -74,7 +73,6 @@ VLC_CONF_OPTS += \
 	--disable-notify \
 	--disable-opencv \
 	--disable-projectm \
-	--disable-schroedinger \
 	--disable-shine \
 	--disable-shout \
 	--disable-sndio \
@@ -401,6 +399,13 @@ else
 VLC_CONF_OPTS += --disable-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPL),y)
+VLC_CONF_OPTS += --enable-vpl
+VLC_DEPENDENCIES += libvpl
+else
+VLC_CONF_OPTS += --disable-vpl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 VLC_CONF_OPTS += --enable-v4l2
 VLC_DEPENDENCIES += libv4l
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
