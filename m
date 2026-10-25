Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C2606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y8C+ao5u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=sNLLwJ1Y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 455DE6061B;
	Sun, 25 Oct 2026 16:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Db1j6FoYtsm; Sun, 25 Oct 2026 16:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E5686060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792944564;
	b=Rq4Y8Ihm23ox4mnFNfxcRgvDlaCA1yonx125gdyTi7bSDpY3Rc7AWBt2MEacSo07Ozbg
	 Z9VO5xdfiX+qdsWTfCabk/tsCSKnC2BbInP+Tr49aTu3SfP63LGHR/fyp6DyRCXeC98DB
	 myOYAPpy9JzKX+k7UwRutjd/XV/xStl51+JHrpjtJ2LZziPBr2/NLUxpE3QhJQ++Mnm+H
	 kFZuE28+rF3u1uTAAkT2nfMzFtLteIzwZrj/bE71eL0RnG9cMeLTjOfYwnMkz9Hgjh5kA
	 Oy5WLE9035eNWx0jV3rXuKR4PTT/paTVTUezmhNTj7wx/tVNuAkveFloRKIPDQETz4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792944564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ASh9wb/UdJAw3dsbDrp8gf+wWnTuhVstkTRYXfuP4yY=;
	b=nhfmgx0lja7b2dVEe90Bidy7ZLQ15SNSludFhUTuACoJSUzRaQOSug+TEpuaMkZfCNY5
	 8V7k7xgf60eTUAsegFQEttdedybrwgJl1yqB9egbk3syhVdkG7YgUnzcnMzq02Lw7+1w9
	 EMuvc4ZfyBAq1VtVjJs5cpaVnibK8NlWp+91704bHpQ2HB7OeC07QqR8h5na3L3RBdZzm
	 NaVXBSxktprNhEFCrsUOkhYIRouPxwuiM2/kHqGNnHopbtL+MPp3BK/C+6EFjD1qvbd0T
	 k2noOACDPpQhn3+0TCIh0mAJ4KLTPF4RHIxL7iO9YphoKIMOteQ//5qi7z0jwAJDHVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792944564;
	bh=ASh9wb/UdJAw3dsbDrp8gf+wWnTuhVstkTRYXfuP4yY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y8C+ao5ua4jRm7R+hJ+KaKHhyQpvoabCdL+W33KeU4P3hjlxkaG0nCFb0Qoc0o5Do
	 XTs2Nghf287Tm9JWkomKoaYLxNxX+fA7+/FNT11CZZkc43S3DQsMPdchmqrqTDV4AP
	 /rxHCPUHeCcjxx6yJTt9KHgJpua+biGuNEG+ZpWtZ0GpE8zd59yl/TpSqPTBtEOYBd
	 FjVO+FVt3keYet5sRqcSPiEOytxduZ0BCtcrJUYz6F9vp2gMqLhZKtxBgk3Ai5At7x
	 E77bgZo108KsXkil0BjQgZZ2RR5ElAdEyO+G7Pm2PVGnHBqeik2vtMFDiR4wL9ZT3s
	 LcyBYp5OjIxBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5686060E;
	Sun, 25 Oct 2026 16:09:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B7D79F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1BF780DB8
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBSxFeVu9YeE for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 16:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5079980DB4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792944559;
 b=Nw6Z7kazaG+RyvsIQs3xFfHvINLiy/a6FFu7xT4gtGiyFHlQqo1jNBR4yWxzQTFY9djL
 3p0UoRL8qs0JywqTnJS2rxekh7WbNAbSwQbv3t0M24SPk6hn3zc1tlxvmhWHoPUUuzQgN
 3CdIYdLLaMbQXNd4BnUa+raDhJyZasMyMsKfJS6i24YHGx/5+DXwecGTQYGXFXU5EdAKJ
 yJHzY+vj9rMbs/buWIXSCmBilkU7jUfg0+j8orrfDepOqMQEqTT5X++2CnAZkdceCmO6Z
 gHLy1KA7R+IOx14CLzGHYRZZ5El/0QVygLyN8GjohH5r9nQwUpX+65oCsk74gfpvP4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792944559;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SDjLzAfUT7pvPtbJBLPyKTbMAAXukCwwFmtmvXG/6cU=;
 b=cMj7TIgYFSBmhiUaTAZLIuka9fW00vney96swNossupsekW+DP1kdU2So6+ZVeoaTs7V
 XWlVTSC3TekH5QcBzgBZJlxR8Zvj5dM00ntovaGu0H084ibbfqUZF76wyJHjWKIegDe0f
 J/3wfxfadM3UilKDlfoi3X27XtaqFkyTxsK7b9TgZpZsJyC80DW43fG9hHFHI4mUy/I7a
 iBUtCWMGOTQrgSaaTw8lshJiwwJaKokd/SSerExRQzXDDM8kiX3axDfUdvLpLFKDKNOm0
 wh3dHRqpwXmeoNqOITot9VX+S+uus6ZeORSLWsPPslg+WcNKtPBM+d8hjczaF2XrUDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sNLLwJ1Y; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sNLLwJ1Y
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5079980DB4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792944554;
 bh=SDjLzAfUT7pvPtbJBLPyKTbMAAXukCwwFmtmvXG/6cU=;
 h=From:To:Cc:Subject:Date:From;
 b=sNLLwJ1YMJplHNVAQlsF8aJb1ESIwy9JhLdD4a4OLNYRGEcGHqfVTjgq05MrISbmD
 Go9mzro0UzTr0GF9A0wBNhdwMsVKkWIElzkbY0JyN7A1lxR9j4oTpOfCnCh6ckvZJa
 tTEjm873E6FwRRm+d05hdzg/E0DGwdFDYEiFlpz87NrUOO3jKZzlwjSgzzUSg09CYr
 VPruTE/mBC+FqpPu1jqkVek5QgD3ASfCS0wfxSjSVqhG0Wr5alOvMKz3MTQYs5k/og
 D8dP2meR8wPQyzrs1J+McymdQf0+aK7wKhnJuJyoKn8MLo8m06vLJIj0blBmcHFHLp
 0FwRHJM7a+WEQ==
