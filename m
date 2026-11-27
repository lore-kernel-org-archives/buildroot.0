Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017E606A32E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rbD46YtK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E6B408B5;
	Fri, 27 Nov 2026 02:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arrzjyKXbeqj; Fri, 27 Nov 2026 02:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2251140898
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795747802;
	b=r4Bwp5UWJswQmoZRvN164canpnXI+KpxC2f1X1S71Mg071B8Zm6nUQdUJbvw0TwY/nq3
	 4tMGQN1js3DyRSk+QEQyuHDOk4qx56xsajIfGKKnV6gP/FK9VBMsKahbdX4CL9Q7IqnNU
	 iJcUMNONeFaTlKoDwkH0epkAEcR/GJDftjKK779ubFJ4+w/yT/uFTIqYNJVni2zGc6G3W
	 eceQmeMHNZw+DmDEchp9FiB0rNxff83+peYXf9LDpI2y3HfEdNyvrzynFWc3PXtMODXBE
	 eFoNfuhMG7ZRraaiBchsrr6/QOgY5X6K1YuwkH76QPYRkxITmMXFnZttKO7fKzukPyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795747802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=X1Ic0I+ZDqY4XrxgHV6MtAds9znudyXnEULi6NWLm+Q=;
	b=XYUwlnSEwLPd5OJ0D3lVTxRtsbW10HaQdG6pHFBTJpBgl3Zv+mO+nOoM+yA5K6t3VKxH
	 dPtUpKj55HIqhXi8U7F0sLZZgiCY76TvUnb2Hm9+QaEHI+4ZvnX06tUAoBMLsUklh6YLb
	 8JvuvQUbG+5maD2nuryNq6RQ5qUtULH+d37bHkL0RSAE/z/AnHZUgPdOhc3KZqo1QmOdb
	 wtNJyaV2dQgTOtv4mIi5yzxXy6L8l4YPbd+EmSNrWyRsXiwDW3zM/r/jemOx0cdgYSMNn
	 9rUR1VJoNzV6+4QO5N1/0W8pgjmqkXNJxIJxrRRZWIfZAaVAn16TVvCQra6e1MNH5Vw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795747802;
	bh=X1Ic0I+ZDqY4XrxgHV6MtAds9znudyXnEULi6NWLm+Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rbD46YtKt+ED0mCmtM871zk/h8u6J6tmSZe2vMZKAO81maxkgbHiXQrPr3WYgu1aV
	 vJta1V1NtHxy0s4EdMSwCKYD0r8b8w4lasg5H2PmZMXTFVlFlZps6BWf7X/NwCOUPn
	 9i3ry8VVu/0sWDQyfXAJb5Ss8dnVfpgKRx4hajBK2eKGL7nknq6aodXsH4XIWfjK9p
	 Ql+XCmRkFao8TmuabKw4Cls7b4IUwIRXNbTvOWSUoOi0xMzNSAHtLJLbn6DZb4trOE
	 tiQl2bTMGrPsP5DYKZxYthxvHdFozIvZW5MZmQfagr2wnDJ2I09BgFUabp7pyy/3FI
	 LyolTGOMq53CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2251140898;
	Fri, 27 Nov 2026 02:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7263C0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 02:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD44811A8
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 02:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPPcMJgc3rXE for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 02:49:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CFD07811A5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFD07811A5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 02:49:58 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8AAD12C84FE8;
 Fri, 27 Nov 2026 03:49:55 +0100 (CET)
Message-ID: <a2643476-4921-4bcd-97c6-92bff9a71347@bubu1.eu>
Date: Fri, 27 Nov 2026 03:49:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
 <20261126192435.1826415-10-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261126192435.1826415-10-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 09/10] package/dracut: install components
 for systemd exitrd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fiona,

this review got a bit longer, because I both learned something new here 
and had trouble understanding how the dracut implementation of this is 
supposed to work. I think on the buildroot side we mostly want docs + 
maybe a test covering this functionality. But there's a bunch of 
conceptual discussion below (I dug all of this up now, so I might as 
well share it :)).

On 11/26/26 20:24, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> With systemd, dracut can optionally restore the initramfs during
> shutdown, e.g. so the rootfs can be cleanly unmounted and
> device-mapper devices closed. Systemd calls this an
> "exitrd". 

TIL, interesting!

> dracut-shutdown.service will prepare the exitrd if
> /run/initramfs/.need_shutdown exists during shutdown.
> 
> Install the required tools and systemd units if BR2_INIT_SYSTEMD=y.

I dislike the dracut implementation for providing the exitrd, unless I 
missed something fundamental in how it's supposed to work.

As far as I understood it requires the initramfs file to be discoverable 
(see [1] and [2]) at shutdown time for this feature to work. That is 
normally not how you want to boot a modern/secure system, where you'd 
normally want the initramfs loaded from a UKI or FIT image. So you 
either need to redesign your boot workflow around hashing/measuring 
(into the TPM?) a plain initrd file or you install an additional copy 
(that you don't actually boot from) into your /boot?

Do you have a concrete setup/usecase where this works? Do you think it 
makes sense documenting the requirements here and/or including a test 
that exercises this functionality end-to-end?

I then was curious at what archlinux actually does with mkinitcpio. 
There's actually two different variants (systemd vs bysubox initramfs) 
and I think both are conceptually better than what dracut does:
* The systemd case especially is also far, far simpler: Before shutdown 
a new minmal initramfs is assembled just containing libmount and the 
systemd-shutdown binary from the running systemd into /run/ramfs and 
that's used for final shutdown. systemd-shutdown handles all the actual 
fs teardown. This means you always have everything you need for clean 
shutdown in the rootfs, at the correct version and only mount a tiny 
tmpfs, not the full initramfs for shutdown.
* The non-systemd case is a bunch of shell logic for unmounting stuff 
(meh) but it does still avoid the need for the initramfs at shutdown by 
copying the contents of it during boot into a location it will be used 
from during shutdown.

[1] 
https://github.com/dracut-ng/dracut/blob/113/dracut-initramfs-restore.sh#L16-L51
[2] 
https://github.com/dracut-ng/dracut/blob/113/dracut-initramfs-restore.sh#L64-L72

> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
