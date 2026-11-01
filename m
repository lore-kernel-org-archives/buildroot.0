Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC361606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r7oFY505
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87E03405C3;
	Sun,  1 Nov 2026 16:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGw-TEwVCRXP; Sun,  1 Nov 2026 16:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35346405BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552263;
	b=DvRPtrau+vHvpMR/wQP53wJQHiTvNJ7V+iSixk3UWo61NpVgEduHv4REn2SMkX9c+CFo
	 ntCLR03BXrfQA/OexiwjtNyO9PavEBXFWsZMea9oqC+QluIfs8w4Kwc3YxpNXR6Xe0S25
	 E4yXGlLDdAYVLEyFvvTG5Y41rvm9VS2EaFE3Sv0kKeDsZJgLulUkrAdjkJQDUkrrF9zjA
	 ZaaZdKEca19MjJ1dT5gs/d9qAfZcTITLmi6grCqRXFLP9nmt6krR5R3Tq74iE4GhAEuoP
	 qf9O09eJxKFJuOeSxh9TvgbIktwfEZzvDeUjJ7SWJXb9NE+jTdrA6nGtwbUTeC4A1kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552263;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IE2IpEyG6tLeIfAh2FaC0fUDESQPMtKaiIwKf8M1fWk=;
	b=YDaAzLpSKPOovFL0OVQIpG2W4Ko/2w4M1XLDE2KcJNN24Y+3YGkJBpgPMuS99oHtuAn3
	 pv/i3Jdj+2AzR2c46VxNlwwPKPzZj1BvrVPzlZMu6iqNYRhew2hLDJcxuNorn1i8FFyP9
	 rFnY9DnRUTbHWH45k3CbebzqCThE+/2PY0Skot9y/5YbC0fvbcY8Q//qeDtg0cGqjYQf8
	 mO2tGl1qVcvC/UyDez48RL6uAP0AgVQj29wyraTtBeE8oBIS1tIeVf/qt+GJOtu26Q5LZ
	 biv8Rzu87iaI//EIAoNqSq0It37sjl+d6wdFiHsxPwZsD+MukZ00X3LcoEN4SIa+ATw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552263;
	bh=IE2IpEyG6tLeIfAh2FaC0fUDESQPMtKaiIwKf8M1fWk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r7oFY5050djl5PKvGAt+JiXTd2E8RrDQKiSlnXoQW+Jd0WkH/kPG//Nnmbbj/gXUS
	 uxA9jFVcakugJw1B8Uzlnwje/vTc9hq8JLPZQHukxbfNDNeJeeSPcYiQyMQC59ecvJ
	 un9Id5suRyivRr50XcyczN2gEWw9LHVS16NMkE/xaiFsKIYxFTiY26N9Er32Iu92IA
	 NH01vtCilT5+87KbbrVfwcGv+SVYt5uTNfkL3IWunwGfX8PMd0gDNr16yofrYbRSEr
	 muIzbQAKpRTiFdndhY7my7NK470/57fNfnSv8gNozjX4S+1ueK2EBoKE+gymswXG+s
	 /rRHZP/Al9Mag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35346405BD;
	Sun,  1 Nov 2026 16:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D0132AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E8A4606F5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LggQwXSdr6xa for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 858596060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552260;
 b=rLwCut3ZLs9guiiLflmp7A7Is+77N2sloer/YjjMNuw7Ux9A0allOG7oCr3LF05hK1xz
 u7Ih6WdEgO9uts2qVVhSS1LRUM5yyYdgONFLGpWK7rcjJ3tTRHkHJMblu78H7QtXCLsuP
 xNQghSEJh8s0nvAALQFX3Ji8M6TdzsgejsDcMUfG3hWbraNApULtWb39Q9KAbCry9t+it
 PwwWcviTtZ2yi7qHPxSIHXj2DJ0l6oo+nkmv7D5vgEbqBmlKCu6McASpPrEg0Dt4HbXWr
 OnBhVT4ym0KPI23kKna4FuHSTNdynyk/fLkyp8sMZ2RqW9qnk0aXuPKaXk+kRNZK81Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552260;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2qqnss/ct7aX0r2k2XzFtr1GNQrGtWaevHyGW75jRQw=;
 b=gvXvClfYAu+onO17AcnOqUSKM6/aP835w97HZkjr02vVPfdTm8SaqCeohgvSNuS3ZAIe
 xYn+FiZ8n8doQ2apP25PDXyhRLLl8OaTaM/preSFcQpgW/nVNkmK4qgDRetncgjjZrzTZ
 Ad4xXAH/c1q7/oyxdHY8i941Npo/IMG31BiN41zqO6cdJkzg6EkZgpwbC53QizBi6fbe9
 IqX0Utum4SIeouGJ5Thw51s7/KQk8wVFu0Jq6t1QvsokVTKuzfkT8sdiZOs+cYu95voCj
 eNtkqhvkYAe0lFkwwFYes1d1VglY5/55wmX+yAYoyfUZEGc+HyOy/iPJu1t2S7Q58+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=q7k8bMEX; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 858596060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C6ECDC49F77;
 Sun,  1 Nov 2026 16:58:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 013AA60750;
 Sun,  1 Nov 2026 16:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 294B310329191; Sun,  1 Nov 2026 17:57:36 +0100 (CET)
Date: Sun, 1 Nov 2026 17:57:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <audve-I-cSpflpOu@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-3-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/6] package/libcamera: bump version to
 v0.7.2-167-g8fe1f4514
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

On Sun, Nov 01, 2026 at 11:45:31AM +0100, Bernd Kuhls wrote:
> The releases of libcamera-apps and this package are not synced feature-
> wise. To use the newest release of libcamera-apps, version 1.14.0, we
> need to use a git tree newer than the current release 0.7.2 of libcamera.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>

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
