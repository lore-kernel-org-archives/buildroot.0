Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF91606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h/DtS6BL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C41E409A9;
	Wed, 28 Oct 2026 21:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXHXtmZV7tQE; Wed, 28 Oct 2026 21:37:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE865409AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223477;
	b=PnQAOqCBQnlFHsKBqY8xM/tJsdG6J7vbvi3YaqFyvo4TlTkhik6ozNDWf6dTePGmMRpR
	 afn7wl/0pJnLxArfaxnXIrh48V61cQeW2JlPY0cSu19IHlNJXj/IkLpIrubaYBhqVO5Qy
	 ELTpeAG/P6saDmrlZn+9OmdonZqr1nlD+A1i125rPeRXC7RoT+bZiibtD9uj7E7OAKkgy
	 Zfqc8giaPb+D/AN1Esw+LFLkGw2JSK+U+pip1R4U6eMM5UNwJmtCu/FJ9hp+uUIEGECQm
	 29NbzDVQipRlyqxC1Y5gA0fOJ2l0maYeVll+PS2Jmq2OXFz25A98bn3rkJRaBiy66Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223477;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:MIME-Version:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zSih/tLaen5JxbLzqVBH4Cm3jAYUPlyRUmUyVixOf+w=;
	b=PIcZdbKd1rV7jE8FPHD34p9DcC1lFqOqapYcacBn0HSlJrrq+5SIXIMA5u0HDSXYEMxo
	 OxsgvLO1zl45vYcBhvWfijinJb8zIMRQuKl5YYFGW3JwqkPJBHVVuheKRH6kTmY86Xakq
	 ZF5G/ubZxziQ5RAyDgYTzG9emPUQk9l6N2esXl+gMDLWg5+HfsQprgfy1OSp1n99hHbxz
	 5pyGzI/PN6YGclqxrE7MoDA/A+dXK546zdEJEzzio8xECpspF93MqSv0zgtsLW3n5jUqD
	 UMYmps/Y3XOUxIhtBwfJl0p+OkBQLSmPwCnnkqTnsDBnBdRjPeq5+/Gx7Jfpn3de0Cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223477;
	bh=zSih/tLaen5JxbLzqVBH4Cm3jAYUPlyRUmUyVixOf+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=h/DtS6BLHGNIBhcJcrPfds3WUyXraOJX+kHN1lIyUhx1o2zIFOGDsPUg3+fgml8fb
	 B0XVJ2r0ZfcvkeIHCWbFIg262eNc6b6Z7J7V+l7qJOjbrHZT6+krXlJwctT81S8Ifl
	 6VcPaZ/CBWSjZlnKtKdanOMXLg5f3FBgpKwKXcTPbpNBjN3grXkUQh5ItoNIJBaUHJ
	 ZR7MiFKYbBmI3nvB2wMRD8azo592Y19kXy23r7FgUCasrl6jFMPVLyamr1ei7y74no
	 ag837Nz3gKvTUSe1ET3j9JTvfY9Bu/pwzFb35II+3t5OIztIuNqsqx56Z7ikrZV33V
	 1y+Ld3hlByEGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE865409AA;
	Wed, 28 Oct 2026 21:37:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B45A8235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A0F409A9
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbdCockOMzIE for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:37:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F9E6409A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223475;
 b=bMXnzkLQNHvQjKrd2bG5/GlIIRMicIFVezq0ruHkvopw4L1tdf7+qXFeDXKw89L7F7rG
 XSbc96UNKSK9PNSpxWaguLlSBz6LyzrN10MYxY758o/hof02ixQ4HXFOnJrWhUqA1hLNG
 mlDfrm+NK/TG+IPDuI73C1Aq0REynC5QU9Wl4CJUfqpI42RhQEsQ1lV2qp3k+AWMhMOAi
 /radpp9O6c0cUX15eE85d15CwHxsCsDIyozrAjILZKb2IgyM7rvt9cW7mowj5F6Vx3a4s
 YnOaaSZ4lBsVd13VFM01c8wXEjLOCxhXx0m0p0pvKsCBHDNZkZfDBbZ1WjZ17sGqFMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223475;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=8vE3/0kmpqNWo7/3mp5fqdxWSssZkU/ufWyVC1wAYLk=;
 b=CMy+byz5Gxljbd8GAHqlJwFAKM+ql4LRP+zEyv05IStgWM56z6G4vZMHpgz6IX8FaWy+
 FYxhBa+nDi39DfM1boJDVMD3J+qHICqxuRQPEP6uzgkEc5TgjQMm45694PgDS51OHaku/
 9zOIrbe3JwW8TjeksGshTpySFiFvfTaxqTx31qgDJEgxhsaL/IyNWms/Si/L/wb6ffY7t
 zHDsm1KMBUeC29JyHzEpGe8snuFL7Tf/OSt4QSqGCSaFFnpXrgrPJuJt3KOPjMRhEF5QT
 Ou8qEUYfcD0geHQIZSN/wR0LeEWtauDoq0KM+sazZCBXh7g71O2Pmj9xQ5dn+9Lx1RA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=QJGClR8w; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::563"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com
 [IPv6:2607:f8b0:4864:20::563])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F9E6409A7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:54 +0000 (UTC)
