Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0414606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B9SOsx+1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=h1z7/dON
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D476080B;
	Tue, 20 Oct 2026 07:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efi5Lyx0g3oD; Tue, 20 Oct 2026 07:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C4777607EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792481043;
	b=KTlGEFW4m/7gtoKeq1w/jQ1pL63yyGtkVkAvn8KFf+y0mS/32cZGjgkQ3//5dTHQVT1d
	 tr0EBSHpaG7wT2osAxfQaaZrpvq67oRNSvP/hjRFJOMU0KribUzlR2JwmARj5gk8iiz5G
	 IUPg+qXUCzf5pb3qHXGnWgH/R4RhznXMNt0Rw1dfmykrs3HiwhpSVeLmlPKD/wB6UfVWo
	 e/z3NcWpDLB/91Dsc59YJxQDgOQ495C3EF/++4cLg6Ze8dvyc7ONnU5hX/MPS9YFiUmAl
	 2DD+E2gBfS2PvmTKupHcs8+QzbkCvZbqNro7N7EVsFUXTdYgPiSmILvy1tHYTwaLP/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792481043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tnGXmO0p2F9mPC8FTuvWzg2VEyIQ+i/8yO/3s/5YQLE=;
	b=YB+qDvQlYmh6DgQlpINfmJPkzyWAUOSinEkID7rbaIP/uIUQ6j06yLRQFndCxLGMGMc5
	 XNCuTyq/gfjND9CrPmqbbe2NeqX/9JnnpnS0U0xWAHuEqS2ziQfRY8QEbP68Ezcns7wuT
	 gb+4tmOKiwuIpVMM6H0VphXYwrFFEgAwCtb8rIofd4D9B7ifMz1Dvtv0O/30aRlbXeBmO
	 IxQ+AMBLjO9YGxmkvguQ/K9v9G56xpGQeAVYJ0E2eKqT3CKu8OE4FrCj7pdVYYa8t9KUx
	 z5WPxBrLRE4FmZuUNjJjNMVuocRwt2MfuXQFdgGVF0NvOlGj3oHjjdIVU6CXsnDwMAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792481043;
	bh=tnGXmO0p2F9mPC8FTuvWzg2VEyIQ+i/8yO/3s/5YQLE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=B9SOsx+10o6Pm1pYUICSJG+ZMCuDw4GPvw2Ow/zgcCuw05T1QSA7Wgqt/x7h6jPC7
	 wC9PfCJHegBASuqUQz1Egrcm80yG8juAOuMjBIF8jticE3yn2le7q/TMphASV2UqnV
	 LqZVuqyc/wYcYrLJO+lO2TMPgMWwbbNW39VdQl3LW0YuA1jeTDLH27XihbbV3h19BF
	 +xvWjf6X/mPMx9AdXHSdJMAThL8rc/z1gCPjwD9RMqtzc6s0lHM1DxKxddl6z/n2ov
	 ufbOZklu8WisjPl5mEitk+vgn/yhp5Rj2GuSAvzpRwvLxwc7uvUDvZOsrh05AMPNuk
	 kxIyTrjvI+iFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4777607EA;
	Tue, 20 Oct 2026 07:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D78465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC57380D88
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0ciUrI1ZXQ6 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:24:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB44180D7A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792481041;
 b=nLxEvzRZPI+TG0KeytAAnlH3NUpTHZrWBIUusEK8teUvcqp+RbGgCGHi6XVKebw8Dh6y
 io/8/r8M4neen7hd0SSBauKH8AOL6tlLlvdJPGBEcx1DqsYN1OubV4yfb63TIPZzm/mCn
 bqM09fKe0levyrTWzg5xtqSptKpsdlm1XuSziUPF0FFOhsv1HStI4QC6YnA5uQVgYtC7H
 UygXblZJoKPUrfuYX8huPfkI8WAcSYMEeGuoLAIPIpTkSA4zQ8eeShke1aXGeBRZS/YSW
 re/KL44B2k1TIYjRChXKon0XQX1ThMmBpaZ8MbFUiQv0r1cDoYdv+JVCC7QhoDVQGrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792481041;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ywl15KhiusH6q7MSO+ng1CJgYc6Y5Tlkm+lV196su1Q=;
 b=erQoy6nZIhe9CoD1S1u4hV8WXfIwbOBvNKL28Vozp/pRjTbtepg/s0XJqYHXnhfm7MAJ
 1cx8dDhRHBjhwqbj5R6BbOMgZ7vPX+vUmBpt4k5yDOoMsOn+M6JprYciRV9YQwMGfUqAE
 vebkLQSbeRNqKqN9RyVEgOx7jSx+xIEoRBCBizoqvg21XeZJwjrqcm2OlBfJnBwCusAmZ
 yzbOVbdcALbf/jirDRqKcc0tzPTClnrefAoe6O5jkrN7bcp6ihDM/wdJOOKiPuhTXp5u9
 JsI7DbNxpNSJ+04bvQZqHN4gGwf9za2x9QZW5vV5evdYZMXrGRlJ/N0MR6ErgU3D0Ww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="h1z7/dON"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=h1z7/dON
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB44180D7A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:24:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa377c61so3521866a12.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792481038; x=1793085838; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ywl15KhiusH6q7MSO+ng1CJgYc6Y5Tlkm+lV196su1Q=;
 b=h1z7/dONAG5eTn1tP/8xioIhYvKvGjnGdWfaiMHtVqtshi+Mh73CA1l/J3C83Ro13T
 kcJ78v16BaIsY2zl/g1mmdHzpnpeEDpFw13KYMnrRAGH/HxRRCquY3OHtb3UtKvC/Gcg
 eaXg8hIqWySSmCUpmbTBG/Ulua/44h6n6w4iq7WHSgZDwnl1JLCm2HDBxoTjHwHdljko
 9EdRVlUrq/Ms3eV3sQEeVeDPPHBHVK0S83uuaTfL9VQIV0GgUYCxACKZSganL1t0iAmN
 9s95NG/yT0+btHaGRVBT3xsByvMlyZh/M761/P1l65jsue0pjbRvCPJ3hJ+GzrdWYXt0
 l2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792481038; x=1793085838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ywl15KhiusH6q7MSO+ng1CJgYc6Y5Tlkm+lV196su1Q=;
 b=ROLg2J8MzzdxtGWSLiBtKyd60CCqExOlLNXZO0SVO3yveJzvp//F1Ajoh8Ft1qPEdW
 VpyEM1aRa9NIKgb0E7rNsIrSz20KW5QFF4ipFlNfY/K13TSNBgW4J/eKmzH/UvJtsyLs
 7jxLsInAQGDBjzUs/qYkgOsMZxXfaJhA5S3PIphyV5yJEzeDUpBsuSP3KkGfWdF5ZfGI
 NHyPQVH3w+VqA1xiWdzet8RGm0g4Vxp+x6ChTZytslGvUq5Vwvgrti9zi9hF0nDHY00b
 ran69gtZrIS5Id9yQDkF9mRue6cTuL/JtMOjdjhfbHiwgk5HRYGElVBj8/cwIRTbfsSU
 49lg==
