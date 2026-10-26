Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FFC606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k5miHKfw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294BB40661;
	Mon, 26 Oct 2026 19:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaFkEl-63S5r; Mon, 26 Oct 2026 19:46:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5165040636
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043970;
	b=PPHsbwbi096Vf2tv7TBPyx9sdu8R2BVeJCRwYNkbXTlUXbyBlDsaOsv9P7jCSJQ56eNc
	 Yt9pvw+InRFklHVHf561wuxeS1Y224yVOkeSzgv9kM0/7r0Sxtmz0/TUaafKKrIFtLZYM
	 mxb71TV7ssq8r4Fb+InQ/HGLN0zZrHAfruyAkPGkc/CLRqder9h1J8uvY/wB/Yg9Afs1L
	 JUPbSAEHUZs7R4N/+fcebfDESS/FWZzK1DEn3zeKZUOlTyst/EbEoR121fEEUfdAPQcP0
	 T61f2YLWLvg2AhpgJPUQlDJKtWXYXIXV1FD46cNOQnaSY8fAPQfS0abmnLFIvBP5e2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=K/Z+j0Qzzq3JkCLsGUOMFE9Mo+H0VM+qnvC2NsoFdd4=;
	b=GCsUPgevaBd2FnPfQKwzQ/e4HlKm1kcixqblcAfwHAIlDDGd70cLZkiL72SggS4zbTOG
	 fyhkubS9kUSahSIdRIdImWB00EtPKLHxZXUpU6gyImFz3Ejx1gb+Xl15dzcKjULrO4U5/
	 9dmYRJ9HQ9wxjMSMGTYT9Dnf+y492T5T4q1lQjcnfDdkz466erc9rkWYf5MSaaXdAY25w
	 c1XOy4dZw8/qdO4tVHiUvLzJ00Xxd2tOKpW2G+hwe5QTlktJ1c9yBoKKbaNztk5ACpHSI
	 wtxEZ+BXDQyGF2zLAtjrjfx3zUc7lA9J+rcP+w34cvxxuNnIYmXMR3uxWaByo9j6RUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043970;
	bh=K/Z+j0Qzzq3JkCLsGUOMFE9Mo+H0VM+qnvC2NsoFdd4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k5miHKfwjL0OC1zpchH6ir+8mmAHmdTvyFbDhOaaie9ApQTtLdAKoH/uZDxZen943
	 5OH8dFukLdHT2ADJUaChPOkk7ZFHTxVZxAW/xWHhEqaZ7q+YW8l3H9D3HmaeFIHECo
	 pnzPtIO3UC41KadsEX+Aeqk9mJfibM1yNDVVCd0Au38SAyEjRHroXfWtgJtouD1JC3
	 tlJP/wVGSdYnw4YPNZx5+lQb/Ixpbcgg3JeG5NtelcUnw4AIRM99zcd/9AOODGy8xD
	 iWh6ZioBfB4RUv1nOnxiJj6ixxNdARvesps2n9fE/mZdxodUIjCDtcgXBEZuLA1G2P
	 4vWurudZ0N5KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5165040636;
	Mon, 26 Oct 2026 19:46:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F972F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA1340636
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n76bs7NienwH for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4504F40631
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043967;
 b=atQS3zeQiz4oAQ1P9lQryWATGoUicjvVRRzRArQ5PFUe/PQuTIi5ODJmyXRnjQjJug9e
 dP8G8A7qyiCbtTH6Cj2efVhPLTAcfHb+iKxu+iGrsFNulXK07dBN8zDKgF7tgx1kDSzb3
 KD03b0Do9EEiy8qqo4EcpkIkjqvQMWhsKSi113WUbZFoNgRhDggRoVKH0c+/8BaXst6ni
 UjZmOimLKIBFYIHVLsFvrLisjm01O5zlvPSzlaQc8H6yx4VPQ7OgZpcz7yzXc7IF4Bzqu
 B6H339QH1rv66047tfigoL3NlWoEyAbBuKnsobSpkfp46h7I0nCnB/cB2KnggWp5/dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043967;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wPzBS+sjIbaQRKExgPn6IzU/y0jw27Q8IY1oywh5zaI=;
 b=ffV88rxl+bO3MzGMdmwJqkOaUl1YZUI1DSAZbfR4nrN5oApoV0Dm7Ghj1mx2p8X5Y274
 0q1vzN3C9aMcffEf0kPOZaeM8DgYljxIMm8NGyX002P0OsvPM5v0bL2pd3XMXzahKNgEv
 XOBzrkbSPMmyhm6eXiy7qk0EJc9MU108FNQNpGbmSaNkQd3Hmk2UIEC1pMZmr/SEm9/eS
 T1k1uCypANLmPbfr05SaHPaoUMMhDT84QG+DxTRqlIjdbXCYTbFeYG+CI39KJc7DcoeMP
 UoJvz4rfxUdI7FbTMQBcF0FAUXiaFRtVdhQJQM1J7cp0Ou22XCr9Bg3ROrl0WjqGoXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Af88TMBD; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4504F40631
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:46:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DAE552003A4;
 Mon, 26 Oct 2026 20:46:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 20:46:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 20:46:00 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Pierre Floury <pierre.floury@gmail.com>
In-Reply-To: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
References: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0c5e8a6afbd257051d50b3cc74b460de@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libtraceevent: bump to
 version 1.9.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 17:30, Giulio Benetti wrote:
> Add patch pending upstream:
> https://lore.kernel.org/linux-trace-devel/20261026162417.646303-1-giulio.benetti@benettiengineering.com/
> 
> Release notes:
> https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.9.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
