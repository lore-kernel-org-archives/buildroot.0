Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108C606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ksh6ofsV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1B880E36;
	Mon, 23 Nov 2026 20:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfWD3jvuO5ZT; Mon, 23 Nov 2026 20:59:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5EE3880DCA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467561;
	b=MQF55UHtyAwrnFtA4cpJlTqDEdzMIJ/gJg/2UHhu/vfjmHmx3lJWpqILQ9VyBHVQCw+j
	 Td72rm96OdJ+X9BjudpO7cUQ1dhSEbb291aL4C/C2yWz096efntz39Xs2A0ncbD6DvhPB
	 IuEkFOzz4gdaTTBAoDnuXivMGMx56X3+BKNFktS47eka5L2+LYseO2eEtVdPoyi8MJjOI
	 xGaH7577MGC3XfVcRDL50ohPkdN5vYMSgw6x6iPE4d2hCDSu26qQmnNpdjbxxZ/qbTmWV
	 qI5NSdf97m8cuGNY8crv30+1mqUumDvWcZhjX+gazp0tBXfZXwvjz9LB+n2d2bt6zTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AUhNg1vzmE8Nxnqw+0i4EPi1ns9Jq7cSqeMOS8TvdJQ=;
	b=BcQeuaUTzFHuvcjMgTcKUFijH4B7LEfCJcoJ2N0jKyZZTQsI+K/8aRbqerN0s6SKhDxI
	 LXaFiS4GFGbLHCwk+ZXDWApOx9oj7/r7cRkgb8eDT7lvUpOQb/b9XAVgBDVXz114Q+Qzy
	 2W+NVlgDVHYeZoI7c84EmLNcJlyutMYEIe9RIvRRz14iRgKl+t82JE4fpVBGK2hUESY6Q
	 x89OJ6kqnSHCBx4kMCvZ9vojedIywSoj7uuOC85XFxa8Vdod9FtA9Il1BN1sHWVZjG0MD
	 GwX5m3RKy1WxVJF8aPouDpYJ7lU/u6Jg285KoiPCLoj0IpIrPkv0vrCjrP4YaH3n9YA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467561;
	bh=AUhNg1vzmE8Nxnqw+0i4EPi1ns9Jq7cSqeMOS8TvdJQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Ksh6ofsVPgdS0WH2Rd4lufmfEdKSeQ3rS1AlMRk6luD8oswOjuc+1jJpjACukAKZ9
	 IwuXsHorNFMai0CTjnYKg8RkmrKdAxoPcoLQOMNV5QCHCESAhxYdznuAif7Lj1PtYs
	 RL3JydFqvF/VoqPon8EbmKZ41YoTJRY/TmJOKJcfgZP4V7czrvetS2SlOyebDle9mN
	 5hMjo4oPCKbvjV0n04god5nPJFiMg6RGZ8R1j+KrQUDZ5T5aV1opoy/A+VvUGtc70r
	 r43tsqdlf0XEt6yNyOj155jcDGQ3uJbGyQsQtFcjhYmEps4IsM3K56NYmbnenioVuv
	 f/hFWuyJGHyvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE3880DCA;
	Mon, 23 Nov 2026 20:59:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68EEE22B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66778605ED
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fPXrIyCjciX for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:59:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7872B605EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7872B605EA
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:59:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 671BD1A17A2;
 Mon, 23 Nov 2026 20:59:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 363AE601E1;
 Mon, 23 Nov 2026 20:59:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4521511E6A9E7; Mon, 23 Nov 2026 21:59:10 +0100 (CET)
Date: Mon, 23 Nov 2026 21:59:09 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <awSpEjthpBsU3rTk@windsurf>
References: <20240228145013.411919-3-christian@klarinett.li>
 <20261123171751.2226383-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123171751.2226383-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/googlefontdirectory: allow
 generating static fonts
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
Cc: Christian Hitz <christian@klarinett.li>,
 James Hilliard <james.hilliard1@gmail.com>, Simon Dawson <spdawson@gmail.com>,
 buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 06:17:51PM +0100, Angelo Compagnucci wrote:

> Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240228145013.411919-3-christian@klarinett.li/
> Superseded: https://patchwork.buildroot.org/project/buildroot/patch/20240228145013.411919-1-christian@klarinett.li/

Thanks, patch status updated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
