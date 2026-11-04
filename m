Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A07606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c+BQRmq9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5F26082D;
	Wed,  4 Nov 2026 22:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZiY6tvjcawa; Wed,  4 Nov 2026 22:40:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 27BB460844
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793832036;
	b=Ymutd5B8OGED0fK2p2a5YpZz9ECZVnC8lw36xK4m5u+ZfVuTd1L6/naIzpoynZvIC7pG
	 clKx4LtrCZ17zJuMdC8po+m47XgSWQHA9EHT9t02f2FERyvs4hX/0CsBoo0t/Z69LrR41
	 WwN6rBoOxDNxjd/Mj9Aiy+g/Zim7n08cCHc+GRjgMthCiApKfFnr6e+6Z0SSdVRTBqmuU
	 A+vZQd9/GVTgrBiLD0+bGGHFmT1Hk4+byFRbR0qV2SIi28cTgJ2QYZZryb/wrGLu3kdd0
	 piX7AgQf5Wlgfhew1e/Sw2Q/iPX0SO3yGs9eaSjTbWWdtYQorusFo3VqIOHADwpsQVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793832036;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ARTID13YQtqtMCtoQYbO3mIj8OfiFmacDQJkia0Mfjs=;
	b=S6OHhV+0gLL3iiw1v1pkDFgjrtDyae4OLgNPEr17ZvP7qY/QeasCCoihvhbl2I2jO9rx
	 tD+OzkrDkC7b00mCz+ziG/WbUZyGGkosugqJ9B4assLcYjesv7CcV65pzHw7Ctojc6Yu4
	 HF2nDte7z1uqCbvrULwlV3+Q+qhDhBVefDj8xYGbu/Ld8A4dBLFIuQ0Ob4XT9zEUUA4NQ
	 QISrwxxLxeHzGOfex86YvpXSMSTYqh41/qCi6egGe1Yl2J5DY4uoqXP6SzZviIOI2/+ap
	 5MNe6sB3w9fpkqdK0f/PsKzmtS2/cJIf79mwsLPnrW4y3d9pDi8INge1cqLTfutSkUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793832036;
	bh=ARTID13YQtqtMCtoQYbO3mIj8OfiFmacDQJkia0Mfjs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c+BQRmq9y7LhWWk1tFmXEhpHu53vR0gIet5c1RnA/1LKGpjSGSVJ1a4Ii0FmYw46q
	 LKQxE2Obhdk0tBJ0EVeUPkFZLtjfcyWcxo5qLfZAaxaY8HcdJsPAWtSI9hdMXDXe7X
	 Q05EkdnnI445IB47WbGt4dErQmJTHZfiEMT4ZYT2mQKYApV7tkW9DxHV/TijuyKxZp
	 Zp7hkWdqqhQU3XKGUdn7WmrxpA0TBRF5DjK8Yt9IU7KbsWqatrYD8Otg3ubVQQ5Esf
	 9TCWGRxvhxbg2DKrGEM+VI2P40U00HHNIuE87lriGHu1QAL28IRQQfMhP0kcpgtEo6
	 thDtUeb9wFk5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BB460844;
	Wed,  4 Nov 2026 22:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9CD831F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D081540867
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUywch9ZGqUC for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8394C40866
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8394C40866
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:40:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7EA2E1A0440;
 Wed,  4 Nov 2026 22:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5821C5FD65;
 Wed,  4 Nov 2026 22:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A3D41032925B; Wed,  4 Nov 2026 23:40:25 +0100 (CET)
Date: Wed, 4 Nov 2026 23:40:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <auu0FjKN4kkG9Pck@windsurf>
References: <20261101222746.26548-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101222746.26548-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/rtai: remove package
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

On Sun, Nov 01, 2026 at 11:27:46PM +0100, Bernd Kuhls wrote:
> Building kernels > 4.19 is broken, for example:
> 
> No RTAI patch for your kernel version
> make: *** [package/pkg-generic.mk:237:
>  /home/autobuild/autobuild/instance-13/output-1/build/linux-6.6.161/.stamp_patched]
>  Error 1
> 
> In 2023 the maintainer laid out some future plans:
> https://www.freelists.org/archive/rtai/05-2023

In this e-mail from 2023, the maintainer said he was 79 years old!
We're 3 years later, so it means that he is at least 82 years old by
now. Not surprising that he has other things to worry about than
maintaining RTAI.

Therefore: applied to master, thanks!

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
