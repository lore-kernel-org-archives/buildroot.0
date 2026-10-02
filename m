Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39071CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E806E40A0C;
	Fri,  2 Oct 2026 15:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3ptzTEvRg2K; Fri,  2 Oct 2026 15:12:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3206F40A27
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790953969;
	b=Xsw9Ht6+bYygTGzW6e8N3nvmHqh8POe5Kqg8rn+Smkzms5+s6P9sQGvePbKIotGKzFqO
	 jzLa4jWgfRXCSLv+Okq6z1UU3P1tHKpEId/k1ezRH+mBUOPvxCmWvRSJgP0ye0hLLGg3i
	 lK4xu78HEzDANvldwckPovH4NdRYU0vQBd1ET4Vc9ItOdp9+PuXj1ZjBG3Pd8Nc9QIk5p
	 BghnSG4mPop6mjQsFhCa7j+A9WSwVrT/JUXz8k/YlEwGomfYXbPXNFRTAxOppo5w+q3qr
	 NNLoecPQt1rlUQ+yTBXmTuyJzOupUMsbSNWAe+tWinywof5s4mmpCiIS3+7nu/RV/3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790953969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rpfI5sae6yXlSmUgcRU2Doa2v2kngtHmmXsnddLQBNg=;
	b=YKmRtYAXRvgnnpL1mS8WKfOMnufUSdeMAVVCAWhBqw8dQc29Pz8zZZXiPVxk9kY1AoL6
	 QHdjCegW1TDM9T6HoTdQC2UWvnrGrFLcDaKi9XTfAxZFh7d56vHxO0fRrWxdGIyBsSQ5X
	 NHCJaqG2380FM8umfmdWcJHMwWqgAYBVcYoEoA2QloPr/mDFLVU44Tz5a8L95g048mJoM
	 mmecATEuKxBgX7SmDho5E4jsh8b61G60ljV1b7e0kwZXbDM5yaMkS+ezeEvLlVHA1JqZ/
	 MJkqjAGPsqOO1+415biYluhAmYOxRJnXFyv6pBFynp/u1VhY79wsVms9t4zvZGzw6eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790953969;
	bh=rpfI5sae6yXlSmUgcRU2Doa2v2kngtHmmXsnddLQBNg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IGwknOH3Vtau73TmlGMGwIzaLbg5qv/Ch5WBKyT+aayVr0x+aN6f6xpWrQiW3NPSn
	 EYLwu5ZAeJy1tpn+TBBSJYMpOVhP3rp8Vmp147aNIlxBw3b5JrdagCZzkFnvtPn0Yb
	 cnDN5D0pr38cx+p3prGGaKIT2WGqyXttKOMmCYfe+dLj2WdvkRLt1cPy/N7nth3bnz
	 nuYfH3NipqtAeMNQ5v7Rb5YG2mmMvRwAiWRNTNBrww3CLu8RsYRhM6odpIaXm22y2R
	 xUc9Sv4pbDaYSDlbM5XUE6jJAymq/ojRcrt6CMyhRD600al2k9YKW/v5hT/us+2j00
	 U+sZeKtvRHXdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3206F40A27;
	Fri,  2 Oct 2026 15:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF0D8435
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0582400AD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrzxFnzyEFST for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 15:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0FEB84004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790953964;
 b=iDxkolwmhvLHrNlm1p9llrQzLkmjkDNANJUfHR2pNYPY2xd0yEinNxMTx1fc6E+6eM2+
 84SxjRVsKQRlwOGcb7eOydrCb/9KVOdztTuC38LaWKY6efXObHXeWbXmZh0+3Bm/P9dvL
 ooN3YyUbSaUZuFOwxTsEUNZqcjVM5n6ba46AbMIMrgTssMQaq4p1zkjVuQU8Cohi8uB6w
 6CJHD8coTiPivwpE04hOtQzdQiPEC1qLAlm27dgLXALDFn6BF7fLp/qpS6gdIVw/b+LE/
 vmw5Jxm/VgThRS0QIGkywN2TWh16VzygwEZz5jTB5byJESQpg0wiHBtNltBGUTQjxgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790953964;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ER4v0CBxFmntOeZhjxtrK+TOa3FUWqBdkJSoqdtpXHU=;
 b=ewptE9i5k5L/FCcqyt9QABDKFHEr4Nq+0IWiUZTBfxu9H+VK0p2uQ81P/EvzVPWOmdYB
 NH3uJl6jitc5x0G/CIB5QS2ceXD3macxK1RzhEa8lzLNOHlb5rkjlc00tb9wauci+STZE
 dLPLs5todqd9bBwFyKlRrEYFhRqaDpbW8AiD95ein3wk6VjieY1/CfAI2mCpklGP2lrMn
 9487vvLVyO6Pyo3PBgWwTPrKbciO5DDx8VSJWCqG0kQ6y3QE6HdinYjYSqmU5pUYOXtMa
 51UIwwf8TNuV0JT93cJrFb8/ph1hWPUKY6FP3uXw0/Nm10nlvtH/JEKJyQO0kY4muIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=VK8rNGxI; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FEB84004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1xKsNn1cO2-00Yb3g; Fri, 02
 Oct 2026 17:12:41 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  2 Oct 2026 17:12:23 +0200
