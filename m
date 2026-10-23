Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C1606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 22:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MJn7j+Zx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=T6YAZpUm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A8A40AB7;
	Fri, 23 Oct 2026 22:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb8XFv3Nf1Gn; Fri, 23 Oct 2026 22:57:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A81F40AB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792796278;
	b=BhjnHbdEm4MrNTDcRaabrftH0cnewmjic057Z6LA0lxYcAwhtTnEAu275h6tSWGDJFTX
	 4apBN4y4TBZF46ZTjzQMIgz1zvzAbs3lLr/ofhnhzgNf4ulXs+ei8VqSP0gk6zB2TOU9N
	 5ZWk2nUc5Ij9NfODBCEuhrKAEJ8pvwYwmCQAZqfhNpAybg8Cl3aZXkeJusjMR7zqMcvFZ
	 mXgfd29rz/OeUf/5BJyYzcfhSkPffNu6ZpENeoWG3LKyHS/BwHK6d3SGVuyF5vLQHU4rj
	 unQ/0gQScQWxJjWCechMTSX3P8oqJy19YcjDq9vHXktLrorVwwxh8UFbP6Bi9G8gThQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792796278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KbIo0mKh/JNCrPIQOCwiJsckMpqALKH8pf++xND/uqQ=;
	b=YeqYWIUGBQBP+PP/QPRnym33E4F20ZOJj7RjMdNUt/DDILJg+jbc2Mgj1TNh/f8KbRdY
	 u+E1uCovGecbJ3Qp/1dMshaOH4ZdOofrHKydtvQbVJuvnxVFoTyAbTYDxvbXE9AMZ58oz
	 0n2ELkhX1hpfbepBMILtmkf911S0u/CNWCcb7WTqPZVfy1Ju0NBUGNNZQNPTBZxkDVR+k
	 /oxErd5Gv0rQV2BrdZXzZawYPEe8pQxYGbi2WypjE37ua4YkS8kDZOmbJAGu3JtAkfEUt
	 8eKoYsUmjczyomQM9hDI/ck/L5MdDODkc1oGWNfxDNcGcIGo4/uqcToRC0yAMmy8egQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=T6YAZpUm;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792796278;
	bh=KbIo0mKh/JNCrPIQOCwiJsckMpqALKH8pf++xND/uqQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MJn7j+Zx/YF+TuqPpS5C1tEUCc2gBXhvrR2co5mNxZ7S72BAQxIptKMwiA5zpCDsJ
	 zj8HfhohAq/QVnJZbseNmJHmL62iHnbSgWWKjeJ/ECs9YmGoCdZ0QGI4G5TTWF7TOD
	 s2FB4cs6Np9QD7wFO4lRSMN5MdpCgZy+VNymh4zAKE7BJ1VrRRV6Lk26X1XS8+iCle
	 XnERasPqbDSpQ53hcvUtRsZQSGZCkxU9jtRB6VGPUEUxd4XBBEhVMuKRDSNavLKO5/
	 TOBuid9RXlQBiiLnDYhBWKaNs3ahNNf6SOxtCtA10xGVgbh6nlTpY9A1CSu9dA6dpa
	 4e2aF45BxoAgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A81F40AB9;
	Fri, 23 Oct 2026 22:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAFD79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0339C40AB4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRWlx05V-SL8 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 22:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00FAF40A9A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792796276;
 b=RbvGGxglSzs8KCB8vqK2SSLM8L8EIUh8CQAWMXgSUmBXuxosn0HQdRp9v02JtgGrlTXq
 9jFYqgGNRJwJp5CZQfMuF++mp/OoetwcJVHBfY/iOPfcchjjiYdvgt0Zm90YuzxgskEe/
 PotWlBAnTyW+qBaeBHdeP5WJVahqyRp46ujL5z49Bm3i6k6sHoyCrBgNnOSP4NMlWVIHh
 xvKOoaQ1hUgbx7oE/85oju3iRlJkddUK/oX5UpAQvZy+CorQHJqdBVKtSgpHSvPHLbvHx
 GPsDdDfZwIfJ3d+uZigMfoGv6HBHXkyF1Nbtu4lNwEWtBeALeldFTUNtEhkqcyYqKXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792796276;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=cslUSc2fdv4KBjPkFgJIxRD/thgtkY8INOXZR/s0slw=;
 b=cP7Zrh/ImrGdTWkGej65jcxomnOz4gy7T/rwLeX+UchQ9t6HeFxBZ45yUDv+sF/kJppM
 xXvS91bHiVFwI+Zo5cAtoZyA2GVRqxbMfSDkDppdN5OfDqtAkPViy/YTB5vHdD64Ane8f
 YSJ2zU+8wKd7iQepn33sYYp27bKQUX52cE6anrSZx2U/XBYyhgBh/Av1Y2/jc4PeKVakt
 OzWMvliwo7ImgMMqcb65YUP0r5fxs74W9XwLPnm3ToOSSEQ5aqswhVRcYTSq9VordMAl5
 myMhbsMZlDYcxlk3Z2U+coK3SDPVwV24ubLB//Ji6JyB/8EssCzS9pcOP3Su943QG+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=T6YAZpUm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=T6YAZpUm
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00FAF40A9A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:57:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b2232d8ef5so2199365a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792796273; x=1793401073; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cslUSc2fdv4KBjPkFgJIxRD/thgtkY8INOXZR/s0slw=;
 b=T6YAZpUmknKsNNG5Z26Q9Pej/clLt8D6nNcPG75uUxT3YtGtPajdRuJJXxXeDG3a8x
 lFX6bxn933ApGNWUxm8jpafC+3iAcjkK6Pr5XfN/YnTa9azyoIHoIe8EBoIbDlNzt9Pu
 2nzCEDP5hE8xqMIQzmmMSoqYZYrYFxHNSwWZlO8vdZWeV1NxpgVEw4TUBoC13i21ai9l
 cCx0MJMkI//n2ziSnQxCj4U51dhtivHQuVCJyYYb8MgyHt2js45VLzPHunGqd80JvDIM
 FsxEyL8+8t+oBFbpBI96ecgxuCkD63AAMRdoKYuy+xFqbM9+iuUeKjhI9y5HxmxMTy68
 f3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792796273; x=1793401073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cslUSc2fdv4KBjPkFgJIxRD/thgtkY8INOXZR/s0slw=;
 b=2zs+IaS32U8SzvFNPivFCnlJvhWspyyOPptoo8TiAdRB8EeUUIfkpf6s/C7iUM7YnI
 qF5SuqcTuvvegPrlHksxIPFPBULfuuPfoxU3/u0FtZ7ogUHAokAchL3Dm1IZv/GJTesM
 FxTtrStFT/vOPMfBwDug22FE92c046rURp88UhlzbETIgBgf7xSWJtAm7Z4EgHDNj9vC
 EM/ih9jaibl/1fz1fWgS6BGS6y4BSS3HZx2MHSbHUECPpRECQcz42BKBUx2gw7yCihW7
 mdO1N8XCtxoVo3g3HCcPNpLtAdXUy2Y3TlycjVsy+1mCDU9zz8l2BoZ6efABg+2c+BGX
 /RQw==
