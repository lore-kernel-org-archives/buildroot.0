Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C953606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hXozdUxH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6CB605F0;
	Mon, 23 Nov 2026 21:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DGt9epeCGrw; Mon, 23 Nov 2026 21:22:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C2F36067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795468950;
	b=MJqd9EliNfab235Nz/qHx64vtubqNXDbTChK0Y2ipqrdMQ7GE2ElxJ5m5xj92CmiLZH6
	 Q0iln5kP45pFAx5/Lzc0flu3gQCvL+Y9hd3jDzm/i0sGhbMiuwmqEtw52W5yFrPz9OwX9
	 ej0H0uTna/mWIshgzpfVOkrPx15YLQzjaAvyL8UU9lqmSj33gcsyI+uc4zMneqsqTV/um
	 oNtuz+y84er2VcXcA1tZYkqEJJvbA8ODPx5nlaXZXFesz5zgUBkVFxQynFAdAIHSMAHIh
	 BQ8WsrnYiU5CWTWjTtRJON9bV+FlS+JCdrEjixmApvz190Wq45EFRzAvZKyZVHFbPKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795468950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L3qcF4tamcPE/Uz2lJ/LZk9Ns4nTWANTWS1Lp62Nepc=;
	b=FOFld5TPTBLhgtRrc1cW63CSI8OC21npZK3XjpJI4MGsAZfg4kxnEXAi1GinomcAKf48
	 9Exq3yfw3G578gbqGjxMIIaBiMH9I3E/BZQpint1qfTxSC7wNHaH7TYcQwWfQl89hvpKZ
	 1jEo6lGs6CW6uSHwXq7LI+8PrnZSZB46tlHxyvjauydBP5VQaH9G6m8DK1ZqSWyWqRdL7
	 kvM1JfpE8vh12SH/DKp8/Y4bZbOcRfwEiRzi5NiTohm/KmfJJ0WYyDy4Bh+I9YP96GPfp
	 ZWDk5Ilh+MHuU2w0f5LXYfVNHW8J+tu2oPtRdNJh8pab6j0YHRtfy5SB0xHXUhpYMbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795468950;
	bh=L3qcF4tamcPE/Uz2lJ/LZk9Ns4nTWANTWS1Lp62Nepc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hXozdUxHa0Rt7snh1YC7U+J6trsuwDRYs5MJpHPM4HDdnbNCagXLAvqLQWQbzFvfN
	 vOvBOMvcGA1ha0xGQRL+k9fkWr8btc0pUM40LVvlZxYnqEgWHHIg8SUWAZOuO2OMVz
	 WxFBTT6krnxootlX3D3JAGD/MbDMsEB0FLoh04swMyld6jeGO1ieqxZ3/LqgCcwHFC
	 fEeVhN2jor91o7uQxrCD81Ep5h+fBYgsGLG12rI6aAfVNBYJaKUpMMnIbpntOUWpt/
	 pZdJ/k7s0iAyrsvYCYeJ3ITE95slICcAFc2sxniHdTnE0NUHpEh4Jb3h7KMGJRkpj3
	 dXjecIv7SttVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C2F36067D;
	Mon, 23 Nov 2026 21:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C32311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B3A80E5D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOoolGsuowwo for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ADF0080D35
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF0080D35
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:22:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 413234E41722;
 Mon, 23 Nov 2026 21:22:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16FD4601E1;
 Mon, 23 Nov 2026 21:22:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40BA711E6AA84; Mon, 23 Nov 2026 22:22:19 +0100 (CET)
Date: Mon, 23 Nov 2026 22:22:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <awSsnZv2Q9VPGUGm@windsurf>
References: <20261120181752.219557-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120181752.219557-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH V2] package/rtl8812au-aircrack-ng: rename to
 rtl8812au and switch upstream
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 07:17:52PM +0100, Giulio Benetti wrote:
> Rename the package to rtl8812au and switch to the 8812au-20210820
> driver from https://github.com/cybersnow02/8812au-20210820, which is
> based on a more recent Realtek release and supports Linux up to 7.3.
> 
> Bump to version 2026-11-17, that is the commit of the latest release
> 8812au-Kernel-7.3-Fix1. The commit sha1 is used instead of the tag
> since upstream deletes and recreates release tags (8812au-Kernel-7.3
> has already been replaced by 8812au-Kernel-7.3-Fix1).
> 
> All local patches are dropped since they are already handled upstream.
> 
> CONFIG_PLATFORM_AUTODETECT is disabled since it forces
> CONFIG_LITTLE_ENDIAN and the host architecture; endianness and
> cfg80211 options are passed through USER_EXTRA_CFLAGS as before.
> The module is now named 8812au.ko instead of 88XXau.ko.
> 
> Add a legacy option that selects the new package.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

This should have been an Assisted-By: tag, so I changed that.

>  comment "Legacy options removed in 2026.11"
>  
> +config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
> +	bool "rtl8812au-aircrack-ng has been renamed to rtl8812au"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_RTL8812AU if BR2_LINUX_KERNEL && !BR2_s390x

This "if BR2_LINUX_KERNEL && !BR2_s390x" is not needed, since the old
BR2_PACKAGE_RTL8812AU_AIRCRACK_NG option could only be selected when
those conditions are met.

I fixed those small details and applied to next.

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