Received: by mail-pg1-x563.google.com with SMTP id
 41be03b00d2f7-cd6a7e1f4e4so619128a12.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223474; x=1793828274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8vE3/0kmpqNWo7/3mp5fqdxWSssZkU/ufWyVC1wAYLk=;
 b=RLqMsFifNxOgTG3aSxOAeC7NsZym4iqMLF6bDYVRrukmleDcFO7/VMOaE1GCvMY977
 Ta5GF8Ot154xKoJyj3nkvacsZ+hN4/QUrnmkbsMIaWXs2/NYH3oOcXxrTXr+Nvlseh/K
 P6XqBNEHx1ajidJyD1pFv2bAbPp24kEFq1yeJTQHifXOc8l83cK7RY/+uG+xg/0gcqQQ
 FPvHU6iyURMnr9IQRlpOr25UH1OLbc3V7Z2Ut4BMR589r0E1l0sAA6Zw/3JhMhKC4oSX
 bjoMV6JtS7uU6pPpyEUmYGJgxUX4+VK9Rx/KIyGeygCWiX02MiPQbSMu4AD+CNTmOR16
 KvRQ==
X-Gm-Message-State: AFq9FYJ5Ywm2b15C/UWaTCBpX1jHk7ul0+LFrWdQ6L6CTzhJzJSMcZs1
 FV0HwsIfhhAn+uyiTvZjrgygKhxD66aAjF02Od0q9H+Xp2Tj9adqPCiPfxmkq5o3WI1gkuRutDs
 QLPxy0mbTnY80ymh8od6mhPXexux+ekKC3usYiBPJ/gt4OCX/t7jRFO+s96pgwN8JSkuCC6oI/E
 9l9Cha6VjxzzWH0HsTb+G6BKSXSLP04WTfPpJY3hd8MfVCW8AXTIZS0BF6WNPzThiTWhWYPCoFK
 jYj25xLmmWQO5TdZA==
X-Gm-Gg: AYBFou1pQi6AssqAVngy1y4FVuISW4RXwl4WCu72hvWa4SIpwAcQs9CGEMXoOPRtMsH
 BdQiu+x9GSHKRbyt+Nzy/rWHhBze7BfXghDkYWDWYOao4WroU707xcDN4rMHASWoK21KjtRSMg+
 x4wWR8PQN/4UiHEXbvEcjQ63lOU+OVbNw3PLJRJWby9eXRlj4RKoyJn96htXLtroKDAaypFUIen
 AvkYwFPps6nasoF+Y3fxY1cRDHExJp03KToKyPmSaYlkd7/E4MhLHiy62qqyP/uyvU+xj7MG538
 qQoIY1b1eSQ1kBt99O6RwLlw8A62lbM4W/ZeZonY3ih5E9AM+VadWgYrCh5sUE0jRrdEsSh6CQB
 eu/in8XmSwNCZcKh/7iArgcqlVyFSFubb8FHAGSNKBmzK+D98yspAYuI9Nlo3E7HDMRQeuGYyGi
 Syt5XCYjIpj6aYK5ifL2ttUgt9APjKHsrQuaeC2x7O
X-Received: by 2002:a17:90b:264c:b0:3ac:80dc:f407 with SMTP id
 98e67ed59e1d1-3ae58241ea9mr2926874a91.60.1793223473427; 
 Wed, 28 Oct 2026 14:37:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e21234dsm587690a91.0.2026.10.28.14.37.52
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:37:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91256a7b7b3so25538546d6.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:52 -0700 (PDT)
X-Received: by 2002:a05:6214:dae:b0:91c:62b7:296f with SMTP id
 6a1803df08f44-91c7d211f17mr60243256d6.50.1793223472077; 
 Wed, 28 Oct 2026 14:37:52 -0700 (PDT)
