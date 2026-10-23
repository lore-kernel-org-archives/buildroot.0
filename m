Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YaqTEHmc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3FD608FE;
	Fri, 23 Oct 2026 21:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ERPdb8omj9m; Fri, 23 Oct 2026 21:48:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2448360A66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792103;
	b=Xf+w0I//I51Ckg+pt9R80CKtQQ5Bd585636tqdlrJz+LLcFb+joatdeHRCUj2Y5g2sKN
	 Dt+/R2sa2XZeF2YAjulivphwwIxzYNknfXfcxamov5LZ9D4ZXbUKJIzuFOFiGclJLIH1J
	 7oGbuuCI+fOjyIMh1+MolrHwUhWjmukJ6cmtQyuC02ZHkESysFOR/Yi4Inag+1BG9kzAs
	 sSQ5XjKEfHYOiDsySygdHxU+09bC+bCyioDsgLxmSao38IM1QHGkhVKMCAubuXGevTBtP
	 ry2B8REckTz1btYLo70aBwDcWELfELTu9FEylyz62KgmPmlihCldGP9d5eNZLhcYpQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792103;
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
	bh=XCriX1ICpdKWPdmXamD/VAbQg9SdryL7fJ38JQ2FpmU=;
	b=smTxM7/kngCa3ODbyoIhdbJHE6I3iQzG5pGbH7btyRo3JQKoXWxdaRvIv2QoAspFB5+z
	 +X5eH3/rovHLPzqdfAQO6j9alEXLKycCkvtAEH2todZysO2cByP+QLho2zf6Gf0XAtAEO
	 9/woL+z3MhBPcqjsU680JlfyMI33gjKVqFtCGxFxXC80wqKuEGGQwh6DSEBGUFqRa4Jf1
	 by9Y4gH4XulgQGQQsSfHxqresi9Zwoyalne5QaJHhPVdiTKbLd5IDnAXdreOA8eh1/JhS
	 CXmVg6Sk+P/OPyVLgSlhg4cvo0minJiVMQ9mKBTQEnAhg/Muq+GjqU/4O4VFN9zoWZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792103;
	bh=XCriX1ICpdKWPdmXamD/VAbQg9SdryL7fJ38JQ2FpmU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YaqTEHmcihk5xe5TKzITPJ4tgHCN92gv/6udJBFO9Ik1O3H+KNmMQhegY8/j+RyNd
	 JZ9Hcg+UWwj9rnCx6cR/Piild0KNjBtKfDgEx+jB+CosuKOZmAhsZMlN9MP9Vjalqo
	 LX7dd0O1lsk+SyQL5IepMPQUb3zQKa2ILDEB6Q50CMxhHRVmOejp41KVYj8w4vcSJV
	 PGGA2FdDGojWMEE0DZmnGQZ9h7goKxezhMeHO+kSehEYvWQEHFvU4ED9P8fYoLvQX/
	 WgcjrVpbdLb5XXDWtqOtF0ti03EGmhCpSSUbYoZpnq217K7F2peth9A7K3D8hxo64J
	 6jloFoOpLrEWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2448360A66;
	Fri, 23 Oct 2026 21:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8816679F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79D24404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ovURNDC0HSf for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DD3E140488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792100;
 b=U13ce3nyS1eLZfOQHoAl+J6BbPZCw6txN2vfHPIbozdhAp5k3ntzm5jbYp+/usWJ+Wer
 JPTLHKdescQBf5ExkjJk7KGgQ/0JpvaZMsHJZy+TXRl1N2Qx9hPuDSHRPKY32L4ej+bfz
 c3Ql52unRuXZMSw4T9lVzJePFJTgbUlMfwCHZ6jD1p7O59CHCz/tWUq9bQCFeXI0EVqpD
 AliK2NWvpj3J2X+lEOjWSaJS9En63Cq3gHm20FSsGzLnnsXYK/WoDPl9TmHxV+6Nf89c/
 rI7ilPqNwjtg5vUGES/FsgbcxpyCOODLCChx50v9CxVrDQ+AbkU8w5i3+WCtMQTiC4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792100;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=Fd4xNqlkDf052L3kzI4MxQi6qs26qm70wF5qUN/hUwY=;
 b=IpyDXDgoh6rYqmvh6XU/RDkcTCpcKkVPSQoBh+S73Ux6SePebV//ZDrNGW1vioOyn+Fk
 Acz/PI6GWmoOK0UHJ0P2O+aDiy3jZKaEBVxV66g5JKUk5Kh2g/apAIaoXSee3WStFHauT
 i2FNo9jPSzUFM85gqpWS0aOGjRma6NSyvnPGyMuFI+704fqs7wikA3Q09DgKeJfJNGMeq
 J5VFif6yJheP5p08cHNHoOvmu3/NbdVOY3ugUTngJvGUrKvCINhNigegz7vEf8IGkLCAA
 uG/TuGx2ZXXp7X3hSyYt1+VHcUHL9gaULYuEriqpwL+JzE9pGFx1cJ9T6l/AB0khPLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="I/ZBUuYH"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::662"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::662; helo=mail-pl1-x662.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x662.google.com (mail-pl1-x662.google.com
 [IPv6:2607:f8b0:4864:20::662])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD3E140488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:19 +0000 (UTC)
