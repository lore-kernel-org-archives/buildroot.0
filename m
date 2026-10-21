Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D852606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xe1JE+R3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rfEblwcE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D651F81A2B;
	Wed, 21 Oct 2026 21:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhXtwl9atjum; Wed, 21 Oct 2026 21:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B5928186B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617109;
	b=o+KsMByZtKmM+5l+RDv3Yv1G/8ETCf+ilo8fRg4Y5RmJLsTxrWap+f09qQ5WKLvJdy+O
	 GW4V0Jvv2cAggaAKR8ZxrnfxqGeGG8ul6vm9Mo9xS7BX9GFeNqaVxtUfJUGvIljFm7pqI
	 ZhaPLdR8P11yNnAcAW9RlemN1PnzFv3e2Hq46ujSG1JXemesKr/1ycpjbAahHxJZuLlhj
	 286V+hI0XRzwMOy4GumT/bP4UMKftfT/cBJPqMkUcXCmMdvvm/m4Hj0DxKyPYCBEGmuZ/
	 qAP8yo88BeIGLKIpS5zfkrRT2MqnfgSsz8MQ0DnWihB9FYgzywCS5JR4TCCuh69QaWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DeulVrEvIqP4eYn7syMIvZHKXeK9zgcStkcKOjFsIJc=;
	b=GUTQDDfZ8dZGO0dhSTBbXSdVjrQ4o94Zly6Y4zbOPTzFoMWcEt0CnWwtfUGnwwOZf9S+
	 n59Z0W8Gfdmq9xO27ctkE8D9htlT90zcAt7RbTCm9PO6S4v16vw4GMHUu34tQ/5kMgxDa
	 egf8T/6O6JBoXWzgZhEUc/vhnG7a0BfSnt4Rlynmt4tN7K5H2rNqCSWwz/6RJv8mThZqe
	 nhAyMixBqr63Rey+zsDXDw8sHzPuBHAJEZFP3feTUvgopZtD43sHjbs47Iyyhk9ae9oS1
	 q8kPZkueC9hUOjf53p0HddjqVZaoIWrJt902w652YVeKPXo8xd70xluCeolB7xl5D6w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617109;
	bh=DeulVrEvIqP4eYn7syMIvZHKXeK9zgcStkcKOjFsIJc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xe1JE+R3B/yP+HLXP1G3r11pM9LdjFRiRNXgJaYfwo++dD9rueJSdxBXguTU0U8Uv
	 kL0O700cWzjAOl/at2JsY7W1eU1a7w4qCCe09/48FBOWTGdXjtGF6FKctb5X4Uq4cZ
	 OrqKeOytNQ19w/rb+gcWegcnDNpCQiz47Na4iVxpkxXmx5W7/Z59t0/ZPMNFUVca7G
	 fo0Fp/Vg+MblirbYSF3aHMDvlijvvqNjlprEqiScvh2z33fOuou53sCtJ+Q54qXzuj
	 /e9dNJ6NIZqEuPPGQbrrD2eANBM2T/c/lq7SF0TiTHky4dETLzcyH+3jaeYZ89x4lP
	 +jwMS3+Z7FV6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B5928186B;
	Wed, 21 Oct 2026 21:11:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F2231AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15747403B4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWmTiemLPu00 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0570F4016D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617107;
 b=HK12uV08kD01G2BYI2WKasTqsT3nb20HzsfHVDGvzlZoVLbDEULwDv8qxOsNn9oRWAYQ
 1BPtfiJEVCF5NTrfQizeIKE4TIE+nkt8yf/GJtwhrJGw3ZGxZrHEnG/VaKiFyA63okCh/
 WwWCAMBVdjfHc9wVgFNJBD4kGc7HACObzr3fUCVq94qgFk7r/IO624+Fd8Zu9kePJkWdv
 /SL5S4beYrUYzISo4ZPbga9qtdFTpxsFprZ1VwZdDGrbttbnGdUK+clemXWxwjw2dSLEy
 xXeNjJMoQrRjEoSvWPZQDhA8vaoo4vYCUnrPY455tyE9UQ4WmwNvdtoAzNL03KfwNbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617107;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mwrF26H1QklYWRcgwE1HbqnqOK8fQo2VFTavwCpN2L4=;
 b=kv22ZQf1aCuKRr0Ac5n1/IWNc8J/tvx6w3eJvXi/B1Ao7g0+jwStVpnGHS695WqIvwn5
 7iBcfDfbXclDj8GnoKqcKy4kFPLnV82yF1n4Kzwr5PBHtIHiZQVV0RjGtZ9OZPqkV0SqH
 RIDbYFQvo91s+eN4feYab+2pibpqXw7cYq0PVZ5+8V5ZgqBdu/q57CAcVPT+ai88cG3lI
 kX2HtAsvjVIVdwOC7+LWzVGY38i9z7ZXXhdrmWc5mi+YWBIB5/788Qgg0LpBogG88R/TW
 M/CsbAYojZqlvSRuQpdlB0nJengDA48i8BbD3d1EarEsSTcY8ll+fsYwTRCn87m8how==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rfEblwcE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rfEblwcE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0570F4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792617102;
 bh=mwrF26H1QklYWRcgwE1HbqnqOK8fQo2VFTavwCpN2L4=;
 h=From:To:Cc:Subject:Date:From;
 b=rfEblwcEII6G5/oPGZi6iCaYLHctq8Q/oh+kgGQS5KOnWoegbUElaxbNjzlVi8yfy
 v1ve4hcZWmlyz2koJxQKlzAKt+wRmbnrqJ6N4h00BgC47iI2+vDubViEdub1nGRsPn
 FL5R9nNmr9PvpL3bLYRkk5vmpKjvdaCo6lI7ugyD9/CHCyf8HbzaZb0Z51meJ0ZQRV
 aYMfhS+E0LUTN1W18lw9a0zrUCv5kPdOlO6U97kT4EJn7JB7u4+/pFE/JxrZ/ZGqud
 TqsTpjYB1mWynWYkTZDqXRKxOmGoU8bibxjS1Lv1vRxmOuBl8sWg7abeta3QD3zVt3
 1it7ebnFhgt7w==