X-Gm-Message-State: AFq9FYKTXW9NHcPP3FerHATkXnisDT3VrwYj9WxWr3iXxacyZHhQpHRW
 vSiLg1lIIshGn6as5cfpxX8X4OTDWUfWj1Kk7Xv9fMBg1zYUc5/0NwH/zig9dQ==
X-Gm-Gg: AYBFou3AOezRAb+JZmSAO4AO/8qDQrBuELfjn6y3WphDiF65u2wnf3n9VxHhODck09P
 KabfeYktBYxxbmNZa5fT8ZIz+rfAr2fEZVwOyuOiOYTt3gWD0JFPE+6hXnY6pBtau/ytpv7cNKi
 hktyxFMX2KMljIWNCkEbRVs+Y7GmBaID/cKgaQtyTGhdkhqxELE/wIPG/OC1SErAAxcZK8csQzq
 BXiW23XdgGwSXQrbAkxfaouXtuTSb9W8D7qcZLi8F631MUtLaGPXOMzchwDTXkvoS9pOum1XHrs
 jY3XZ/cPXgz9+UliMKQqSBeNXEy3g8+VXB/VaIHYS1gw1czqa/3uo2to9TXuHlEIMbQ/FAOre2X
 zVgCYEdJuDTWV/62EXHAJZasaDqVXASvwHLnvNUNgu0oCVm/Pu01BuMA0k896pP1Y1ppZ/VPeus
 BTY/fbPoCc6d+ERA1LKor/9EL+HoqVITEnQ2oG5JeytKC+W1AnBAFGPKH5OrZTl1AoX5+AcpIEg
 5Rvfsdk3Edhe4otVK8AxVlIthhXAgsvkZSi63Z6HmTUJ0jw2NzU4g==
