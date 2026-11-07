Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E02606D818
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A9ip+qs8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F0A811FC;
	Sat,  7 Nov 2026 10:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRDOcneV_Sll; Sat,  7 Nov 2026 10:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 40667811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047473;
	b=DmaYT8z4TtwkoXDT03m5WX1143E9DVNJN4K4u+uEjHqnVcgusLyUX262nnC02YoTfqLD
	 ruvY4SkmcDkrPbqVXeR9/e+uBTx/7UnZuD8Vwodpr4bu3cr7FNjvPPe7Imu3mXu+f5uJC
	 mKGdJHjA64wQM3l6gbHuKHa6DvaI36QYM0hdtVYO0LFXfwc7mJrBd8ehL8lT7RI6v4DqF
	 vQljpVyztDJHCM+6FbdlAZJZjmxWp/+XRBhBacMpWTIDlf41dEHizUMofFB+wxkBafAtD
	 7YH1a0w/oYs0nyTYWMbCQziLFugYRqRtMHN9LKCBSVuEpGCnscANG/PBmeY25HmLLhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047473;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	b=Xrxh9shTNsbWd/dpuH84IdgnzISsrD0k70QwWT20Ev8++q6nJUZISleuCIxwnHcFkGcJ
	 L7tC5HAcWzANqF9mNeOOAlgQv3Glf/jO90xB9Dxjxc8dD6kp3Ywad7g8tof/RQGJeTEyk
	 Kzk1GiFd4Pp7779Y/EVPNHy6n37ReUtVNoXVAOVk+DeijPBeJy+Mqh9zl3yxx8zK0sSmV
	 g6PnKfHUZcujSPOSjYBc98KzGVWTpx3yfPDgT3aiF68y//awFmLZsbIFAgu04N6yaUCCf
	 XlF6tS+61Fb03TUwhXFyHuut2y4hjW6Srzayuw0OnpW7FmF3vWcAxOEW3gOjtpeMMtg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047473;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A9ip+qs84YgQnv+sDtpIr4cHbELIE2tUGukArPBzUEIBa3xVt0xC9UcJkkaHedJl/
	 vNV/UhvaNF5UR6bNFbaViyoUxklDGdxRkb76QRRLqL+zFhcsMczBbFTmFBPzdupQQ1
	 ym8dthh06yQPtZ+QpHBcBi7cZaoLSpKZZUHa7EoDta1JBeNa4pw6aT4/IOqQp2PRA/
	 NpF2T0AXW7OOP1cYIYhVWfyG46/p0YHC5twiA2prgd3h36A/CEh2Q852EUwQvkoQPM
	 hgxoZazGSuedgj/NB1Vl8QEXkQLLThbjNBW8JjdFFbjvrvAdioUXHhFWBJqTKmPt/e
	 A5a1q/VZuD6Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40667811AA;
	Sat,  7 Nov 2026 10:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3CDE1C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5553405E9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97DTcV-z5-Ri for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:31:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 568FD405B3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 568FD405B3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:31:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 16E4D6013D;
 Sat,  7 Nov 2026 11:31:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:31:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:31:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106211918.2606369-4-james.hilliard1@gmail.com>
References: <20261106211918.2606369-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <90169d2a84d7f261d147d4a0137dfe0f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-uv-build: bump to version
 0.13.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 22:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