X-Received: by 2002:a05:6214:dae:b0:91c:62b7:296f with SMTP id
 6a1803df08f44-91c7d211f17mr60242576d6.50.1793223471267; 
 Wed, 28 Oct 2026 14:37:51 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm139827476d6.4.2026.10.28.14.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:37:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:21 -0700
Message-Id: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 00/23] Support building the Linux kernel out
 of tree
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This series lets a package be built out of tree, i.e. with its sources
in a directory separate from the build directory, and enables it for the
Linux kernel.

For a large source tree such as the kernel, this matters for the
LINUX_OVERRIDE_SRCDIR workflow: the rsync step is slow, doubles the disk
usage, and leaves the developer's tree and the build directory out of
sync. With this series the kernel is configured and built with
O=output/build/linux-<version> (or linux-custom with an override), and
the sources in the overridden directory are never written to.

A package opts in with <pkg>_SUPPORTS_OUT_OF_TREE = YES, and is then
always built out of tree:
  - without an override, the tarball is extracted and patched in
    output/source/<pkg>-<version>, and output/build/<pkg>-<version> only
    contains the generated files;
  - with <pkg>_OVERRIDE_SRCDIR set, the overridden directory is used in
    place, with no rsync, and the build directory is
    output/build/<pkg>-custom.
Only linux opts in for now, all the other packages are unchanged.

Most of the groundwork comes from the out-of-tree work Thomas Petazzoni
and Yann E. Morin did in 2015-2017, which was never merged. It has been
rebased on current master, and extended to cover the custom logo, custom
device tree files, and linux-tools. Their authorship is preserved.

Series overview
===============

Patches 1-8, infra preparation:
  - introduce <pkg>_SRCDIR (where the sources are) and <pkg>_BUILDDIR
    (where the package is built, and where the stamp files live), both
    defaulting to <pkg>_DIR, so nothing changes for existing packages;
  - fix up the users of LINUX_DIR that need the build directory
    (boot-wrapper-aarch64, mxs-bootlets, the linux extensions), and run
    the kernel version probing from the build directory;
  - introduce <pkg>_SRCSUBDIR (<pkg>_SRCDIR/<pkg>_SUBDIR) and convert the
    infras (cargo, hare, luarocks, meson, perl, waf) and gcc-final to it.

