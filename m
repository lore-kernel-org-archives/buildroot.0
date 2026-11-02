Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762860703BB
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K3Bd6nLb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0whDjUI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E99A607EC;
	Mon,  2 Nov 2026 16:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvTepuRYOL-3; Mon,  2 Nov 2026 16:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91D03607F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793635517;
	b=dLhIAgqLY0l77E8KPqmHgKn5+WUmD1VPEwDfIrIPVyuEwrehUcdc6TEGRG/lngHrILyq
	 cUIrssRpczLnWxyZpN9IkqIcUFsuSF1BLdFuVdAUWR/RHTkhPbXsXLDz+pynaVjbSbTno
	 rJVf9VF8spD6Tt/WJ4i/TX9O8d842+hvUfoqOOO5tuc+WCCST9CHEJ4SCPlgLuh53uCY8
	 KwYavmX6N0tRcPEmD8E6cURwx+VTj7+x7DbueEPDKqp4HX3WMzUKEB+Fs536sTzbM+4CO
	 metc7FxEkiayEpT6Zkgt24/Npx4RYP7+KCxfvNftDrvDXZSvKnzhE1zARZIfvWiujoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793635517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b8iPXQosB29dvgfMEN7fR9+s+K6k1xqbu7jJJrxz0Dk=;
	b=QYZLXFgQM/CJLtyEguLPuqXCffwTK5ifwruYjuLCHUnI1Gih9yw6xV11YxqoljFCdB0k
	 pC66kZ/UOIi4tRYTX+WWiNIDjzA/czWmyy58bQtC+1w7FSj/1OdaDN4H+gceETmT49jMr
	 uJBMyJVGSlH2dK9Pqk528lnLofQ2rNc94MiDsy7RnH52csoCr3WDP357Ci2Xsad+XlpQ/
	 L9MkZtesW+8Dbi9Wi283kuCBk7rBq2FlQAV2N2f71tcb+h2UaHR9omHd6IqogrXQGIkGJ
	 oBWtsM+/HvkqX9m2MnqiqyToB9bLhLTOVdnv0Gp8b6d5k5E9L5NGgXICmjL0LXxpfdA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793635517;
	bh=b8iPXQosB29dvgfMEN7fR9+s+K6k1xqbu7jJJrxz0Dk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3Bd6nLbTyFWrrU+s+FL1BUC6pU9K7ohoZU9eAmFfFbDkAWjERNDgCP4cZelsL4O9
	 iComBDK7HXZwgHT9AEKOypH3MK61SSLlleMLnRuSRbazZ1Vkp+Pt3AD7Z47w3uLwZc
	 oJiBZKriGOb+4n7AY9ag7I3oXiU6X9XrmerDdzWw6w04Uvu7I7Q3XofCFQUg6Pqf4i
	 /qSgj0C0CZ7TiZsdhJvUgFGhphKDWBAxSpBEUcz6/kfPCJds+PPLtNJ/hw2qQYadUh
	 QoFdAU9/eiIcw1u3nOGgrmqtW0zZr2BIwkUL0uaiZPHcCsKgi+7I2Nuhy0lrr1Zcrt
	 QBmhYNRepf2KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D03607F3;
	Mon,  2 Nov 2026 16:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA4C4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22BB840703
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHzDyYD_w0tl for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 16:05:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31AB7406B0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793635514;
 b=qogeNvT7sn+WysmGgY6cKYSPuBy/QW1AsSH28Xr2NUBBQh31B3ZcYYvodhpcKSEC4GVX
 cdl5Q+A6iLzL22D7PIQgtOMD+sLkpoQG9b3PTmPAStyWOpcszyJwa/BdTy6jHlHec366+
 0FZbMiG9iisNOv4NjVuiJbqPfiV3OSMACrWPpKmGcfHqVaOKhAQnh7lC9rNIglhGQOqsY
 IikQ/V1Ou1mDy+a6top34mqYKuPfcSIz4Wy/tGhthWJVjI0DL3+CkcQRVVdSw76HFecu0
 GjPYjjg/tswwpopI1r9YCXJBnVNmzwSN/yM2QHiQy0muWAuIpGqk0KxNFh1AUJ6uK6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793635514;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=pbVXMgVrVv+ViUCJTj2VTUjZGGvBnbX8fh/KgOKGHpc=;
 b=H/azWsO0CxSUwB4LymZWfjOOW4XaS0J2URAxLgmM7A9QuwhFBWCEDADTVFk5eEF3k2DE
 mDHDsoj6cXTzTWCOe8cObG+WCqqch2Krixt8vrVau9pcho3WHlO9xZqakTeuCBAPmIvwb
 eyzL+rwK236+i+1k0Xq/E+sQTeMf799CvZfNUzpfsHgFMU/VKs7+hSLxMF+aWeQKe1tDl
 Ej5k11pKxhIpKW+hCsPp/vduqw3NqhqRkLUqiNlG0mwyZ86ggKr+hxU/JEAQ3qFGWYsWZ
 6926KOmVbaHF8VTWp69KDIcrFNvRAnVTVRrlDGF4ukFmBe4UpxShBE7tLFY2vfVD1pQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=h0whDjUI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=h0whDjUI
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31AB7406B0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c3fd91337baso539494766b.3
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793635512; x=1794240312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pbVXMgVrVv+ViUCJTj2VTUjZGGvBnbX8fh/KgOKGHpc=;
 b=h0whDjUI8iwt6+v0Y/SDoSdjB26rkzzPIR1yTRmDrA+4C5gbSAGseCI1xQrlS9B1VW
 UWKGa+WLCtvsoB+CawNDPww+KRQiVyXgpP5ZcMD/65TAybCRGFrMzanRI5riNRvu9hUa
 3np3PD2LbJjCla4X88NDsQI+Us8nQZiC5bsU5BvnVMUJyN6AUFK1BJEvRDlHv5kUrmVv
 M9gDObf6aooKam7/Ywv2TVO7w4K3BM2APT2U9+MTLnlSweZPUl9q6vDw+c8cVNub8fEe
 OJtEs73SwZhHdkiZDkmJMF4tOyqTZJeKOcySOpe5DSQbb2snJ26Xk5p7Agaqj/lnJNVX
 K4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793635512; x=1794240312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pbVXMgVrVv+ViUCJTj2VTUjZGGvBnbX8fh/KgOKGHpc=;
 b=F67E1FqNSUt5ZpkdMRGoDKGM9CYd0zO6IvMslg3G60B425q6tqGs/E6EhNSmtPwt04
 STUtjWGjYKhuG46nkyWtwX2G4N+JUqSP8odl3oOflTNelZmNOQZJvDrVNKNfL7JQSr3d
 NAMUfVeAGzXE8Kfx5df4kkfy719TVPfFn5z+gBY1YKMHUk/xm/kSsPrswTPPDOxFMMq7
 jaYEDTD6UgsTygskdGKE7Aax5dtn+RBv1RlFi1OL3HbM8+kC0cMN51vhKYjlkEhOX5SS
 cQsJaGosppE+MyxnNIjn0EjXQnhGST+SP8JN/Qa/dmNltqF14Mitlgu0BPkYiObOoOMD
 rLLQ==
