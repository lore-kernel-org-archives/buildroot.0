Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E649606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CgZhNmgl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B5081DE4;
	Wed, 21 Oct 2026 20:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOE4ljofOnKg; Wed, 21 Oct 2026 20:41:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 85F3481C26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792615275;
	b=NHpQXhnI/n+BoGRWc4OfHUr/lOB71FsHk3j6GKz6LCXizB70t4aBj6LNlG5nu6OewPpL
	 OtXO1SSRtV6s9J/mfjqqB8EcIGmjG6gQTrBM/Ve4Zoy5QL646NumxVlEaBX9KBBlkrC7b
	 SOZWyjzBhqiFbJ3JnBxH5E8CYfIAgN3Aix4awN4WshEbxwY9/10DY58FxIbsj0GOETHPo
	 yl8H5P+y85+A18oOxtOMnDWzecUmPxxUYocS9v/GaaYNeZCFszlI2BEfmmM07u+okNUPl
	 uRxEphe7/VTUlTPUEGCiLVYUOcoxi3P9CJZMQW1SdUlODovW5u909wRk9/pbNsH/aEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792615275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oAtGmc8J8nO5ISfq8063U1lG/BvlEEZOIILc/ujbM4I=;
	b=pQLVodk9CFfdB2PR0zB5uOKFtm78mmzGVPBjWYxNjdXGU79Lg6OmkpqMFoTwdloNd8y6
	 AmKL2I9IlavJhLUP5WZtFne5brsqDAQBujyZtPKmFS+SlVuwqN2IAJdBilUCzYNSEEVBe
	 UW/fvB16ufwJ9X26WjcQleDba8fBv3t81yOpMdJvhmkeqZuStcICpxh+KAD/wQhcqZb3K
	 S4hCMWWzRurJ0RhOl38CJ0euUW8FlLaLCF6nbcC9jMjMGSN6gIryJ4xfe+EkocoOZh39O
	 QWL/HBB2gYMOftq1vg+kJ4+nHle+Vsbk0jKqZV02azcYIHFiimgzfeq+8o1ekfS4iJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792615275;
	bh=oAtGmc8J8nO5ISfq8063U1lG/BvlEEZOIILc/ujbM4I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CgZhNmglqcubs/uPqcMpgrKBxR937Tkk9p+9zZgm8p4NdnYV2yA/BBpM9zGwkg34R
	 oyJ2BtoK5Rp5tAtFQp4R2oTqiwy7v4KJacKdkDfnH+tKG2hW5m/eMb5eTZ65ZVd8YR
	 ppbM0I/rKj5BNF10zZgsYOVfxFZt6ZnR7R1lB4YtsJd0KPLaTTPaYaKUEMnDwSf9Rc
	 tk7PUGy425ZZ3Yas1F5ohB/SF3ZlMfAEHkuFXvmpV24Y0oUulGkJO0/0dIPAEeTRZY
	 DBiOwaRnTFSMIbCImbxjeMT5VNpq8uHNUvP84NzOQmgrYp6G4rR4ZDdl/06PJA5i3w
	 GZAKSmDuh2Rgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F3481C26;
	Wed, 21 Oct 2026 20:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C7F1184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC1661637
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFqqQRqXcWK7 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:41:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76B1261634
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792615272;
 b=GbTC1LdCmfKENySXMyR6T10dl75KCtjrFazv85N9X/E8Am/RD6+sETluzUDyqPViiIv1
 zs/OmnW8nIpnhTLNy+S1ycsfTHFVZ1yoG8m17h9mV/GrE9r6nbwHhjsu2DQm+82HHNzke
 Ms10yrtMdcFuKcRHkulKgopSOG6Xx00d/68xLryH1lJMCWsOtQcBbCyYpAdouhJYQCOXK
 /dts5lmbLSC1nNzMD0Uw1lv6IvwxPLP8Om5g4Zd0C/Es4iyeoC6N6ZEA48vStid60Ir4X
 Qy6FgfefXhd+AiMC23NAwjcUHB4PZDO4qSpY5zB0OqlG9SnrKvb7EOBMsJZcO9qECug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792615272;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xyNO5ldTKSBvXBoGXOnLXpIXqCNk2s9xls8f9gkdaII=;
 b=EkAkTZ6vvTBkpsBDPSQ7sLUmqbKC+ndRn5vVTYOjgPeSkvfa8QOi1g9qifjymXOVWPvr
 2MKsAOakJWmNhZubDn6X/5gAxAAHBT0maDUNiJag7A3HWP3Nur4AE6GFaHZ8geuyfOc3q
 n6z7Za/Pyt342Pwt/sCnFRLVinBWYQMzxSspdn2aRqxCQD5FRHYtfNGv59acHCOEv67mY
 C67y6W5PllJcvP4BrB0kD9BRXr8nRvqsP+ivNKOOTyRnuc1oNTgrduzbuKCU4vRfH0XGc
 814oHu82g9xd9BFX2UWmpgSgGL0g3kTDp0J/53ylo6ow2Pqd2/YMOn2r4SbLquBGl+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OcDphRbI; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76B1261634
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C464CC5CD6A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:42:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8EB55606E3;
 Wed, 21 Oct 2026 20:41:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 978D810328D6E; 
 Wed, 21 Oct 2026 22:41:03 +0200 (CEST)
Date: Wed, 21 Oct 2026 22:41:03 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@buildroot.org
Message-ID: <atkjW5h0IxrIvFNX@windsurf>
References: <20260908085905.83870-1-mf@go-sys.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908085905.83870-1-mf@go-sys.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/sdl3: bump to version 3.4.16
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 08, 2026 at 10:59:05AM +0200, Michael Fischer wrote:
> Stable bugfix release:
> https://github.com/libsdl-org/SDL/releases/tag/release-3.4.16
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

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