X-KAS-Sym: v3:f51bdf72230551df:SXEBPGvQUI7wUHH6SmaQnf9tMxa+JRCifVqrxVKeOzDZ6
 44RhnsRDLFvOkwc/X6UQW5nIsOnYFDqQdX0bQlWPg95wD3VOSUK7+c6L8MmgluA67ImIxDTQbxU
 VbeiHhMtToH+5zEKCi2YnzuuG2FVu3Fq4oxPa3J6L9AMgycO0QVPsmsRHFOcZEs7w3vp+vY4e68
 HCd5Ukd9CBZPVAuyxPhND+GP04oRzDZdIOT2umP6ybVG025pHFI2CNXpUhKLM0oGJtzT6drtikk
 pX1ebMHHK1dWLMG3dd3JnQdJRyz4npYbveNRHqs0SoUicAKTyCxOeCxz/zvcZFUruHmzE5pQ==:
 i9542n4JQRuSG5CcV6eeGLb2PHf69tZ3Mkt/ZxV2sq71i5P1Lchk9zm9rbmUP76tPF5udHGmoGP
 uBZvxH4UGfKgrvkZ4DYgwXcCirCoqybxUEGVZHPxHXVSZRlIVBakXIjADkj/mKLTNZ1daVGmUDD
 Lq5a7LThTTpq8p/YBIIldNoxBtA19Ur1EGRzGu5F6MTT3DTGUq+qRKD55LXYlkRk/q2ZnAloYvP
 bYzE9J47ZVz8kywzotJaIaXjnirpYFB3nDSBTEek1p9fXPQMnM8gJ+VvHLqqjP9y5IujygSnIka
 v/aUlpZzM8Ug1MCYrIpNwX1mvM4+jLaKQRkDHQKmDO/t46EZgeSt6VPkTwkiOhMczQRmC4kGs7H
 o+jgqd4v8z+yAnlpHPi8/XvmMkqRIt8e17z9BP1udKuz/YB1tjPKeRj+DxQesKORJCAGCJ2d7YO
 T+WoogO9tHOHncKzF6XwnxAul5OsWs53tfeAQdA7ZxPRBQeFPrTF6mNjhXKFyyq6ELJM5KvUVhs
 HjGKwDxWiIDhIF1aSDVPiM6WBv/J/WFZhGMQLMafWtZXcmenROvpbyiMQYvNbxLtjDTQDdTHY/q
 RDo/weY0K1HlkXvcw5wrcByMP7sKR5YAzMWaSIXz15ifWx6grJdonoCzNp/nDG+ukmUOF+O3R6s
 alQPOgH39eaDAdMCdUJ5gsPbTBM6CA9WPewDM4CWbnxa1CGs9Ig/sO0CDFFBI
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17CDDA4C6ADD;
 Sun, 25 Oct 2026 17:09:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54794)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL0mX-00000000616-0k8J;
 Sun, 25 Oct 2026 16:09:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 17:09:12 +0100
