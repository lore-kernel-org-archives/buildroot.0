Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449E606A32A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d1m/8J9U
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0EC040721;
	Mon, 23 Nov 2026 21:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWrI3ZpqatIq; Mon, 23 Nov 2026 21:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0B374065C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795469014;
	b=VOyB6xg9WIc4IW6gUpEYOX0Pn5KmdAAtkgGGfjGAxqxYI/iMQeFYLOX74A59LOXQo1YT
	 GRIEuAUZoGQDUbTXNJNPU3sp3M/xxUrO15+0VRHORcjxSfLrpN1Ywb+DsmeKOoTcY7Gao
	 tABHWPDgju3GpxFWANiz5ghwvl1ZXX+HIpC9inUI+djp+e0bMLcuVnqTtkTICqttMDAsE
	 OnGs7QQHTJhTuEXV1DuoV+u1jTjxCixIaWjax5jJjaQzZqaHNygTrewqDSLZWbBDCATEh
	 zNRiRqUyS3g1QDtq+/5bIR/4AO6EJXtA5+EyEsHEZs2bLigEv502vFGXJPlOZGws9fA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795469014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lyWdWxeOob2/QSBuEWgpffaV3qETOgmvMcoW/AFraNM=;
	b=EHemO5yl/01MDORaGLlh+MDFjKuLdQ+0KElh6g2V03p0KGfy34ZGWRAOtt4pE+hoZyev
	 MAHS3Yx+gIaFaVRjQPv8kP+veHYxMgbNTIGl1E6UEg7eRdm4CZxWpZtfvyiYSDtoenLJX
	 m8nWeBd9fj1TFMrot/aL1guSu5B4uzsO/BbvMiSD5GWnuuV3T/gSL/O4G9z/UzkJ/djjD
	 wMDLly4CPfsOEfA5F9spnMUVDlk3ySAuyQoGLBpg4/RI0GxuZTivdUSA1ylbf6tUlM2MN
	 MY6KL/SveAbFtIhm2C+OFSVtZ9S0iwh384o3B/GzSTYyIzC6BsQtmmISF1VfNJWedTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795469014;
	bh=lyWdWxeOob2/QSBuEWgpffaV3qETOgmvMcoW/AFraNM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d1m/8J9UmgU5MyaVDISUakJVECUUISvo9e1yW+dXanrg++wMMVD8TeXZ3e8t1+GEO
	 bTQWdiXha49dcfP7F5JVZyRCFZr+oeQnvapo8JfG5WpPxFRyy0IdHhGqwNDdwjdbGb
	 JPopUH2FDRIRxg5nLX0dcEcbTVnB89taXwWnYfTqXgfc+Nowa4p50uSaD1DuuKF0WD
	 RG/Y6Qv93s3KjZwAi/R4gFrAfWRHHN+XvEX2A/FQwTnA9f5vBmSELpefZripSYudnZ
	 uzMf47DHQeF3lCiLKhEd4X6VRMCfE/+fs6u1A/MzDmFyWSmpsQR5JBtXaXUvabeQJH
	 iEw9eS2ij3HjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B374065C;
	Mon, 23 Nov 2026 21:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9273D311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FC5B80C92
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WWh9PbNLqPT for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B4CC980C80
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4CC980C80
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:23:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B02011A17A6
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:23:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F362601E1;
 Mon, 23 Nov 2026 21:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A59B311E6AA89; Mon, 23 Nov 2026 22:23:25 +0100 (CET)
Date: Mon, 23 Nov 2026 22:23:25 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Nicolas Carrier <carrier.nicolas0@gmail.com>
Message-ID: <awSutG8aIkyXnRLs@windsurf>
References: <20261121171754.3354509-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261121171754.3354509-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update e-mail for Nicolas
 Carrier
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

On Sat, Nov 21, 2026 at 06:17:54PM +0100, Angelo Compagnucci wrote:
> nicolas.carrier@orolia.com is rejected by the mail server:
> 
>   550 5.4.1 Recipient address rejected: Access denied
> 
> Use carrier.nicolas0@gmail.com instead, the address of his commits
> such as aacca7f0639b ("package/pkg-generic.mk: local and override
> support in legal-info").
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, even though I don't know if Nicolas really intends
to continue maintaining those packages in Buildroot.

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
