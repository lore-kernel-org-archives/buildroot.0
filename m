Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD82FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8626881238;
	Fri,  2 Jan 2026 20:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwk2-_NPAHxR; Fri,  2 Jan 2026 20:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07C081359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387263;
	bh=AWewsdfHFg2Pe89JmKmG/WCDszKYbewe2flEk+9ogso=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TS0lJ7WsFFqxExk1J4SnE2BMgLk1rjRh6+in4TXkD6Si0iN5jDpkfR60a4p1zViBE
	 v+0/kEbgyY8GHJtVSAmMoReTtSk6PBsCB6JPFrx5JN+MBg8IwbQ1dzDHt67Q/kljcB
	 43PrHQJFhy716kktDbphy11Ew+Tgr4FuVIPDDX8+EvYAd3RNHix1SpEnLTRLKsKnzE
	 ReuHGFFvXx3eYZ6uJG1GhMkFC6byLnluPMDMuJ8JEpGq1RpySwgo9b5gntenD0BiQ8
	 Qjjy5Uya0t/rI/gTQPFoVu/RtYeLrz5YvOXm2tX7CPpOYUhZfRf4om9vAl/+n8IKzc
	 VjD3Mrp+ppGqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07C081359;
	Fri,  2 Jan 2026 20:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A559202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C88A81359
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHQ7nY-PTsou for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21CFB81238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CFB81238
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CFB81238
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:54:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A7324C1C3BC;
 Fri,  2 Jan 2026 20:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 795BA606C7;
 Fri,  2 Jan 2026 20:54:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB1B1113B023D; Fri,  2 Jan 2026 21:54:17 +0100 (CET)
Date: Fri, 2 Jan 2026 21:54:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
Message-ID: <20260102215416.5215c132@windsurf>
In-Reply-To: <20260102203552.4183262-1-james.hilliard1@gmail.com>
References: <20260102203552.4183262-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mkI2mHcgafC2ArZRWaPWg5JdpxwDTIcUL0N/WKZR5jE=;
 b=UsloIHr5nOHjLcp527V/nmlgl2iJuZzdvLDvASUZRf9QIDlv++NFTC5CrnDn+t7chsSn5n
 8/pEo8u3I9iPFkSu2NYhXcZahzAJEg6NyH6g2e1hwoZKRLoQXKwmacZsEF8icnRlo2gGjk
 iI6u4RDLgeDI7AL7sZ5lTBdOMpOvoCaN1BpDuZA19ouT4oo1ObcyYoNsCTGZihZXpHC1/8
 RXAxIRmQP06XcZWC/bCftgClW9quP/kiRSdnnFzdCXvUmy7suN/tl8AjNMQKj1FQFZ5vI6
 dmQFmkDd3vQcbHd3u3aG0nKmxY+6/VIn3Vu2NJxsTlGZTPuqdk/isIkQR6NhAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UsloIHr5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version
 1.6.2
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

On Fri,  2 Jan 2026 13:35:52 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pynacl/python-pynacl.hash | 4 ++--
>  package/python-pynacl/python-pynacl.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