Message-ID: <20261025160912.468488-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: bump version to 2.18.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Daniel Lang <dalang@gmx.at>, Sergio Prado <sergio.prado@e-labworks.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Mario Rugiero <mrugiero@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Simon Dawson <spdawson@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.freedesktop.org/archives/fontconfig/2026-May/007334.html
https://lists.freedesktop.org/archives/fontconfig/2026-June/007345.html
https://lists.freedesktop.org/archives/fontconfig/2026-July/007371.html
https://lists.freedesktop.org/archives/fontconfig/2026-August/007385.html

Due to upstream commit
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7643efb77552076b035d3eb506ca836ed4764ca5
added in version 2.18.0 fontconfig now uses locale_t which adds a
dependency to BR2_ENABLE_LOCALE that needs to be propagated to its
reverse dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d77ec80cd462a3b3abb5120c5ee5bfebafe0fe9c

 package/cairo/Config.in                        | 4 ++++
 package/cairomm/Config.in                      | 4 +++-
 package/cairomm1_14/Config.in                  | 4 +++-
 package/cups-filters/Config.in                 | 4 +++-
 package/efl/Config.in                          | 8 +++++++-
 package/fontconfig/Config.in                   | 5 +++++
 package/fontconfig/fontconfig.hash             | 4 ++--
 package/fontconfig/fontconfig.mk               | 2 +-
 package/foot/Config.in                         | 6 ++++--
 package/ghostscript/Config.in                  | 4 ++++
 package/gstreamer1/gst1-plugins-bad/Config.in  | 8 ++++++--
 package/gstreamer1/gst1-plugins-base/Config.in | 4 +++-
 package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
 package/gtkmm3/Config.in                       | 4 +++-
 package/kodi/Config.in                         | 9 +++++----
 package/kodi/kodi.mk                           | 5 -----
 package/libdecor/Config.in                     | 4 +++-
 package/libfm/Config.in                        | 4 +++-
 package/libgdiplus/Config.in                   | 4 +++-
 package/libgtk3/Config.in                      | 8 ++++++--
 package/libgtk4/Config.in                      | 4 +++-
 package/librsvg/Config.in                      | 4 +++-
 package/matchbox/Config.in                     | 4 ++++
 package/openbox/Config.in                      | 4 +++-
 package/pango/Config.in                        | 4 +++-
 package/pangomm/Config.in                      | 4 +++-
 package/pangomm2_46/Config.in                  | 4 +++-
 package/pcmanfm/Config.in                      | 4 +++-
 package/poppler/Config.in                      | 4 +++-
 package/python-pycairo/Config.in               | 4 ++++
 package/qt5/qt5base/Config.in                  | 4 ++++
 package/qt6/qt6base/Config.in                  | 4 ++++
 package/ratpoison/Config.in                    | 4 ++++
 package/rrdtool/Config.in                      | 4 +++-
 package/sway/Config.in                         | 4 +++-
 package/swaybg/Config.in                       | 4 ++++
 package/tk/Config.in                           | 6 ++++--
 package/vdr/Config.in                          | 4 +++-
 package/vte/Config.in                          | 4 +++-
 package/webkitgtk/Config.in                    | 4 +++-
 package/weston/Config.in                       | 1 +
 package/wmenu/Config.in                        | 4 +++-
 package/wpewebkit/Config.in                    | 4 +++-
 package/x11r7/xapp_x11perf/Config.in           | 4 ++++
 package/x11r7/xapp_xclock/Config.in            | 4 ++++
 package/x11r7/xapp_xfd/Config.in               | 4 ++++
 package/x11r7/xapp_xlogo/Config.in             | 4 ++++
 package/x11r7/xlib_libXft/Config.in            | 4 ++++
 package/x11r7/xserver_xorg-server/Config.in    | 4 ++++
 package/xscreensaver/Config.in                 | 4 +++-
 50 files changed, 173 insertions(+), 45 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index c41a12fe81..f1b58973d7 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
