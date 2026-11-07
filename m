Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0F606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OYuatIWf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDz8fJb0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4EB84070F;
	Sat,  7 Nov 2026 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lp0t69pKjeDC; Sat,  7 Nov 2026 16:34:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2946940748
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069293;
	b=koqEQiHGFO0u93sDdSTQz4zhQ869Pht+NGS51SP0qzoR++rX8VUb8Z2WhSvbXs4hgdR/
	 rfzVvDWFlLBbP/d+SZCoAxqWzEFjYXaWDlGyPMzgHgssqBZhkPEjC7SZab1Po4VQ/4e2k
	 DwZy4CXGSSZblK5baHaHYxs+teDuf7nOPZs/Ny0hnjcwWo20RW4H/Ootm2e6qqL6c+7fL
	 Be4G2ZZ90e8xDQYPVq8b3yG7TCFOgzkael8T8x0Sy/vyYSefLB06227jofXPYgWAdjeQb
	 51UTHwKCw1hExHSCExjsA/TUdN1QoDE8l55n7lnztU60kE++z3kNr1tXteejg/bs8lQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yNp/wG1Syhu/HMHsmm0gczMhgBH8ly/IH30G5+6ophI=;
	b=pcjdHojMyfcnrzk97EhKeyZe0QEPnqGNE9iIWVDQPgbdPP0DknGx9GVA8PrGf0cT5/yP
	 f9Kye7z9/2bhTdMnxgWi210mOcz6wa+GxI2BsgGBO1TZ1NyXQVZxSOCCS7RARe5mGgG5r
	 YDqdEMhXr6bjpa5xMMOqzcfWrDuoE7pmpW2LPDAt5DSWkMmz2up0LpgQpF+riqxVgLICp
	 zRDrBm+IMzSMU2ranqeW6hPDitOym0sOn8Mn9/nKuMrwXNJuvvavf5xT+v6jL3oieEQKN
	 ID1YoiyZ3NC574gbDx9xLdH+2TwHuZcfw5mA9j9Jb1lJ5T/R5lyhTUBMx2aUqPfBpQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069293;
	bh=yNp/wG1Syhu/HMHsmm0gczMhgBH8ly/IH30G5+6ophI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OYuatIWfYO54b1wV8HsAR4Rng/f96/lDFNWNGqlcw4DImZ3QkdKba57sV3GdTAMfw
	 pSshL/nwuybpslHK+QqtP8LeLaiwUUdpTFupjh/EGVzbnvyJ23/Q/auK0p84IqYJBB
	 fVc4R2XPAOFOAkl/fMRiBtyBooQODfPS9YNF46bZJuZrADYE3RIF+iUG0nCPtAlgJU
	 Ic68lx/Q3+yCgmDe48IEvburzb8mNXjOmdRXaoTJrVw0UY7zbMdaiiNH+vdsTOI8Ue
	 vdoX/kOv0b+iU7jZ8VDKRS2+1Y5IBgT30DstcpgKHAIe9iYvB273jhWqA5pFdl2BF7
	 zovhF3dX7kkTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2946940748;
	Sat,  7 Nov 2026 16:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9F1A64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14F5E811BF
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSPYOyFQMTQN for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8021E81149
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=SDz8fJb0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8021E81149
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-490a0e72588so797978f8f.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069287; x=1794674087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/kMWCTfUV4fgE6j99pNDvcnyHzSplqvBDPUW0GHzVkc=;
 b=SDz8fJb0ZLLjoUdTXLVROVm5dpNEekGIOWDvaKCwWdroOafK9bUJc2qt5vD7EwxmHI
 c1YURIwAZrlnaBNUY7MUEluHHe9kt9pcWBJqny+1Jfx/asuAmCOBaSZZD95oQHhWxmJt
 FzwZTX7zTIQhqQ/j/E0YWnPxawAVYJECNhsWSr3JlMuH7bnvDsPe5VdEIzCarM/aBM2+
 xeJHTzWCUvIs6ux6dAZfRu6hBVNthwdcDt0WgV55kIK70FjbGyFJ7Nk0INlGLjQ9ZvXl
 NMTPp+uk92MJZ8BwuYmXnjNYSIJ4gESNQeD0FolwNP5YWYdtX3sKAjGlhyhMmjKp8P5n
 +lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069287; x=1794674087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/kMWCTfUV4fgE6j99pNDvcnyHzSplqvBDPUW0GHzVkc=;
 b=B5u67QsoR1n8HBbYtlhLXWM8T7X+Y2TYbW06x4bDRQ8S5GFbB8ZgPSSk2ttztx8xj6
 9sz7/fd52KsnGU8J0cEnP+U9v0BqgALYJG45GgNk7UuKbIz5HDRX+Hz1+sDcMdrzqD1e
 WO2eyguHIfKUuPqpIz9DqzK3+fN6Os8PTmyrS/K+Z4JubQ7oz9h9+bM483+IrOI8uv8I
 oAZLVONjpTPHdDW9QhuF8nBVNLhF9pXPN1h0dp2//z5VMuPzKxrLZXbQDuWJqrd36Dk5
 j43CglzxCp6/FGoi266S+J+bEDmuWEziZJrYRjghUbsJEqkKU8vjFKWsE8PB5ORdoX6s
 ICaA==
X-Gm-Message-State: APuU4Z+jyiwDQS4IY6ZPnzdOPp/E/SyQDwKwvaD2cBv1BEvswWEqxy3q
 JZHGPCUProDl5zPf+0MKZzu5C9YEPMZ4JkfaYCxnlDrQ3tdqN9cPlv0gwUI+veMD