X-Received: by 2002:a05:6402:3201:b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b3e021385amr2312143a12.38.1792481037912; 
 Tue, 20 Oct 2026 00:23:57 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1335d3sm5055805a12.3.2026.10.20.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 00:23:57 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 09:23:57 +0200
Message-Id: <20261020072357.2590087-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dovecot: fix build with Lua 5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 2.4, dovecot's configure defaults to --with-lua=auto and
picks up any Lua found through pkg-config, as long as it is >= 5.1 and
not 5.2. However, src/lib-lua/dlua-iostream.c, also new in 2.4, uses
luaL_Stream, luaL_tolstring() and luaL_fileresult(), which only exist
since Lua 5.2 and are not covered by dovecot's compat layer, so the
build fails when Lua 5.1 happens to be built before dovecot:

  dlua-iostream.c:16:28: error: field 'stream' has incomplete type
  dlua-iostream.c:68:24: error: implicit declaration of function 'luaL_tolstring'; did you mean 'lua_tolstring'? [-Wimplicit-function-declaration]

Handle Lua explicitly: enable it, and add the missing dependency, only
with Lua 5.3/5.4, and pass --without-lua otherwise, which also covers
LuaJIT as it only provides the Lua 5.1 API. This also makes the build
reproducible, as Lua is no longer picked up depending on build order.

This issue has been present since commit 894cbeddaf
("package/dovecot{-pigeonhole}: security bump version to 2.4.5"), as
dovecot 2.3 only enabled Lua when explicitly requested. That commit is
not part of any release yet.

Fixes:
https://autobuild.buildroot.org/results/e4cf30f6ca8b18ac010755bf13fc1d5e92eda575

Fixes: 894cbeddafddf9322411fcb5257861c1d0df3ea7 ("package/dovecot{-pigeonhole}: security bump version to 2.4.5")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Note: dovecot's configure accepting Lua 5.1 has been reported upstream,
with a patch requiring Lua >= 5.3:
https://github.com/dovecot/core/pull/335

 package/dovecot/dovecot.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 74cacc3200..876cff2523 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -89,6 +89,14 @@ else
 DOVECOT_CONF_OPTS += --without-pam
 endif
 
+# Lua support needs the Lua >= 5.2 API (luaL_Stream, luaL_tolstring...)
+ifeq ($(BR2_PACKAGE_LUA)$(BR2_PACKAGE_LUA_5_1),y)
+DOVECOT_CONF_OPTS += --with-lua=yes
+DOVECOT_DEPENDENCIES += lua
+else
+DOVECOT_CONF_OPTS += --without-lua
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 DOVECOT_CONF_OPTS += --with-ldap=yes
 DOVECOT_DEPENDENCIES += openldap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
