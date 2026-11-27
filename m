Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBECE606A324
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kWARFaDd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=h6F/N/5F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D77A40A2E;
	Fri, 27 Nov 2026 12:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y19ZugEHrQ0y; Fri, 27 Nov 2026 12:39:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A231740A30
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795783142;
	b=Qs95zDmoO7xECaQYSMRmm7jnHNnr3PQWaouUvY8gpTpFO+sf9aYvDP96bzNmAjE7MxFD
	 LFBXJotTzOEq7VMg3BFI2+HCA9qOs9dAoQ3McHgmkgH33MWr9AqRvEuo62nbaD9ltAmB+
	 H72AFeOOnt2x8aQ+GpbKnp3smT9E9XPK+YCy0OvgPe9rAPUzlcA+skd7FGQC/+cUUoJrh
	 ONj4Vn8y7VdflZapoFqCxJu9Tjhz4d/KJXUYRChkchubKR7eG/Y4Ju5tLSkQ/1z/mIGam
	 b4/pvsJ5Wx/ndxc1sneedVdbrhJXaoiWQl2ijayZOjDyc/BMGxvesMiLsuSw774XrTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795783142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bcHnHmAWXWmDZrZrOY2V7oY9vavWlvaJWQpd70y89rY=;
	b=Rj9sa4ZYmm56n7xy4icin1oJNIpqPfl75zVRsPSgr1u/NwKVyUq7WY7RaB4aIkEV+ymL
	 AQZU1b287HNdbZraAaP1Y661Y7g/W8H5fcC5zHKSrmgpLmRXWHNDpChCbYaF0ltOyT+1W
	 um0xPjz7VXkeuGwI3mYSnfBFg8aJ1j1ksStmC1WRDaTqJQUTUYbv5zcNupNErdSMLekQo
	 AfF6xRQ5q4dbjF1hViZBLmLMk3cUQVwRFt7pE4l47z/raC4kPMOQRgTgqvA3VgbdBC17i
	 H9YOx3XH9xJgdJegpzKzCYEex681WBismH/PaHVZU1r1uczpDxHXvLR4w8Dw1vhBUdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795783142;
	bh=bcHnHmAWXWmDZrZrOY2V7oY9vavWlvaJWQpd70y89rY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kWARFaDd//3EAyt+8nVo0i0Se6cebDf+sujRtKMuohRT8Fzlm3Efdq0EUM3jV+C7r
	 uuKfAwtG87JnM7jkTBluM2mJWLM6MpKa0BkCDl2qDjhHsjMQHf1xsqVZiViqcyZhNT
	 EVKFwIePY6vumZTbMxj0mE7Pj5IYFSZSucfjTZmt+pIdI0rUtpUa6KI4LC49hFlniu
	 6iRRLkxfyvQ09P10bZOOtz+4+C9hXDudgLEr4wNdBHF25E9Yess+1dt6i4Kt0ETDal
	 ZQj2xI7E1nY8sDMgsQi+yRkXfED+NpUGAwE/8/lcy9FdgmN7umZOs28jDHcuGkiGj2
	 uHwgVD4Hpi6Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A231740A30;
	Fri, 27 Nov 2026 12:39:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 833492DF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7220E40572
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VatbKgasTC9r for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 12:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1C8264004D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=h6F/N/5F
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C8264004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:54 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WvE3xMYVxV5J9WvE3xjmcP; Fri, 27 Nov 2026 13:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795783132; bh=6hBSB/cSUXLR7oPeavZapors/crwPFAWgt1VuFtBJoE=;
 h=From:To:Subject:Date:MIME-Version;
 b=h6F/N/5FqOdUCEPjPuw5dw5nz5ra3p6ev9XXg6cEktTfZHp/3O/3ZLpnwTWmpt4Kn
 wQVOTRnnZ2O5UaISlvYJuD6DIJUimPT1QSP9FOwEOAn0sdxuUqntK0RqQKSl83KtVL
 vmj+Wb7ZVqfxeJTmn7CAsn/MGxXmQfXLDJfKUI9ACrmasYot57F/CejbUsAqWe/wKA
 z/E2cDVoyar/SmIaIuKe8a4yWQRT1I4TTugvkMxDlwwbczK8ZJSNte6WC1CLufJuJd
 8eBco4gN9uxC4wdYppttHa3zSVeBx7dVxOkCophefECnpdIiO/9UjQHAZpRELD9iXk
 2oG45BOJsj7hg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Nov 2026 13:38:47 +0100