Message-ID: <20261002151226.867507-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:R/QKu5rnJ5sU801UopAInnnhhBcBhEY1cm4/wL3x9RdG/9a/IYd
 yo2xrWK1E8TLtJLI0NatXxd0yO2UD9Nw3Av1+D0QAEn0VT+3DVKgEzxEjahg3acR6mRS1L4
 mmyg8FqCRp6AYicEkjx7eSPCKot4r9I+/5SeKFV+HiQZohRFcdgVaih9UzZ0CEegWttN5wA
 ODfyyu3FYS3sElUO+zyDA==
UI-OutboundReport: notjunk:1;M01:P0:SG+AxTcHOCs=;Pg8CnbhP7gDyJxpVjzvUvwzYo7t
 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
Subject: [Buildroot] [PATCH 0/3] Bootstrap package for libudev to fix
 device-mapper rules
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

this series adds a bootstrap package for libudev from systemd. The
reason is that some packages that may be in the dependency chain of
systemd (depending on configuration) depend on libudev, at least for
optional features.

An example is lvm2: It needs libudev to allow using udev's built-in
"blkid" implementation instead of calling "blkid -o udev", which
Busybox's blkid does not support. The issue I saw with Busybox blkid
is that systemd never considered device-mapper block devices as ready
(seen with dm-crypt and dm-verity). Setting
BR2_PACKAGE_UTIL_LINUX_BINARIES=y is a workaround, but shouldn't be
needed when udev has a built-in for that purpose.

Unfortunately adding a dependency on libudev to lvm2 creates a
dependency loop if cryptsetup is also enabled: lvm2 -> systemd
(libudev) -> cryptsetup -> lvm2 (libdevmapper). The bootstrap package
breaks the loop by providing libudev from a build with minimal
options, so lvm2 can be built before systemd. The library used at
runtime is still provided by the main systemd package.

That said, the new systemd-libudev package could relatively easily be
extended to also provide a standalone version of systemd-udevd
together with libudev, as an alternative to long-unmaintained eudev
for non-systemd builds.

A combined package for bootstrap and standalone systemd-udevd would
avoid duplication of most options and variables from systemd, at the
cost of complexity in the package makefile. The main point I see in
favor of a separate package is that it could be updated independently
from systemd. I'd appreciate opinions on what's the better option and
why. If a combined package is preferred, I'd want to rename
systemd-libudev to systemd-udev before merge. :-)

Best regards,
Fiona

Fiona Klute (othermo GmbH) (3):
  package/systemd/systemd-libudev: new bootstrap subpackage
  package/lvm2: set unconditional dependency with "=", not "+="
  package/lvm2: depend on libudev if enabled

 package/lvm2/lvm2.mk                          |   5 +-
 package/systemd/Config.in                     |   7 +-
 package/systemd/systemd-libudev/Config.in     |  21 ++
 .../systemd-libudev/systemd-libudev.hash      |   1 +
 .../systemd-libudev/systemd-libudev.mk        | 195 ++++++++++++++++++
 package/systemd/systemd.mk                    |  11 +-
 6 files changed, 232 insertions(+), 8 deletions(-)
 create mode 100644 package/systemd/systemd-libudev/Config.in
 create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
 create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