@@ -28,3 +29,6 @@ config BR2_PACKAGE_CAIRO_ZLIB
 	select BR2_PACKAGE_ZLIB
 
 endif
+
+comment "cairo needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 174f3967ab..33d2bfe98f 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIROMM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_CAIRO
@@ -13,7 +14,8 @@ config BR2_PACKAGE_CAIROMM
 
 	  https://www.cairographics.org/cairomm/
 
-comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "cairomm needs a toolchain w/ C++, wchar, locale, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
index e369aa6f4a..c9aa593d6f 100644
--- a/package/cairomm1_14/Config.in
+++ b/package/cairomm1_14/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIROMM1_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_CAIRO
@@ -16,7 +17,8 @@ config BR2_PACKAGE_CAIROMM1_14
 
 	  https://www.cairographics.org/cairomm/
 
-comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index b5b9e04a28..8c8cecd516 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP # qpdf
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
@@ -32,9 +33,10 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 10"
+comment "cups-filters needs a toolchain w/ wchar, locale, C++, threads and dynamic library, gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/efl/Config.in b/package/efl/Config.in
index c4f82b92e3..f824a212ca 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-efl
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -280,16 +281,21 @@ config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
+comment "SVG loader needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar"
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar, locale"
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 218fdb2e7a..e4c6e3da59 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # locale_t
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
 	help
@@ -7,3 +9,6 @@ config BR2_PACKAGE_FONTCONFIG
 	  access.
 
 	  http://www.fontconfig.org/
+
+comment "fontconfig needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e6f2e0771c..f1373ae75f 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz.sha256sum
-sha256  9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541  fontconfig-2.17.1.tar.xz
+# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3/fontconfig-2.18.3.tar.xz.sha256sum
+sha256  4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3  fontconfig-2.18.3.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 639f6ed51d..4cd11dd898 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.17.1
+FONTCONFIG_VERSION = 2.18.3
 FONTCONFIG_SITE = https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/$(FONTCONFIG_VERSION)
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
diff --git a/package/foot/Config.in b/package/foot/Config.in
index b0ec2e3926..5a3ce7a773 100644
--- a/package/foot/Config.in
+++ b/package/foot/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FOOT
 	bool "foot"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fcft
 	depends on !BR2_STATIC_LIBS # wayland
 	select BR2_PACKAGE_FCFT
@@ -32,6 +33,7 @@ config BR2_PACKAGE_FOOT_THEMES
 
 endif # BR2_PACKAGE_FOOT
 
