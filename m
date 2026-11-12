Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D308606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WdAIGidl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyjYsgM3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED142811F2;
	Thu, 12 Nov 2026 10:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfTrx342wtII; Thu, 12 Nov 2026 10:17:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 49158811F8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794478671;
	b=QmuXg7Ss72ImSA9OVSV/BDrnTrV6iAHLZJ/t+/VbIJ/Rhpqwr3ONNhr6oZxM8owx8TZe
	 r1D5kWKBcHWDoeRsiVG6PYn74e+Z1hJshm0p6KFhaY1nM6Pa3kjMxwBzQRbAiaDcOUq+b
	 kiltQlmCyNbTl3/niwBSoaiYvxYujCy4iJiw7T3GiO6QuWM4zc/ap9WmBdgtZWMPPwDWO
	 cLxB0SDmHy3fqkcehdxrDbh433D7pnY8TnRr71YIGspdnPS8TW5baUvZ8fy0SicVFPN/A
	 6Is8Nvq9spAQ+hMaJGtufpcipCu+KgiXCiWhIAxpIkTESefAQbS064Xsi2KhJN57jpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794478671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3Ql3rHIp+oOYS9IVYYPi5JwYG9digMjqaCgMB5/34kA=;
	b=T9gAxFULXzQ/HGL5K/KB7RcoHx8J3C28Wm5eoJ2EY+vqnmH+AFfuLZxCCdyTiWOC6SSI
	 lb7e2ver+d8H+TRs2M1itCo7/q4Xd9vDJWi5whQ1tQXJ+d3UEIm+fg2A5RhEV/xoB5/b3
	 nJEkaNxP/uvpBtyhyLSCZOTYW6sCI0ZNUtrjh1qaI+GJ338XbKm1T1jNL8Gki1vUTsKPo
	 s33LYn8PqIjPsCCI3L4LKsC1yxedrl84NEbX0KqO21+1GuZJiEOuYjkqk30Hkgvmth09Z
	 SNdpcWpC13/5YU9WZFrW9DTwu00DFcfNPHBR+pZdpCGLXqPWfPcEWR9yqGTHs4EUt6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794478671;
	bh=3Ql3rHIp+oOYS9IVYYPi5JwYG9digMjqaCgMB5/34kA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WdAIGidly/nQ7GVrwmBUwBZ0BFCEfe070QX2qs4OecNzowlW+krnTH4xQNKoLIj97
	 +qSyIX8+9Dw7LgC1GQoCWbq5OmReNKYcZJ+8FzsOe4thdYyIlUR7Rjlrnf3Yzvw06p
	 xAtlVJg1XOdBHFfA4LdsXJ047LUo1C1X9gppkpZojxaFGTDTLzc2buk7N9Wkd/0pL7
	 2ZoPIrOyv6ttON6wgYidEX6SeVluPpHGlqn84J4fdN4biRZ1a71VWi04JCETPcVK1p
	 4lOrJNS+FCjXdZrI4NRHR+Fu+A8zzDJVLXuKdd+lNvt4Jk20cO5zZqyI5zUO+LPVTu
	 l6//b2rnj9pGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49158811F8;
	Thu, 12 Nov 2026 10:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C841E335
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C7860615
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEHGonHKv5lh for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 10:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB3F56075F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=vyjYsgM3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB3F56075F
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:17:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so45249725e9.1
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794478665; x=1795083465; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YHNVUmULSeQo+VFbPl8tsNcJDeg9XEHpsqeHn3gCC2Q=;
 b=vyjYsgM3V7SA7eWZv1WhASwqYeT89mqsa20o+dMAaj6x8bDEUAm5OZtexQnt8dGN2d
 QcB/ei6ZGIEdMh58ZUU9Th1r4QY2n0hv59txEqIlkc/7PG9kCSDISESm4fAgCiQiOxIW
 ZrXxkmePagU7m7Qh4+VrKNjUtM8JQ7kMFoizuGrywbM2YQyiZqRQg3HOxmGiUr8q/+Nm
 omJI+ZFsxFp5cyJkjR8dM0WcCRCEzhq2IFFVMLzSk4+SR+wEzu6oM7+sQ3D+4SGW461d
 pi3fZy5MuptyE5gb6ViioG/S2uTGJP1fH7ApmNHEH12jb2R8IRCrKmMXERsxfKHOIXV+
 Y7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794478665; x=1795083465;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YHNVUmULSeQo+VFbPl8tsNcJDeg9XEHpsqeHn3gCC2Q=;
 b=xOhcy9pNrRGHwN2S9a5t2c84Dyk3JDaErrF0SRKmX1/anb1fcG8lvAscA5xR/rlaCw
 06GOEowtfgCSBV36cLOfpq4DSuH2oEP8E1n0KqF/NMKvahBs/eUM2eI/hzoW6l8+VvMD
 XVH1uWxthQbucjWickYtYQN7Q/kJMhBo+gWWuu0Vcgsn7fuZPRw2Ug0e+mbPyHqJyLqy
 1rDofuByS9af5HQZZqucIx2vAtHwLvA47/fRQkod+WLdKvsxjJ5smlb1v0xitHyipwjQ
 3O1xjcSFUG1IinUDn+faeQgq8iLjDqzOPiH2xI/rMjMah0DM6Y57yX+siw7YEBnoh1af
 eHkg==
