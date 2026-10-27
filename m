Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88420606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pTs3/nD7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62518606BA;
	Tue, 27 Oct 2026 20:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVR-bMuQTW8K; Tue, 27 Oct 2026 20:47:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 84D2460687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793134073;
	b=Q42QM4xIbIDwkSOLpuV6UmOeSWPK+HmDrq5QLOsCg8SUKMrkbt97AfmEB8pvjUalNu81
	 tpc0HgJL56Ec0eEtN6EeOK1hqD7iTHQ6eDHAIX+wcrEFerPoTL0zjQP7SLRSNU4P1J5uh
	 yV8wIJ+zsI+1xRcy9QZDgAQ9+VgVVKsq0WKaWcV5OspsIbXro+fHVV17hUlBheoeYGL7o
	 YTMLtQRf1p7tLUKHXJa8xAi2UYPtVHlGrt/IJra0G1vAWeXsBF43PiVcyV2HMayicKEgl
	 vbK35MQCN/ui++1alUjY2kU2oNj+EsjS6Qykq+KRamHcl6Jn3aXYKxr7gBVChY8LgdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793134073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y3S+bj6e0/LiTL2h/0p5Jtl7RPzi2j6dGAtNLeQT+gw=;
	b=d8uq4MAkmnWhJfwoBMFmBc0+jyq88nkm7bldFhGdMbH/Z4yQKB3edqXRPH3n9rEua+WE
	 mzIBGbpT8ccwC360U7KKIBRdaSkHXdYz6LGEpwwR1zErMqc+0MpdNY40jSBTueCcvb493
	 zqisuFINMTqw0ESHt4k8tf2Sscr0mE54Xr0neOys8+Jl1TlvLwNZeFwG8L1h01FHRFeJS
	 QQakEB2QmUF9AO9uGjGOlW61SyzVAp3cpDctUpzvD24EJkVpiEyKFtcqEDO+CJj4zFf7K
	 //WhcGbUPqj55CSX2vOPzMdu+wx2Kejo0ZAX2DeDqIDaywE/zto8nnNjS8waaf+pF/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793134073;
	bh=y3S+bj6e0/LiTL2h/0p5Jtl7RPzi2j6dGAtNLeQT+gw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pTs3/nD7/yYOTVQkkz+QOPcc9V4Ah5hw0J8zE4DltpOz/NRqhYCyib8C9+W+45DFG
	 6nxXoiZc87fqzT6TvvBjxm84xA07qhwSVFntQwp0fhMN3yvZEbqVOUyknO+GNaU3gb
	 GrcgEp15YWB9XXsoBP+aMglXWxEkKGENm/Mw6ldUJaSCEsrTdFIIk5xkIstA4Rn6rF
	 DajtVHwMDyEBP6m9DfH6+7rdoRkRnBogbtLrSGyw/9PYAtYYjNnhuOB9abakJfXu0P
	 p+yW1TzLal90+Xb6aEu1GdgMuqttjzohdX6c/6kmQHemtYdGkys4aKsNOQod4JyGQP
	 HH15QN8Loe8Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D2460687;
	Tue, 27 Oct 2026 20:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84247235
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6682680DBF
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgtrII0mXkcv for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:47:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 603FE80C11
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793134070;
 b=hKVZenwUzkG+kDpNs8kR//cxYi19/64V7Jrv+/isewuf3Q/pShTguHmmeb7W9E1fBRwl
 w8pNgidQIECni4bCiLK0jwGdPMyzhNtD8kqieOQpViX61M3UemQVkz+Z8dMGlB2RU7zdA
 GGb4TFg3vp/ksSagnRETi6Ia2h5sGYocAcOQmLhtMcvCM48AuyKYhK8T+NBR0IvxuSGXg
 f9cSdMPNzz6tT1CwaRa+XhxCOcWHFhyk0gP7YzvnmtMiRePuRNgmqhgr+OPPCKpl8UZBE
 VXPwLEOX/pgPVmvj8YeGFjG/M5GhFmwclLwuY2Q6/C/rGn+M1Wc3DQApSluHnrgHHkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793134070;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MFzUqTyDiyTvqywYx1DD+J4t69koNXEbLt3P72G7B4o=;
 b=AVz24rGKEMgRUDKniZzkLHBz0ffWY5wv3i7CoWKDLDv8YuUUvGMCoBA0LxAshADoj2IT
 pw6E45V8YomgHpFZfD3xKh4KtwK72fqLtFFEpQNZq/QLhsVVmec78VQ/t8mjJgeHbs0MQ
 iWDlcm6icszmxoujGmAqjCYMl5Gp4UFf0H4gpvlL0UJI9rcVeqzLsqwDpDjFms4J3sFNQ
 hMDl0PxOS7YYGRHI1h11q+5T9iE/TzONovad7wDQe1q5Cld8bAoD5MV5LgFUZjV+EVztC
 4LKIUUuLt2iMb1m6xeVC+NYd0FQ1B0zGpgfkxxHvyYGABF5Fw0lPOhqqHUD/PT7FQ/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=upDjnkaA; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 603FE80C11
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:47:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8CE401A1369;
 Tue, 27 Oct 2026 20:47:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60EF5603BD;
 Tue, 27 Oct 2026 20:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 711561032907F; Tue, 27 Oct 2026 21:47:43 +0100 (CET)
Date: Tue, 27 Oct 2026 21:47:42 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auENylyyJ3syqQsI@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-13-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-13-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 13/14] test_mender/post-build.sh: use
 /etc/mender/device_type
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

On Tue, Oct 27, 2026 at 05:40:10PM +0100, Adam Duskett wrote:
> To keep parody with board/mender/x86_64/overlay/etc/mender/mender.conf,

Should this be s/parody/parity/ ?

> change /var/lib/mender/device_type to /etc/mender/device_type and
> add a /etc/mender/mender.conf file.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
