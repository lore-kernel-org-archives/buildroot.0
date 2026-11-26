Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FFC606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k8lUvZmz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85918115E;
	Thu, 26 Nov 2026 22:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPPJMJIMDy9c; Thu, 26 Nov 2026 22:09:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC5508114B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795730985;
	b=NeR5IJA61klMEyZLC9behtsNelzx8zELjbjRwvUrxBZOkgQF1hXW48G+kEWohtWRIxRE
	 ivBazXkDEig74EWj/YucHr+P7vQIyc2TjQQb8CAEB8Ltt8SXUSulVaoVDXzSZYg+6ZnhB
	 DRyG/it7RxsK6EmupE1U5SFxk7v0YGz5llNzAI1rfCTCL8kvf8Iy2VxT4cwCXQdFfNJTO
	 JkOwHDJteV2GwvMlcHkiW9Ql1ZPk+1AkqTESuWD50gnZCGk1RXitdrw/4xT4tnEvqKpAq
	 CToF1HM36sOuMyCtvDFs71nDwCG0CE7xm5/wYvBGjt4zLkwaveygKG7lGodK9t4+YAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795730985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XfF/q/ugWZcJr8tMfGpf8/dYdQ3D0p9G2o39CeKQG6Y=;
	b=P/4AA23Y9C7knsCtB2L6SW2V5q/hlLJcvcIpdb9nr7G1bVNL3u4mkknPVzFfQEkbqdic
	 mIIDgdXAteMPKX1VKXYbJ4gaNYrKZN+J/kETJ+ez9VOoG55uFpJGnTybxP953OENLC5Xi
	 ASaR4kx7SLFuc7lWzM1MVNyko/SfzkOwtuHjvJb/85E4A7zI/j7bq79/DU8BVajToHFMM
	 7SxE2kpjHbXy3vsf9zmSvI3g7HZzRf4tDf9Z/t7G0s5mU1ZqiRfe+COIMaYI2l8tTJgun
	 1kSaIMzJ3C+lD1dpV2cVNf5xXbKMcscribLPdBv/Wj6o901vm2Z506GQySJAyDNBmhw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795730984;
	bh=XfF/q/ugWZcJr8tMfGpf8/dYdQ3D0p9G2o39CeKQG6Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k8lUvZmzNab02lXVw12asgaaaY9sD7LT+7pim2PIRXoef390wuA0m4f8/NMMZIg12
	 +oqeJvnq8OdEqdAwDam202UV7sHqBm2r1iayMRLtNHjw7/R7OZhERwIEsrPQgNbf/I
	 GBC/i4IUc2Ehk3EbX/ZgJks4l0trAdZDVBRyMspZeWzhM6qTZSP1vENW5+6oFAa9Oo
	 JuIEVcbLaKXXTK/KpVvnsLWiXPfsHayjirnCrZgbXq03qs7RsC+H8lddfajF+qgc/D
	 3UAZvJtDBj0gaMwKeaSIC4hQ29Z6CjYt+0Me9DXgK/EsMPURm7LH6LRCMPZMzQqLBl
	 3AWPINbCRPtjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5508114B;
	Thu, 26 Nov 2026 22:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 916B0260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EF61405AD
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9inS7lRLlGK4 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:09:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0D3A40588
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0D3A40588
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:09:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6F112C2B9F2
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:09:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF78060558;
 Thu, 26 Nov 2026 22:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5286711E691D1; Thu, 26 Nov 2026 23:09:34 +0100 (CET)
Date: Thu, 26 Nov 2026 23:09:33 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <awit746cny3jzfo3@windsurf>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
 <20261124120443.1909297-4-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124120443.1909297-4-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/9] package/depot-tools: bump to version
 25e7767e91a5e7f3209c947b07c52e7a45dda6b5
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 01:04:38PM +0100, Adam Duskett wrote:
> Drop both upstream patches:
> - 0001-gerrit_util.py-fix-importing-socks.patch is no longer needed,
>   as gerrit_util.py no longer imports socks;
> - 0002-Replace-deprecated-ast-types-with-ast.Constant.patch is
>   included upstream.
> 
> The LICENSE hash changed due to a copyright header update:
> "Copyright (c) 2009 The Chromium Authors. All rights reserved." became
> "Copyright 2009 The Chromium Authors" and "Google Inc." became
> "Google LLC".

Hm, OK, but your patch breaks legal-info, so I'm not sure to
understand what happened? You have updated the license file
hash... but to a wrong value?

>>> host-depot-tools 25e7767e91a5e7f3209c947b07c52e7a45dda6b5 Collecting legal info
ERROR: while checking hashes from package/depot-tools/depot-tools.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 023c510d6670baddaf6114f5aef8c82d495b1cc5d56abbdc5f099d6d9c0158fc
ERROR: got     : 20b1e32e55821d109bcd17e1e150cfe242b54590d3e8083648d1276f88d33d16
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/depot-tools/depot-tools.mk:27: host-depot-tools-legal-info] Error 1

What happened here?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
