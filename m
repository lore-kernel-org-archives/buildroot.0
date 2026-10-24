Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E62606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CUXv0QRk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C93F81217;
	Sat, 24 Oct 2026 21:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHI_oQDyxreG; Sat, 24 Oct 2026 21:32:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9471D811E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877536;
	b=NIGVi9bsXdzmNxW8LmKdO9ItxkNKt7PssQZSdZWjQ5G0C0+B4i7ZUzE4bxzkA30U6neL
	 rv3q0g6osYIj8Qa24hjKAPOOCdn0SFR1uE0BtyTKbPCSMs238fHNYx41SWwvrQBAMZ0nW
	 DqZK04DiZW3ykLfGJzQQgwHqfFi+1Ku09cBNYryOjY/oTW/kqj0ECmx2VWp+QPKw1cBAt
	 ZBSXsALj/gqsPum67sJwkpwV3JZbBZ306mPXXLIJKdrZdQFH/0VZ7uOchmU7pE56/Sj39
	 rJSycf3JfsRUI9sAguFtWx2DdgjODjj52B/IySZeFkjP16+zY1HZYpeF0D06ijr0UUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lkW017UxDic5gX1jSIMWnIxrDslRAwMpcA3ReLD4OCY=;
	b=Qvuj5Jf/AOZJqD+9PNahWo0B28fUI4E72Lc/oyEQ9K+Cu1dPS86T61aHEXJ8bdhxm58a
	 +DOfclizcbN6H5wyG+D2KF6LuADJAFmizYwq/iaz/DAcn5c5zkiZyJ+87X9UFMhbaoBeM
	 ywaEosSuWD0VxE80bkbJp0m5/UU/+Gcu7hV70k2gSUsZAla5HS5rqdJU8AsnOARAn2+KT
	 vGfnDxg09iHSwWlojqgZZhXWRxSmZZ4y/GnNwRCDDTfOvnBCsVs1bptaP/siG8C1ntyEw
	 ybgGY7f8WZYNZoo+RjvZmY+ucZfKP4Pxwad7pS25frg3JJDrgi2l5fHWt1JrR4LCyoA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877536;
	bh=lkW017UxDic5gX1jSIMWnIxrDslRAwMpcA3ReLD4OCY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUXv0QRkNxmHlEQhaZOA4mpDAgnikDpGLTD6BVgPoCIc5kKRq0xP3r9afZNtNYj4I
	 6reyLV8j+LfKEV7c47brucBbVo+lopptFpfRS+ZIHNHbkRvha7jbvwmiLBGquaSWeP
	 k2gqH/0khdLUxRBL/xJBQEZJBVyiFoUYrV6n+Aoam1Pzx1gKDf9FIZEq9ilM+JUofF
	 I0tqiHH5uabtiXHc6stOTaXAsphVNgYD+VYDF6sBhTf/VZDp1Zp9v+dlsbAMkxrW39
	 InGs+h8Y5W6gQNpGXP1Z52yFzNrmdVfHu9KrH+Xbrv1j1T5QkVG2Q41m2J2NC8YfgO
	 mKA3XRTVd80Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9471D811E7;
	Sat, 24 Oct 2026 21:32:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3363D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1139E6066F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4SHcZxZA9As for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:32:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB2E86064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877530;
 b=VsW2VPVaRGSI4QgHkHzxw2kG46PRsEEEM5F+7egVt4IeRcUE4jxMqLpvG7yGzFP3Y0pZ
 Ov+97JY6gGjCAfpolktB2103gqPPYWUDw31E+pvEfH9vJkSlWvodA5+pBE/jTsZmm19qn
 DWDoglZQ0SgXTe+na64CoF+ceR537EXbwJznzUr7pE4loeDxpUmtKI4fJfFv6oe7EnB+Z
 vuAHY+CVLzcTz363rIIIOI2um/3JxzMTzv8Y40tEyNmAh3hRDuRoJssTGfzxThG8SUqpZ
 u2fuyyWt5me+rHUKVnyJ+JkmG4MTNUmMT5LxV7HxYl+l+o0T833eZqtlHs/5UWZzFqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877530;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uCALnX2spkOtUduciNVQbYhXCAPJ0Agy6Izk/n05wmo=;
 b=PmZ5HytAtUTYUVYQkoqR0phSuHzZPx9qp0ysGc3RIa1et9VY8Xzu9xoiYGRZj+Q5Tkt7
 f7xNQ8qBlk9J9aCATSkKmm5fEG0Z9DBU5LbNiQjtVdXxNFYlhQV/V2yVpmjzjCJWWi51B
 5MagtZ7cHeNc68XIsEjtRys30xs19qxsrfKLvW1rM3PIiWknjeU+j/X8OTpWAoc2kQ8EN
 2BSExg+FHhbunXCRbLIiczRjVmRJ8Ylvs6tHdv94nvTHFdTMVQ+WYz3iF8ETLi2R4kjBb
 DYbKtjpvTNwd/kxk4XUigi16LF0+rMcG1Q5XzimP0t4Eu9Lw12Fs6NvTCi3PHsSAgeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB2E86064B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44CF69CDF4; Sat, 24 Oct 2026 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:31:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf751c39daff643d5b762149c29ae15f5223141c
X-Git-Newrev: a416a8ef097250ad6acb9b073880ed2a44f7df62
X-Patchwork-Hint: ignore
Message-Id: <20261024213043.44CF69CDF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jimtcl: fix optional openssl and
 zlib dependencies
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a416a8ef097250ad6acb9b073880ed2a44f7df62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since jimtcl 0.83, the "full" configuration is the default, so jimtcl
automatically enables ssl support in the aio extension and the zlib
extension when openssl and zlib are found. As these dependencies are
not declared, the result depends on whether openssl and zlib happen to
be built before jimtcl.

Add them to the dependencies when they are enabled (with host-pkgconf,
which jimtcl uses to find them), and otherwise pass --disable-ssl and
--without-ext=zlib.

This issue has been present since commit 283821fc31c4 ("package/jimtcl:
bump to version 0.83"), as jimtcl 0.83 made its optional features
enabled by default. It therefore affects 2025.11 and later.

Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jimtcl/jimtcl.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5e09e776ad..e81b2a250d 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -24,6 +24,20 @@ define JIMTCL_LINK_TCLSH
 endef
 endif
 
+# jimtcl automatically enables ssl support in the aio extension and
+# the zlib extension when the libraries are found
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+JIMTCL_DEPENDENCIES += host-pkgconf openssl
+else
+JIMTCL_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+JIMTCL_DEPENDENCIES += host-pkgconf zlib
+else
+JIMTCL_CONF_OPTS += --without-ext=zlib
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0644 -D $(@D)/libjim.a $(1)/usr/lib/libjim.a
@@ -55,6 +69,7 @@ define JIMTCL_CONFIGURE_CMDS
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		$(JIMTCL_SHARED) \
+		$(JIMTCL_CONF_OPTS) \
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