X-Gm-Message-State: AFq9FYISsxb72oYVw/jDkFCkaGjqtDPppiSpqEOyYAdTpMEv+PzG/ywq
 INodK3oFqi+AkTnXfNLt0cxYIKPpPUMRgpBbkkNYizaO4aIjgCLXYR5cH/bc5A==
X-Gm-Gg: AYBFou2PHHG4m3ACi4iYBacQaUsKKKG+cm9sDbbIuFPy1WDKatkg2to8kkmNfKnw57K
 fSMjoyaRkmrTqwURY5R4oojJqv1Mq1A4q8eVj5LX1BTxXnMRIamfWutnKZkL7A1cZahjY1o7Rn/
 67ApDBC54DerrwbW0yhqO0YnwFzo0quwIF9GZuZ0xINYUds6BX2aDHQ8ucrzuvVO6wfYMUetKGb
 w1L0KmYqX7Q4xZiZdFQg174f8P6+UK9KHIDvQlzqMb/goUkMxoQNo1NfktkAUaW9tLmcGnB1jO/
 FgWKqIOOJQfe/Nh+2c6oAbnMUkwWj3arMOgUa2rqQDDMsOPonDxvp0wzzEb2lJCZHRYg4lSj1PU
 5ibl+Rc5+LLQA64VXLSBpMCRT7Mv3had8B6ZlCw2iDchsJwnk/m3o1+xfGXh/JB7ZeGaYNPG7VS
 6A0yQj4bBmz5JN5F5bbH7+OeoibeN56hKNyPKqukPp9QRcch9l+10ba4mwLI0ZEUMXcSYFazqu8
 XquFaoo3cnyOIYfDM+Q6JI1OWXGJP/rXS830m2GZPwpKq4svj1uzfY528O4Rvcf3XMCmFYuplXA
 Bmw0dl+vxQDSU6IohiQz3pJ0YpOGPl4kxok=
X-Received: by 2002:a17:906:9fd0:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c46bde97dbbmr43168366b.32.1792796273169; 
 Fri, 23 Oct 2026 15:57:53 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd34fe2dsm17340666b.1.2026.10.23.15.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 15:57:52 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 00:57:50 +0200
Message-Id: <20261023225751.2614512-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023110216.1414214-1-yegorslists@googlemail.com>
References: <20261023110216.1414214-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: fix readline dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

avrdude automatically detects and links against readline when it finds
libreadline in the sysroot (find_library(HAVE_LIBREADLINE ...) in
CMakeLists.txt; AC_CHECK_LIB([readline], [readline]) with the former
autotools build system), and there is no option to disable it.

Buildroot never declared this dependency, so the result depended on
whether readline happened to be built before avrdude. Even worse, some
external toolchains (e.g. the Bootlin ones) ship libreadline in their
sysroot. In that case avrdude ends up linked against it without
BR2_PACKAGE_READLINE being enabled:

  $ readelf -d target/usr/bin/avrdude | grep readline
   0x0000000000000001 (NEEDED)    Shared library: [libreadline.so.8]

but libreadline is not installed to the target, so avrdude fails to
run.

Add readline to the dependencies when it is enabled, and otherwise
pass -DHAVE_LIBREADLINE=OFF, so that find_library() skips the search
and readline support is disabled.

This issue has been present since commit dc776f0d0546 ("avrdude: new
package"), as avrdude has always detected readline automatically. It
therefore affects 2014.02 and later, including all maintained
branches.

Fixes: dc776f0d0546900b22d1552f3e522be2080016c6 ("avrdude: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - rebased on master (avrdude 8.3)
  - sent as a series together with the libserialport fix

 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 5708fe2017..476f031c99 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -29,4 +29,10 @@ ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+AVRDUDE_DEPENDENCIES += readline
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBREADLINE=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
