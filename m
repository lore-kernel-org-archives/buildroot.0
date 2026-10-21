Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21D606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YsNO9jA3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337BE70848;
	Wed, 21 Oct 2026 18:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_DpPnIlD1_5; Wed, 21 Oct 2026 18:55:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E15F70856
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608912;
	b=YVGydzxNHXuzSKwYCJ1fPLRb22sGIw6obY11ADnAXNR4n/fOfXxTVNbjpQQQfRAqe+g7
	 GojpkthTGOGZFS8VleqkJ9bGQVZr4Q7Tn+cNZ0oFXdBDUpGYR1iEVgt7muBH0nqxFpsfq
	 eLmjs+kFv6SuEvYmgYky1T5aFr4pKjy4LlkMjFHRJcLsv8ZwhHrloFwNtvntu27AMkUrQ
	 t46mHPXy5E4RfJmEBE1YAzhHE47wG4DUKLJmQfthmN7OKytUAw5QJmtKkcVZ9GYEHO+rn
	 Din0ZVnL4zEb9ZuTtZ9X2/mstMlSv47B983hqHyVgLb0RDO6C5AvtmEX+jw2lRCzhKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5RRea09DRNbDBckiBgVddCA+ECFrm1ScWN2jdwAJpNQ=;
	b=DSVoC007o5M4PrgbddVoMh86pHHJDIZl255M/ZYQ0SBRkyp33jXYVT+Q/ehKkiAK+CW3
	 6SF64BXwDBi4jbFbrglO2CXufXX65ulvLlfUlQp/QtHncMbYNQihxpi6lNvespq11dEOM
	 dcKU9amT1n7m+RXGml+F4r94pnI3HGfgp9iXCmBS65CpKYZhqqUyhgAWUZefnmZHNv8Z0
	 OZ6bmUETJqd0OTyVj68fOPjlT+9392aDwuSgoQSHAnjDYDTMyF13+oyhlzUCEKGsaB3id
	 FNJ3eAX0Y7T5ovk7KozwVjaVAe5x6/kp7c9j9eqvaKn45efF0MKUsaayO/M/vh+dEeA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608912;
	bh=5RRea09DRNbDBckiBgVddCA+ECFrm1ScWN2jdwAJpNQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YsNO9jA327kkBHxHnTxJim54AHC+oqFrho6UCentznP4b1jJFH/4cschrC0qFqY1m
	 WDmNB3Mlh++Uuo95fdhlj8jkGswHKBUKRufd3dVTBoKW2RzS3gMQGVThOs/mbNO9HF
	 7mGCozq9L8xNUsNfxV0JUzb2xmjC+SRhbLfvQ5ebPE9GfLV5ay1MdV+rA9SkegShtw
	 /U4rWtb6OjdUAT7F5Or0bosjLb541J6dj0Po5DbSIIoHOOFqLRh2EIboEgvvrTaQ4+
	 sDL+AJKbvNtCJCcP3BfVc6cfBiXuVbp4eE2t+CGgqrSrg33J6qBtRE/kutxvTq7Rfc
	 78M4JVs4SkDnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E15F70856;
	Wed, 21 Oct 2026 18:55:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3804A3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2961F40C55
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3kjkGAS0ZGf for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 78FC740441
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608909;
 b=euLxJix97FMWfKgutCCxc/Iz9hxTN8eaGt9oQ9uG8vdofSZTeS4BiobFbtX/XHkH95YS
 vtiKzeAR8a7XblVunPMz08TeCG7xrt10zMpH983LSll4bqKdis0+7Y6/y/mVYZDTzSIFs
 FIL6CM3Piod4ZeMZu7dHaNS7hdHLp7Hqy6MqF3Z4g5t/aN1tsuh9y1c1/85wxQHDXRkF+
 I1Do9hwpl2FPoEaS2gV/hK96p2UAXvdvfCDAqUZWr5JqSd6DEOsOipksvkxKE05nxgptw
 bfavqAD80uKX1SqBlm8bJOlCf/KmJkOAGl1BhrajLL+z6XsbGF8d8Hd0zFnltEd+X4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608909;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iO/5Oa4cm5VEEnZh5GU3qGmGhbAXG7TOSZapybbGXYc=;
 b=Qar6PjiYzYieDVOY2k+USAuzJDCerhspO9gjcBv0I87DhfqHhqfGgq2a3aFott5Hbkdg
 1GP/Qx03bZYwfhWIAC8aGFGTNZmApSZ+hlCfHwReq2clibooOWCmEKuy/0MbgogQTwFjG
 bWvpzFigyECuC4rqXQ7F09yNxSbcwQnu20IRLunjAHuZmV78fG/WB1jnrRzXZwCPWw6Rg
 2ei05S5dY8iiyVflJFOskbEu6cxWYSrKw3vA7VKdI35ydgYkvD+Z7rMPyd/md1daJ/dt6
 7r3ZMHCwboAFAXrUtZfWHym3xnuXq9k8mRUbeVWzn+E7Q1+mM7WGKcQse8lhBfeGPrQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ErVyzYjR; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78FC740441
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:55:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9E36FC5CD6A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95BBF606E3;
 Wed, 21 Oct 2026 18:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F18DB103289F5; 
 Wed, 21 Oct 2026 20:55:01 +0200 (CEST)
Date: Wed, 21 Oct 2026 20:55:01 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <atkKgL_oYx6_eJQO@windsurf>
References: <20261021165949.3324383-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021165949.3324383-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: add upstream security
 patch for CVE-2026-107891
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 06:59:49PM +0200, Fiona Klute via buildroot wrote:
> CVE-2026-107891: musl libc: multiple integer overflow in regcomp,
> possibly leading to incorrect allocation sizes and out-of-bounds heap
> writes
> https://www.openwall.com/lists/musl/2026/10/21/1
> 
> The upstream announcement states: "The vulnerable code has been
> present since version 0.5.0. All subsequent versions up through 1.2.6
> are affected." So the patch needs to be backported to all Buildroot
> stable branches.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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
