Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD2CD26D9D
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB6B60F39;
	Fri,  9 Jan 2026 21:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0VTtIQ3PHBt; Fri,  9 Jan 2026 21:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14E8060F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767994357;
	bh=lIuEAcnhCEey4iwGbLMKc4W0i68AT4EXOtiCqnmTyKk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j+BfSjLiUFQO413wRfzLeY58b+nIPHIKHp2AJ8zOQ3B/n1gjtNlYrj850RD1nK+vn
	 ET42f5A12yR8ZqYW9MvTAyTSBlX5MEg6y5qhtQJq8xDvlWvR9JZ0PbyIEO6etg9rF6
	 Z+2o+i2NbuoViA591jOvZlSimqj8sq+ZIghFCNplImMGlzpa+YOQvilaK5Qy/5OK0K
	 EF1VvgQeIR9keCxvIgEkiwUKwGValZ12675ZI9g32V1V2eA2ESF/LIf5RAViEJON9N
	 oVrac85BlXwL6/yCalAYO3JFLgkwntHOIWK2R661h0bdZuHnAf7tMXYc/v4o/i737H
	 cK9ZgDzaI8/tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E8060F26;
	Fri,  9 Jan 2026 21:32:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8473E131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 762B060F26
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0rudCJs0vYc for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 21:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6765E60F1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6765E60F1F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6765E60F1F
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:32:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5618019F5B2;
 Fri,  9 Jan 2026 22:32:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 22:32:28 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 22:32:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20260103190259.1904724-1-bernd@kuhls.net>
References: <20260103190259.1904724-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <8904d464ad7b4b0e0bb3854a2196bbfc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767994351;
 bh=L9M/bbm+yuk85rGhKxmKjlZTXWWl5gdv6u+8Iyc5a1Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dprRNhhRJ2vz4RJdolbJXzwh02enA8NUWiet7y8B8WBUHceJgPSWxLEUM2rJSbD7h
 v4kqGVcsIiloWeL7/EQaTbZG/1F/H8AXKkm4vOz24zHLN+0uVUtoBYRcZtMskEB87V
 kj/NpjcGZJQByyrwFM9Kb36ru/IH9cHIw+RtFM5+jnysqmfKntrc6Lx8g5Prqphg8o
 txqU4KmE6J+njAyyIpSiE6mwQMpzuGnTxjJN4Tdz6PlS1N69GN9NlMvo0EhbgzaCw1
 6lKAxjnv/G7aLulNwg0FTJbDg9kvUblHYxZDNIr8dSgkY5dbZ8ie/NTye/xLoGJTR+
 vuaVP9nGMIYrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dprRNhhR
Subject: Re: [Buildroot] [PATCH 1/2] package/bitcoin: broken on m68k
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2026 20:02, Bernd Kuhls wrote:
> Buildroot commit a3a88ff1c85ba0067af1028bc232f8f61b628979 bumped 
> bitcoin
> to version 26.0 which includes upstream commit
> https://github.com/bitcoin/bitcoin/commit/b8401c3281978beed6198b2f9782b6a8dd35cbd7
> causing an assertion on m68k:
> 
> /home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
>  error: static assertion failed: Units of size ELEM_SIZE_ALIGN need to
>  be able to store a ListNode
>    92 |     static_assert(sizeof(ListNode) <= ELEM_ALIGN_BYTES, "Units
>       |                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>  of size ELEM_SIZE_ALIGN need to be able to store a ListNode");
> 
> /home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
>  note: the comparison reduces to '(4 <= 2)'
> 
> To fix the problem we disable bitcoin on m68k.
> 
> Fixes:
> 30.0: 
> https://autobuild.buildroot.net/results/268/2688e4a2aa8dc34343f0218fd6727d0ae3adb132/
> 26.0: 
> https://autobuild.buildroot.net/results/fb0/fb05401c7de289e0f87f5c9e3a7f92f5589b590b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch (only) on master, thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
