Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19591606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zd1oUfwB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB286606C2;
	Fri, 20 Nov 2026 01:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp4HhE75kNin; Fri, 20 Nov 2026 01:41:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1C8B60D98
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795138915;
	b=ZViVuL0gmBHVVPhjHVPEtwuu7B/Kem14mxfAU/M6PGYEC3cPBes0G2J5O7+nSFxqt5AL
	 YPZnKhGBfHFC/DFwDBYVJFAdWZQ/Mf6G6xSIb1oq0DF1keLsOr3pQSESnSZGqZhKeiI3C
	 is14OfLKAaPVuFkegCIA+Zm86Hq2M8GMkDRIbpDndNc/JXuG2pdGP9QcYxsoEWjUpLKk8
	 pOas1BBBU0BqOsFoPEsim+2pcRT2cZQ6G7LaV3HWNwfnzFw949+xal3iWR+MfsGA2O8+E
	 V5zvsnk9YGfy3tRwVLqpxtSSYrS5guKbRc2cGQDGWkXGyocxpV0PXAr7m6Z/jQty8Wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795138915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AmET0WrBr8OBX8aN7VcZB9jbRtqS2SWh5GA2wRAYIHQ=;
	b=U814sks4DzfTCIX3VJoHFLikzt//mbKCs4ipnW/uFBIA1T6G2GKTH56HnubHTs0//6z6
	 33qliziQ+LPJuoPF2uufDqTuQPkkR5QBnOjdYi8vGkvlVlkLNmwN2eLxJyf9jaXbFet7S
	 eV02LjDHpZt5nXHrvz72fAWmH0GQck6kHyIebm+WBEDUonXHozAeMrsw5oHOOjl79YGJN
	 fP75yUtVjzH819SF3Al/FNwdRZ4VTS+98uhnrNrVVLXR/Vfs9ULAnL5sZIUDkjRPp1JDa
	 QQYH/Euo+4ey02YXF+evpPEXD9VwgZr2nm6+CbY/pKQ1LkaLu7X0w2ciQOvrcJakzkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795138915;
	bh=AmET0WrBr8OBX8aN7VcZB9jbRtqS2SWh5GA2wRAYIHQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zd1oUfwBR0x7MiVda4igiwWYjdjv56dAUgI6nbljM3XL62L5yxuEWpCebBuajEsbb
	 CDxnSPvQJ2rNMK1jOxaKB6A6v45hOMmjQDP7DhgE6VdjKQgZutWdPCjaJ06QXVK/n+
	 vT6dlfKyVAxlBv0iL1pl8IV/j9JzI5AljzL+gz+5l71/jMIZX506LpLyQvLXk0ALMR
	 6s5/2i2jZbE8GGYsLbpiG4a8K8sf7QhNkn8QrSO00hB+df6Rrnc5QeHYn9t7/K6ghG
	 b4IOHqVqOoLjHl4iFhksXuaeAzj1ezgxNqItaZnMjayMU9JwtPeeCD/VZv0f/wnlEs
	 wDKWs4Q1ip/Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C8B60D98;
	Fri, 20 Nov 2026 01:41:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 543F3260
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3643E401AE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsGYaosMaNNC for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 01:41:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E766540087
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E766540087
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:41:52 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2F0A92C84ABB;
 Fri, 20 Nov 2026 02:41:50 +0100 (CET)
Message-ID: <7053bf0b-a732-48e5-b0d3-1ac5a6e31a39@bubu1.eu>
Date: Fri, 20 Nov 2026 02:41:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>
References: <20261120000714.490935-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261120000714.490935-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_usbip: fix with
 eudev 3.2.15
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
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fiona,

I looked into the root cause here and have a few suggestions.

On 11/20/26 01:07, Fiona Klute via buildroot wrote:
> Since the update to eudev 3.2.15 the QEMU USB keyboard and mouse both
> show up as "QEMU Tablet" in lsusb output due to hwdb changes [1],

This sounded confusing and like something was going wrong somewhere. But 
as far as I understand the reason behind this is:

* qemu uses the same usb vendor + product id for emulated mouse, 
keyboard and tablet, just exposing a different a device descriptor.
* lsusb resolves vid/pid against hwdb, and if that lookup fails, falls 
back to the device descriptor. This was happening in the previous eudev 
release, i.e. the test was matching against the fallback.
* the commit at [1] merged a hwdb update that now includes the mapping 
of the qemu vid/pid -> QEMU Tablet. Which is not wrong... but also not 
exactly helpful, if the underlying device is a keyboard. :D

> causing the test to fail because it expects to find exactly one
> keyboard initially. Remove the unused USB mouse, and adjust the test
> to work with the remaining "QEMU Tablet" device.

To make this less confusing we could attach the qemu tablet device 
instead of the keyboard device? `-device usb-tablet`

But also maybe we want to skip matching by name at all and match only 
vid/pid instead (0627:0001)? It's very unlikely that qemu will ever 
change that at this point, but if the hwdb entry name changes or lsusb 
changes it's lookup path to somehow show the device descriptor for this 
again, this test would fail again. Not the most pressing issue though. 
:shrug:

> 
> [1] https://github.com/eudev-project/eudev/commit/27542cfe3c5f0f9e71d9e3be1f9430d00d7c8551
> 
> Fixes: f6c2c6a086ae1a5857f99514324ebf4038dab31a ("package/eudev: bump version to 3.2.15")
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
[...]
>   
> -        # We bind the first device (USB Keyboard)
> +        # We bind the first device (USB Tablet)
>           self.assertRunOk("usbip bind --busid=1-1")
>   
>           # We list the remote devices. We should see our exported

This is not in the diff, but on line 82 there's another stale reference 
to keyboard.

> @@ -88,16 +88,15 @@ class TestUsbIp(infra.basetest.BRTest):

[...]


Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
