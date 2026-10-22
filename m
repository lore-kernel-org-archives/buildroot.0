Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF61606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Txv1jzO6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F49811CB;
	Thu, 22 Oct 2026 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kFmQqNPEy5v; Thu, 22 Oct 2026 21:04:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2670D80D80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703043;
	b=LFCd1VsN9P9shi6sVePgQwinxDbjBMBysyDtmqIPBm+ClLZASk2i1EZ5JyO7Itn6fsEd
	 HDaes9lZgMe6tbex0es4n0a6jTcLbQytNvH7wiT03I7SEQvvsb3WBU0xXDJazY+6TDyLF
	 qTneV3hqqgQTgmwRwLDaNRCvk33kAdJX02pmJ74FJsmjG63PDiXLqv6D26VvoX1CZ1VoE
	 5nYHbjohORlw7pm64wRLoclSQcn/ExjejEQ8nZf8VH0gvav7at0LKcDb7IBtZVwQTpfSN
	 MKoDLvGGLqWU5XrIXLpQOuLjXLDUhXgglhvQw8s+hOOxtc6ff99NLFId1UkaUY9bTDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6x28jsxSRJfEzcq7IwJk9KmOaIJiAv3AdzLDM3swzFg=;
	b=NDPo/aoGE014AQP+9lXfD8xeh1ep7P0R1jpDg2dREV9J9Bbs2X1aYn6gBnLFTTEKACs2
	 Ix/Rvgnou/eVJhUKqVx3GIftAWszhe/5SiLZ/idwWgvULExUFqHZsz3bxhr/QtM6XBZKq
	 DsEHOMn0y4fWL+YURVd+DBrCrU8pXdEM83QGvrxsC/ywvXSk6duZA5ytAPeVSZxArMc9s
	 jKvRsxV0nR9MeAd7pPJTvAFF8KMa3ARjfMeRh5Xqv4z04B2MZOGotsnnX2hR5gGRtxsBw
	 NBbeXuWijFWUqkjR4opQQ0QJuJnssmpcLGr5tTOYSt3CMHg0Y8MSzUFiFvKyevoyLzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703043;
	bh=6x28jsxSRJfEzcq7IwJk9KmOaIJiAv3AdzLDM3swzFg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Txv1jzO6QX2gHXQ9GfY15oKRRix5nGnF/Ci+sFxPhha51qO2IoYEIGbp3S/qoPVS0
	 1Hu2qh6Jeb+fAyp7Q8S22MMiV9mDqK/2IuuQAtii9n6UtznNMezUoQwooL4Zu36ai6
	 JLWRKGlQHzYuA2zlZ0oF/zmKncCyiZqxh3Xpj9rzXpprQxZ6/AwPGMshXqfSDRFNp9
	 sARoqKwZ+G8nXECNDHtpUCSuFfTHHgpmf5bbdeI4KT3H+yIrlTk0NAN6Bdkj78CtLj
	 PzPd7Br8xARX9uJrOIaKQiAFhsB4zQycKPqrPx35EW23B9sIit/2SgDkpz+UP5Y01K
	 nThSJcktL9T5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2670D80D80;
	Thu, 22 Oct 2026 21:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6FEB3C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9235401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xwv4BrDviPB for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:04:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4771C401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703040;
 b=lNRxrIdueOpgkD8joTfnVJ1Y5os7udp3setI+ivb0jJUI0+ApPT/dKQcH/ClMJkyRtWg
 AYS69+Ld1umNeAYV5qIrk/wGng3FaA2vOLepdP9AZmHvyEz7QXp0TXi0bpDpS4t3xJE6i
 pQ8lklq9sBNjzrDxw2WYQePDgRIguo2Gkh76T4/qW+MSwpt3b3qCVqrTWY5FMac6139Xh
 /Oz40VtNC851KG40ZmQtJ7KvsF6z3uFjHkHsE0lFIoxfJXHmGv5qWs6Oc44jXNy3EKcPC
 imzAfosBrqZwqTFq7gq6G/EJul+zdNpFMiO9k9y2yg1Qa5QTRY28+igpfSV1cE/gS9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703040;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bIyZTUjvfQgRroWiBe+nGy29TLbn4nQiF9gSOxReIyI=;
 b=XbJdKQVMw1GAV4AKTofbGypaIVSJd+k6E6FX5WH/MrPOtdIY6Ni0zmO7FbuWyIgju7Zc
 DRD8fEHpQzzqau3hOHHRvW/+kn7obdhdSm/hiJZW7jkv3ttX2otj8EI3JK0QSzw349Zpy
 /8FjWa+YugVQfcBaJL29FoVQDlyqlgZPI++KMxiZ6lnjXp6N8gXWNuoo2CQhJ6QCoPkVj
 T5Bqe7UB6DW708ghs4hX/KfFEOj2mc+/xvoQuoWzvQSkG/P2cvNcH3nn4A539Rc1z5xSh
 vJGmufglJuTrEZfUR4rx91Y7UViF74k+PeG7D4ZZqOtQRjhcL0G5g2xZbBXQmsTVRdQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xliSHiLH; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4771C401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:03:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B521C1A12D5;
 Thu, 22 Oct 2026 21:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F77060763;
 Thu, 22 Oct 2026 21:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9C56103281B0; 
 Thu, 22 Oct 2026 23:03:51 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:03:50 +0200
To: Aaron Mestdagh <a.mestdagh3@gmail.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>, 
 Aaron <aaron.mestdagh@barco.com>
Message-ID: <atp5h3LsaVTlBV7z@windsurf>
References: <20261022164212.615-1-a.mestdagh3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022164212.615-1-a.mestdagh3@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/4] package/fluent-bit: bump fluent-bit to
 5.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Thanks for your patch. However, why is this PATCH 4/4 ? I haven't not
seen your PATCH 1/4, 2/4 and 3/4. Is this a mistake or was there a
technical issue (perhaps on our side)?

On Thu, Oct 22, 2026 at 06:42:12PM +0200, Aaron Mestdagh wrote:
> From: Aaron <aaron.mestdagh@barco.com>

Could you please fix your Git setup so that your full name is first
name + last name ?

> Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
> and improved OpenTelemetry processing.
> 
> The 5.x releases also add Google Cloud Storage output, Windows Event
> Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
> FIPS, TLS, and proxy improvements.

Did you run this update through ./utils/test-pkg ?

> Signed-off-by: Aaron <aaron.mestdagh@barco.com>

Your Git setup should also make sure this uses first name + last name.

> diff --git a/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
> new file mode 100644
> index 0000000000..c98bce88a9
> --- /dev/null
> +++ b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
> @@ -0,0 +1,18 @@
> +From: Buildroot package compatibility
> +Subject: [PATCH] ripser: initialize temporary diameter entry
> +Upstream: https://github.com/Ripser/ripser
> +
> +GCC 6 does not accept the implicit default construction of
> +diameter_entry_t. The temporary is assigned before it is used, so initialize
> +it with Ripser's existing invalid-index sentinel.
> +
> +Upstream-Status: Pending (https://github.com/fluent/fluent-bit/pull/12533)
> +
> +Signed-off-by: Aaron <aaron.mestdagh@barco.com>

This patch looks very odd. Could you please generate your patch with
git format-patch? Or now that it has been merged, just take
https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167.patch ?

Use an Upstream: tag pointing to the upstream commit, i.e
https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167.

Could you send a v2 after addressing those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