Patch 9, the kernel:
  - add <pkg>_SUPPORTS_OUT_OF_TREE, which defaults to NO so that an
    infrastructure can later change the default (e.g. autotools, with
    a per-package opt-out). A package that sets it has its sources
    in $(SRC_DIR) (output/source) and is built in $(BUILD_DIR), with
    kconfig called with -C $(SRCDIR) O=$(BUILDDIR). When
    <pkg>_OVERRIDE_SRCDIR is set, the rsync step is skipped and the stamp
    files go in the build directory. <pkg>-dirclean and make clean also
    remove the extracted sources;
  - opt linux in, in the same patch. When the sources are overridden,
    Kbuild requires a clean source tree for O=: a tree with a stale
    .config, include/config or arch/*/include/generated is rejected by
    kbuild itself.

Patches 10-19, host/target consistency. When the sources are shared between
the host and the target variant of a package, they must not be patched
differently, so:
  - sync the host and target patch hooks, and fix omniorb, lua and perl
    which did different things between the two variants;
  - have host packages inherit the extra downloads and apply the libtool
    patch to host libtool;
  - warn about packages that autoreconf without the libtool patch;
  - replace $(PKG)_DIR with $(@D) where this is possible.

Patches 20-21, the parts that write to the kernel sources:
  - the custom logo (BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH) and custom device
    tree files (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) are copied into the kernel
    sources. With an overridden source directory, linux is built from a
    "shadow" tree: real directories whose files are symbolic links to the
    original tree, created by the new support/scripts/symlink-tree. Files
    are replaced rather than written through the links, so the overridden
    tree is never modified;
  - linux-tools checks which tools are available in $(LINUX_SRCDIR)/tools,
    and builds them in a shadow of that directory, because several of the
    kernel tools build in place, and some (mm, tmon) do not support
    OUTPUT/O= at all. This also covers the PCI endpoint selftests path.

Patches 22-23:
  - packages that read kernel headers from the source tree use
    $(LINUX_SRCDIR) instead of $(LINUX_DIR);
  - document the feature and the new variables in the manual.

Things this series intentionally does not do
============================================

  - Only linux opts in. The other packages still extract and build in
    output/build/<pkg>-<version>, and still rsync with an override. Other
    packages can opt in later, with the same variable.
  - The "hooks sanity check" and "host inherits the target hooks" patches
    of the original series are not included: they do not work with the
    infras that register per-name hooks (e.g. golang).
  - The Python 2 and asterisk patches of the original series are dropped:
    those packages are gone or no longer need them.

Testing
=======

All of the following build with the series applied on top of master
(1cfdb4efd539), from scratch (no build, host, staging or source directory):

  - raspberrypi4_64_defconfig, stock, and with the Raspberry Pi kernel
    sources overridden through LINUX_OVERRIDE_SRCDIR;
  - qemu_x86_64 and qemu_arm_vexpress, stock, and with an overridden
    kernel source directory; all four boot to a login prompt in QEMU;
  - a wide package set on top of raspberrypi4_64_defconfig (autotools,
    cmake, meson, perl, python, cargo, golang, waf, luarocks, hare,
    kernel modules, asterisk, ffmpeg, libvpx, u-boot, and the linux-tools
    gpio, iio, perf, pci, cpupower, rtla, tmon, mm, usbtools), both with
    and without an override: the content of target/ is identical;
  - a custom logo and a custom device tree file with a #include, both
    without an override, and with an override where the overridden tree
    is left unmodified;
  - the same package set in the Buildroot CI docker image, offline;
  - <pkg>-dirclean, -rebuild, -reconfigure, -legal-info, -source,
    show-info and linux-rebuild-with-initramfs;
  - every patch of the series builds, tested on a small package set.

Known issues, not caused by this series and identical with and without it:
xtables-addons does not build with the Raspberry Pi 6.12 kernel, and
some linux-tools selftests (mm) fail to link. I have not tested the
selftests in the docker image, as the container has no python yaml.

Not tested: the other kernel extensions (rtai, xenomai), which are
adapted but not built, and booting on real hardware.

Changes
=======

Changes since v1:
  - patch 3: removed a leftover "WIP" note from the commit message;
  - patch 9: as suggested by Thomas and Arnout, out-of-tree is no longer
    only used with <pkg>_OVERRIDE_SRCDIR: a package that sets
    <pkg>_SUPPORTS_OUT_OF_TREE is always built out of tree, with its
    sources extracted in output/source. SRC_DIR is now a separate
    directory, and dirclean and make clean remove it. Patches 20 and 23
    are adapted accordingly;
  - patch 12 (lua): the host variant also modified luaconf.h, to set
    LUA_ROOT, in a host-only post-patch hook. As suggested, this is no
    longer done on the shared sources: the Buildroot patch now lets
    LUA_ROOT be overridden, host-lua sets it in its CFLAGS, and the
    installed host luaconf.h is adjusted in a post-install hook;
  - patch 17 (perl): as suggested, revert 8dea6e7c089c ("package/perl:
    apply perl-cross patch only on target perl"): the perl-cross patch is
    a normal package patch again, applied to both variants, and the
    PERL_POST_PATCH_HOOKS hook is dropped;
  - the subject no longer mentions LINUX_OVERRIDE_SRCDIR.

Regards,
Florian


Florian Fainelli (6):
  package: use <pkg>_SRCSUBDIR where <pkg>_SRCDIR used to include
    _SUBDIR
  linux: build out of tree
  linux: support custom logo and devicetree files in out-of-tree builds
  package/linux-tools: support an out-of-tree kernel build
  package: read kernel headers from LINUX_SRCDIR
  docs/manual: document out-of-tree package builds and the new srcdir
    variables

Thomas Petazzoni (7):
  package: prepare removal of <pkg>_DIR
  infra: introduce a global SRC_DIR variable
  packages: sync host and target patch hooks
  omniorb: avoid target-only patch hook
  lua: rework post-patch hook usage
  package/libtool: use post-patch hooks
  package/{ffmpeg,libvpx}: use $(@D) instead of $(pkg_SRCDIR) when
    possible

Yann E. MORIN (10):
  package: fix <pkg>_SRCDIR and <pkg>_BUILDDIR values
  boot/boot-wrapper-aarch64: needs LINUX_BUILDDIR
  boot/mxs-bootlets: needs (BAREBOX,LINUX,UBOOT)_BUILDDIR
  linux/extensions: point to proper _SRCDIR and @D
  linux/linux: LINUX_VERSION_PROBED should run from build directory
  infra: host packages inherit the target extra downloads
  package/libtool: also apply libtool-patch to host libtool
  package/perl: apply the perl-cross even for the host variant
  infra/autotools: warn for package that autoreconf without libtool
    patch
  packages: replace $(PKG)_DIR with @D where possible

 Makefile                                      |  3 +-
 .../boot-wrapper-aarch64.mk                   |  8 +-
 boot/mxs-bootlets/mxs-bootlets.mk             |  6 +-
 docs/manual/adding-packages-generic.adoc      | 12 +++
 docs/manual/using-buildroot-development.adoc  | 38 +++++++++
 linux/linux-ext-rtai.mk                       |  8 +-
 linux/linux-ext-xenomai.mk                    |  4 +-
 linux/linux.mk                                | 41 ++++++++--
 package/a10disp/a10disp.mk                    |  2 +-
 package/android-tools/android-tools.mk        |  1 -
 package/binutils/binutils.mk                  |  1 -
 package/ffmpeg/ffmpeg.mk                      |  2 +-
 .../imx-alsa-plugins/imx-alsa-plugins.mk      |  2 +-
 package/freescale-imx/imx-lib/imx-lib.mk      |  2 +-
 package/gcc/gcc-final/gcc-final.mk            |  2 +-
 package/gdb/gdb.mk                            |  1 -
 package/gstreamer1/gst1-imx/gst1-imx.mk       |  2 +-
 package/icu/icu.mk                            |  1 +
 package/libtool/libtool.mk                    |  5 +-
 package/libvpx/libvpx.mk                      |  2 +-
 package/linux-backports/linux-backports.mk    |  2 +-
 package/linux-tools/linux-tool-cpupower.mk.in |  8 +-
 package/linux-tools/linux-tool-gpio.mk.in     |  6 +-
 package/linux-tools/linux-tool-hv.mk.in       |  6 +-
 package/linux-tools/linux-tool-iio.mk.in      |  6 +-
 package/linux-tools/linux-tool-mm.mk.in       | 10 +--
 package/linux-tools/linux-tool-pci.mk.in      | 12 +--
 package/linux-tools/linux-tool-perf.mk.in     | 27 ++++---
 package/linux-tools/linux-tool-rtla.mk.in     | 10 +--
 .../linux-tools/linux-tool-selftests.mk.in    | 15 ++--
 package/linux-tools/linux-tool-tmon.mk.in     |  8 +-
 package/linux-tools/linux-tool-usbtools.mk.in |  6 +-
 package/linux-tools/linux-tools.mk            | 20 ++++-
 package/lua/5.1.5/0001-root-path.patch        | 24 +++---
 package/lua/5.3.6/0001-root-path.patch        | 15 +++-
 package/lua/5.4.9/0001-root-path.patch        | 11 ++-
 package/lua/lua.mk                            | 18 ++++-
 package/ncftp/ncftp.mk                        |  2 +-
 .../omniorb/0002-optional-appl-services.patch | 29 +++++++
 package/omniorb/omniorb.mk                    | 26 +++----
 package/pciutils/pciutils.mk                  |  2 +-
 ...gure-keep-_GNU_SOURCE-in-build-flags.patch |  0
 package/perl/perl.mk                          | 11 +--
 package/php/php.mk                            |  2 +-
 package/pkg-autotools.mk                      | 28 +++----
 package/pkg-cargo.mk                          |  8 +-
 package/pkg-cmake.mk                          |  8 +-
 package/pkg-generic.mk                        | 77 +++++++++++++------
 package/pkg-hare.mk                           |  8 +-
 package/pkg-kconfig.mk                        | 48 ++++++------
 package/pkg-luarocks.mk                       | 10 +--
 package/pkg-meson.mk                          | 26 +++----
 package/pkg-perl.mk                           | 12 +--
 package/pkg-waf.mk                            |  8 +-
 .../xdriver_xf86-video-imx.mk                 |  2 +-
 support/scripts/symlink-tree                  | 58 ++++++++++++++
 56 files changed, 471 insertions(+), 241 deletions(-)
 create mode 100644 package/omniorb/0002-optional-appl-services.patch
 rename package/perl/{perl-cross => }/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch (100%)
 create mode 100755 support/scripts/symlink-tree

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
