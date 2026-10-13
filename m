Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A50CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B9160763;
	Tue, 13 Oct 2026 07:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqKWNYIsDQy7; Tue, 13 Oct 2026 07:58:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F18FF60750
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878295;
	b=npAuH4+3CGCQHenkPDMcXfu/IrrcSl3nI+ZExbRpz1Nh7mRTxwg8LMsZ6kW7EtW93Iy4
	 q6+nGq7gVV6Vnez0s/VD4yiwV91LIq/RGlmafHBfvWUzt5HmMaOfLVsvO++LhN6ZE2zT/
	 Qz6Jsp8gHVIfkx9DNcgPGQRSlOHt5HpRWcRRiX1NS0dROCVqk0MJb4pUrUnXzo8U7EuJG
	 IAxuw6xWHVgax8a4hlmD8FSYR4zJvW3WV5IIoD1OQi9yTQZPhBHXyg07eKxNXHNhEyjcp
	 bpQEj1l7Z8SW3MQ48zts58VmZxCn7lE/2YmYDbAHywvc7j75eTsQUfFWSeSpHYoHugw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4le6gVtqv200Co7dgO6JiAf8ug0Er0c5/hI47fw6UZo=;
	b=boNt8bqPu0XnTfM5uoBnqxxThP+z1+4UcTZNj/JtdIKMf048wXgp5k8yXRoymmp0oyWR
	 0zULPhRQBlnfOR1kmhStPxgqL7LFFrhla+pUTGK8VLCuf8cB9IRCZa7ym4teJaw1GU1EH
	 tP5oHUF6eLaqszg6azjwuVB6Dovvtr67Np5g+enB5mXMJrBDEDKnH7tkR7fEd6dQfP2Pz
	 lcGfjRfH473QsgtJ5GEsc/2Wfbnx1UBO7bz6ZuyJdemBQLVote/eYJt92LCujVwvxp+FU
	 OOhMjw6pZERrLKZHiKscXAEiAAQE8YXEc4Y1vnk/D5aqJROjzEQHiDreL/CMwjU0Bhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878295;
	bh=4le6gVtqv200Co7dgO6JiAf8ug0Er0c5/hI47fw6UZo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QZXlUe/8Q+rs7V8jLpNLJGttEG6zK1iOuCqZtg8FTQggK8c/Tbbu0sr0dunxsANr9
	 a+3kzFz+UwuVAFRdBTMg7AWU15q4C2Jx7NvJz+JMFdu4oSRQMVgvZxfboInKkfxQ10
	 M3g5o4KauU9dbyRCSGIQCNdKfo1VLyVbd3kSIudnd79qlQ1M9x+84KvaiDhS3YZgs/
	 8BWreY/jG3Q+pU0AT0IMgpNJut1iKvcmHjJPHporuZgvc5fnljy210WQsycRCLIGAJ
	 Zw9dzgg5+JKsMwF2VU8t3w9U95sqBEM2Vko30xH3EZ12dCWwyejqVzpHFx+V5oOtHd
	 byeQJfYzB7XSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F18FF60750;
	Tue, 13 Oct 2026 07:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B88F788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7199D80A96
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8efIY5yGVAt for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:58:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1BB4F80A87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878292;
 b=U7uvy+q8/aAjOmwuvCnAubgHkpYuRjN//J1Yo/NamlBdSVd14pao87IHosWHwrLo2oe8
 vqzFqckrXgOS/gbV2hBgjgdG2iYX1z/njAcmM5BkTUFWLGoCSTcGoJcsvpSjga0CgMCVf
 zoL0yEAFGw7OejkQPQHFRcm9LAnc/VE4b9QaT0HSB8NfZdIqpbTrevdIVDvT+eSUfOM+P
 RDghzAwxNrn/BpgS8Luy+sN4K5aiiCsQWK+iS4K+VVyfFQgEd707QRN0wTzwnYUjx3aJB
 JUf27sb5PqOoHr3/hlhoQmcx4TpVuBRc6N4M8QvlzHX/v6wACF91KhtyOr1CIlH57VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878292;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iBkZw5OrtscYKo/3160ZuSZDWtGHnuidzTzFkp38tFE=;
 b=c/T4NwMvGhUPfihlgEj8N6jxjyBWXLaoN/Aa94dv2t6tFNAcQWa0IZXExX478wHjj1rI
 TMWlkcoh43fUAi+XvzOQ8cWORxADd0LshxQa46LgcUDWodcJNhRIz6nxH7+U8aSZHQE/U
 m9vdK4hrpDyufMXfgLrLX0PSt27Z5s85UBUXtg+kiaywKevPz/GEMb1OKRwIyyZ1OJjot
 rlegDGzGQUtwHvWoaaGqKJGz9t394zIy1MaPOv4/fGtS7zaWc1z7xHotl8y2iFv0S7A+t
 huMcQT+lzTHgbio5sal+8hiVpCw3w8MmKdSBM/rSOB42cryzzj3ILkAeuOovm8WjzdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="AOU/11TF"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BB4F80A87
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 07:58:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 16BE54E41209
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 07:58:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C6BD460362;
 Tue, 13 Oct 2026 07:58:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86EDD11D70D5A; 
 Tue, 13 Oct 2026 09:58:06 +0200 (CEST)
Date: Tue, 13 Oct 2026 09:58:05 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <as3kiUE1k_SIyjRs@windsurf>
References: <20261012062552.78913-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012062552.78913-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/lua-cqueues: bump to version
 20261006
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 12, 2026 at 08:25:52AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
