Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE2D606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bAOkAukV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 565E060752;
	Tue, 27 Oct 2026 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNuCs0jI2O_8; Tue, 27 Oct 2026 20:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96BFE606BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131260;
	b=RfH+tGL8xaau0kQVQUD7Px6u5HMGraKkffKaNHV64hg3foTw6pkwmjcmPgS2xGECsX7E
	 GnCjoeoDoHB295aRvPyzsFSwJ7k3XWngGLAIO02gx0QNP25jakq0oV/3N0Zd/z/YlbTyx
	 djK+SyWCHwHHXi+7dBXJvh6k7hgy/yTbzpNZXOctFgAdm8qLHE0gJSwesrHGLdQAmCi+k
	 /EkpUCToyrjFxp7sWFhAZtO5M5fnogEJvX+5KRsRSYszYBg8nRj6nFFFhEZLEAF1UmbqJ
	 z5XmAg1gJjWY2WCbpA1cKgMLSZ8yEZu78HbshTl/0DYofcTvGcB4bzkBjweHvZvFTew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hnRVsv7Uv8+70sgYgTCkM1MRZ9SY6z8E8GuVOf1Cuss=;
	b=M7x1tM4xFbi67IegecNLUEQT+fZrArSnpraZGKp9zRJpAEAVe8lwC6h7aKHtaoiUMJmE
	 shei2kStOPAEQElgmCXChdGzesqxohq6Vaqj+eNh8CcKElLdsz025/8iFzqwoc7rK0suV
	 4XzAt2jfKpxaY6CniHwUpXIQv1YTrICEYm66gv9dyE0t5oVrYWAuAjPEbQlH6EcujSR9t
	 8tLl1Og2lp8pgu85/ktweEBiqIMKULeTv8ibkcF5zfgw1eppTt4+zQ4gwgx9MvXvmyBb0
	 7ZcRfbEiRH8EnZPVDLkPoeU1ysqVQMDQNlUQJV/Cp8Qpi1YmWyiKmBlSqq9my2JxeWw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131260;
	bh=hnRVsv7Uv8+70sgYgTCkM1MRZ9SY6z8E8GuVOf1Cuss=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bAOkAukV8qCieEcoYjCdu28WYta5Nnr8jjnZZfURLsSLCrgJoueTPYAG3+7ZfZA/L
	 zfYGbfC7abuX4FuSmbjmManiFzXYAqpYKfGqX65glVZYrGQyqO01rtKHZNF6QesoxK
	 qFKtjPmPnE66AGxqYN/+9y0R+HBw2S5in3fGCS5F7ub+2Pt3Ms7VrvB3Sk6TUw4Vkd
	 hfb9636avl2xDZTrVHEBzWFPz2xlq8uVruhVoW4NNgy45xjhU2VKe/vVdI+KJ5+YAu
	 fZhCOJFsgZN7PsOlw44zO/MP4/XX3n1Q0JjznpiTTNN/WEEY9R0qEzyux4mFEuUKtf
	 9sGyB/ztM0l+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96BFE606BA;
	Tue, 27 Oct 2026 20:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9FF279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 360B0606BA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wbcM6C8PY5n for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:00:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D913605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131258;
 b=ESnCooGgjcKNnDFpSSc03Yj/R+mBUAEIrDP/NkTZ1oWFI2ot/vrDqHH/uaA3Mv82niIj
 zUmwfdxZ5qaRUhKDd4SC8pm192uCBYpqvMhFxmHnSKeE/LjjNWQSf63lKQf1TKj3ix+Wy
 I2OtfEJyl86S3EOotOMfdEBBoA9Jf7j3BHG+iLc7XbHK9CM53WgfbrPuwD5mIrLcCFxDm
 l+9WvFllvRQC01veh/TaFngUOaJKaPqEaOo3y9K4UEM3fkiLbc1SL3+uhu6QSCpzF10Pp
 AtywDw8XEo39J8TU5dTi+Sl8q2xW4iF7w8Lo27OELkbH/rZG7Elxv1czJa9UAOCVMRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131258;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=7jsFhlaMRhcx1+q8LIhxEcyNjW0SJv2J3AB8t24xJRQ=;
 b=VNjhMrw3XXjFvF1XBtj/7KzURxIn740/WMUJ9e+LDl24aao8ZIIOhZB7jjZ8sanp36yZ
 l2hwAS3+bNnNG52VotdDkLxMjGwbTEzD6wbug34qV7LrQPjbCU2rOMfwW++VvBia4vR7H
 aFpmN33dBY0WWyXsApXcpieVD0GHQH3GuRZhQ7PEZTvxbHG5RLaNcRkDdrVy9BuZ7oJ/x
 /fOkF/7MoMvCf1sdsUlhppOPuuzGuVR21I7Td2iToNDMLwbANkXHB3pqR1xn9ZCjztiCK
 mDY2kmqP8meFHaUzK4KVo0d3SMT9QEHuKC02LQwKrCIMHz21Uo6RlKiifW0TjIvEWpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KJQIYXT7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D913605F7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95D254E41336
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 63C54603BD;
 Tue, 27 Oct 2026 20:00:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95243103290A5; Tue, 27 Oct 2026 21:00:51 +0100 (CET)
Date: Tue, 27 Oct 2026 21:00:51 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEC6OjclUh-sdaQ@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-8-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-8-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 08/14]
 configs/mender_x86_64_efi_defconfig: bump kernel version to 6.18.59
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

On Tue, Oct 27, 2026 at 05:40:05PM +0100, Adam Duskett wrote:
> Also update board/mender/x86_64/linux.config by running
> `make linux-savedefconfig` and comparing the differences.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