X-Gm-Gg: AYBFou2yyYTE9lcw9GoCmOFFFZHom4/LPURliY9I9bMwF+5pdLM1X744VS0fI40UYPo
 uuQLBj2Zq9RX8ifFnexsSXG42sa52HiMadnOPCw9htMa4bb+MfHYZyl4+2nuda/o064Ey/ouN3r
 QHznIrCoiDWaYeYZZ76HpxG0SQxlod9A99j7TG+AngRjMfPB7slyhFcN7nlY97kC/9KPOTBQqyi
 tJIl6YSpHraJQevzGk+wNDUi/EPm3VG/fexFhYILVjJ5bnn2CEBRTNgzyMPcwvMXRJDwCBRgm6D
 pWZYBP0xqqCFnIwdOdjhPh2z8ZsN42QtzAygvz6DEgFcA4npPIWr/Zp6WkWlNJgfCyryvVMX/9D
 IS93zX3pAZbpcxAVt1LoER/mTPxL9WYG6keFUMIL7qGVupI202C1xQ076hxuwf5bCpqV1ORuz0e
 ZCnjTVkZ8PgWeZGV+zE50nHxhsKKLt4UqbOl3jUhH/8QIFqT9I52g2DpnulzBHN1GC3Mjeis82f
 30Wq1Vo0M3v12uBFFEg2VWKkFdrET0zW/kintnBc6c+j1dx7pYorkASayyPB9WQKYHrO5sohoGt
 OnSeFyz5lHLRyRpOjYxekltnLbNQp0M46YSWNlnAPYBN5IsmjT9u
X-Received: by 2002:a05:600c:6384:b0:4a1:d537:1c8d with SMTP id
 5b1f17b1804b1-4b6dea6a00cmr106804025e9.19.1794069286657; 
 Sat, 07 Nov 2026 08:34:46 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:46 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:13 +0100
Message-ID: <20261107163414.560896-15-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 14/15] utils/check-package: warn about
 symbols not recognized by a package infra
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Francois Perrad <francois.perrad@gadz.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
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

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

For each .mk file, create a list of all symbols defined and compare to
the list of symbols supported by the package infra(s) used in the file.
Also keep track of usage for internal variables, since any variable
suffix can be used as long the variable is use in the file.
Ignore some variables that are defined in one file and used in others,
for instance the variable that holds the path to host tools to be used
in the build of other packages.
Use a small list for the exceptions that don't use a package/rootfs
infra: linux extensions and initramfs.
Also support the special case of _SUBDIR, see below.

In the main script, add support for a check function to return more than
one warning at once.

Create a simple model for the package infras, listing the supported
suffixes for variables for each package infra type.
This file may need updates when new package infras are added or existent
ones are changed.

Add an exception to initramfs, because it changes TARGETS_ROOTFS.
Add an exception to xenomai because it changes LINUX_EXTRA_DOWNLOADS.
Add an exception to luarocks because it changes TARGET_FINALIZE_HOOKS.
Add an exception to toolchain/toolchain.mk because it does not call any
package infra.