X-Gm-Message-State: APuU4Z/2OR+1FBnv29XYWD/YuhwDxB4yXaWhKr3D7dDsmirsQhydYwEQ
 91adN7IrlJzmnGHMTw3OwwPB367BCVROFia7sq+PI7T1JaM8lqwW4C5a4lW20w==
X-Gm-Gg: AYBFou1kFFbvC+Dyv+U32acWpTe53g+Vo5+Cj5Hn6LzIYU7VOG3sQKH+GahHCTShNeX
 Yn0Zc/KEcQwi0AuUj8iq873xPAgCWNwPYKLhW5qDtwbACtUaZP2clRnlX5PMKp/B3bym9HNlvSc
 uJezxEt/PrSlK5VV7TtivO63Tmh/kyqKvFvUCb9ZWrWApcZt+SgCvz/uRR4ThfEBOnQKMDT1Bt2
 d4StAWqPaklCfRenNKmpzGWJtbOjF7HCUrE2NeGkp70IUdHRwFg/wq/YLzWoehfAWXc76XzzCj4
 AhZOSW+SPotP35ot0f9oiOClhcx8iXQxiDlXQvwOWnWyGvjFkQh966FOfbK30T8Qftki9z2OuTs
 uyGDCc54M+7potGcBREMJvuV3KAW7S+Mxi5zmx50elxn0xxU4WCyw9APDptBcrbj3H9UdSZgdP0
 lGrZH8OOrr+OePCT2K9M5ELBQ/Z7I7bZHKtQEh+ygRHXmMj5iJ65kkM6pn4YKUA+Urtndw78JER
 4AU2H3UFMBC/DiCZltP/thgCdP7IOPJFMRzUwzI+xvb3W6ieUSdnHSpF9+VzVIXLzPXKlqw/+hM
 UOolUM4LVNwg+waVHkwJwXiNski2u+QndTo6vQqdyr1hmIkV89hwsaT73e+xNljVcKx5SxsR2OM
 BVPSNAPg42RwUeaQiS8jSqfSqJCppt8gL2bn+uNkMFm4rkXo0y3C1o1gol6ZG/AjPubIu65o+e6
 fg32c1bed8OARcus+Mb342CgA=
X-Received: by 2002:a17:907:d92:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c4ca7a4bb1cmr859115266b.8.1793635511793; 
 Mon, 02 Nov 2026 08:05:11 -0800 (PST)
Received: from KORLIN40066.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9eaeesm20789169f8f.49.2026.11.02.08.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 08:05:11 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: fontaine.fabrice@gmail.com, thomas.petazzoni@bootlin.com,
 thomas@devoogdt.com, Copilot <223556219+Copilot@users.noreply.github.com>
Date: Mon,  2 Nov 2026 17:05:05 +0100
Message-ID: <20261102160505.1754919-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102160505.1754919-1-thomas.devoogdt@barco.com>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libgtk3: add missing direct
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Devoogdt <thomas@devoogdt.com>

GTK3 links directly against fribidi (mandatory) and harfbuzz
(auto-detected). Add them to LIBGTK3_DEPENDENCIES so that they are
always built before libgtk3, and select the corresponding Config.in
symbols instead of relying on them being selected by pango.

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: also fix missing dependencies for libgtk3
---
 package/libgtk3/Config.in  | 2 ++
 package/libgtk3/libgtk3.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index dac2d17974..000a4da16a 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -29,7 +29,9 @@ config BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_ZLIB
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index cbe49b8716..e41d3120bb 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -15,7 +15,7 @@ LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
-	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
+	gdk-pixbuf harfbuzz libepoxy libfribidi $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender xlib_libXi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