X-Gm-Message-State: APuU4Z9mbO9led/AeTNnrpBJqyuoYTrTYO6XmHCd0WX7QWpgyX6NRZJq
 ocAEnPDZAmNRyhhUOUbyjmKQtWNRC4sUvQuXUnSQoCWqrlxRKx5ObtzxM6/MgQ==
X-Gm-Gg: AYBFou2c3yKahH/A4OSHmvZd8z8eeP6Tv+lPyxyQ65NW8gFTz9e8jsN9C3vdJVKUV1j
 hHGNIWNvTCVIveJQ/aASvVcY7KoWzDFZVPXs16L7NuesopKeQ75Q10Geo4JJ5m9Cp65ATvxP2Ge
 gdmG3t05WoF6f36JoBbaNYRQ/tJZoHbMHGQAiUhdyk0vWKFZpw7TyNwH3T4EQ2vooV9hrVNpkqI
 agV2LAehmNUmU+D7evnTbiECt7x8s3B2tV2N4WNvVz+b4Vg5TKHqCtcBz+NPMfN+pkJ/3kOi94E
 2JNUhfCZ21+9x9Q6Orb0oLZ984ZMbwWrrUze4GEYddrI1Um5fVGJmItVSwhgKk/Q0kEWUXIWVG7
 vVNaa1Fugco+jG/w82ssB6egl4cS5VLgFnLzcSo8fDSMJxT2ASKeEwikvRGEQULgxj0EulDQi2u
 msFLei+0Hljz4Qef6cW+UgqzvJUYRYkClew6pRs3o/qk7MRMD9f2A5TnlURhFMNh5nl3hDzD9RZ
 vzXcRLqweyrMPgaOUDMqiXniL2mmvTUkJYfBMSmr4xZ1B+0X/cjfy23RLovLWyPG/Slh1HMV5EA
 E8xrvC4EuX0pixSg4LC+iSEZkrqBa4TTvlw8DzlLTsIkw3emnNSYW2zow+F9A9jp7HeUJaIkbvj
 mkLQBUSFBu3F/7EPp7yhXetJZ6GYEo3L0YfoHLwFSPok=
X-Received: by 2002:a05:600c:828f:b0:4a1:fa33:441a with SMTP id
 5b1f17b1804b1-4ba0931d88bmr104923845e9.2.1794478665099; 
 Thu, 12 Nov 2026 02:17:45 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2adf53sm58508755e9.15.2026.11.12.02.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 02:17:44 -0800 (PST)