Received: by mail-pl1-x662.google.com with SMTP id
 d9443c01a7336-2e987b4a710so12716675ad.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792098; x=1793396898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Fd4xNqlkDf052L3kzI4MxQi6qs26qm70wF5qUN/hUwY=;
 b=0EbWxLvtTUjBTFuXs18DGODdJOQoVoStN4AorrHRd5DMQvFw9UMBRDkkKiLGP1lr2F
 FKdPS59sC9t95PsbAgOwbWIiZ1wUqsHyQb+PHq5Zc4rsK5dCu/dAmgcn1SeC8DRluCVl
 5lQ2pn82853A9ptWtgICkTCpdSOV+fo86Y+D19MVPkpjLzxvZ5Nv6H3cp5ARfhLZ3dLJ
 PQWorRlZLnk5TIzhnU3LlXJXb3a72mptatH7QOjrX3PaUwA3WaYgqmfoXMmWc2KHUKU6
 HEs0fq5NeV3j3r4k1jciE2ecIg5yUN6E4DJ0aTqQMSf/+GyoiP7L4f2XT9ONxmnVw+bt
 d5pA==
X-Gm-Message-State: AFq9FYLLUgazt/Ug2fxvy7ysKBe8mRy0xDIRN4lHf/5mBcxc0ijQt58E
 MXtVcC33Y4r0jECDfbQEYp/HGujvS3yUya/OHRRapLncW1XadSBLIm1Wi6Se9gvGiRYHZrnsKKY
 s7rZhwMeNrKg914Lw2t+slBd+VQm/qQRDN2w55ul4cFgabJRQps5FAPIuSD7Ue+ftBOy9AKpL5D
 8S9pCHLfez+nce4IjirndMzxdEf9ydg3Sob/AQjrGHQVQYM2kzJyKr2oCxGfI1OuSQEWnZcOdaZ
 ArtRp2fgcBVceRl9TDU
X-Gm-Gg: AYBFou0MYnOgNCQcHkz7Ys/YWvPjEgWmbZZEdfgIM6eGxE3YZFShzOyWclKWPcMrBoF
 092XD0YKXIvM/KIgErosJuPjL0/TYzsccf4O2bz3HyNwUI/TnhgGYPsBZDhsiz7WgxFASfcg6Ss
 ABSg5u08NQtKqbHmBWTdkFHTAGUKY2h4s3hU2zHm91plWM3G5dCFASwGoZfhO159SBE+ubVU+Yn
 mCVNMusfgLwWo2A1AwbMYqZVLjtCd9RkR6SIe/+p1sOwgoiOAL7VYu8I6zkmO/UkfhIZDI4DnSp
 HSOR3HKl1yOhWI2a48cRpIaU4L3lhaYFVeXanCMQUAVuqNyPCYymT3UqSRCSMTQ1pLvkq83W8d/
 XYtEHWEOBrNzWEinELz8YMBXz2tl4CFQAsRB2ksmskOvJHXivmjb2hk0Ta03uumMzXepNPiWdX5
 e2+SqkFymMmfsByQiM6MBAQbn6hdQOOURSjhmmfFB+zUw=
X-Received: by 2002:a17:90b:4a52:b0:3a7:9ec3:ea0e with SMTP id
 98e67ed59e1d1-3adeb5a58e3mr281136a91.22.1792792098440; 
 Fri, 23 Oct 2026 14:48:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adeba44b2fsm149926a91.1.2026.10.23.14.48.17
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f37c94ceeso486101785a.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:2e81:2217 with SMTP id
 af79cd13be357-940ef9cf423mr48625085a.36.1792792097029; 
 Fri, 23 Oct 2026 14:48:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:2e81:2217 with SMTP id
 af79cd13be357-940ef9cf423mr48620385a.36.1792792096345; 
 Fri, 23 Oct 2026 14:48:16 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:44 -0700
Message-Id: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 00/23] Support building the Linux kernel out of
 tree with LINUX_OVERRIDE_SRCDIR
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

This series lets a package that is built from an OVERRIDE_SRCDIR be built
out of tree, i.e. without rsync'ing its sources into output/build/<pkg>-custom/,
and enables it for the Linux kernel.

