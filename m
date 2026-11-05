Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B97606A329
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EFGcR3M6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A681540501;
	Thu,  5 Nov 2026 07:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrp5lbOuAwf8; Thu,  5 Nov 2026 07:32:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D794407FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863929;
	b=HrUsbwfa5bpqMh9w2SswV9bSwAKCIJc/VYE+GZmmoxa8vF7Cyms0/c9OoCx8UdfCIOFo
	 deKIx9uwOLlQpniJNLdTN90yR3D1RGMQs1m4XevSioCvRjc17UMksQMBKWZMxHceJC4b2
	 6eBpFiadTfwOB3ScAb2/oo3Fv2PZtov1sMRrWJcsXZaRe30ZPtaDC9LHfIoLF6uMAeriJ
	 0W7Z/lBcVNIcxdYuQRIMecpVFzENh+VBUUL45BwPmGSom8p2Pm24uBXIqGqSi3zkfiI5B
	 zQjUSyiOoidiORFjDh+XOXMAtNobqYNSAPGrEimTcgn71a74wzIhCuYhW1i7kqqHrZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+s1BqZYMjKWiRTpFwc8gzd19ffcsd+BpZtLQQNYAnh0=;
	b=LPVy+X1iLL2PGH9OGefcIrUmdg1AGxWwS2Zl1KvdlE3P3c8j9E+wSC/p6yPVUzSs0DUN
	 9JwFRgvgWAK8NGcwnP3S/CmXgYHSmo3AeEwcJLpfJvqx+QC26+17GH+RTtlRyotMBf6cw
	 iAhX5tT5jpt6el7qAg0ShQw9UyKiHPvNpj93BF4nZ3hG2qkbm0SLt68z1m/2q/r9rAdnw
	 g6h0Ndg9OMBG1uB6+s9Dsa5WM8wrF9z1BBytsYBmVYavzF3UV2KnRD7yBaEBWQX/6Z2pF
	 qP02YgYvdzeybzpCP1xUCXTYv+sD44bL2qUGNlOQ3sC3pCkfPf5PpMKWclu4t9Uc5Bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863929;
	bh=+s1BqZYMjKWiRTpFwc8gzd19ffcsd+BpZtLQQNYAnh0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EFGcR3M6x7N9dqFeA3ueJv+t455t/7+oj5UWfAIA4Ag69dKQ6gNaDwW3zxB1bWKKo
	 DXzw5aBxzRyn0rtXR0dcH4AipMcL7DuBkp+CJNJecb8FMNu9MQRD7w1OffI7TCLUuf
	 gojY2orrwbXTjTdnWSqTugGykISCHcIyfcvf1+VmGPiI/PO767w15CcF/o4+nSmboq
	 n2HDnKys4I5S4Qde2I3vUQ59h87PHPp5yCVYfb9h5Bm7heE3RMhY3sLNkIX0WW+BKm
	 8uP6eYNGcGhdh6FmCgPkUBljIYTo2pnoha5T1KPlv3tMCcPlRSZWG3Yp7zSl6FVYKK
	 jPsgi+g9HsC2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D794407FE;
	Thu,  5 Nov 2026 07:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A494F362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC5281036
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQ9bbSspkFdW for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2B9C80DC5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B9C80DC5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:32:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3AD284E40774
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:32:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E98185FF85;
 Thu,  5 Nov 2026 07:32:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F55810329267; Thu,  5 Nov 2026 08:31:59 +0100 (CET)
Date: Thu, 5 Nov 2026 08:31:51 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auwwYVD-_tyAv3vL@windsurf>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/6] package/mender-update-modules: add
 banner module
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

Hello Adam,

On Wed, Oct 28, 2026 at 12:33:26PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v2 -> v3: Fixed github link [Thomas]

Thanks for this v3, I've applied patches 1 to 5 to master. I haven't
applied patch 6 as I have questions about it, I'll reply to it
separately.

A quick suggestion: when you send an updated version (like this v3)
which had comments from someone, don't hesitate to add this reviewer
in Cc: of the new iteration. Indeed, in the overwhelming stream of
incoming patches, I can very easily miss that someone is sending a new
iteration of something I looked at before. If you Cc: me on the new
iteration when I've reviewed a previous one, then there's a much
bigger chance I'll have a look at it quickly and apply. It's not a
hard rule/requirement, just a suggestion that can potentially help.

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
