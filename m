Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xu248+Nx
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1E24043A;
	Sat, 31 Oct 2026 18:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9Tys-qkov_T; Sat, 31 Oct 2026 18:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8ED3405AD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793471802;
	b=H/lZ6mpBN9nTIXwFHHJJKhFk5842CmVlJ01JapaFoXc7uler+RgqtlA7bzsu7A6denKw
	 e5rQTYIwFw9jPOChbtxCyGwY4kohOj7yhJ5yEMZs1wy5fsoPKTPHX26XomlILlVoUEN2K
	 6Dis0NHH/NEbYzCNNi/jMIgP8oCOAaJuEpvpDqwvDgadDT6TS7bGpkcCFs63rtYcvyou9
	 tkE6WIixxCVmxNeMYrX44UTlnrrdDOp9qmxMlNdo7Mb7dUtgiYMdsDwoT5Un1vm4xicfe
	 rL85JsujaY0lKtMbxdxjMIqOS+SUGxliFtp8JwrgG1CbnWHbqIkO+HVTjujfs/4HF4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793471802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SaoWDBc2Z4TGwxiAAgYMcng5HWU6/OrVm0u66jFWcqg=;
	b=E4zETa7hSJZhbRvPDPoQygrzE5rVw8CgULZjFu+jdqohToU38Pstk7Vs1fl2N7a9a+cq
	 gPh2Zk4wQkcMEFQ3OLQPvMIAs55HOyvmi+K/N4L3aIK8/3kyl76wXchN3l9IrE3MX9xwc
	 FnkdYE1OKgk6hd2eVPPufP6SIMsxQlkiJNmGakweVQ139IcZCdKvwTp45YfTNiIP30vMW
	 OekyZZ3SyHfvtOttBzbR77mXNdnWh+z09IdrrNhJzsxD2GB8I3NAxXDJBNPuV3JsSiowu
	 dj6u/dRa1GJzgrkDtqcug5cW+nFE9Hq3yXdi/5VrUPTsmzskjE/S977OdoXXxDWo8xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793471802;
	bh=SaoWDBc2Z4TGwxiAAgYMcng5HWU6/OrVm0u66jFWcqg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xu248+Nx2Hj/4h6xO8a10I2mjYYW8/R1+mK0hrLHDqUiRCH5Gj2ERYcgzZ9IJE6rW
	 TnH3LFP7OMoigwRo6vb4HeobOVgA2Dyw+zdRtcvzFyY+ZZL8NpCxEXA6quxg7vDNqx
	 ULYThi/nhjWv+3HPfg0GvMB7Ni2tK78BY6SdLrhCTATa2weMmUupXJ4oS4SRvY9S2b
	 gYLpRLW1SExXU6vzXEvOgb++9m34NPCIb3OyeMmnuCAqvMg2aJtH2A127/Z0oo5MqC
	 9SNjoGGkKliAU2tjVXY3n24/LTTlRqwt1iOOG83VUGivxLo1LUZ+LoUroeLrXGSCVE
	 qhSUqpy5AHvzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8ED3405AD;
	Sat, 31 Oct 2026 18:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE36D156
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B472480EBA
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZZXnWr3IpEn for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:36:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 093B980EB3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793471799;
 b=DjE7K1f2IzvBPO4DapxET87VzKx/jvIvpQ6FF3SLJinBw7UCIZ7C44CnFEuh1mK2Klkc
 IAqFeg86gzws7aFNJ0In44DOlLM7+ynOhFqpN/Bfsns6obrlofNNlG8HowPdqptkL9Ciw
 vuJinX1s26DzfqlgFZ9nK//Tr08/X515jlcsRN84OyiwlHVJuvToR1Oa/Yr8Y+GIQX6Jq
 Z/m1A08e+ORd4jeSZnysBxpsndGs08u/uUy4k63UNFDwBbaz+O4NblaRbaQnGp8ZYurPb
 XmpxHdcMzsdSVxBuHtyartIoAU1bVdh4/baq+4lKIb5FdZSZWTDhNFxxzpWYiQZlpZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793471799;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZOt6cblgMc9noRNv1QBy+omXT+8jXAjBPFxw8ccgcfI=;
 b=SzwZCH3bUg+yvKhXbB8IDvVQE7+18tsz7Ri3eCnfu/wgp+4enmTitmOoJTNEo2NCDM2R
 wuDOV43L7x5JafbEvFGj+vk1HjQMUNdAGmdrxlP1YgbisOOWbLaQQqnlpfxNUSsguesd9
 gSdw3dSZqfvnlHewL99zs1e6NniQTrL90u6dKSNLXibLjnshhR/a/ErkLCukPnR6iv65I
 ucTIwpLnFAjXF7ODrvhe1pKfxToGVB73iPGKxdqk/8QPZlJEJTdnuHWYtRo9/mwoBbHJD
 SFIQ/Hh4/OIdkKIPIICbyXSgdJi9k7XzFoQPKPEWNhYVEXOCnP90l6OQGxl+360JavQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.128.53
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 093B980EB3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso13216975e9.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793471797; x=1794076597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZOt6cblgMc9noRNv1QBy+omXT+8jXAjBPFxw8ccgcfI=;
 b=FOaMItUY9fSrUtk4b8A/gwGIUz8IqbNuyHIC0lkREvy/yXTFRKtwFYm58zxP7MNkQw
 6Ue4JYsYiwxUSay6w5XBP33a1TKpemRapqTxyZJZxNo2gwPG0HtczqC/v63jR49j7haj
 dNKsccuvhV9HzfOKQRpAbYIXdjRt/estV6Fd4ld+qHKnxSABHW5oOgosWcMu3a+GIjJc
 zSLWUWZMEHFpAQscYWLYOvHNLRF4scOsPSSPQJSdQeSNTqbuc7B+BHB3bCv4JyhNz1QE
 FGsB8vv/24VqCiBSOvHg2qL6uEUuPShs1PUlP4b5pPUF10qUJwZaesvraYxo/3NF1S9r
 VlIw==