The _SUBDIR variable is a tricky one. It *is* declared for the generic
infra package (and all package infras that inherit from the generic
one), but it is really used in certain conditions.
package/pkg-generic.mk uses <pkg>_SUBDIR only to define:
(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
and it also uses <pkg>_SRCDIR only to define:
$(2)_BUILDDIR                   ?= $$($(2)_SRCDIR)
so the generic package infra does not really uses _SUBDIR by itself in
the common scenario.
So The manual entry for the generic infra seems correct in not
mentioning _SUBDIR.
Also any package infra that inherits from the generic one (by calling
inner-generic-package) needs to use one of the three variables in order
to support _SUBDIR: _BUILDDIR, _SRCDIR or _SUBDIR.
That is the case for: autotools (_SRCDIR), cargo (_SRCDIR, _SUBDIR),
cmake (_BUILDDIR, _SRCDIR), luarocks (_SRCDIR, _SUBDIR),
meson (_SRCDIR), perl (_SRCDIR), python (_BUILDDIR), qmake (_BUILDDIR)
and waf (_SRCDIR).
Of course the .mk file for a package using the generic infra can define
this symbol and use it, directly or indirectly, for example, in its
_INSTALL_TARGET_CMDS.
Also any package infra, even the ones that do not use directly any of
the three variables above, can use _SUBDIR when the package uses the
macros KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT or KCONFIG_DISABLE_OPT
declared in package/pkg-utils.mk.

The variables this check finds in the tree are fixed by the previous
patches, except in gcc-final, added to .checkpackageignore: the m68k
ColdFire libgcc fixup hook is registered under a wrong name since
bfcddf0570 ("package/gcc/gcc-final: add a target variant in charge of
target installation"), so it never runs, but fixing it changes the
ColdFire internal toolchain and needs to be tested on its own.

Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v4 (v1 was patch 27/29 of the "warn about symbols not
recognized by a package infra" series, now sent together with the
"support inline flags" series, v3):
  - rebase on current master: print_warnings() in utils/check-package
    now also handles the expected failures of the ignore list;
  - add the suffixes added to the package infras since v1, which
    gave about 240 false positives on the current tree:
    _ADD_CCACHE_DEPENDENCY, _BUSYBOX_CONFIG_FIXUPS, _CPE_ID_VALID,
    _DOWNLOAD_POST_PROCESS_OPTS and _SVN_EXTERNALS (generic),
    _AUTOPOINT (autotools), _BUILD_ENV, _BUILD_OPTS and _CMAKE_BACKEND
    (cmake), _EXTLDFLAGS and _SUBDIR (golang), _CARGO_MANIFEST_PATH
    (python) and _VERITY_EXTRA_ARGS (rootfs);
  - add the variables used outside their package since v1:
    FLUTTER_ENGINE_GEN_SNAPSHOT, GCC_TARGET_SIMD, GO_BINARIES_INSTALL,
    HOST_FLUTTER_SDK_BIN_DART_BIN, HOST_FLUTTER_SDK_BIN_FLUTTER,
    QT6_GIT, QT6_QMAKE, QT6_QT_CONF_FIXUP and
    TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE, and the
    LINUX_TOOLS_BIN_ARCH_EXCLUDE and LINUX_TOOLS_PRE_CONFIGURE_HOOKS
    hooks of the linux-tools;
  - the variables still found in the tree are fixed by the previous
    patches, except in gcc-final, added to .checkpackageignore (see
    the commit message).

 .checkpackageignore                  |   1 +
 fs/initramfs/initramfs.mk            |   1 +
 linux/linux-ext-xenomai.mk           |   2 +-
 package/luarocks/luarocks.mk         |   2 +
 toolchain/toolchain.mk               |   2 +
 utils/check-package                  |  17 +-
 utils/checkpackagelib/lib_mk.py      | 120 ++++++++
 utils/checkpackagelib/pkg_infra.py   | 322 ++++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 426 +++++++++++++++++++++++++++
 9 files changed, 888 insertions(+), 5 deletions(-)
 create mode 100644 utils/checkpackagelib/pkg_infra.py

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db54..6419cc53b8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -345,6 +345,7 @@ package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/gcc-final/gcc-final.mk lib_mk.TypoInVariableSuffix
 package/gdb/15.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/15.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
 package/gdb/15.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 3b3d4ed8b9..69f0910368 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -27,6 +27,7 @@ rootfs-initramfs-show-depends:
 .PHONY: rootfs-initramfs rootfs-initramfs-show-depends
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+# check-package TypoInVariableSuffix
 TARGETS_ROOTFS += rootfs-initramfs
 endif
 
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 5ec6891bbf..247ff087cb 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -12,7 +12,7 @@ XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
 ifneq ($(filter ftp://% http://% https://%,$(XENOMAI_ADEOS_PATCH)),)
 XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
 XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
-# check-package TypoInPackageVariable
+# check-package TypoInPackageVariable, TypoInVariableSuffix
 LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
 else
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 43d099726f..f808f4ca13 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -43,11 +43,13 @@ endef
 
 $(eval $(host-generic-package))
 
+# check-package TypoInVariableSuffix
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
 
 # Apply to global variable directly, as pkg-generic does not
 ifneq ($(BR2_PACKAGE_LUAJIT)$(BR2_PACKAGE_LUA),)
+# check-package TypoInVariableSuffix
 TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
 endif
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index fe87a72ed4..36344c1b20 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -10,6 +10,7 @@
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+# check-package TypoInVariableSuffix
 define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 	$(Q)found_gconv=no; \
 	for d in $(TOOLCHAIN_EXTERNAL_PREFIX) ''; do \
@@ -51,5 +52,6 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
+# check-package TypoInVariableSuffix
 TOOLCHAIN_TARGET_FINALIZE_HOOKS += TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 endif
diff --git a/utils/check-package b/utils/check-package
index f9978adef4..d83484efc5 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -219,12 +219,21 @@ def print_warnings(warnings, xfail):
     if warnings is None:
         return 0, 0  # No warning generated.
 
+    # Allow each check function to return either one warning or a list of warnings
+    if len(warnings) == 0:
+        return 0, 0  # No warning generated.
+    if type(warnings[0]) is list:
+        all_warnings = warnings
+    else:
+        all_warnings = [warnings]
+
     if xfail:
         return 0, 1  # Warning not generated, fail expected for this file.
-    for level, message in enumerate(warnings):
-        if flags.verbose >= level:
-            print(message.replace("\t", "< tab  >").rstrip())
-    return 1, 1  # One more warning to count.
+    for each_warning in all_warnings:
+        for level, message in enumerate(each_warning):
+            if flags.verbose >= level:
+                print(message.replace("\t", "< tab  >").rstrip())
+    return len(all_warnings), 1  # One or more warnings to count.
 
 
 def check_file_using_lib(fname):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 297cb14460..9e154e3049 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -14,6 +14,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 from checkpackagelib.lib import Utf8Characters         # noqa: F401
+from checkpackagelib.pkg_infra import get_valid_suffixes
 from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 # used in more than one check
@@ -384,6 +385,125 @@ class TypoInPackageVariable(_CheckFunction):
                     text]
 
 
+class TypoInVariableSuffix(_CheckFunction):
+    USED_OUTSIDE_THE_PACKAGE = [
+        "ALCHEMY_INSTALL_LIB_SDK_FILE",
+        "ALCHEMY_MAKE",
+        "ALCHEMY_TARGET_ENV",
+        "ARCH_TOOLCHAIN_WRAPPER_OPTS",
+        "BR_LIBC",
+        "BR_NO_CHECK_HASH_FOR",
+        "DIRECTFB_HOST_BINARY",
+        "ERLANG_EI_VSN",
+        "FLUTTER_ENGINE_GEN_SNAPSHOT",
+        "GCC_TARGET_ABI",
+        "GCC_TARGET_ARCH",
+        "GCC_TARGET_CPU",
+        "GCC_TARGET_FLOAT_ABI",
+        "GCC_TARGET_FP32_MODE",
+        "GCC_TARGET_FPU",
+        "GCC_TARGET_MODE",
+        "GCC_TARGET_NAN",
+        "GCC_TARGET_SIMD",
+        "GOB2_HOST_BINARY",
+        "GO_BINARIES_INSTALL",
+        "HOST_FLUTTER_SDK_BIN_DART_BIN",
+        "HOST_FLUTTER_SDK_BIN_FLUTTER",
+        "HOST_GCC_APPLY_PATCHES",
+        "HOST_GCC_CONFIGURE_SYMLINK",
+        "HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS",
+        "HOST_GCC_XTENSA_OVERLAY_EXTRACT",
+        "HOST_GO_HOST_ENV",
+        "HOST_GO_TARGET_ENV",
+        "LIBGLIB2_HOST_BINARY",
+        "LIBXML2_HOST_BINARY",
+        "LUA_RUN",
+        "MKFS_JFFS2",
+        "PKG_CONFIG_HOST_BINARY",
+        "QEMU_USER",
+        "QT5_QMAKE",
+        "QT5_QT_CONF_FIXUP",
+        "QT6_GIT",
+        "QT6_QMAKE",
+        "QT6_QT_CONF_FIXUP",
+        "QT6_SOURCE_TARBALL_PREFIX",
+        "TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE",
+        "TOOLCHAIN_WRAPPER_BUILD",
+        "TOOLCHAIN_WRAPPER_INSTALL",
+        ]
+    DEFINITION = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
+    USAGE = re.compile(r"([A-Z0-9_]+_[A-Z0-9_]+)")
+    INDIRECTLY_USING_SUBDIR = re.compile(r"\$\(call\s+" + r",|\$\(call\s+".join([
+        "KCONFIG_DISABLE_OPT",
+        "KCONFIG_ENABLE_OPT",
+        "KCONFIG_SET_OPT",
+        ]) + r",|[A-Z0-9_]+" + r"\b|[A-Z0-9_]+".join([
+            "_BUILDDIR",
+            "_SRCDIR",
+            "_SUBDIR",
+        ]) + r"\b")
+
+    def before(self):
+        self.usage = []
+        self.definitions = {}
+        if self.filename.startswith("linux/linux-ext-"):
+            self.valid_suffixes = ["LINUX_EXTENSIONS", "_PREPARE_KERNEL"]
+        elif self.filename.startswith("package/linux-tools/linux-tool-"):
+            self.valid_suffixes = ["LINUX_TOOLS", "LINUX_TOOLS_BIN_ARCH_EXCLUDE",
+                                   "LINUX_TOOLS_POST_PATCH_HOOKS", "LINUX_TOOLS_PRE_CONFIGURE_HOOKS",
+                                   "_DEPENDENCIES",
+                                   "_BUILD_CMDS", "_INSTALL_STAGING_CMDS", "_INSTALL_TARGET_CMDS",
+                                   "_LINUX_CONFIG_FIXUPS", "_INSTALL_INIT_SYSTEMD",
+                                   "_INSTALL_INIT_SYSV", "_INSTALL_INIT_OPENRC"]
+        elif self.filename.startswith("fs/initramfs/"):
+            self.valid_suffixes = ["_DEPENDENCIES", "_NAME", "_TYPE"]
+        else:
+            self.valid_suffixes = []
+        self.using_subdir = False
+
+    def check_line(self, lineno, text):
+        self.valid_suffixes += get_valid_suffixes(text)
+
+        m = self.DEFINITION.search(text)
+        if m:
+            variable = m.group(2)
+            if variable not in self.USED_OUTSIDE_THE_PACKAGE:
+                self.definitions[variable] = [lineno, text]
+
+        rest_of_line = self.DEFINITION.sub('', text)
+        variables = self.USAGE.findall(rest_of_line)
+        for variable in variables:
+            self.usage.append(variable)
+
+        if self.INDIRECTLY_USING_SUBDIR.search(rest_of_line):
+            self.using_subdir = True
+
+    def after(self):
+        if self.using_subdir:
+            _, package = get_package_prefix_from_filename(self.filename)
+            self.usage.append(package + "_SUBDIR")
+            self.usage.append("HOST_" + package + "_SUBDIR")
+
+        possible_typo = {}
+        for variable, where in self.definitions.items():
+            valid_suffix = False
+            for suffix in self.valid_suffixes:
+                if variable.endswith(suffix):
+                    valid_suffix = True
+                    break
+            if not valid_suffix:
+                possible_typo[variable] = where
+
+        warnings = []
+        for variable, where in possible_typo.items():
+            if variable not in self.usage:
+                lineno, text = where
+                warnings.append(["{}:{}: possible typo on suffix: {}"
+                                 .format(self.filename, lineno, variable),
+                                 text])
+        return warnings
+
+
 class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_AUTORECONF\s*=\s*NO",
diff --git a/utils/checkpackagelib/pkg_infra.py b/utils/checkpackagelib/pkg_infra.py
new file mode 100644
index 0000000000..1e292d65d6
--- /dev/null
+++ b/utils/checkpackagelib/pkg_infra.py
@@ -0,0 +1,322 @@
+AUTOTOOLS_VALID_SUFFIXES = [
+    "_AUTOPOINT",
+    "_AUTORECONF",
+    "_AUTORECONF_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_GETTEXTIZE",
+    "_GETTEXTIZE_OPTS",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_LIBTOOL_PATCH",
+    "_MAKE",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    ]
+BAREBOX_VALID_SUFFIXES = [
+    ]
+CARGO_VALID_SUFFIXES = [
+    "_CARGO_BUILD_OPTS",
+    "_CARGO_ENV",
+    "_CARGO_INSTALL_OPTS",
+    "_SUBDIR",
+    ]
+CMAKE_VALID_SUFFIXES = [
+    "_BUILD_ENV",
+    "_BUILD_OPTS",
+    "_CMAKE_BACKEND",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    "_SUPPORTS_IN_SOURCE_BUILD",
+    ]
+GENERIC_VALID_SUFFIXES = [
+    "_ACTUAL_SOURCE_SITE",
+    "_ACTUAL_SOURCE_TARBALL",
+    "_ADDITIONAL_DOWNLOADS",
+    "_ADD_CCACHE_DEPENDENCY",
+    "_ADD_SKELETON_DEPENDENCY",
+    "_ADD_TOOLCHAIN_DEPENDENCY",
+    "_BIN_ARCH_EXCLUDE",
+    "_BUILD_CMDS",
+    "_BUSYBOX_CONFIG_FIXUPS",
+    "_CONFIGURE_CMDS",
+    "_CONFIG_SCRIPTS",
+    "_CPE_ID",
+    "_CPE_ID_PREFIX",
+    "_CPE_ID_PRODUCT",
+    "_CPE_ID_UPDATE",
+    "_CPE_ID_VALID",
+    "_CPE_ID_VENDOR",
+    "_CPE_ID_VERSION",
+    "_DEPENDENCIES",
+    "_DEVICES",
+    "_DL_DIR",
+    "_DL_ENV",
+    "_DL_OPTS",
+    "_DL_SUBDIR",
+    "_DL_VERSION",
+    "_DOWNLOAD_DEPENDENCIES",
+    "_DOWNLOAD_POST_PROCESS",
+    "_DOWNLOAD_POST_PROCESS_OPTS",
+    "_DROP_FILES_OR_DIRS",
+    "_EXCLUDES",
+    "_EXTRACT_CMDS",
+    "_EXTRACT_DEPENDENCIES",
+    "_EXTRA_DOWNLOADS",
+    "_FLAT_STACKSIZE",
+    "_GIT_LFS",
+    "_GIT_SUBMODULES",
+    "_HELP_CMDS",
+    "_IGNORE_CVES",
+    "_INSTALL_CMDS",
+    "_INSTALL_IMAGES",
+    "_INSTALL_IMAGES_CMDS",
+    "_INSTALL_INIT_OPENRC",
+    "_INSTALL_INIT_SYSTEMD",
+    "_INSTALL_INIT_SYSV",
+    "_INSTALL_STAGING",
+    "_INSTALL_STAGING_CMDS",
+    "_INSTALL_TARGET",
+    "_INSTALL_TARGET_CMDS",
+    "_KEEP_PY_FILES",
+    "_LICENSE",
+    "_LICENSE_FILES",
+    "_LINUX_CONFIG_FIXUPS",
+    "_NAME",
+    "_OVERRIDE_SRCDIR",
+    "_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS",
+    "_PATCH",
+    "_PATCH_DEPENDENCIES",
+    "_PERMISSIONS",
+    "_POST_BUILD_HOOKS",
+    "_POST_CONFIGURE_HOOKS",
+    "_POST_DOWNLOAD_HOOKS",
+    "_POST_EXTRACT_HOOKS",
+    "_POST_INSTALL_HOOKS",
+    "_POST_INSTALL_IMAGES_HOOKS",
+    "_POST_INSTALL_STAGING_HOOKS",
+    "_POST_INSTALL_TARGET_HOOKS",
+    "_POST_LEGAL_INFO_HOOKS",
+    "_POST_PATCH_HOOKS",
+    "_POST_PREPARE_HOOKS",
+    "_POST_RSYNC_HOOKS",
+    "_PRE_BUILD_HOOKS",
+    "_PRE_CONFIGURE_HOOKS",
+    "_PRE_DOWNLOAD_HOOKS",
+    "_PRE_EXTRACT_HOOKS",
+    "_PRE_INSTALL_HOOKS",
+    "_PRE_INSTALL_IMAGES_HOOKS",
+    "_PRE_INSTALL_STAGING_HOOKS",
+    "_PRE_INSTALL_TARGET_HOOKS",
+    "_PRE_LEGAL_INFO_HOOKS",
+    "_PRE_PATCH_HOOKS",
+    "_PRE_RSYNC_HOOKS",
+    "_PROVIDES",
+    "_REDISTRIBUTE",
+    "_ROOTFS_PRE_CMD_HOOKS",
+    "_SELINUX_MODULES",
+    "_SITE",
+    "_SITE_METHOD",
+    "_SOURCE",
+    "_STRIP_COMPONENTS",
+    "_SVN_EXTERNALS",
+    "_TARGET_FINALIZE_HOOKS",
+    "_TOOLCHAIN_WRAPPER_ARGS",
+    "_USERS",
+    "_VERSION",
+    ]
+GOLANG_VALID_SUFFIXES = [
+    "_BIN_NAME",
+    "_BUILD_OPTS",
+    "_BUILD_TARGETS",
+    "_EXTLDFLAGS",
+    "_GOMOD",
+    "_GO_ENV",
+    "_INSTALL_BINS",
+    "_LDFLAGS",
+    "_SRC_DOMAIN",
+    "_SRC_SOFTWARE",
+    "_SRC_VENDOR",
+    "_SUBDIR",
+    "_TAGS",
+    ]
+KCONFIG_VALID_SUFFIXES = [
+    "_KCONFIG_DEFCONFIG",
+    "_KCONFIG_DEPENDENCIES",
+    "_KCONFIG_DOTCONFIG",
+    "_KCONFIG_EDITORS",
+    "_KCONFIG_FILE",
+    "_KCONFIG_FIXUP_CMDS",
+    "_KCONFIG_FRAGMENT_FILES",
+    "_KCONFIG_MAKE",
+    "_KCONFIG_OPTS",
+    "_KCONFIG_RULES",
+    "_KCONFIG_SUPPORTS_DEFCONFIG",
+    "_MAKE",
+    "_MAKE_ENV",
+    ]
+KERNEL_MODULE_VALID_SUFFIXES = [
+    "_DEPENDENCIES",
+    "_MAKE",
+    "_MODULE_MAKE_OPTS",
+    "_MODULE_SUBDIRS",
+    ]
+LUAROCKS_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_NAME_UPSTREAM",
+    "_ROCKSPEC",
+    "_SUBDIR",
+    ]
+MESON_VALID_SUFFIXES = [
+    "_CFLAGS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_CXXFLAGS",
+    "_FCFLAGS",
+    "_LDFLAGS",
+    "_MESON_EXTRA_BINARIES",
+    "_MESON_EXTRA_PROPERTIES",
+    "_NINJA_ENV",
+    "_NINJA_OPTS",
+    "_SUBDIR",
+    ]
+PERL_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_DISTNAME",
+    "_INSTALL_TARGET_OPTS",
+    "_PREFER_INSTALLER",
+    "_SUBDIR",
+    ]
+PYTHON_VALID_SUFFIXES = [
+    "_BASE_INSTALL_CMD",
+    "_BUILD_OPTS",
+    "_CARGO_MANIFEST_PATH",
+    "_ENV",
+    "_INSTALL_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_SETUP_TYPE",
+    "_SUBDIR",
+    ]
+QMAKE_VALID_SUFFIXES = [
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE_ENV",
+    "_MAKE_OPTS",
+    "_SUBDIR",
+    "_SYNC_QT_HEADERS",
+    ]
+REBAR_VALID_SUFFIXES = [
+    "_CONF_ENV",
+    "_KEEP_DEPENDENCIES",
+    "_REBAR_ENV",
+    "_USE_AUTOCONF",
+    "_USE_BUNDLED_REBAR",
+    ]
+ROOTFS_VALID_SUFFIXES = [
+    "_CMD",
+    "_DEPENDENCIES",
+    "_IMAGE_NAME",
+    "_POST_GEN_HOOKS",
+    "_PRE_GEN_HOOKS",
+    "_VERITY_EXTRA_ARGS",
+    ]
+TOOLCHAIN_EXTERNAL_VALID_SUFFIXES = [
+    ]
+VIRTUAL_VALID_SUFFIXES = [
+    "_IS_VIRTUAL",
+    ]
+WAF_VALID_SUFFIXES = [
+    "_BUILD_OPTS",
+    "_CONF_ENV",
+    "_CONF_OPTS",
+    "_INSTALL_STAGING_OPTS",
+    "_INSTALL_TARGET_OPTS",
+    "_MAKE_ENV",
+    "_NEEDS_EXTERNAL_WAF",
+    "_SUBDIR",
+    "_WAF",
+    "_WAF_OPTS",
+    ]
+
+
+ALL_VALID_SUFFIXES = \
+    AUTOTOOLS_VALID_SUFFIXES + \
+    BAREBOX_VALID_SUFFIXES + \
+    CARGO_VALID_SUFFIXES + \
+    CMAKE_VALID_SUFFIXES + \
+    GENERIC_VALID_SUFFIXES + \
+    GOLANG_VALID_SUFFIXES + \
+    KCONFIG_VALID_SUFFIXES + \
+    KERNEL_MODULE_VALID_SUFFIXES + \
+    LUAROCKS_VALID_SUFFIXES + \
+    MESON_VALID_SUFFIXES + \
+    PERL_VALID_SUFFIXES + \
+    PYTHON_VALID_SUFFIXES + \
+    QMAKE_VALID_SUFFIXES + \
+    REBAR_VALID_SUFFIXES + \
+    ROOTFS_VALID_SUFFIXES + \
+    TOOLCHAIN_EXTERNAL_VALID_SUFFIXES + \
+    VIRTUAL_VALID_SUFFIXES + \
+    WAF_VALID_SUFFIXES
+
+
+def get_valid_suffixes(text):
+    if text.startswith("include"):
+        # we cannot guess the package infra used looking only at this file, so
+        # default to a superset of all known package infra types
+        return ALL_VALID_SUFFIXES
+    if text.startswith("$(eval"):
+        if "autotools-package)" in text:
+            return GENERIC_VALID_SUFFIXES + AUTOTOOLS_VALID_SUFFIXES
+        if "barebox-package)" in text:
+            return GENERIC_VALID_SUFFIXES + KCONFIG_VALID_SUFFIXES + BAREBOX_VALID_SUFFIXES
+        if "cargo-package)" in text:
+            return GENERIC_VALID_SUFFIXES + CARGO_VALID_SUFFIXES
+        if "cmake-package)" in text:
+            return GENERIC_VALID_SUFFIXES + CMAKE_VALID_SUFFIXES
+        if "generic-package)" in text:
+            return GENERIC_VALID_SUFFIXES
+        if "golang-package)" in text:
+            return GENERIC_VALID_SUFFIXES + GOLANG_VALID_SUFFIXES
+        if "kconfig-package)" in text:
+            return GENERIC_VALID_SUFFIXES + KCONFIG_VALID_SUFFIXES
+        if "kernel-module)" in text:
+            return KERNEL_MODULE_VALID_SUFFIXES
+        if "luarocks-package)" in text:
+            return GENERIC_VALID_SUFFIXES + LUAROCKS_VALID_SUFFIXES
+        if "meson-package)" in text:
+            return GENERIC_VALID_SUFFIXES + MESON_VALID_SUFFIXES
+        if "perl-package)" in text:
+            return GENERIC_VALID_SUFFIXES + PERL_VALID_SUFFIXES
+        if "python-package)" in text:
+            return GENERIC_VALID_SUFFIXES + PYTHON_VALID_SUFFIXES
+        if "qmake-package)" in text:
+            return GENERIC_VALID_SUFFIXES + QMAKE_VALID_SUFFIXES
+        if "rebar-package)" in text:
+            return GENERIC_VALID_SUFFIXES + AUTOTOOLS_VALID_SUFFIXES + REBAR_VALID_SUFFIXES
+        if "(rootfs)" in text:
+            return ROOTFS_VALID_SUFFIXES
+        if "toolchain-external-package)" in text:
+            return GENERIC_VALID_SUFFIXES + TOOLCHAIN_EXTERNAL_VALID_SUFFIXES
+        if "virtual-package)" in text:
+            return GENERIC_VALID_SUFFIXES + VIRTUAL_VALID_SUFFIXES
+        if "waf-package)" in text:
+            return GENERIC_VALID_SUFFIXES + WAF_VALID_SUFFIXES
+        # any new package infra will need support here, otherwise default to a
+        # superset of all known package infra types
+        return ALL_VALID_SUFFIXES
+    return []
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 1bbb0af20c..eca0a255f8 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -714,6 +714,432 @@ def test_TypoInPackageVariable(testname, filename, string, expected):
     assert warnings == expected
 
 
+TypoInVariableSuffix = [
+    ('good',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     '$(eval $(foo-package))\n',
+     [[]]),
+    ('bad',
+     'any.mk',
+     'ANY_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_VAR', 'ANY_VAR = \n']]]),
+    ('internal variable',
+     'any.mk',
+     'ANY_VAR = \n'
+     'ANY_CONF_OPTS = ANY_VAR OTHER_VAR\n'
+     '$(eval $(foo-package))\n',
+     [[]]),
+    ('ignore missing space',
+     'any.mk',
+     'OTHER_VAR= \n',
+     [[['any.mk:1: possible typo on suffix: OTHER_VAR', 'OTHER_VAR= \n']]]),
+    ('libc exception',
+     './any.mk',
+     'BR_LIBC = \n',
+     [[]]),
+    ('arch/gcc/toolchain exception',
+     'any.mk',
+     'GCC_TARGET_FPU += \n',
+     [[]]),
+    ('host (bad)',
+     'any.mk',
+     'HOST_OTHER_VAR = \n',
+     [[['any.mk:1: possible typo on suffix: HOST_OTHER_VAR', 'HOST_OTHER_VAR = \n']]]),
+    ('provides',
+     'any.mk',
+     'ANY_PROVIDES = other thing\n'
+     'OTHER_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:2: possible typo on suffix: OTHER_VAR', 'OTHER_VAR = \n']]]),
+    ('ignore space',
+     'any.mk',
+     'ANY_PROVIDES  =  thing  other \n'
+     'OTHER_VAR = \n'
+     '$(eval $(foo-package))\n',
+     [[['any.mk:2: possible typo on suffix: OTHER_VAR', 'OTHER_VAR = \n']]]),
+    ('multiple warnings',
+     'file.mk',
+     'LUA_RUN = FILE_INTERNAL_VAR\n'
+     'FILE_DEPENDENCY = wrong\n'
+     'FILE_LICENCE = wrong\n'
+     'FILE_CONF_OPTS = ok\n'
+     'FILE_INTERNAL_VAR = used above\n'
+     'FILE_WRONG = # commment\n'
+     '$(eval $(foo-package))\n',
+     [[['file.mk:2: possible typo on suffix: FILE_DEPENDENCY', 'FILE_DEPENDENCY = wrong\n'],
+       ['file.mk:3: possible typo on suffix: FILE_LICENCE', 'FILE_LICENCE = wrong\n'],
+       ['file.mk:6: possible typo on suffix: FILE_WRONG', 'FILE_WRONG = # commment\n']]]),
+    ('linux extensions',
+     'linux/linux-ext-any.mk',
+     'ANY_CPE_ID = \n'
+     'define ANY_BUILD_CMDS\n'
+     'endef\n'
+     'ANY_PREPARE_KERNEL = \n',
+     [[['linux/linux-ext-any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n'],
+       ['linux/linux-ext-any.mk:2: possible typo on suffix: ANY_BUILD_CMDS', 'define ANY_BUILD_CMDS\n']]]),
+    ('linux tools',
+     'package/linux-tools/linux-tool-any.mk',
+     'ANY_CPE_ID = \n'
+     'define ANY_BUILD_CMDS\n'
+     'endef\n'
+     'ANY_PREPARE_KERNEL = \n',
+     [[['package/linux-tools/linux-tool-any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n'],
+       ['package/linux-tools/linux-tool-any.mk:4: possible typo on suffix: ANY_PREPARE_KERNEL', 'ANY_PREPARE_KERNEL = \n']]]),
+    ('initramfs do not use fs infra',
+     'fs/initramfs/any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_NAME = \n',
+     [[['fs/initramfs/any.mk:1: possible typo on suffix: ANY_CPE_ID', 'ANY_CPE_ID = \n']]]),
+    ('autotools',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(autotools-package))\n',
+     [[['any.mk:4: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('barebox',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     '$(eval $(barebox-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('cmake',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(cmake-package))\n',
+     [[['any.mk:3: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n']]]),
+    ('cargo',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     'ANY_CARGO_INSTALL_OPTS = \n'
+     '$(eval $(cargo-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('generic',
+     'any.mk',
+     'ANY_CONF_OPTS = \n'
+     'ANY_CPE_ID = \n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('golang',
+     'any.mk',
+     'ANY_GO_ENV = \n'
+     'ANY_CONF_OPTS = \n'
+     '$(eval $(golang-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n']]]),
+    ('kconfig',
+     'any.mk',
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(kconfig-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       # https://bugs.buildroot.org/show_bug.cgi?id=15161  	kernel can't support SUBDIR
+       ['any.mk:4: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n']]]),
+    ('kernel module + autotools',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(autotools-package))\n',
+     [[['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('kernel module + generic',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUPPORTS_IN_SOURCE_BUILD', 'ANY_SUPPORTS_IN_SOURCE_BUILD = \n']]]),
+    ('kernel module + cmake',
+     'any.mk',
+     'ANY_CPE_ID = \n'
+     'ANY_GETTEXTIZE = \n'
+     'ANY_GO_ENV = \n'
+     'ANY_KCONFIG_FIXUP_CMDS = \n'
+     'ANY_MODULE_SUBDIRS = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SUPPORTS_IN_SOURCE_BUILD = \n'
+     '$(eval $(kernel-module))\n'
+     '$(eval $(cmake-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_GETTEXTIZE', 'ANY_GETTEXTIZE = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_GO_ENV', 'ANY_GO_ENV = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_KCONFIG_FIXUP_CMDS', 'ANY_KCONFIG_FIXUP_CMDS = \n']]]),
+    ('luarocks',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(luarocks-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:6: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('meson',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'HOST_ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(host-meson-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:7: possible typo on suffix: HOST_ANY_INSTALL_STAGING_OPTS', 'HOST_ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('perl',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     '$(eval $(perl-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('python',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(host-python-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:6: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n']]]),
+    ('qmake + host generic',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_TARGET_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(qmake-package))\n'
+     '$(eval $(host-generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('rebar',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_ROCKSPEC = \n'
+     'ANY_DISTNAME = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     '$(eval $(rebar-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_ROCKSPEC', 'ANY_ROCKSPEC = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_DISTNAME', 'ANY_DISTNAME = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n']]]),
+    ('toolchain-external',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_INSTALL_STAGING = \n'
+     'ANY_INSTALL_STAGING_CMDS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(toolchain-external-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS = \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:3: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_IS_VIRTUAL', 'ANY_IS_VIRTUAL= \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:12: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:13: possible typo on suffix: ANY_WAF', 'ANY_WAF = \n']]]),
+    ('virtual',
+     'any.mk',
+     'ANY_BUILD_OPTS ?= \n'
+     'ANY_CFLAGS := \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS += \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(virtual-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_BUILD_OPTS', 'ANY_BUILD_OPTS ?= \n'],
+       ['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS := \n'],
+       ['any.mk:3: possible typo on suffix: ANY_CONF_OPTS', 'ANY_CONF_OPTS = \n'],
+       ['any.mk:4: possible typo on suffix: ANY_INSTALL_STAGING_OPTS', 'ANY_INSTALL_STAGING_OPTS = \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:8: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n'],
+       ['any.mk:11: possible typo on suffix: ANY_WAF', 'ANY_WAF = \n']]]),
+    ('waf',
+     'any.mk',
+     'ANY_BUILD_OPTS = \n'
+     'ANY_CFLAGS = \n'
+     'ANY_CONF_OPTS = \n'
+     'ANY_INSTALL_STAGING_OPTS = \n'
+     'ANY_IS_VIRTUAL= \n'
+     'ANY_PRE_PATCH_HOOKS = \n'
+     'ANY_SETUP_TYPE = \n'
+     'ANY_SUBDIR = \n'
+     'ANY_SYNC_QT_HEADERS = \n'
+     'ANY_USE_AUTOCONF = \n'
+     'ANY_WAF = \n'
+     '$(eval $(waf-package))\n',
+     [[['any.mk:2: possible typo on suffix: ANY_CFLAGS', 'ANY_CFLAGS = \n'],
+       ['any.mk:5: possible typo on suffix: ANY_IS_VIRTUAL', 'ANY_IS_VIRTUAL= \n'],
+       ['any.mk:7: possible typo on suffix: ANY_SETUP_TYPE', 'ANY_SETUP_TYPE = \n'],
+       ['any.mk:9: possible typo on suffix: ANY_SYNC_QT_HEADERS', 'ANY_SYNC_QT_HEADERS = \n'],
+       ['any.mk:10: possible typo on suffix: ANY_USE_AUTOCONF', 'ANY_USE_AUTOCONF = \n']]]),
+    ('SUBDIR no use',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[['any.mk:1: possible typo on suffix: ANY_SUBDIR', 'ANY_SUBDIR = \n']]]),
+    ('SUBDIR explicit use',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_SUBDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 1',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_SRCDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 2',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     '\tmake $(ANY_BUILDDIR)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 3',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 4',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_SET_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(generic-package))\n',
+     [[]]),
+    ('SUBDIR indirect use 5',
+     'any.mk',
+     'ANY_SUBDIR = \n'
+     'define ANY_LINUX_CONFIG_FIXUPS\n'
+     '\t$(call KCONFIG_DISABLE_OPT,CONFIG_BPF_SYSCALL)\n'
+     'endef\n'
+     '$(eval $(kconfig-package))\n',
+     [[]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', TypoInVariableSuffix)
+def test_TypoInVariableSuffix(testname, filename, string, expected):
+    warnings = util.check_file(m.TypoInVariableSuffix, filename, string)
+    assert warnings == expected
+
+
 UselessFlag = [
     ('autoreconf no',
      'any.mk',
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
