Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50376606E821
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WyM7pihT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293536085F;
	Wed,  4 Nov 2026 22:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9xgqMNM3g-N; Wed,  4 Nov 2026 22:21:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BBE460820
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830878;
	b=WsF1lTC2dLGYc53Bl1+4lRPLsVJtvWkNgOWWcuRIwn3xjmhAHv2ukmEi74rk3A+WTkPR
	 iEzu4YUjfyzzDBqCwI3fF6pnvV4yqP+YPHC/SoSXvWA0E6U65ZwnrQ6OH+7KnKbTWmlHw
	 KUofgDgzMdDBUhvchgve8L+qZcFq12SjfkHCre69zoLG4GksphW1rVXRoJnKtlxUOUt97
	 slJ3LtUyNFd6ph16fsQ3iENz++bJu9xvN5HOJFw3lEZjwztjXnxRffa5tdHGDnmEQJmvE
	 iZ+OPjFGFXu/V3JQbZlFQexr+wh+PqEQUxUBiNY+FwnWDH0JQ4um6VsmWr+1+16XbAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nKBahRI4voXNGmJagUml+a3Z7wjvTQBJ1PAjI8FuFC4=;
	b=YIScHwce89tHGf6BunXyMCPkuWE5oK1uT+WPoLNPRrDGg8ALNyb8ozBy+H2Ebk6CjbG+
	 cAVfbw42YHA5TVq6b5jMbLYmNMs5MNq4PGeAW761UeHauKpa8pfSCa1U4RdIXcYko/jfE
	 32zqfdhOSKcgbqZxNAcaTVda5TDPawTWeXPSI1Mb0W8qMmLDbWHUpCTx9qDnKjMNoXZ71
	 1WNix7k5c4PapbyM0pCGSbQfFwrPSXKV/tfeQgxySl+KGTWqaX4KTikUynfEEnOENXqUE
	 1OR6wQpj902OL7V4d4DQ9DGWecrPh142i8HJzDzuemoNicdDSPNMCQ1iZT7PtibEo6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830878;
	bh=nKBahRI4voXNGmJagUml+a3Z7wjvTQBJ1PAjI8FuFC4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WyM7pihTXDv5aIjzhNT/IhQuoyVXrJgmMYK5ld/SasBegQRTa6bswYR7olvGzx/Pf
	 C/uGFI7IjWHlxq/tAdsPHyovSYmOX5LGhCnD1BvSj3jShwOm2AtD759oDoUdbBVbGU
	 CKIRp0tdEwrfCjbu+XO8ppjVdbjtFAmw0B50O0z1nO56ek065TeQfZyodgKH9PDxYI
	 Drf6Mee6tlMg0hrtSnyHbyE4tbRTLSAtnzDXcb2K3YVSuBP6uG8uysA3snTPCE7jpB
	 x30NS/lhj87ojXkqO+eaugc3daGB7GBXHIVGRofaMA/4DdtmViarshth6nOYwH8aOg
	 s6kTJ8XAQ5MFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BBE460820;
	Wed,  4 Nov 2026 22:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 284C8B00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E6D40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EI3mMXu2O3Fp for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 358254008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 358254008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 57FD74E403FF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 31D615FD65;
 Wed,  4 Nov 2026 22:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95F6C103291FD; Wed,  4 Nov 2026 23:21:13 +0100 (CET)
Date: Wed, 4 Nov 2026 23:21:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuv1VVbGJ-GaT-8@windsurf>
References: <20261102181345.3238554-6-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102181345.3238554-6-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-trio: bump to version 0.35.0
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:13:37AM -0700, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
