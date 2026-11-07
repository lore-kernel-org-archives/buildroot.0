Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC9606A32D
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EHLCpTQ+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCFNx1g+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F9F8112A;
	Sat,  7 Nov 2026 16:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYc9DsKZN1ee; Sat,  7 Nov 2026 16:34:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30F408112C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069263;
	b=nfkO5T+ijqnUlfKrv42hxYGEIgGXkQXADmjCoj98m5cYbDR4ys11PsjJRPHe+4CPVrFG
	 4a9Rt42reGMvaWcpo8+Zxs8FPRFhinxkIBqsOv6fW7uiWHq9cIvzEEBo/UjhEMoEpdptU
	 zHunapeynH+Eo7qf5S3RIEBFLp9CzBo8KveZc47XLf9HOkYmbh5ni49+0ioEbiIZ+xCmy
	 8uX8PcpA+lA7ymyLXBWYoznT/MhYOvtCDb6ShH+wQMimjSBmfTxSVlhe7fuA5LsSsPrCj
	 m2UP8U66bYNIWcPss8F3Fpww0ISpyyPPUr4LDcCxq179/Yfta3W8MaAhllFk/OWq5BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069263;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nTNOJYfPTcU8f55JZwn592F9gaGgQY8Fn8hVB2XlJpk=;
	b=A/nzCVa+l+GeF0fenLTR25g9di90KUnU7yPkYRIEhFWDLTf7w8GBfqg7AIykldDjkB4i
	 /S2/WOFDMMOL01uYVid5DjoKqM4Jxo5LePJdS5/a4IgtEXpvZ/4byc/PLOxXmbk3cbPMA
	 xPDPZYBCdsG9YeRDI+N7G6wCrn9SpJtoiJBZ6+3UrrNoB2LDMvwhLt4V7ajof1Thbkm0V
	 2baCJmzQbgWjEn6rGogx0t4TMcbxOonhjbWJsZ1onKcwfTQlwzVFeD8E2pkyfnlck6YEb
	 M0m1AC9RreawycZ/3AoY3PwKPJCkNpl2R+UnO2qJIDpAPohbCQoaeCIhGyOKTI80ssw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069263;
	bh=nTNOJYfPTcU8f55JZwn592F9gaGgQY8Fn8hVB2XlJpk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EHLCpTQ+Aba3FHgblBW60tgi+8jQ0m051tQ7+nCD0dXql7gb/oW+3wxu0YvRJlmow
	 QFJpGl8gq775/SxsjSkEa71t0iz+hxvv1juzyM2Fh7s3humiCbXbvtSnl0/U3Ds6np
	 rTeqbHE95PzGZnakdK+YztV+33A8bAaHIT8536jpzUQeCnBXMwN566mWJzJNhERwTt
	 C5yepY+ICkzqIolCSfCU27M6cHwPiWUZiy6buSK9mxKyh/nqJDK1x6Vx7Tklei7ID1
	 gOCLSgOCK8BWsykw+rgymLA3fHnaVlqDRdjeMXBN2LZF7UjReLHXnYbXEuOePvORAb
	 TEyYZsrrn5+Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F408112C;
	Sat,  7 Nov 2026 16:34:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEEF34D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2A7F400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIpsiQdKY3T0 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7E5BA4009B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=kCFNx1g+
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E5BA4009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so9674195e9.2
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069258; x=1794674058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7YGgSzxHMHRc6D8K5jbnrsKxe/Ih/5cMV/7gfewtHS0=;
 b=kCFNx1g+YEnT0pVljxpSGLQmZuHQkcdFOplsKcb14UKXS9Hw5OCuQwhr+E2Y0Z0ajv
 Uj9MThoc+SN2N04efaaJk8CbPW5Gmkprs1c2Tt/P/jVbioTw98xQhVyJ0GVDZw8O/su6
 XkMu4IOe0UBtIXdCZT0Y1bHT/EV/U9DQqHbAt/9KdwalkrVCGLXWiezMoBITrzbcDLHR
 wyzTVySEvjgfWdBpy3eOEUxV9++Dv8dm9wiMtPBjZG9ZS4ztnR9M+pFHmLaaKy1JZaGf
 sUT5AnN9wgJ8Rc1xJDElD3qfteD7eGYN5ieSiX6ANzPOb/52c3ErCXmWfOab94Xhj+Ob
 y//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069258; x=1794674058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7YGgSzxHMHRc6D8K5jbnrsKxe/Ih/5cMV/7gfewtHS0=;
 b=eCUHGi1cZ5lifO0AaVaIvHQRLIgMdwgKGu9e+G0nCOsk350h7RhVzKVvXXZuz8jeIB
 puDIWsFC0HQL7/tRHoJeVypJfnAJ3UW49eFpZCtfwmg1cc8DPGtOtHndXJcmQoF1ZrTK
 Ne0HBslZrgsp94hvB08VsnP9QuPm9Rp9U9zGIr84MU4eHBNuo48PY7C20enZG2yKCQQu
 Zo/Z2WzacEhuz2pCyhSUymQilItKafZZu2z8Pn6WAFoDHvZycC/q/qjYBjuq6QGhaHzP
 LyHmyNiladq9rfOLN0Oa/7eDwjR7JJoAbVnq2JyiQb5LcQMjLIvy2RnoafHNAEcJe73q
 MY8w==