For a large source tree such as the kernel, the rsync step is slow, doubles
the disk usage, and leaves the developer's tree and the build directory out
of sync. With this series, with LINUX_OVERRIDE_SRCDIR set, the kernel is
configured and built with O=output/build/linux-custom and the sources in
the overridden directory are never written to.

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
  - add <pkg>_SUPPORTS_OUT_OF_TREE. When it is YES and <pkg>_OVERRIDE_SRCDIR
    is set, the rsync step is skipped, the stamp files go in the build
    directory and kconfig is called with -C $(SRCDIR) O=$(BUILDDIR);
  - opt linux in, in the same patch. Kbuild requires a clean source tree
    for O=: a tree with a stale .config, include/config or
    arch/*/include/generated is rejected by kbuild itself.

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
    sources. For an out-of-tree build, linux is then built from a "shadow"
    tree: real directories whose files are symbolic links to the original
    tree, created by the new support/scripts/symlink-tree. Files are
    replaced rather than written through the links, so the overridden
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

  - Only linux opts in. Other packages are unchanged and still rsync.
    A package opts in with <pkg>_SUPPORTS_OUT_OF_TREE = YES.
  - The "hooks sanity check" and "host inherits the target hooks" patches
    of the original series are not included: they do not work with the
    infras that register per-name hooks (e.g. golang).
  - The Python 2 and asterisk patches of the original series are dropped:
    those packages are gone or no longer need them.

Testing
=======

All of the following build and, where noted, boot, with the series
applied on top of master (fd9c348c227e):

  - raspberrypi4_64_defconfig, stock (in-tree kernel);
  - raspberrypi4_64_defconfig with the Raspberry Pi kernel built out of tree
    through LINUX_OVERRIDE_SRCDIR: the Image differs from the in-tree one
    only by the embedded build timestamp, the dtbs are identical;
  - qemu_x86_64 and qemu_arm_vexpress, stock, and with an out-of-tree
    kernel; the out-of-tree ones boot to a login prompt in QEMU;
  - a wide package set on arm64 (autotools, cmake, meson, perl, python,
    cargo, golang, waf, luarocks, hare, kernel modules, asterisk, ffmpeg,
    libvpx, u-boot, and the linux-tools gpio, iio, perf, pci, cpupower,
    rtla, tmon, mm, usbtools), both with an in-tree and an out-of-tree
    kernel: the content of target/ is identical;
  - a custom logo and a custom device tree file with a #include, out of
    tree, with the overridden tree left unmodified;
  - the same package set in the Buildroot CI docker image, offline;
  - every patch of the series builds, tested on a small package set.

Known issues, not caused by this series and identical with and without it:
xtables-addons does not build with the Raspberry Pi 6.12 kernel, and
some linux-tools selftests (mm) fail to link. I have not tested the
selftests in the docker image, as the container has no python yaml.

Not tested: the other kernel extensions (rtai, xenomai), which are
adapted but not built, and booting on real hardware.

Changes
=======

This is the first version.

Regards,
Florian

Florian Fainelli (6):
  package: use <pkg>_SRCSUBDIR where <pkg>_SRCDIR used to include
    _SUBDIR
  linux: build out of tree when LINUX_OVERRIDE_SRCDIR is set
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

 Makefile                                      |  1 +
 .../boot-wrapper-aarch64.mk                   |  8 +-
 boot/mxs-bootlets/mxs-bootlets.mk             |  6 +-
 docs/manual/adding-packages-generic.adoc      | 11 +++
 docs/manual/using-buildroot-development.adoc  | 30 ++++++++
 linux/linux-ext-rtai.mk                       |  8 +-
 linux/linux-ext-xenomai.mk                    |  4 +-
 linux/linux.mk                                | 40 ++++++++--
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
 package/linux-tools/linux-tool-perf.mk.in     | 29 +++++---
 package/linux-tools/linux-tool-rtla.mk.in     | 10 +--
 .../linux-tools/linux-tool-selftests.mk.in    | 15 ++--
 package/linux-tools/linux-tool-tmon.mk.in     |  8 +-
 package/linux-tools/linux-tool-usbtools.mk.in |  6 +-
 package/linux-tools/linux-tools.mk            | 20 ++++-
 package/lua/lua.mk                            |  9 ++-
 package/ncftp/ncftp.mk                        |  2 +-
 .../omniorb/0002-optional-appl-services.patch | 29 ++++++++
 package/omniorb/omniorb.mk                    | 26 +++----
 package/pciutils/pciutils.mk                  |  2 +-
 package/perl/perl.mk                          |  2 +
 package/php/php.mk                            |  2 +-
 package/pkg-autotools.mk                      | 28 +++----
 package/pkg-cargo.mk                          |  8 +-
 package/pkg-cmake.mk                          |  8 +-
 package/pkg-generic.mk                        | 74 ++++++++++++-------
 package/pkg-hare.mk                           |  8 +-
 package/pkg-kconfig.mk                        | 48 ++++++------
 package/pkg-luarocks.mk                       | 10 +--
 package/pkg-meson.mk                          | 26 +++----
 package/pkg-perl.mk                           | 12 +--
 package/pkg-waf.mk                            |  8 +-
 .../xdriver_xf86-video-imx.mk                 |  2 +-
 support/scripts/symlink-tree                  | 58 +++++++++++++++
 52 files changed, 422 insertions(+), 209 deletions(-)
 create mode 100644 package/omniorb/0002-optional-appl-services.patch
 create mode 100755 support/scripts/symlink-tree

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
