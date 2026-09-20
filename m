Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D2C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B353C40D90;
	Sun, 20 Sep 2026 17:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCYhkBz2duDq; Sun, 20 Sep 2026 17:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 986CD40F5A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924776;
	b=Y0KPCMZGqwEpR5EpAtTQ60iKLZiIcN16HaToJGl+869U2zDYiFX3EcAhTE/4BFI1dl++
	 3Yyrubmc6WxOJSSDFlP6CaQKX37HIDN1JhkqFdsnlWV+FN1qLzru53cj9Lm9bn8CAd1uF
	 gSmhdjcSKtanP1RGXjBJQtSU1vsc1qVIm9CrKrqFsAOk0NNQpIWJtcCRRKwOx8OVeLSzT
	 FDg5O9+/JfmY+bppJ9mKq6kk19a4+/khNxjggp2jVTgbF36fkYoOlUjxwqqa7GI1cJr2p
	 BChoj84N6beiAbuiWAxG2NRPMPfImQIsO04BbTT5LBZEauW1o1sBmM9nFTVbusEQ0hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RpELp7fPqZK0GKrTFYbXJgv2JJQp48TQyU1ga+X68e8=;
	b=tSY9PeG3jF19huL7mMOSHNltPn730AIe9enYBU48NtF/Jsoy2ByxNeqNLFRXStcf+6J/
	 /Wm/XZzRuRsRC1s9n6HRtmFg1G2po4XRNftWrmyD6rL0zwkjOBURwNC4WlZF7IApqR9BW
	 bS4OeY7zKW/8IFOfQdEYgYdZqwQX1NANCy6NKKH4SFTTUN5vgV2HjpqLt20zxAGQD+AO/
	 AQ1KeuBId33B7f3flHPf/bGhkvkkPoMmQv/KDkX+rmASu99CE7JGhalCePnDLKaMk6i9f
	 gqEPxCRHJhU8+1rBp7NXATUdfn9G0Di5UYz5YJeD3xumdHQcAaCJ4wSyzesKdt9uscA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924776;
	bh=RpELp7fPqZK0GKrTFYbXJgv2JJQp48TQyU1ga+X68e8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NGnrViGA8NgBQQxXETbBqPdQYDVDlALmozN1U0GbBkbO+9Hdz/q0H2S2rztYVFiPM
	 cGFEu03ljNnyDPjLbXliHg2J8++K+8VgXDGk9BOP0Hbtkxd+wbO4wOE28yBUc2NRcH
	 ZRtX19GQlfeuW1pWdpvJVBsf/h0I/xbSJ+EqNrwiJOG42y1mFt/sD5MfHm74Wgi9IE
	 mhvnlHBbQrVrfGqnxJbs6cyv4zspy0KdWlzrmoE3k3BcPj9OL2qJZqzOgX8xwHJZOP
	 DxGGFeV85AR04OINAJmhfjnjt8AtX7ZFvpbXL1IMLaKbS+K3nZCaGCIt0evd/vFHMe
	 w/LMiL46j25iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986CD40F5A;
	Sun, 20 Sep 2026 17:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EAD73FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3086780DC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWKCDnjEoMch for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2797480DC2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924774;
 b=TCGN+9/Z1RHxncbo5B2samxbqjvjkYCmV0zEJVxrV612Yrw+HyEsaR2hCHkNbmsYzYrG
 228hg8bXOfwh/2Haf38ms46b/rPfURPyUKiY9Sz2t/Sei02shitJ5oca5FqHcCGC7gHtx
 OH2xks4eSU6kGukh3HRO0SB4eCfI2jvjM2xfbEkBICw60gRGrt3DPtcNhGNuUCCcqMGqJ
 7kuJNstZjh521Oq8bTP7MLZrgVYei4s/FOEIPi0fsw73XlL/r6Z8fTmZYPXfLVJ7iG6W8
 RnsXmii0kQSUDfXPUA8rpjO+t5LE7nciaM5DOZYzGncqxJob0rICwDs9nL7lbWau5Uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924774;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+i5lgpMo2Dxxs70DvH62jyuptYOqcjaXlGHpdSRlC1k=;
 b=puP7qzNvp03h2/4dE/mj+4DPn7daQe0WLQnbnGOG6C1DcgX48Vb4IfN/s8hCzkpbG03i
 f0ZPQZMwyLcs0tdxxRxQJ5xhSP273girIEpCy3VxPLC74mo76AqqdmSj8w9lrfOWCOLrg
 z1MOavMJnUQlMYV4meLjBEEUGXefSUhHVescYdq/ctrbOqsL1+2oMyfsbQPlGQ3VxHMz7
 jApxAgm/NW+6bhPy0Bp4cpxBj5vQNaU0btqpmiTAJ4yMtp4Cq0AGWFPF2vMYkkdy+IXIJ
 GyHV9SBE/5v4Gl4RnCFRl1ngF+VzSJsDjCYGL8diiEbVJMNxjyho8bwIhCKzsJMbA8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sS7Jhh2K; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sS7Jhh2K
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2797480DC2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924162;
 bh=+i5lgpMo2Dxxs70DvH62jyuptYOqcjaXlGHpdSRlC1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sS7Jhh2KvYH6erZPafmJoBdYexpperpOPjAij5xQe+po1YIjg65ZXg8AZJKelbPLo
 wqfee9UyTVmi1K1b3GQTGG4Ilr1OEu6xfVaA749uVeSdITYg+fj2ZT7rzodK0aR4M8
 YPvuUelfIcN/5PDJAclQFOGPmbnLr5F5hWdBLFW0PvpybVPkx+tscOcYNtcYRDfI4I
 2RXaMInQMr/2hEu7BCfwsooZkUfTeyEu7jP3TmwhOcPIgri/6Zc+fTSZypo0cOGSgI
 Jh3Fsfk/LcddUjMXuBOPT4ljoDGvl7GV8SSQwokeHI4Cy2OBZOfLhYUDrXWwLRY1xW
 FDSq2KAQU7j/g==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:xLYPsQ1/12Zh3zh8dRUW0S0HN30pyj8VgSIrbe5krRITKeWB8P6vPK7uMa27v7grNYfeM+FA0uzRn4nJro5N5b996uEWk93Yo6Hd89S0zqSeYs2ARPvKiDVuSb49msaTNMlPn49vQLH0UHrTMDW3i7Qks+xDSjmGZnLGkWdJvxWGR3NL3cym0CJ/ArfKX485Z0xXojRE0yrRof5u0tFkp4TT4nc9zgus9RPXKw9LS0fevtreN/bzbECGgYDJbJ6TQhzmbcj9fwSPJgl+l8DCXD68PsMbDtpkj+uzu+opTkyTqoVUv0FYjZEse/zi5mkLU3KM1wy6eUKeL7nnRz2yBwFMyk+Wd88HHMqSsgXQ/jb+ZgivHAsGlilkhSjMPn+MzDtKv+G9FyxXB4wITi5GoTURbJmMTJ7GzSTFoUvBV/GotNtztj6fu9pcuNhd+uOZxwe8T50sTdMkUsQ/kgh6CLK1HaHHlI1SKVTXpr2T9WrCVgKNW8ngCCKriiyKFjhEFeXu+oZjkKChDcdMk3zU6035oYWMdDRlZ76OfRgf/NEpBgD/lMrt2+NXmk+UE+JiQbiN1vU8QmG53YazhBo3p059twUpIB+H0zEAwqgdFmS9Nk
 j5Vq9+z1VlIrjxQl8YSV1XecrvhLiWhTCvHZ+c/wWkjDXRV+49Fw5EYak4Wn3r3UFddjagBdp6NdYo/sxF/3TVnCXnYGaKz19GzLF9Mw5nGlDItZ0C
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F997A4C4899;
 Sun, 20 Sep 2026 19:09:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1c-000000000o7-1jQv;
 Sun, 20 Sep 2026 17:08:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:48 +0200