X-Gm-Message-State: AFq9FYKXCOv6gjAvxW8FUg8dEtx/W+5zqlAIl249vfN3mTrKv5Y+e3VR
 y4SHSPnM8HKjonjz2D4kfMkpoQGfQrKDE1whfgZmIBY/R3Zz9pl8/Zf/kne/PA==
X-Gm-Gg: AYBFou0oC6oqxrZCDPySxSBNZrhYtuGqcjPGEjHu+vNbBXM36NtNZ3Lqm6OhP9Iv3uc
 /9lDeEaJkgKEnH3vawtQlRqZRjhaGFSgXJqmYN/jWaIMjScfpKfTkxgmRI6NBVlyZhn0oiueR06
 /XkhO1V7PZho9NsUVA5aN9V3cKSyJO6A/Pp+TFi1J3UbYY2NqKUn/AYwE/ECpQSwxP/SvCXB2yG
 DkedJnPFJflVJgLNjB4c6X/hzJkHLeKbYY1Xa72Fl9cuCa/oMLuG2bu6yzuiG6e5ZNZDUvSuhoD
 gTV4NPVHXcAraxHjQcGNx7B+51zn9iTDOGZWHRZ53GO1oE3C1poMRruK0+p/x6FjBEYFTIEet4p
 gjz0GpjipHqOoX6qKri8dSrWqacDqNwRDRfbw1TbvamdfRR+j0PtQG8LsepRx/BDzHwSEzk1T8V
 IEHVQ1LAjUfpH/l3yRCVVuaLrSjlWqmLjzouPgTVH8P6i4nZWHtb/r9pkSOsUxtojbYbM1qf6Xo
 DUVoQUcaNQR/pqhOivEoUn71NWpR1OsV8NrTZwWxEUfrq03BqnkIqAHMfvXNLtgFYHT8r0BOsIm
 dccNhmR1uGZa5+FVtMWHIrayOWyYUQCc7S1w5i2Ug75F6Cq3UbTpdNHICi0hbpMGk722xIxP7np
 xzze0g6K28BHWEYT4g/+1neuiSKfY7ocPJ0KQG05XVsslnc1Z4Ci5XbxEjyEavLEGAAIt4N0/qi
 N+tQs2wJSx
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id
 5b1f17b1804b1-4ac17752ee4mr125231985e9.16.1793471796854; 
 Sat, 31 Oct 2026 11:36:36 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:7047:f4fc:5b2:60ec])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a66caefsm116462835e9.5.2026.10.31.11.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:36:36 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 31 Oct 2026 19:36:32 +0100
Message-ID: <20261031183632.1561453-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031183632.1561453-1-thomas@devoogdt.com>
References: <20261031183632.1561453-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/2] package/libgtk4: bump to version 4.24.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS

Highlights of the changes since 4.21.0:
 - librsvg is no longer a dependency, as GTK can now render SVG
   images natively; this also drops the rustc host requirement
 - New GtkSvgWidget for displaying (interactive) SVG, used for all
   SVG icons and GtkSpinner
 - Wayland: support for text protocol v3.2 and
   xdg-session-management-v1
 - GSK: 10bit image formats support, rewritten cache allocator,
   clip masks to reduce the number of offscreens
 - Session saving support is back

Since 4.24, GTK unconditionally links against libpng and libjpeg
(previously only needed via the gdk-pixbuf loaders), so select
BR2_PACKAGE_LIBPNG and BR2_PACKAGE_JPEG.

Also list cairo, harfbuzz and libfribidi in LIBGTK4_DEPENDENCIES
as GTK links against them directly, and add the X11 libraries
(GTK links against x11, xext, xrender, xi, xcursor, xdamage,
xfixes, xrandr, xinerama, fontconfig) that are missing from the
X11 backend dependency list, so that all direct dependencies are
correctly built before libgtk4.

Finally, added two patches to fix fenv usage on uclibc toolchains.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
BR2_PACKAGE_LIBGTK4=y
BR2_PACKAGE_LIBGTK4_WAYLAND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_MESA3D_GBM=y

./utils/test-pkg -p libgtk4 -c libgtk4-mesa-wayland.config -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: FAILED
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 8 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

BR2_PACKAGE_LIBGTK4=y
BR2_PACKAGE_LIBGTK4_X11=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y

./utils/test-pkg -p libgtk4 -c libgtk4-mesa-x11.config -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: FAILED
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 8 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

One fail on bootlin-m68k-68040-uclibc:

In file included from ../src/util/list.h:40,
                 from ../src/compiler/nir/nir.h:40,
                 from ../src/compiler/nir/nir_opt_varyings.c:524:
../src/compiler/nir/nir_opt_varyings.c:3207:1: error: static assertion failed: "dedup_entry layout changed"
 3207 | static_assert(sizeof(dedup_entry) == (sizeof(void *) == 8 ? 48 : 28),
      | ^~~~~~~~~~~~~

Reported here: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42235#note_3751861
---
 ...uild-add-a-check-for-the-fenv-header.patch |  26 +++++
 ...value.c-fix-compilation-if-fenv.h-is.patch | 106 ++++++++++++++++++
 package/libgtk4/Config.in                     |   5 +-
 package/libgtk4/libgtk4.hash                  |   4 +-
 package/libgtk4/libgtk4.mk                    |  23 +++-
 5 files changed, 155 insertions(+), 9 deletions(-)
 create mode 100644 package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch
 create mode 100644 package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch

diff --git a/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch b/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch
new file mode 100644
index 00000000000..788c190d865
--- /dev/null
+++ b/package/libgtk4/0001-meson.build-add-a-check-for-the-fenv-header.patch
@@ -0,0 +1,26 @@
+From d126fca3178004ab7d540d067e8c39745b69820f Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 15 Nov 2024 08:22:23 +0100
+Subject: [PATCH] meson.build: add a check for the fenv header
+
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index f8a6d35e3c..ca8e63b93d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,6 +198,7 @@ cdata.set_quoted('SYMBOL_VISIBILITY', get_option('symbol-visibility'))
+ 
+ check_headers = [
+   'dev/evdev/input.h',
++  'fenv.h',
+   'ftw.h',
+   'linux/input.h',
+   'sys/mman.h',
+-- 
+2.43.0
+
diff --git a/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
new file mode 100644
index 00000000000..38c5b7573e1
--- /dev/null
+++ b/package/libgtk4/0002-gtk-gtkcssnumbervalue.c-fix-compilation-if-fenv.h-is.patch
@@ -0,0 +1,106 @@
+From 734fcd35e1d82a9b68b7c6aff7cd2b27d557b29e Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 15 Nov 2024 08:22:40 +0100
+Subject: [PATCH] gtk/gtkcssnumbervalue.c: fix compilation if fenv.h is missing
+
+../gtk/gtkcssnumbervalue.c:29:10: fatal error: fenv.h: No such file or directory
+   29 | #include <fenv.h>
+      |
+
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ gtk/gtkcssnumbervalue.c | 59 ++++++++++++++++++++++++++++++++---------
+ 1 file changed, 47 insertions(+), 12 deletions(-)
+
+diff --git a/gtk/gtkcssnumbervalue.c b/gtk/gtkcssnumbervalue.c
+index 1181c1a802..03cf30262a 100644
+--- a/gtk/gtkcssnumbervalue.c
++++ b/gtk/gtkcssnumbervalue.c
+@@ -26,7 +26,9 @@
+ #include "gtkcssstyleprivate.h"
+ #include "gtkprivate.h"
+ 
++#ifdef HAVE_FENV_H
+ #include <fenv.h>
++#endif
+ 
+ #define RAD_TO_DEG(x) ((x) * 180.0 / G_PI)
+ #define DEG_TO_RAD(x) ((x) * G_PI / 180.0)
+@@ -1846,13 +1848,25 @@ gtk_css_dimension_value_is_zero (const GtkCssValue *value)
+   return value->dimension.value == 0;
+ }
+ 
+-static double
+-_round (guint mode, double a, double b)
++#ifdef HAVE_FENV_H
++static inline double
++_round_fenv (int mode, double a, double b)
+ {
+-  int old_mode;
+-  int modes[] = { FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO };
+   double result;
++  int old_mode;
+ 
++  old_mode = fegetround ();
++  fesetround (mode);
++  result = nearbyint (a/b) * b;
++  fesetround (old_mode);
++
++  return result;
++}
++#endif
++
++static double
++_round (guint mode, double a, double b)
++{
+   if (b == 0)
+     return NAN;
+ 
+@@ -1880,14 +1894,35 @@ _round (guint mode, double a, double b)
+         }
+     }
+ 
+-  old_mode = fegetround ();
+-  fesetround (modes[mode]);
+-
+-  result = nearbyint (a/b) * b;
+-
+-  fesetround (old_mode);
+-
+-  return result;
++  switch (mode)
++    {
++    case ROUND_NEAREST:
++#ifdef FE_TONEAREST
++      return _round_fenv (FE_TONEAREST, a, b);
++#else
++      return round (a/b) * b;
++#endif
++    case ROUND_UP:
++#ifdef FE_UPWARD
++      return _round_fenv (FE_UPWARD, a, b);
++#else
++      return (((a/b) >= 0) ? ceil (a/b) : floor (a/b)) * b;
++#endif
++    case ROUND_DOWN:
++#ifdef FE_DOWNWARD
++      return _round_fenv (FE_DOWNWARD, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    case ROUND_TO_ZERO:
++#ifdef FE_TOWARDZERO
++      return _round_fenv (FE_TOWARDZERO, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    default:
++      g_assert_not_reached ();
++    }
+ }
+ 
+ static double
+-- 
+2.43.0
+
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index c1f3928b8aa..689d963228c 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,5 +1,4 @@
 comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -14,7 +13,6 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
@@ -29,9 +27,10 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GRAPHENE
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index dff32c57b48..ffa90911e58 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.21/gtk-4.21.0.sha256sum
-sha256  f52475c5041dfd02cc4eed22ee94f12ec310c16a68fda9203dc54ffd5daa6e6f  gtk-4.21.0.tar.xz
+# From https://download.gnome.org/sources/gtk/4.24/gtk-4.24.1.sha256sum
+sha256  e98abe720e16129c8c0f50761dee0a2e9ae2478055e31018f6cf977fcf6513e9  gtk-4.24.1.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 9a5ed651a82..26346dad29d 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.21
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).0
+LIBGTK4_VERSION_MAJOR = 4.24
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -17,12 +17,17 @@ LIBGTK4_INSTALL_STAGING = YES
 LIBGTK4_DEPENDENCIES = \
 	host-pkgconf \
 	host-libgtk4 \
+	cairo \
 	gdk-pixbuf \
 	graphene \
+	harfbuzz \
+	jpeg \
 	libepoxy \
+	libfribidi \
 	libglib2 \
-	librsvg \
+	libpng \
 	pango \
+	tiff \
 	$(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK4_CONF_OPTS = \
@@ -46,7 +51,17 @@ LIBGTK4_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
-LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
+LIBGTK4_DEPENDENCIES += \
+	fontconfig \
+	xlib_libX11 \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXi \
+	xlib_libXinerama \
+	xlib_libXrandr \
+	xlib_libXrender
 LIBGTK4_CONF_OPTS += -Dx11-backend=true
 else
 LIBGTK4_CONF_OPTS += -Dx11-backend=false
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