-comment "foot needs a glibc or musl toolchain w/ dynamic library"
+comment "foot needs a glibc or musl toolchain w/ dynamic library, locale"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE
diff --git a/package/ghostscript/Config.in b/package/ghostscript/Config.in
index 023ef5f2ba..f037d764bf 100644
--- a/package/ghostscript/Config.in
+++ b/package/ghostscript/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GHOSTSCRIPT
 	bool "ghostscript"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_GHOSTSCRIPT_FONTS
 	select BR2_PACKAGE_JPEG
@@ -12,3 +13,6 @@ config BR2_PACKAGE_GHOSTSCRIPT
 	  Document Format (PDF) files.
 
 	  http://ghostscript.com
+
+comment "ghostscript needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0586b7f327..4eb5058b13 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -475,6 +475,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	bool "ttml"
 	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
 	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -486,10 +487,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	help
 	  Timed Text Markup Language (TTML) subtitle plugin
 
-comment "ttml needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "ttml needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
@@ -568,13 +570,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "rsvg plugin needs a toolchain w/ locale, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 6eff685c2f..2da9e9da22 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -265,6 +265,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_ENABLE_LOCALE # pango -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
 	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -274,10 +275,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pango plugin needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index c4eb4efb65..8e45dcb759 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -328,11 +328,15 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	help
 	  Cairo-based elements
 
+comment "cairo needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
 	depends on BR2_USE_WCHAR # flac
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index ac38ba06fc..d6f59efef6 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,8 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	depends on BR2_ENABLE_LOCALE # cairomm -> cairo -> fontconfig
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on !BR2_STATIC_LIBS # atkmm
 	select BR2_PACKAGE_ATKMM2_28
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 16b86f3fe5..53b3a31360 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -9,11 +9,13 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_m68k
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 9.x, host gcc >= 9.x"
+comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, locale, dynamic library, gcc >= 9.x, host gcc >= 9.x"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE \
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_HOST_GCC_AT_LEAST_9 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
@@ -63,6 +65,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # gnutls, python3 and others
 	depends on BR2_PACKAGE_HAS_LIBEGL
@@ -88,8 +91,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LZO
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 32dd9a3ada..d374ce80bb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -144,11 +144,6 @@ endif
 
 KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
 
