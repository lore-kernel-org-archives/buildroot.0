Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679D606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Oiiuly6g
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3940260848;
	Thu, 22 Oct 2026 21:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlVYQC1aZxFp; Thu, 22 Oct 2026 21:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C494608AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792706206;
	b=d9iVvleXci//yiZ3hPu+drQqxSKcL3o6ooSrH6FcMhZnxYgIRGWvPzkfomMvstcEjfBc
	 Jx4Zlh8L6gMvz7JpgbYl+WuR/WAU/51Zq46XOajuKdaIAtEV4q3/6AnY9OXnbso/4nJMR
	 kcb+22Zu+mZTRbFEGpohT3zEPHBGdfehVThiqDYGoRgM1F7xQHhiHM0DUQuIlgCK09aWx
	 1HOwovkabrBOcSfbhyXS4+sGlXX9JKJ6OJ4mvHqfjyTIKikxoivsuotQVrgTJAOn/r8+U
	 wMJIKK6VzY8gUunrSqiaSMJPLTE3zfeoBTHG4r8twXmgLsVIvagfsqKYBxe6MQvN8tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792706206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CY024FHOH47/Fwqy6t6Y9SeJp6W1axxOm/SiKfsRNNg=;
	b=CAuKNqzCsDBaBLPGoSFEIdfaGmofqPPl9G+lqKZXvPSLlVB3z8FIA9QULeZm0N62u2Hn
	 ZO1sZXv6h1DnSeDS+drDyIOYRY4GcUXj2TsDzKX+Ejux/LWzE/QAtAE1mp1iG7Gqri0kU
	 YafE38oo75sQNsuAkqz+MUY9tQUPgUNI0QrlPMdHVzxq6reeyMvJi70ylNQiLSG0W0ng/
	 T2vvjRrclQ7XqWH471i0oK8sOHgTe6Swe0uw83UXpFdxpyw28YRJi73zsqflUeNI1sxXU
	 Aci+qD9WzG/aC0nmKxjTFbjJBQ4+buV+y/XLdm52mSo4Eux0jP2cbJPUGRbO6TDtrxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792706206;
	bh=CY024FHOH47/Fwqy6t6Y9SeJp6W1axxOm/SiKfsRNNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oiiuly6gkoFpk4apmcvXQWfVtC82ims1yAAuhHNyKGNTMAevsUsOCkf6IMle57cQy
	 PAoFfC6lHuQq3nS0qrns0J9JKVGGWCJFb8MWXI3a/6qP/UnTl0KEsL+P1by7kj5Kgt
	 O3kbn/0n4fPCtDJFxDS1Ma7za3Mvxg6qNSOczm5mTgzYqxLT2vYjRbb+HOApPtUo9s
	 XEZgAfHU0U6Xke5nM/f6ONta6I+ZkZKu99Ort+rZ44jkL/PF76zM7iXxR6OMgyoMG7
	 9xq1eDjlhDLRYgZHmkKudznkfIDGxCRCbA+ZmTQkkl0ZzirWnkeECaQ6PS2ghgzXLR
	 6aAAbRX+ZuFRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C494608AA;
	Thu, 22 Oct 2026 21:56:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 438CD499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355B64040D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLUT1tjuR8Ft for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A40C40270
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792706203;
 b=DtajMSJtcb+mNbFOZ5N4op4GbxBxERJg3TkQ2ZgpwlDuMktgpz2nMIrAGJhulJw3BLYv
 eXhu596x/7sSEAHZ8+6X+0h85jnG+3I+ON5Q1qHhQbIx+54bMoWjyp+C3B+gGQhztljW8
 FilZ0Ua+7q9IVJSh6OKeMueltCdAt+1qm+R1xesluZaR+uzx4ROuBg/7om3PECA604YDk
 qMc39Z0mtD64QOrmfWqU4QT+p3s+Z00+a3JlwNqoDl65VzjRDkAiNmEQvJq4aLokk4FQY
 fndWmHX/tnviq3FHiyiyK09PPF5ThKPzaVh8Y4wk572dBEXyZMKeXLadPQu+tVN11IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792706203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rBYQQEyvsxYYeIlvXLPrBAxKke7ChU9xkAPhro8k444=;
 b=DbuFEcPpvcgfuuwP1E74oDknCaY6JYq7GeTv87XNyxPCAzU8/SZ1E/XxZ8HJ16wOsIWL
 ZR9Mv8YeDXnfG7LvCY1uhkGN6B9F81IeruzsI5wibN+Q2F2mAHORzqfa8cvF+aFGi+xa9
 OK/71cARMCIkPz2+gxy52zzYZN8ZucmNqHj6vHUS6gl49lcQqvWrIeRpGPFTIf2j+561V
 0VrIWKQKVEPPEh/7FPc2bTQPgutJegu9/3zi5vDR309XJS1CZHlyyHxvId8KoqwBoiTdK
 azSrG/oZ8gKR3eK37RMalIrfiEK+30P9oPhJIimcFWKRuX5PL/y9ToCp/q7OvXXwEyg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A40C40270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E779BA25; Thu, 22 Oct 2026 21:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:55:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8579c1eb00c7465275eeaf12d04e2be02a6d7a2e
X-Git-Newrev: 02a4df08f99fa4ce205b5dfe510f20a6d3b8bfd8
X-Patchwork-Hint: ignore
Message-Id: <20261022215519.51E779BA25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3: fix X11 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/02a4df08f99fa4ce205b5dfe510f20a6d3b8bfd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
