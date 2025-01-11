Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D48E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F6F80D99;
	Sat, 11 Jan 2025 13:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36N9d8Sxxz3x; Sat, 11 Jan 2025 13:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F8C80D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F8C80D5E;
	Sat, 11 Jan 2025 13:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB928942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C977180D44
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7XdGMSnzmom for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50D4C80D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D4C80D5B
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50D4C80D5B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:33:11 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id B01A7240DF7
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:33:09 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id 91F5D2600AF
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:33:09 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 5A49C240C95
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:33:09 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 14:32:05 +0100
Message-ID: <6118780.lOV4Wx5bFT@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2221
X-purgate-ID: 154282::1736602389-48F732C4-BD7E8F73/2/62172712687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1736602389;
 bh=2A8u4X4j2R+gSB7cvqbdpWm1YxjilH+YN9ILu1Ti8CA=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=PCNqn4X2FPAv57pgwlFXmbmT45EEKH4iO/L++FlLShrOTkGgR3fUuj5F4fLem+G/m
 xFEeAo9XBqrzprNwfAasHbQ+EFt50Z3hE6EbLIjag8KVWC2Sg91rqs92VeRZavTduq
 g2tx2M3pIquJwK9182HbqKjfGvCM8Ve7Jt/AtkrYdWtQMZXoSU1bee1VxcY1nWKv4o
 DoQrzH5hMJhqL3cqaCMyg3+Yy2RsqwgtuTZRwDCfo3kDPcciQRv/XjAIpxrMzQmfod
 QxiCYyNBwgQBKyfj5G+tIhaTj2rsx5Tq8eewrJFjlWe6bmENnGD3dnWKITMo9zzLbq
 C7gsyt7jro4DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=PCNqn4X2
Subject: [Buildroot] [Help] Using an external toolchain
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'd like to use an external toolchain, to speedup building my images.
Buildroot supports this and also has a subsection (6.1.2) about this in the
manual [1]. However, I was not able to straight forward set up using an
external bootlin toolchain from the manual. I.e., I wanted to set up the
easiest way, i.e., to use a predefined external toolchain profile. Hence, I
set:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y

However, with only these settings, I get errors, e.g., that the headers are
not correct (2.6 in opposite to 5.4). Therefore, step by step, I add more
options:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
BR2_TOOLCHAIN_EXTERNAL_GCC_13=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_OPENMP=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/
toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--
stable-2024.05-1.tar.xz"

With all these options, I can then use the bootlin toolchain. However, I am
not so sure, whether this is correct this way?  In
toolchain-external-bootlin/Config.in.options there are a lot of options
already set, e.g., BR2_TOOLCHAIN_HAS_OPENMP, so I think that maybe I should
not have to manually set this? So maybe I am doing something wrong here? Any
help appreciated!

I also believe to remember, that in the past I saw some protocol/log from last
year's buildroot developer meeting, and I believe to remember that it
encouraged using external toolchains for board supports - but I can be wrong
about this. I also don't find that protocol anymore, does it still exist
somewhere? And what is the current best practise for external toolchains and
board supports? I.e., when contributing a new board support, may that board
support use an external toolchain?

Thanks and best regards,
Kilian


[1] https://buildroot.org/downloads/manual/
manual.html#_cross_compilation_toolchain


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