-ifeq ($(BR2_ENABLE_LOCALE),)
-KODI_DEPENDENCIES += libiconv
-KODI_EXTRA_LIBS += -liconv
-endif
-
 ifeq ($(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
diff --git a/package/libdecor/Config.in b/package/libdecor/Config.in
index 782fe855b4..113f154c1e 100644
--- a/package/libdecor/Config.in
+++ b/package/libdecor/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBDECOR
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_USE_MMU # pango
 	depends on BR2_USE_WCHAR # pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
@@ -18,8 +19,9 @@ config BR2_PACKAGE_LIBDECOR
 
 	  https://gitlab.freedesktop.org/libdecor/libdecor
 
-comment "libdecor needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libdecor needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index abb35ca3dd..6a64d1fb50 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBFM
 	bool "libfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
@@ -27,11 +28,12 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "libfm a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index d26a997d46..c53abe78de 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGDIPLUS
 	bool "libgdiplus"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -14,8 +15,9 @@ config BR2_PACKAGE_LIBGDIPLUS
 
 	  https://github.com/mono/libgdiplus
 
-comment "libgdiplus needs a toolchain w/ wchar, threads, C++"
+comment "libgdiplus needs a toolchain w/ wchar, locale, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index dac2d17974..08dfbc9178 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,8 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
+comment "libgtk3 needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+	depends on \
+		!BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
+		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
@@ -16,6 +19,7 @@ comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libepoxy
 	depends on BR2_USE_MMU # glib2
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index c1f3928b8a..5c21b34531 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,8 +1,9 @@
-comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "libgtk4 needs a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
@@ -16,6 +17,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 9f5c2f388e..46e431f700 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
@@ -21,10 +22,11 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://gitlab.gnome.org/GNOME/librsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "librsvg needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 9d212902a0..7eb9990160 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_MATCHBOX
 	bool "matchbox"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
@@ -33,3 +34,6 @@ source "package/matchbox-panel/Config.in"
 source "package/matchbox-startup-monitor/Config.in"
 
 endif
+
+comment "matchbox needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index e042ed2b48..ca2adead88 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # xlib_libXft -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -20,10 +21,11 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "openbox needs a toolchain w/ C++, threads, wchar, locale, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e2b2e7fe2b..d6d48efa20 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -24,9 +25,10 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pango needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 6ddad9e6ef..b8b70cfd28 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGOMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	depends on BR2_ENABLE_LOCALE # pango -> cairo -> fontconfig
 	select BR2_PACKAGE_CAIROMM
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_PANGO
@@ -15,8 +16,9 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "pangomm needs a toolchain w/ C++, wchar, locale, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pangomm2_46/Config.in b/package/pangomm2_46/Config.in
index 772b523c83..95d069d823 100644
--- a/package/pangomm2_46/Config.in
+++ b/package/pangomm2_46/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGOMM2_46
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	depends on BR2_ENABLE_LOCALE # cairomm -> cairo -> fontconfig
 	select BR2_PACKAGE_CAIROMM1_14
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_PANGO
@@ -18,8 +19,9 @@ config BR2_PACKAGE_PANGOMM2_46
 
 	  http://www.gtkmm.org/
 
-comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 5250176c1f..2e7203ad8b 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
 	depends on BR2_USE_WCHAR # libfm
+	depends on BR2_ENABLE_LOCALE # libfm -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
@@ -23,11 +24,12 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 208126a327..52e8c4e2d8 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POPPLER
 	bool "poppler"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -31,7 +32,8 @@ config BR2_PACKAGE_POPPLER_UTILS
 
 endif
 
-comment "poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 7"
+comment "poppler needs a toolchain w/ wchar, locale, C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
index 0d8de977e1..70d19acd80 100644
--- a/package/python-pycairo/Config.in
+++ b/package/python-pycairo/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PYTHON_PYCAIRO
 	bool "python-pycairo"
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	help
 	  Python interface for cairo.
 
 	  https://pycairo.readthedocs.io
+
+comment "python-pycairo needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index dfaa798bd4..2068ffa6d1 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -238,11 +238,15 @@ config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 
 config BR2_PACKAGE_QT5BASE_FONTCONFIG
 	bool "fontconfig support"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	help
 	  This option enables Fontconfig and Freetype support using
 	  the system fontconfig and freetype2 libraries.
 
+comment "fontconfig support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e6bb99de28..2d8c5ceeac 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -125,11 +125,15 @@ endif
 
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	help
 	  This option enables Fontconfig support using the system
 	  fontconfig library.
 
+comment "fontconfig support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_QT6BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
index 7b724290c3..81a1f8c334 100644
--- a/package/ratpoison/Config.in
+++ b/package/ratpoison/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RATPOISON
 	bool "ratpoison"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -15,3 +16,6 @@ config BR2_PACKAGE_RATPOISON
 	  advantage of your precious screen real estate.
 
 	  http://www.nongnu.org/ratpoison/
+
+comment "ratpoison needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d954fd1214..b36202e466 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_ZLIB
@@ -26,8 +27,9 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
+comment "rrd_graph support needs a toolchain w/ locale, C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/sway/Config.in b/package/sway/Config.in
index c89c0607d3..f80f73031a 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
@@ -61,10 +62,11 @@ comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
 		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBGBM
 
-comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+comment "sway needs a toolchain w/ wchar, locale, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
index 63aa8cdb6a..bb73c35cca 100644
--- a/package/swaybg/Config.in
+++ b/package/swaybg/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SWAYBG
 	default y if BR2_PACKAGE_SWAY
 	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_WAYLAND
@@ -11,3 +12,6 @@ config BR2_PACKAGE_SWAYBG
 	  Wallpaper tool for Wayland compositors.
 
 	  https://github.com/swaywm/swaybg
+
+comment "swaybg needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/tk/Config.in b/package/tk/Config.in
index 507b0bf979..7c958fe8e1 100644
--- a/package/tk/Config.in
+++ b/package/tk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TK
 	depends on BR2_USE_MMU # tcl
 	depends on BR2_TOOLCHAIN_HAS_THREADS # tcl
 	depends on !BR2_STATIC_LIBS # tcl
+	depends on BR2_ENABLE_LOCALE # xlib_libXft -> fontconfig
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_TCL
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -12,7 +13,8 @@ config BR2_PACKAGE_TK
 
 	  http://www.tcl.tk
 
-comment "tk needs a toolchain w/ threads, dynamic library"
+comment "tk needs a toolchain w/ locale, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index 38502729a7..c7b22e6fa2 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VDR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -17,9 +18,10 @@ config BR2_PACKAGE_VDR
 
 	  http://www.tvdr.de
 
-comment "vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
+comment "vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, locale, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
diff --git a/package/vte/Config.in b/package/vte/Config.in
index af6bfae890..38ae3f8c44 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VTE
 	bool "vte"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3 -> host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # libgtk3 -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -23,11 +24,12 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, threads, C++, gcc >= 10"
+comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6600ac17cd..f5c05349f5 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, locale, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_7
@@ -36,6 +37,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
diff --git a/package/weston/Config.in b/package/weston/Config.in
index dcb5c7544e..1f4d9a84e2 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WESTON
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wmenu/Config.in b/package/wmenu/Config.in
index ce9e70f9f8..a8e0a33d58 100644
--- a/package/wmenu/Config.in
+++ b/package/wmenu/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_WMENU
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_USE_WCHAR # libglib2, pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBGLIB2
@@ -21,9 +22,10 @@ config BR2_PACKAGE_WMENU
 
 	  https://codeberg.org/adnano/wmenu
 
-comment "wmenu needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+comment "wmenu needs a toolchain w/ wchar, locale, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 91de3868bb..0cc6c55efa 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,10 +16,11 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
+comment "wpewebkit needs a toolchain w/ C++, wchar, locale, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
 		|| !BR2_HOST_GCC_AT_LEAST_7
@@ -37,6 +38,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 0f1eca8938..eb02375fe8 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XAPP_X11PERF
 	bool "x11perf"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  summarize x11perf results
+
+comment "x11perf needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
index 083a6d1e40..36113049a0 100644
--- a/package/x11r7/xapp_xclock/Config.in
+++ b/package/x11r7/xapp_xclock/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XCLOCK
 	bool "xclock"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
@@ -7,3 +8,6 @@ config BR2_PACKAGE_XAPP_XCLOCK
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
 	  analog / digital clock for X
+
+comment "xclock needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
index f006b1e488..1312501bde 100644
--- a/package/x11r7/xapp_xfd/Config.in
+++ b/package/x11r7/xapp_xfd/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_XAPP_XFD
 	bool "xfd"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  X.Org xfd application
+
+comment "xfd needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index aacb75ffb0..dc7a20ccf0 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XAPP_XLOGO
 	bool "xlogo"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  X Window System logo
+
+comment "xlogo needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index 84967a55e3..16261b485b 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXFT
 	bool "libXft"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -8,3 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xft library
+
+comment "libXft needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 89410f22bb..23f49ea7dd 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,10 @@
+comment "xorg-server needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 5763f12601..d4f59ed945 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
+	depends on BR2_ENABLE_LOCALE # libgtk3 -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
@@ -31,7 +32,7 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads, gcc >= 4.9, OpenGL backend"
+comment "xscreensaver needs a toolchain w/ dynamic library, wchar, locale, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
@@ -39,4 +40,5 @@ comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads,
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