X-Gm-Message-State: APuU4Z/w8iQ83ATePYxBwkvntCQ8ER/hzrEZURJFfvHM1MgQKY4hBS+E
 0Aa6eYtpwOULJ0a7bu273LX7TvahRbWYjyRG7GIbLYakMNQcjGreDTJ4m28h+D9Q
X-Gm-Gg: AYBFou3ygKZEUeA2JFCenwMmVfK4KJlOSNj5EMji5cP4SH3t6DEL+1PofyMiI2maB+A
 jO8H3K3DqBlYd4MULtatHM5Bv1bTUJ/90eSOcNtuGRhSJPj2dbx7q7ROPnuYYkTo+3MEYokSt6X
 nBTup3QP0rQ1jFecCAGwClw6frrt3YQmkmfigk5cnvlCMyTHRE6CeWiSDuWaQ9otLihwAgqQUAR
 ZfoYrNkpoIED9uhEM7Qg0+r64vORIpAcqYjJScSEDg5/U+mHYx+5hDoBc1rkBGcq6eNMu7cPG08
 jZYwQcXn7lrEYqE7L40m7c1gUZBAi4VPGbdoODGs16cCmjIkTNNiHEpkTkp5/kx9oZxVTH1cZ/Z
 CVoFLX3yfBovTNMK3O8MDXLmsMelvFySPo9/A/Tzs/JdyQOgHBio3LlxsLC/t/l4Q/YiJ/XLFd/
 g8+NTqL2EgYXI+wHTwqZ2XzoIkozVvcN8bqwL6yvzV3upU6620yO5OUv5/VS7v2CoMsqoWzL+VT
 cJihNg9b/xZb9DB2KGrz2URUo0BUwt41tRxQulw/pBLflDoYtuuzfQMUFau9jqcJbQ/fMCuV5YI
 2sQQIzMvyPhucQiBburWeQEswVa6WqnYKpfH2Vr9LeGsf30ZoJeEgBkCrlM57jXmfM/zsP38C7g
 =
X-Received: by 2002:a05:600c:3104:b0:4a2:1e1:d55 with SMTP id
 5b1f17b1804b1-4b6e054955emr116942645e9.28.1794069257715; 
 Sat, 07 Nov 2026 08:34:17 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:17 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:33:59 +0100
Message-ID: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 00/15] check-package: warn about symbols not
 recognized by a package infra, support inline flags
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series resurrects two check-package series sent by Ricardo
Martincoski in 2023, which never got a review and have been sitting on
patchwork since then:

- "check-package: warn about symbols not recognized by a package
  infra" (January 2023): the fixes of the tree and patch 29 were
  applied, but the two new checks, patches 27 and 28, were not;
- "check-package: support inline flags" v3 (September 2023), which
  lets a file enable special rules of a check with a comment, and
  removes the list of Config.in files hard-coded in lib_config:Indent.

Both are rebased on current master and sent together, since they
touch the same code. This is v4 after the inline flags series; the two
checks were only sent once, as v1.

Patches 1 to 3 are the inline flags series, with only a conflict
solved in the first one.

Patches 14 and 15 are the two checks: TypoInVariableSuffix warns about
variables that the package infra used in the file does not know and
that nothing else uses, DisabledInstall about install hooks that never
run because the installation step is disabled. After almost four years, the
lists of variables known by each infra were outdated, and the checks
gave about 250 warnings on the current tree, so they are updated in
patch 14 with the variables added to the infras in the meantime.

The remaining warnings are all real problems: variables misspelled or
left behind by conversions to another infra. Rather than adding these
files to .checkpackageignore, patches 4 to 13 fix them, as the original
series did with its first 24 patches, so that the checks can go in with
no new entry in the ignore list but one:

- the license file of andes-spi-burn was never saved nor checked;
- the configure options of usbip were never passed;
- linux-pam has not been linked with libintl and libatomic since its
  move to meson, which breaks the build with an external libintl, as
  seen by the autobuilders (also in 2026.02.x);
- fbv, postgresql, libselinux, zfs, mesa3d, nxp-mwifiex and
  libglib2-bootstrap only had dead variables, removed with no change
  in the build.

The one entry left in .checkpackageignore is gcc-final: its m68k
ColdFire libgcc fixup hook is registered under a wrong name since
2023, so it never runs, but fixing it changes the ColdFire internal
toolchain and deserves its own patch and test.

This series supersedes the following patches, which can be marked as
superseded on patchwork:

- [27/29] utils/check-package: warn about symbols not recognized by a
  package infra (patch 14 of this series)
  https://patchwork.buildroot.org/project/buildroot/patch/20230101233653.487175-28-ricardo.martincoski@gmail.com/
- [28/29] utils/check-package: warn about disabled install (patch 15)
  https://patchwork.buildroot.org/project/buildroot/patch/20230101233653.487175-29-ricardo.martincoski@gmail.com/
- [next,v3,1/3] utils/check-package: factor-out check_disabled()
  (patch 1)
  https://patchwork.buildroot.org/project/buildroot/patch/20230903163509.614740-2-ricardo.martincoski@gmail.com/
- [next,v3,2/3] utils/check-package: support inline flags (patch 2)
  https://patchwork.buildroot.org/project/buildroot/patch/20230903163509.614740-3-ricardo.martincoski@gmail.com/
- [next,v3,3/3] utils/check-package: remove hard-coded list from
  lib_config:Indent (patch 3)
  https://patchwork.buildroot.org/project/buildroot/patch/20230903163509.614740-4-ricardo.martincoski@gmail.com/

Each patch has its own "Changes" notes.

Angelo Compagnucci (10):
  package/andes-spi-burn: fix the license files variable
  package/fbv: drop the unused configure options
  package/usbip: fix the configure options variable
  package/postgresql: drop the unused install-world options
  package/libselinux: drop the unused make environment
  package/zfs: drop the unused module subdirectories
  package/mesa3d: drop the unused host Vulkan drivers
  package/nxp-mwifiex: drop the unused make options
  package/libglib2/libglib2-bootstrap: drop unused variables
  package/linux-pam: fix linking with the NLS and atomic libraries

James Knight (1):
  utils/check-package: remove hard-coded list from lib_config:Indent

Ricardo Martincoski (4):
  utils/check-package: factor-out check_disabled()
  utils/check-package: support inline flags
  utils/check-package: warn about symbols not recognized by a package
    infra
  utils/check-package: warn about disabled install

 .checkpackageignore                           |   1 +
 fs/initramfs/initramfs.mk                     |   1 +
 linux/linux-ext-xenomai.mk                    |   2 +-
 package/Config.in                             |   2 +
 package/Config.in.host                        |   2 +
 package/andes-spi-burn/andes-spi-burn.hash    |   2 +-
 package/andes-spi-burn/andes-spi-burn.mk      |   2 +-
 package/fbv/fbv.mk                            |  13 +-
 package/kodi/Config.in                        |   2 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk  |   3 -
 package/libselinux/libselinux.mk              |   3 -
 package/linux-pam/linux-pam.mk                |   2 +-
 package/luarocks/luarocks.mk                  |   2 +
 package/mesa3d/mesa3d.mk                      |   1 -
 package/nxp-mwifiex/nxp-mwifiex.mk            |   2 -
 package/postgresql/postgresql.mk              |   2 -
 package/usbip/usbip.mk                        |   2 +-
 package/x11r7/Config.in                       |   2 +
 package/zfs/zfs.mk                            |  12 -
 toolchain/toolchain.mk                        |   2 +
 utils/check-package                           |  21 +-
 utils/checkpackagelib/base.py                 |  21 +-
 utils/checkpackagelib/lib_config.py           |   8 +-
 utils/checkpackagelib/lib_mk.py               | 209 +++++++
 utils/checkpackagelib/pkg_infra.py            | 322 ++++++++++
 utils/checkpackagelib/test_base.py            | 131 +++++
 utils/checkpackagelib/test_lib_mk.py          | 555 ++++++++++++++++++
 utils/checkpackagelib/test_util.py            |   5 +-
 28 files changed, 1279 insertions(+), 53 deletions(-)
 create mode 100644 utils/checkpackagelib/pkg_infra.py
 create mode 100644 utils/checkpackagelib/test_base.py

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
