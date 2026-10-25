Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21ED606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KVxwnnOU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8698F6060D;
	Sun, 25 Oct 2026 17:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkIlm7uakdAe; Sun, 25 Oct 2026 17:28:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94E9C60600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949310;
	b=bThw8fIczK4DuzCIKJr65K6gTZHfQBiZlNio/wONfGONi8sAzb96iraQvt9uZqe5NgTK
	 DrQBuZB9dHqyNspaUL9SiL3NmKpQERnrhPCa0u1kekA4CXqN0xDIsVI5hU/uFYKgTTRBw
	 Sx6enT47nmHinoiSia9At6IIcLiTt/WClnQjznK67OIXIeUk6+n43XztqWHqLA9ay1gL5
	 BamdHwp4Xa7h+Fd4G0I8Vixta61NauzgCaLPGCZ92v+3mIoTFvJhOuYHVT0O2QsyJsdDL
	 9m5Z8mccbSkFTT7jMLXL0EWrJ9F+weq9VwAe8AahVzkyPCrKtGG5bkXJhi4vv9OG0WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HE8oPFVq1w4M8WC8hiUuxjvuSzDIwNKawngXbAUBU8s=;
	b=ECISe0A4LLs6wXhTUAFgMyBwrw2EIt4Ja98EYkQ+34W8g28VRQmUAgXiVOFtkJ90Dmpw
	 7BBtGQMlTeVgyCfcEPM7PFXCpMJiBB42xRHGojW6j6sMYBlSiKo0lWDSUohnoCmLqBiCL
	 UrZC451TiOGnGbHqHL937AakygMPLNKD7cV5A3VXlqqC8Vw7eGGtZ/SJ+cmT4+EPG6meu
	 3htxX0J3OBSN/9nJIc53eb5rO7i1yAVO9ediVigvL60oiDz6k+OqXUYn2rnEHukNk6mHB
	 bj1UxD9Cvarb73afm1kBVJB4uErfMZN0lHsJdfvY/OkZrRBvUEHRcE7uUu1xGjBY8Lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949310;
	bh=HE8oPFVq1w4M8WC8hiUuxjvuSzDIwNKawngXbAUBU8s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KVxwnnOUBcd3D/+zaa4X1hrqarzhqjGw/oGalgCUCV5QS9bRTYIh4EgK8XoKPIBOe
	 if1IbAGZS7gIYhcZShNpx2rybov8RBE1QccDy6DN854H3xui968qamZzK5cCHnBRSF
	 h9EbrB+mFqv9ZeqfFH+Pk9QU6LWXfOis6xVgYnYVmuCHnRgZ01EjYU8yE+RJm6u6ON
	 +cKETsEDxQLsMjAhP4BQCPoPKgi+cp65BBcLrQBQpkOxAL41LEbmvlEuxDtfduyNZa
	 ISb/qbPT560k/zAdUZ1KIaXTecYA9P+1VtT4HfonOFlcQNdXkNPPeWpeIM5r4Yf4hc
	 3Sc5lvJtsbcng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E9C60600;
	Sun, 25 Oct 2026 17:28:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DB7D33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A50A60600
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrzucvcasA1p for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:28:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EABC8605FD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949307;
 b=NeCNx8yBX8wjw2K+TGyQAE3rIs1hxdVW0nAMWDii0avqMbuva7uO+az94kXrfbXbKTLq
 CUppTPj6WyvRKDp1IayMMGYIKSRpk5Z6GjB6LOeESW8IpRQ6IOY9qWo32SgReBBdB4nq0
 MpoMfW/ExBOGAYB/60QSnlqxhC1/MXtVVKbNnrpT/ujuz8mSz4AApmfhIsTsBa61GClVk
 JvOnG8cGCEnazhHU/FwkEW3nmwnjIbqyOwiI/EPHw0OdVNMMSmbsTEGy8KizGMVC4Z65i
 Co+r+tPTG/XHWbVNwCidHuzahlQrm9olSJ3n2iR1A0YbfWYFoGOG4xdSdOp0jWeUrLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949307;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SIyBdo+DFDzioDAle99ToMvLY6bqwo1G4Urr2ulqVZ8=;
 b=XY/2mIa7rw1TxGti8pH8fHYS66iB/dqMyGz7ncCe0qFzXjWcI2r/tCzheYjjPLDuR99A
 4CYT9QWhxG/hbES1y2j2nFisv50/+9pOS6vUfZjrMMfUR8P/18pcSvt44MzmZfF2zlKvD
 f0blgwWDGepaCMN/LuDE5vv/jD8LFJjdCB6TmOGd9+ZnKPPy6ia8YFDa6m8NhPvPm3xMu
 f0Twu2mlV9ZXKDVf9hdnEDJQh/cgmjaxiVSfVO3PNFb2PBl2XhuSIek1f5dXefwNpskpK
 j9GHZDaS+QmKmKMRbaocJDTCvSqswOo0FoELGGxGEGw3gFGn3NNjPQxeJGT1futp8tw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0cjeclPk; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABC8605FD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:28:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6E0C5C51475
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:29:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E15760740;
 Sun, 25 Oct 2026 17:28:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A0EC10328E76; Sun, 25 Oct 2026 18:28:21 +0100 (CET)
Date: Sun, 25 Oct 2026 18:28:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at48MFLaAwWO3wnx@windsurf>
References: <20261024090225.3987962-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024090225.3987962-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix build errors with
 uClibc-ng
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

On Sat, Oct 24, 2026 at 11:02:24AM +0200, Bernd Kuhls wrote:
> uClibc-ng 1.0.58 includes commit
> https://github.com/wbx-github/uclibc-ng/commit/487af14988c3c923aa661f204642597cff356a83
> which removes "#define PAGE_SIZE" causing build errors detected by the
> Gitlab pipelines for all uClibc-ng toolchains:
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-powerpc-e500mc-uclibc/build/kodi-21.3-Omega/xbmc/utils/UDMABufferObject.cpp:26:12:
>  error: expected unqualified-id before numeric constant
> 
> Patch 0015 fixes the problem.
> 
> Buildroot commit f82f5fe177b7f884d424c7ce22aff670ed13f359 bumped uClibc
> to version 1.0.56 which includes gettid() causing a build error. Patch
> 0016 fixes the problem.
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
