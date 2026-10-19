Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFA606A324
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HQ9gdgiC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED5A80A98;
	Mon, 19 Oct 2026 21:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeQFdzMwQQlw; Mon, 19 Oct 2026 21:53:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 715E480C8E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446783;
	b=KlP9/4HIxNRgNVeIUvzJdR8hzcPN50tXxFC6ez5cwJXRfHq3vx+k7o4hp9OX81jrBAh5
	 odcHONmx+4zKEyVeqoXHmHTcEVSSVH6RBNevZ2ZBy4khjbtpmvFqxAhiP3r4TQXwrM42h
	 cpG1YOSVrslVdI2B8i58KPQrU7F2PkedOAr37hVCXEvDPw1EwmuCSbsYq6siyWAgUN+E1
	 YECeDF6SEiTaQ+kXIUBerTOYtUxbsv5mbU57vKjslLvT2wwV7z3npsn/vRjBAfcw/66lj
	 9JgaT/Jld+guAGdWdIa6mvzmmc8P41+TQjdsfVDa/a9qG2iiPuo1Bj1o3veIkVRq0bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZjbGOn8q6TtffBSNCgiunHYn5reCNbK3KpBAyT04xvk=;
	b=UqIBSkIr/F9pi9sGldoxcH0fIpVaz0KQMYyHzS5Ljco6YL1YVA9fdTiThmGfmCHL1/22
	 62cbShthhzon1w4lT3QUZpg9S6wtUySf3gPe0rwZl7vfQfsvL2LrISOsW+KsZ3pcrSKy8
	 pJBcNZdzpAjTT67clTWcRY0W/QTzYXXXZdHW3o4UFGopPOQT/UWCNXxgiiFYX4WP7hGCL
	 je+rj2SNphucu6Ia7/nofsIigHQrJx95nDPC4Y4sqrKaZ2IC6fRvt9AKLhnKA+icepg6L
	 mqv+V5Z2LVFqynDh6E0yaWWmPkPNcvZiLA+OxtbHXlTbJdxSWwWi5xjNruRGkk7EEHw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446783;
	bh=ZjbGOn8q6TtffBSNCgiunHYn5reCNbK3KpBAyT04xvk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HQ9gdgiCey3/cYb+9INxd435O+TJFKsz9mtWQ7D7b+GZTg/iC9IC+VHyGiAVCLLzJ
	 orTOGkDvH25DJ8mIq2OdCyRGPfAmdykJtd8CAdhYFZ1/6MjluVEcdY3u7qAputzVqf
	 prwkBirw5yio99M8h3QWS2uZDPmqcxzxff4a0Uv1q8AecKBJsJkzealctBLzKUIxMq
	 4UiHdKlSPaw9Cd8s3OLO1NPgplWbRS+cLQQfYU5F1HsdAFPbGPL18quN07ahnooTiC
	 QnTCmUeYvV8Z6auJH+i2YqxfRBzZ2PasYGTmtxvPCyJF+oGMBvB3gSpS9OfPlhHzXh
	 vbqrXh2hWjEKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 715E480C8E;
	Mon, 19 Oct 2026 21:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B10F23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 415F380C8E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xLX-lojC3P0 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:53:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23DF880A98
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446781;
 b=k55euTLA1bqiSbzraizwzDTlZofaDsH0KF5OOKe+s7OX+4oSCNuc9HSjEEX7wEuprbTu
 tixXvjQ+4bMxPqOjHtvIHPdMo5BKeObt0nmgbaZxSl/hwk5UG9K0h2m2uOHQscLkRMAed
 SuFIeb5YSA0YhvC1j+Rh/Z8dFtHnGIDHSl6zHkso3iFAGuy3THNVpryS+IR6C1WT0RFtL
 h3vJ/nw21T4Miy9S/9xzpUg+VKXDR3eEZHD5uxtyOy6O1x+s5yquLH3jTRJHWLjWS1VUv
 tKdkMrwbmNcgKNBB66ETJSAQ7WFPS3h/Vv+/A471e5k0nhj4dT3a7fDl1ZqcBaWLkTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446781;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DmFLsZCbJ9qvVIwuqdem/hVwjh2vcMxUaNh2w15+FRg=;
 b=HgKLuwJ0bYVDHi3k9rS3wWJ71NU9CfHm33IrvzI4SpE0l6OB4hkKdUL+/QY8s41EBIqt
 QhNJ4LBhXOWTU/Gqs7GvKi33mT3OhTLZh/pcAeMRh3dIDLC4uP9bOGXdA9p3zyWTASkso
 4v8TDOalU+14ETIiclfdPfttEp0bXkIg+1r4nTac9DBe5hJg/TVotFqbAY1McpAlWPbmU
 TSqiAL28O7om9pIw5Tu2d2uSSC6IBkrs1CmmVXQ8AUGrh/R8iDo/MUfDL4qWST4csayM6
 bcJIOTbMff8oTGvNdF7zGNI1WhgVHQqV6uhsjShvXRDtyagr+URAvHPTz9iAAajnSIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wFpjNwKN; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23DF880A98
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BDEDCC5CD5D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:53:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 832C560582;
 Mon, 19 Oct 2026 21:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFB4610328C22; 
 Mon, 19 Oct 2026 23:52:53 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:52:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ataRMYPXxRJE4Yeu@windsurf>
References: <20261019211405.93925-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019211405.93925-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.54.1
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

On Mon, Oct 19, 2026 at 11:14:05PM +0200, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_54_1.html
> https://sqlite.org/src/timeline?from=version-3.54.0&to=version-3.54.1&y=ci
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
