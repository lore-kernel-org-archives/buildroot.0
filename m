Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4276B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CEyWFed6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB4381567;
	Sat, 24 Oct 2026 10:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktc0IBudu42q; Sat, 24 Oct 2026 10:34:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4324A81463
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838087;
	b=r/DCJo2yILX4N924pIZ+nj94vOHGpit5Upve+VWibLeWUYIcA5LQPfupgkeKft6RiYk3
	 255SIf6Oit7jBxQXUo3hlCO6eLgPhkrr146QJ/28yTEUXkSqWzEgjY/Lh5SBiI8PhaThm
	 T/bVHhHIx5kEm/lUhhV4hfDA0Rb1g4Vwn2IWpQD8KDthtpFdKsFtX6Gbp2nXwzX9ym4fB
	 Bdb7oYKH/Xxf3h3X2SIwwmzApQnDHZRhIOREScs4vZfRqwbhtyFU/NOtNiDZTSXRCsOBm
	 uEIVshkG0SPK0xN9WU2pYtV3z6lPopClRJSxvgsGi7zQ6O17tAzmNDn4+hg3bPNHPHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=nZwxps98bayEYKMlvFBqpdNPvOlfr+i/fSMTT9ynk1zQPxLVLhd/D5VEfZSQPbYEQqHu
	 tQeIXcKyxyNeE/C/CQctK0HygZSV7DqaqQ4LN/5wuHfDGOzqyGALTyUf9iw4u+BH1QbFN
	 axfc+ogz3HBN1LkE4afhMECDX70kUtYlIdEWXpTh5VAoug7MNPvEjusdMZ0l5dusaUoGU
	 Op/KBTU0lVzsCT1ekwhIwv9Y8kBMSBvVerxYYgxxThhYjfhnd9Mq78Y+1eamNqyAIO1VS
	 KrFOR1ayBv50qOk6Fh/fpPasD8Cbhj1RAopm0+8rETfc9f14KV6hFVCMuEdDQshQeCg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838087;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CEyWFed6txu28MRXkip1dBg1iAAiNQBiVoiFYDzEXosJqWJG87zNz2A6DWj+vMbRl
	 LBUr67r9odO8K2lBbysJSgaXY8Ziov3akZ/854LvgD02LeD5No2e4DibtGs69bw3qx
	 T6MGGpJBWBtUBBUBKrFpqfprNV6iP+DtVFz9mN3HwNG6XQz3SI9hIqhDTgAqg8nhHq
	 rVSxRnx17SbWsMNaGVKLT725Zl8Aw3IuBm8fszykn3apZApfopJUUZ3+JYY5A6cWX0
	 KBjBSA19rGvmlVSXnsoWv/+sDwO9d8GQri0bp2CLA/2p7o5U4PqVmXl1CbZuXbvkux
	 hHzCCWRm8fPDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4324A81463;
	Sat, 24 Oct 2026 10:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D2D143
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E9DC81463
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRt3XHaOQXBI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCED7811A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838085;
 b=VSIjfukvex+RXKkZ8dwZjmyY0moBWzmzl2qk6qYHNeMpqipJ0yvDSsbxXSP3jIPRsMl6
 AnP0+juAMwI5RGanUPQszitMlGYbUTiUUoC3D0rTWDGzEQtNlWVI+jE73H0Bxcn3nmAPA
 j5G/gfcB33LHmyvg3K+tAjPaElqw7cXL99tKtJTACJHJTBcFeLC0bdHsY+QuwjDy3Weap
 XTYGSszJjIVDQRAhtF5Z/OGRoJQkqhnRoUphQspWLc9H+W59Z/0DGxSQi5D/V465OoFMc
 41/1JosObfOIe+rYPphBRnwBw2GYykFt25gPGiKG6DX06naQspG83YAEMqu7I6afbIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838085;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=N1VjyOWDZggpOmNRvG9H6Nx/yATT0Io9ABvfeCKz+ys/xo6Kd9rGmFyIfstBn+s2f1lv
 FbDYveVKTquO02nm72c5RiTodn2EO8Ms6wz2ABD8/3VRFElGuJOONk17fwLPXiEtzXzkK
 eTfFz2nZ3IrvXoqJxykxN8Bz79OkNabk0kduiLFZKAQbJCakSC93WIdUbJfyGL1IYinGp
 lRtSyzIRrkqsEehpe/PWJ0ekaVv7p0sZMCFXgSvE2P09Wyu7LFfKZ/0IaFhnpT5O072Pl
 TtxynEZ31Al4m5rnFSRGXICDP9ACSWB5XXDaLf++yNK/FjPSuyHEzOfrD04mYdtrFjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SKMTdBmp; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCED7811A2
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:34:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 591B27804FD;
 Sat, 24 Oct 2026 12:34:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:34:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:34:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-16-james.hilliard1@gmail.com>
References: <20261023181818.920329-16-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <24e36320af83f4263175c76a145fdea1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pycparser: bump to version
 3.12
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