X-KAS-Sym: v3:f51bdf72230551df:S4qBUrRWRyh0jhL0ETWeC14meNm6JB4YMnrN7KrsSQshO
 hc3IKBdcyUqLu+KYuGsuw5MWC4EXm6b4IFs2oGGT2VZeyspLj06JQI87YrQZVjkKhANizIytXBH
 0qpuNFn4wJ0rIpcO6gnoKUBlk8GYmSO6mzykg/ZUqSmVw7zLC72ZuOM29tdJ4Vw4pG0a4zcHgZl
 uwuuvnZyyaqj9pz2LxAiZb9+tWeTM9HB3uUbc8HFPXNWbUKg5dXnqVPCPGQG2R5y1ncvwwWTYbf
 yGw8NPP1m0SW1mXSlGdlv/tbbxRg5j4drOJj022pVmJYGzJYzmAtcTu8oMdiAJru90tOfMLw==:
 hE1Ro6x4GxAzDsdOL62A4ENI3/mWg2hbHMGPif0TLu2lr0qGAKePB+jjD8SgNh5J5hOII5AeTj/
 eMxVmcJiWhxJ8EF4INouRAQNxGB2h1p/D3xBnosbChoKGfu68QDr5HdXhYNodRRvrf1lyRfN/2s
 BVxaquZ9zR7s9g32Sy68xmD/Lg7g1dVQEuF5Wt7tTx75jwaOo+6DuWKntJdkdZLM5pM69Lxvk6F
 HDO9Q3QVgYT/dyNS2czBlImvLN9PW48nDmFgt4zSPkzyNqL+KQuJinM+aIHSzmqbw9DLwx5XUdi
 NvutpAj5TKorz8HWbMoJica1Vz8Ums+ao1mUA9X7bj0EbqqylIHD1ufW2uiV46kceFYh7+cFO39
 cm7aagO0tmpkPzoEvyDAjJzvgrAivqEg6kOpUAkKiSXoyYxxnrrjIfeAxcOgyVsOnrCwuiS1pRB
 UGxiy8P1+BlowR2p6wZri4usuIsxMnCcXYfiw/oJz/UBKJCSTyiC3tdtAu2i68u7A8P4hIDXs3l
 3+HfQt+bZa9dvXVxg6bnwAd2uxpJ04dtB4XbqZlSvyjJXx7ZfgxkMb4iMHpGbPz8SaX7tnRoaD+
 bUgJ
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0672A4C0CA1;
 Wed, 21 Oct 2026 23:11:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49152)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJdb2-0000000049X-3lSr;
 Wed, 21 Oct 2026 21:11:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>
Date: Wed, 21 Oct 2026 23:11:41 +0200
Message-ID: <20261021211141.2759992-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 1/1] package/sdl3: fix X11 dependencies
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

Add handling for optional X11 dependencies to fix configure errors like:

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XCURSOR.  Please install the needed
  packages or configure with -DSDL_X11_XCURSOR=OFF

Please note that SDL3 only checks for these dependencies when X11
support is enabled so we do not need to add =OFF options to the else-
clause -DSDL_X11=OFF:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325

The problem exists since the package was added with buildroot commit
2dd13e328f118363165b47258429604a5ffd3b41 so a backport to the 2026.08.x
branch should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: added configure error snippet and backport info (Thomas)
v2: added handling for xlib_libXfixes (Julien) and xlib_libXrandr

 package/sdl3/sdl3.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index 8c2cb8f629..861714385f 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -59,6 +59,49 @@ endif
 ifeq ($(BR2_PACKAGE_SDL3_X11),y)
 SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
 SDL3_CONF_OPTS += -DSDL_X11=ON
+
+ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
+SDL3_DEPENDENCIES += xapp_xinput
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+SDL3_DEPENDENCIES += xlib_libXcursor
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+SDL3_DEPENDENCIES += xlib_libXfixes
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+SDL3_DEPENDENCIES += xlib_libXrandr
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+SDL3_DEPENDENCIES += xlib_libXScrnSaver
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
+SDL3_DEPENDENCIES += xlib_libXtst
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=OFF
+endif
+
 else
 SDL3_CONF_OPTS += -DSDL_X11=OFF
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