Message-ID: <20260920170815.240247-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 41/67] package/mender: Fix build with OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mender/0001-openssl-v4-update.patch | 180 ++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 package/mender/0001-openssl-v4-update.patch

diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0001-openssl-v4-update.patch
new file mode 100644
index 0000000000..010872e69f
--- /dev/null
+++ b/package/mender/0001-openssl-v4-update.patch
@@ -0,0 +1,180 @@
+Fix build with OpenSSL 4.0
+
+Downloaded from Ubuntu:
+https://git.launchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=applied/ubuntu/stonking-devel
+
+Upstream: not applicable, upstream moved to c++ in newer versions
+
+[Bernd: rebased for vendored download by buildroot infra]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/engine.go	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/engine.go	2026-09-20 18:37:50.270612314 +0200
+@@ -15,6 +15,7 @@
+ package openssl
+ 
+ /*
++#include "shim.h"
+ #include "openssl/engine.h"
+ */
+ import "C"
+@@ -33,18 +34,18 @@
+ 	cname := C.CString(name)
+ 	defer C.free(unsafe.Pointer(cname))
+ 	e := &Engine{
+-		e: C.ENGINE_by_id(cname),
++		e: C.X_ENGINE_by_id(cname),
+ 	}
+ 	if e.e == nil {
+ 		return nil, fmt.Errorf("engine %s missing", name)
+ 	}
+-	if C.ENGINE_init(e.e) == 0 {
+-		C.ENGINE_free(e.e)
++	if C.X_ENGINE_init(e.e) == 0 {
++		C.X_ENGINE_free(e.e)
+ 		return nil, fmt.Errorf("engine %s not initialized", name)
+ 	}
+ 	runtime.SetFinalizer(e, func(e *Engine) {
+-		C.ENGINE_finish(e.e)
+-		C.ENGINE_free(e.e)
++		C.X_ENGINE_finish(e.e)
++		C.X_ENGINE_free(e.e)
+ 	})
+ 	return e, nil
+ }
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/hostname.c	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/hostname.c	2026-09-20 18:32:37.854514981 +0200
+@@ -6,6 +6,7 @@
+  */
+ 
+ #include <openssl/x509.h>
++#include <openssl/x509v3.h>
+ 
+ #ifndef X509_CHECK_FLAG_ALWAYS_CHECK_SUBJECT
+ 
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/key.go	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/key.go	2026-09-20 18:38:13.462370202 +0200
+@@ -303,7 +303,7 @@
+ 	keyID := C.CString(id)
+ 	defer C.free(unsafe.Pointer(keyID))
+ 
+-	key := C.ENGINE_load_private_key(e.e, keyID, nil, nil)
++	key := C.X_ENGINE_load_private_key(e.e, keyID, nil, nil)
+ 	if key == nil {
+ 		return nil, errors.New("cannot load private key, ENGINE_load_private_key error")
+ 	}
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.c	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.c	2026-09-20 18:36:02.855038372 +0200
+@@ -382,7 +382,9 @@
+ 	int rc = 0;
+ 
+ 	OPENSSL_config(NULL);
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
+ 	ENGINE_load_builtin_engines();
++#endif
+ 	SSL_load_error_strings();
+ 	SSL_library_init();
+ 	OpenSSL_add_all_algorithms();
+@@ -403,6 +405,46 @@
+ 	return 0;
+ }
+ 
++ENGINE *X_ENGINE_by_id(const char *id) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_by_id(id);
++#else
++	return NULL;
++#endif
++}
++
++int X_ENGINE_init(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_init(e);
++#else
++	return 0;
++#endif
++}
++
++int X_ENGINE_free(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_free(e);
++#else
++	return 0;
++#endif
++}
++
++int X_ENGINE_finish(ENGINE *e) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_finish(e);
++#else
++	return 0;
++#endif
++}
++
++EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data) {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_ENGINE)
++	return ENGINE_load_private_key(e, key_id, ui_method, callback_data);
++#else
++	return NULL;
++#endif
++}
++
+ void * X_OPENSSL_malloc(size_t size) {
+ 	return OPENSSL_malloc(size);
+ }
+@@ -480,7 +522,7 @@
+ }
+ 
+ const SSL_METHOD *X_SSLv3_method() {
+-#ifndef OPENSSL_NO_SSL3_METHOD
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_SSL3_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return SSLv3_method();
+ #else
+ 	return NULL;
+@@ -488,11 +530,15 @@
+ }
+ 
+ const SSL_METHOD *X_TLSv1_method() {
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_TLS1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_method();
++#else
++	return NULL;
++#endif
+ }
+ 
+ const SSL_METHOD *X_TLSv1_1_method() {
+-#if defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_1_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_1_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_1_method();
+ #else
+ 	return NULL;
+@@ -500,7 +546,7 @@
+ }
+ 
+ const SSL_METHOD *X_TLSv1_2_method() {
+-#if defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX)
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && defined(TLS1_2_VERSION) && !defined(OPENSSL_SYSNAME_MACOSX) && !defined(OPENSSL_NO_TLS1_2_METHOD) && !defined(OPENSSL_NO_DEPRECATED_1_1_0) && !defined(OPENSSL_NO_DEPRECATED_3_0)
+ 	return TLSv1_2_method();
+ #else
+ 	return NULL;
+diff -uNr mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h
+--- mender-3.5.3.orig/vendor/github.com/mendersoftware/openssl/shim.h	2024-05-24 12:07:27.000000000 +0200
++++ mender-3.5.3/vendor/github.com/mendersoftware/openssl/shim.h	2026-09-20 18:38:33.117854985 +0200
+@@ -40,6 +40,13 @@
+ /* shim  methods */
+ extern int X_shim_init();
+ 
++/* Engine methods */
++extern ENGINE *X_ENGINE_by_id(const char *id);
++extern int X_ENGINE_init(ENGINE *e);
++extern int X_ENGINE_free(ENGINE *e);
++extern int X_ENGINE_finish(ENGINE *e);
++extern EVP_PKEY *X_ENGINE_load_private_key(ENGINE *e, const char *key_id, UI_METHOD *ui_method, void *callback_data);
++
+ /* Library methods */
+ extern void X_OPENSSL_free(void *ref);
+ extern void *X_OPENSSL_malloc(size_t size);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