Message-ID: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEaoEdNhIYao+QtkVetUB6eEZgjoXCDcBx+fkFMv6b6dnoKqemn8xDMIbtiMhRSzIvRintO8xonllswkE68RxjpipXiHd1neu98wEJTZhnKVn0KYU3sf
 DLx/VdM9eOgmYSI6e8rcchqusoL3t3/DKwL/vpvB7kQkvTjzY1rkAmFWSZnfKz8oidmAWgWIizuEdo0WyglAxifbpthTnOmwL4JQ6SuKYdFO4/PUf/Z2vSc2
 /u6x+oLMsa4s6TibY+siBglVo64QZfJtgcsfGxryVGs0U2DYJgOJmtZF9UDcN43QIV/mqFdXR2jZpbP15b1z4t5myZG7XTMQPEIfAQFeEEg=
Subject: [Buildroot] [PATCH v5 0/4] Add the .NET 11 runtime,
 pre-built and built from source
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
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the .NET runtime, to execute .NET applications, as a
dotnet-runtime virtual package with two providers, like for rust and go:

- dotnet-runtime-bin (patches 1-2): the pre-built runtime provided by
  Microsoft. This is v5 of the series previously sent as
  dotnet-runtime-prebuilt (v1-v3) and dotnet-runtime-bin (v4). As
  Arnout suggested in his review of v3, it can be merged first.
- dotnet-runtime-src (patches 3-4): the native parts of the runtime
  (CoreCLR, the native libraries and the hosts) built from source with
  CMake, and the managed libraries from the official release. It
  replaces the dotnet6-runtime RFC.

Only .NET 11 is supported. 8.0 is end of life, and 10.0 (LTS) is
supported until November 2028 like 11.0 (STS): the applications built
for 10.0 run on 11.0 with the Major roll forward policy, as the help
text tells. See the discussion with the .NET maintainers in
https://github.com/dotnet/runtime/pull/138021.

aarch64, ARMv7-A hard-float (at least VFPv3-D16) and x86_64 are
supported, with glibc and musl. ICU, OpenSSL and Kerberos, that the
runtime only loads when an application needs them, are options of the
dotnet-runtime package, enabled by default.

Building from source with GCC needed two fixes of the ARM assembly,
submitted upstream: the first one is merged in main, and both are
submitted for release/11.0 in
https://github.com/dotnet/runtime/pull/138374.

The runtime test checks, on the 6 combinations of architecture and C
library and for both variants, that the dotnet host is in the PATH and
finds the runtime, the RID it reports, and that the libraries loaded at
runtime are installed. All 12 tests pass.

The detailed changes are in each patch.

Giulio Benetti (4):
  package/dotnet-runtime-bin: new package
  support/testing: add dotnet-runtime runtime test
  package/dotnet-runtime-src: new package
  support/testing: test_dotnet_runtime: add source variants

 DEVELOPERS                                    |   4 +
 package/Config.in                             |   1 +
 .../dotnet-runtime-bin.hash                   |  10 +
 .../dotnet-runtime-bin/dotnet-runtime-bin.mk  |  43 +++
 ...ix-WriteBarriers.S-build-with-GNU-as.patch |  52 ++++
 ...m-Avoid-text-relocations-with-GNU-as.patch |  70 +++++
 .../dotnet-runtime-src.hash                   |  11 +
 .../dotnet-runtime-src/dotnet-runtime-src.mk  | 204 +++++++++++++++
 package/dotnet-runtime/Config.in              | 129 +++++++++
 package/dotnet-runtime/dotnet-runtime.mk      |   7 +
 .../tests/package/test_dotnet_runtime.py      | 247 ++++++++++++++++++
 11 files changed, 778 insertions(+)
 create mode 100644 package/dotnet-runtime-bin/dotnet-runtime-bin.hash
 create mode 100644 package/dotnet-runtime-bin/dotnet-runtime-bin.mk
 create mode 100644 package/dotnet-runtime-src/0001-CoreCLR-runtime-arm-Fix-WriteBarriers.S-build-with-GNU-as.patch
 create mode 100644 package/dotnet-runtime-src/0002-CoreCLR-vm-arm-Avoid-text-relocations-with-GNU-as.patch
 create mode 100644 package/dotnet-runtime-src/dotnet-runtime-src.hash
 create mode 100644 package/dotnet-runtime-src/dotnet-runtime-src.mk
 create mode 100644 package/dotnet-runtime/Config.in
 create mode 100644 package/dotnet-runtime/dotnet-runtime.mk
 create mode 100644 support/testing/tests/package/test_dotnet_runtime.py

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