Date: Thu, 12 Nov 2026 11:17:43 +0100
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <avWSR9xikrw3Gu0u@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [RFC PATCH] configs/lx2160a-rdb: bump TF-A and generate
 SRK keys at build time
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump TF-A to 9799b799fb51, which brings the LX2160A fixes needed to
build the secure boot images (e.g. "fix(lx2160): build fip and
fip_ddr safely with -jN"), and add the TF-A change "feat(layerscape):
generate SRK keys at build time", not merged yet, so that TF-A
generates a development SRK key pair when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT_KEYS_DIR is empty.

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54235

Signed-off-by: Leo Denieul <leo.denieul.yoshino@gmail.com>
---
This patch applies on top of the series:
  [PATCH 0/2] NXP Layerscape secure boot support for TF-A
https://lists.buildroot.org/pipermail/buildroot/2026-November/816615.html
which depends on:
  [PATCH v8] lx2160a-rdb series (board/lx2160ardb: new platform, ...)
https://lists.buildroot.org/pipermail/buildroot/2026-November/816061.html
  [PATCH v6] package/qoriq-cst: new package
https://lists.buildroot.org/pipermail/buildroot/2026-November/815882.html
 ...cape-generate-SRK-keys-at-build-time.patch | 305 ++++++++++++++++++
 .../arm-trusted-firmware.hash                 |   2 +-
 board/freescale/lx2160a-rdb/readme.txt        |   2 +-
 configs/lx2160a-rdb_defconfig                 |   2 +-
 4 files changed, 308 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/0001-feat-layerscape-generate-SRK-keys-at-build-time.patch

diff --git a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/0001-feat-layerscape-generate-SRK-keys-at-build-time.patch b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/0001-feat-layerscape-generate-SRK-keys-at-build-time.patch
new file mode 100644
index 0000000000..0fc8081e13
--- /dev/null
+++ b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/0001-feat-layerscape-generate-SRK-keys-at-build-time.patch
@@ -0,0 +1,305 @@
+From cb3b335a22aa404c4ef774de632147b8b0cf2bd5 Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Tue, 8 Sep 2026 22:33:51 +0200
+Subject: [PATCH] feat(layerscape): generate SRK keys at build time
+
+Let's try to follow the X.509 flow: the CSF signing flow is missing a
+mean to generate an SRK key pair with the CST gen_keys tool.
+The X.509 flow already generates its ROT key in the build directory
+when CREATE_KEYS=1.
+
+It applies to both chains of trust, because BL2 and the PBI are signed
+with CST in the X.509 flow as well. The build cases that do not sign
+anything are not changed.
+
+Examples, with only CST:
+
+  make PLAT=lx2160ardb TRUSTED_BOARD_BOOT=1 CST_DIR=~/cst \
+       BOOT_MODE=flexspi_nor RCW=rcw_flexspi_nor.bin BL33=u-boot.bin \
+       pbl fip
+  make PLAT=lx2160ardb TRUSTED_BOARD_BOOT=1 CST_DIR=~/cst \
+       BOOT_MODE=flexspi_nor DDR_PHY_BIN_PATH=ddr-phy-binary/lx2160a \
+       fip_ddr
+
+The first make signs bl2_flexspi_nor_sec.pbl, BL31.bin.cst and
+BL33.bin.cst with the generated pair, the second one reuses it for the
+DDR firmware. To sign with the production keys instead, you can use:
+
+  make ... SRK_PRI_KEY=/keys/srk.pri SRK_PUB_KEY=/keys/srk.pub pbl fip
+
+For comparison, the X.509 chain of trust on the same board becomes
+symmetrical:
+
+  make PLAT=lx2160ardb TRUSTED_BOARD_BOOT=1 CST_DIR=~/cst \
+       NXP_TBBR_USE_X509=1 GENERATE_COT=1 \
+       BOOT_MODE=flexspi_nor RCW=rcw_flexspi_nor.bin BL33=u-boot.bin \
+       pbl fip
+
+The PBL is CSF-signed as above, while BL31 and BL33 are covered by the
+X.509 certificates instead of using CSF headers.
+
+Behaviour change:
+
+a TRUSTED_BOARD_BOOT=1 CSF build used to fail when srk.pri and srk.pub
+were missing because CST could not find them.
+It does now succeed with a generated development pair, because
+CREATE_KEYS is 1 by default, but with the message:
+
+  WARNING: generated a development SRK key pair (...), not for production images
+
+so an image signed with a throw-away key cannot be used wrongly for a
+properly signed one in a build log.
+
+CREATE_KEYS=0 enforces the former failure.
+
+The key pair is always handled as a pair:
+  SRK_PRI_KEY and SRK_PUB_KEY
+must be provided together, srk.pri and srk.pub must both be present,
+and a pair with one file missing is an error.
+
+Change-Id: Iae88126d12aa55ae4b2b45a8a040f3834a36cc93
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Signed-off-by: Leo Denieul <leo.denieul.yoshino@gmail.com>
+Upstream: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54235
+---
+ docs/plat/nxp/nxp-ls-tbbr.rst                | 37 +++++++++--
+ drivers/nxp/auth/csf_hdr_parser/csf_hdr.mk   |  8 +--
+ plat/nxp/common/fip_handler/fuse_fip/fuse.mk |  4 +-
+ plat/nxp/common/tbbr/tbbr.mk                 | 66 ++++++++++++++++++--
+ plat/nxp/soc-lx2160a/ddr_sb.mk               |  6 +-
+ 5 files changed, 98 insertions(+), 23 deletions(-)
+
+diff --git a/docs/plat/nxp/nxp-ls-tbbr.rst b/docs/plat/nxp/nxp-ls-tbbr.rst
+index d185b14c1..5db483823 100644
+--- a/docs/plat/nxp/nxp-ls-tbbr.rst
++++ b/docs/plat/nxp/nxp-ls-tbbr.rst
+@@ -35,6 +35,34 @@ Refer fuse frovisioning readme 'nxp-ls-fuse-prov.rst' for steps to blow these ke
+ 
+ 
+ 
++SRK key pair used by CST
++========================
++The Code Signing Tool (CST) signs the CSF headers with an RSA key pair, the
++SRK (Super Root Key), whose public key hash is the SRKH burnt in fuses. The
++build checks it with the order:
++
++- ``SRK_PRI_KEY`` and ``SRK_PUB_KEY`` on the make command line (both must be
++  given),
++- otherwise ``srk.pri`` and ``srk.pub`` in the current directory, if both are
++  present,
++- otherwise, when ``CREATE_KEYS=1`` (the default), a throw-away key pair of
++  ``SRK_KEY_SIZE`` bits (default 2048) is generated in the build directory
++  with the ``gen_keys`` tool of CST, as the X.509 flow does for its ROT key,
++  and the build prints ``WARNING: generated a development SRK key pair``.
++  With ``CREATE_KEYS=0`` the build fails if the keys are missing.
++
++A pair with one file missing is an error in every case: the build never
++regenerates a key over the remaining one.
++
++The CST input files are generated in ``$(BUILD_PLAT)/cst`` from the
++templates ``drivers/nxp/auth/csf_hdr_parser`` and the provided key paths.
++An input file provided on the command line (``BL2_INPUT_FILE``,
++``PBI_INPUT_FILE``, ``BL31_INPUT_FILE``, ...) is used as is.
++
++NOTE: generated keys are only suitable for development, production images must
++be signed with the key pair whose SRKH is fused, passed through ``SRK_PRI_KEY``
++and ``SRK_PUB_KEY``.
++
+ Two options are provided for TRUSTED_BOARD_BOOT:
+ ================================================
+ 
+@@ -95,12 +123,9 @@ Option 2: CoT using NXP CSF headers.
+ 
+ - To generate CSF header, path of CST repository needs to be specified as CST_DIR
+ 
+-- Default input files for CSF header generation is added in this repo.
+-
+-- Default input file requires user to generate RSA key pair named
+-  -- srk.pri, and
+-  -- srk.pub, and add them in ATF repo.
+-  -- These keys can be generated using gen_keys tool of CST.
++- Default input files for CSF header generation is added in this repo: they
++  are instantiated in the build directory with the SRK key pair described
++  above.
+ 
+ - To change the input file , user can use the options BL33_INPUT_FILE, BL32_INPUT_FILE, BL31_INPUT_FILE
+ 
+diff --git a/drivers/nxp/auth/csf_hdr_parser/csf_hdr.mk b/drivers/nxp/auth/csf_hdr_parser/csf_hdr.mk
+index 12e22e944..3e86cae21 100644
+--- a/drivers/nxp/auth/csf_hdr_parser/csf_hdr.mk
++++ b/drivers/nxp/auth/csf_hdr_parser/csf_hdr.mk
+@@ -25,7 +25,7 @@ endif
+ 
+ # CST_BL31
+ define CST_BL31_RULE
+-$(1): $(2)
++$(1): $(2) ${BL31_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $$@ $$<"
+ 	$(q)$(CST_DIR)/create_hdr_esbc --in $(2) --out $(1) --app_off ${CSF_HDR_SZ} \
+ 					--app $(2) ${BL31_INPUT_FILE}
+@@ -35,7 +35,7 @@ CST_BL31_SUFFIX := .cst
+ 
+ # CST_BL32
+ define CST_BL32_RULE
+-$(1): $(2)
++$(1): $(2) ${BL32_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $$@ $$<"
+ 	$(q)$(CST_DIR)/create_hdr_esbc --in $(2) --out $(1) --app_off ${CSF_HDR_SZ} \
+ 					--app $(2) ${BL32_INPUT_FILE}
+@@ -45,7 +45,7 @@ CST_BL32_SUFFIX := .cst
+ 
+ # CST_BL33
+ define CST_BL33_RULE
+-$(1): $(2)
++$(1): $(2) ${BL33_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $$@ $$<"
+ 	$(q)$(CST_DIR)/create_hdr_esbc --in $(2) --out $(1) --app_off ${CSF_HDR_SZ} \
+ 					--app $(2) ${BL33_INPUT_FILE}
+@@ -55,7 +55,7 @@ CST_BL33_SUFFIX := .cst
+ 
+ # CST_SCP_BL2
+ define CST_SCP_BL2_RULE
+-$(1): $(2)
++$(1): $(2) ${FUSE_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $$@ $$<"
+ 	$(q)$(CST_DIR)/create_hdr_esbc --in $(2) --out $(1) --app_off ${CSF_HDR_SZ} \
+ 					--app $(2) ${FUSE_INPUT_FILE}
+diff --git a/plat/nxp/common/fip_handler/fuse_fip/fuse.mk b/plat/nxp/common/fip_handler/fuse_fip/fuse.mk
+index 48e968d4b..697fd7820 100644
+--- a/plat/nxp/common/fip_handler/fuse_fip/fuse.mk
++++ b/plat/nxp/common/fip_handler/fuse_fip/fuse.mk
+@@ -71,7 +71,7 @@ endif
+ 
+ ifeq (${FUSE_PROV_FILE},)
+ else
+-${BUILD_PLAT}/${FUSE_PROV_FILE_SB}: ${FUSE_PROV_FILE}
++${BUILD_PLAT}/${FUSE_PROV_FILE_SB}: ${FUSE_PROV_FILE} ${FUSE_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $@ $<"
+ 	$(CST_DIR)/create_hdr_esbc --in $< --out $@ --app_off ${CSF_HDR_SZ} \
+ 					--app $< ${FUSE_INPUT_FILE}
+@@ -79,7 +79,7 @@ endif
+ 
+ ifeq (${FUSE_UP_FILE},)
+ else
+-${BUILD_PLAT}/${FUSE_UP_FILE_SB}: ${FUSE_UP_FILE}
++${BUILD_PLAT}/${FUSE_UP_FILE_SB}: ${FUSE_UP_FILE} ${FUSE_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $@ $<"
+ 	$(CST_DIR)/create_hdr_esbc --in $< --out $@ --app_off ${CSF_HDR_SZ} \
+ 					--app $< ${FUSE_INPUT_FILE}
+diff --git a/plat/nxp/common/tbbr/tbbr.mk b/plat/nxp/common/tbbr/tbbr.mk
+index d6966aad1..270d06cfa 100644
+--- a/plat/nxp/common/tbbr/tbbr.mk
++++ b/plat/nxp/common/tbbr/tbbr.mk
+@@ -32,15 +32,65 @@ endif
+ 
+ PLAT_AUTH_PATH		:=  $(PLAT_DRIVERS_PATH)/auth
+ 
++SRK_KEY_SIZE		?=	2048
++
++ifneq (${SRK_PRI_KEY}${SRK_PUB_KEY},)
++    ifeq ($(and ${SRK_PRI_KEY},${SRK_PUB_KEY}),)
++        $(error SRK_PRI_KEY and SRK_PUB_KEY must be set together)
++    endif
++else ifneq ($(wildcard srk.pri srk.pub),)
++    ifneq ($(words $(wildcard srk.pri srk.pub)),2)
++        $(error srk.pri and srk.pub must both be present in the current directory, found only $(wildcard srk.pri srk.pub))
++    endif
++    SRK_PRI_KEY	:=	srk.pri
++    SRK_PUB_KEY	:=	srk.pub
++else
++    SRK_PRI_KEY	:=	${BUILD_PLAT}/srk.pri
++    SRK_PUB_KEY	:=	${BUILD_PLAT}/srk.pub
++endif
++
++${SRK_PRI_KEY} ${SRK_PUB_KEY} &: | $$(@D)/
++	$(s)echo "  GEN_KEYS $(SRK_PUB_KEY)"
++	$(q)if [ -f ${SRK_PRI_KEY} ] || [ -f ${SRK_PUB_KEY} ]; then \
++		echo "SRK key pair incomplete: one of ${SRK_PRI_KEY}," \
++			"${SRK_PUB_KEY} is missing, refusing to regenerate" >&2; \
++		exit 1; \
++	fi
++	$(q)if [ "${CREATE_KEYS}" != "1" ]; then \
++		echo "SRK key pair ${SRK_PRI_KEY} / ${SRK_PUB_KEY} not found" \
++			"and CREATE_KEYS=0" >&2; \
++		exit 1; \
++	fi
++	$(q)${CST_DIR}/gen_keys ${SRK_KEY_SIZE} -k ${SRK_PUB_KEY} \
++		-p ${SRK_PRI_KEY} > /dev/null
++	$(s)echo "WARNING: generated a development SRK key pair" \
++		"(${SRK_PUB_KEY}), not for production images" >&2
++
++CST_INPUT_DIR		:=	${BUILD_PLAT}/cst
++
++define CST_INPUT_RULE
++${CST_INPUT_DIR}/$(1): $(PLAT_AUTH_PATH)/csf_hdr_parser/$(1) \
++		${SRK_PRI_KEY} ${SRK_PUB_KEY} | $$$$(@D)/
++	$(s)echo "  CST_INPUT $$@"
++	$(q)sed -e 's|^PUB_KEY=.*|PUB_KEY=$(abspath ${SRK_PUB_KEY})|' \
++		-e 's|^PRI_KEY=.*|PRI_KEY=$(abspath ${SRK_PRI_KEY})|' $$< > $$@
++endef
++
++$(foreach f,$(sort ${BL2_CSF_FILE} ${PBI_CSF_FILE} ${CSF_FILE}),\
++	$(eval $(call CST_INPUT_RULE,$(f))))
+ 
+ ifeq (${BL2_INPUT_FILE},)
+-    BL2_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${BL2_CSF_FILE}
++    BL2_INPUT_FILE	:= ${CST_INPUT_DIR}/${BL2_CSF_FILE}
+ endif
+ 
++ifneq (${PBI_CSF_FILE},)
+ ifeq (${PBI_INPUT_FILE},)
+-    PBI_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${PBI_CSF_FILE}
++    PBI_INPUT_FILE	:= ${CST_INPUT_DIR}/${PBI_CSF_FILE}
++endif
+ endif
+ 
++pbl: ${BL2_INPUT_FILE} ${PBI_INPUT_FILE}
++
+ # Select X.509 (mbedTLS) vs CSF header flow for NXP.
+ # NXP_TBBR_USE_X509=1 enables X.509; default uses CSF header.
+ ifeq (${NXP_TBBR_USE_X509},1)
+@@ -115,19 +165,23 @@ ifeq (${NXP_TBBR_USE_X509},1)
+ else
+     # Generic image processing filters to prepend CSF header
+     ifeq (${BL33_INPUT_FILE},)
+-    BL33_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${CSF_FILE}
++    BL33_INPUT_FILE	:= ${CST_INPUT_DIR}/${CSF_FILE}
+     endif
+ 
+     ifeq (${BL31_INPUT_FILE},)
+-    BL31_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${CSF_FILE}
++    BL31_INPUT_FILE	:= ${CST_INPUT_DIR}/${CSF_FILE}
+     endif
+ 
+     ifeq (${BL32_INPUT_FILE},)
+-    BL32_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${CSF_FILE}
++    BL32_INPUT_FILE	:= ${CST_INPUT_DIR}/${CSF_FILE}
+     endif
+ 
+     ifeq (${FUSE_INPUT_FILE},)
+-    FUSE_INPUT_FILE	:= $(PLAT_AUTH_PATH)/csf_hdr_parser/${CSF_FILE}
++    FUSE_INPUT_FILE	:= ${CST_INPUT_DIR}/${CSF_FILE}
++    endif
++
++    ifeq (${DDR_INPUT_FILE},)
++    DDR_INPUT_FILE	:= ${CST_INPUT_DIR}/${CSF_FILE}
+     endif
+ 
+     PLAT_INCLUDES	+= -I$(PLAT_DRIVERS_PATH)/sfp
+diff --git a/plat/nxp/soc-lx2160a/ddr_sb.mk b/plat/nxp/soc-lx2160a/ddr_sb.mk
+index fb54aa5cc..2cf32137f 100644
+--- a/plat/nxp/soc-lx2160a/ddr_sb.mk
++++ b/plat/nxp/soc-lx2160a/ddr_sb.mk
+@@ -31,11 +31,7 @@ ifeq (${CST_DIR},)
+   $(error Error: CST_DIR not set)
+ endif
+ 
+-ifeq (${DDR_INPUT_FILE},)
+-DDR_INPUT_FILE:= drivers/nxp/auth/csf_hdr_parser/${CSF_FILE}
+-endif
+-
+-$(UDIMM_DEPS) $(RDIMM_DEPS): %.sb: %
++$(UDIMM_DEPS) $(RDIMM_DEPS): %.sb: % ${DDR_INPUT_FILE}
+ 	$(s)echo " Generating CSF Header for $@ $<"
+ 	$(CST_DIR)/create_hdr_esbc --in $< --out $@ --app_off ${CSF_HDR_SZ} \
+ 					--app $< ${DDR_INPUT_FILE}
diff --git a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 24c30057e3..47c37ba376 100644
--- a/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/lx2160a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
+sha256  c43b8da8ef3fefc38a295a11e60e974f7d34f500ebf14782ca0ce26241cbe8b6  arm-trusted-firmware-9799b799fb51edef36607bcd534b5510aa4156bc-git4.tar.gz
 # From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7:
 sha256  a7e8bcbec0e6f761b4af24f25677626b35f762f68eef79c08677a363212d11f6  mbedtls-3.6.7.tar.bz2
diff --git a/board/freescale/lx2160a-rdb/readme.txt b/board/freescale/lx2160a-rdb/readme.txt
index 90a5964ab1..2ee72542d0 100644
--- a/board/freescale/lx2160a-rdb/readme.txt
+++ b/board/freescale/lx2160a-rdb/readme.txt
@@ -7,7 +7,7 @@ Board, using upstream versions of TF-A, U-Boot and Linux instead of the NXP
 BSP forks used by freescale_lx2160ardb_defconfig.
 
 The upstream components are:
-  - arm-trusted-firmware, v2.15.0
+  - arm-trusted-firmware, 9799b799fb51edef36607bcd534b5510aa4156bc
   - uboot, 2026.10 (lx2160ardb_tfa_defconfig)
   - linux, 6.18.60 (arm64 defconfig, fsl-lx2160a-rdb.dtb)
 
diff --git a/configs/lx2160a-rdb_defconfig b/configs/lx2160a-rdb_defconfig
index c261ade4af..616c233231 100644
--- a/configs/lx2160a-rdb_defconfig
+++ b/configs/lx2160a-rdb_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="9799b799fb51edef36607bcd534b5510aa4156bc"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="lx2160ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
