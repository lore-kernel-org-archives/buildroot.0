Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E49B606A32C
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RHKRWbuJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E95E80BC0;
	Sun, 22 Nov 2026 15:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XegqyEaU_tPf; Sun, 22 Nov 2026 15:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BECB80BA6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795359701;
	b=rea/ErV7OtwfVfS1X0kYOOIe5+P6djltESoKzBwJT/RCx4nXaKSriNrsFAvAYySOrsUd
	 AbEzOLf5mY9nG9nzOmr3mozhgKM5o26kuCrcQWw9w6zYUcZweU0hMYrnKfXDQEdSYVoGQ
	 F7/pf1Xv02lpyFZN4MBZwnNWI8aElTWU6VSmZMjBztr4LZsDTQwip5j+Yu+9F5QBN3m/D
	 EsUojvrB06xJQZZNKESxlnqgsDHhTsSPh78RY3MQ9XJW7zDOlkJM7ukLV+RixVu4ZCDBT
	 qbsShHrme1TfEIB7JBWQO2Eo3SZ4e3qIMEuZFitzqGNtXwVueI24Glp+rcoJCOdRLpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795359701;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=GYJg/jpv5JRiJ1DeO+Ptrubd8T43NqM6rrFOLs2cCTs=;
	b=Sz21P8BbzuITDSoszjFxCTTJ5FzxzbdL6Yyo9vhT+wKYtL60T2hGY0OJfY9I/6h2mDsd
	 ocbZOdRdRpnrusxCxOgmRlyX+Hhcd38+wPuz2uFWUyW8xJ11sFynfwH1tdl+E756T2H5Q
	 qw2MuTXwjXuIFjWrUuuB53GpJJDHBM0A/VrfupibQSkT8dU2cSIHR/LNqvBISF9ubkOTM
	 iHGLO/WwwDj32FuDnXPQ2HF0lH0MqvoQhfISG+JeQRw2cWFF/OLRymBqF/0Zmm8HKYC3w
	 C/5eTxQ1jD8b4VLUaY6H/UsqekYfL1H113oktW1AN/nSmvoRglpSk9ttl/Ex9VAUDfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795359701;
	bh=GYJg/jpv5JRiJ1DeO+Ptrubd8T43NqM6rrFOLs2cCTs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RHKRWbuJh4yhy4xoENCHl+gIUdD1hgaYDrAgjCSYUGJeD3iz7JBxomBwVfvdu2u5o
	 Qm5SdTTM7Q5bKp6W/mfFUhZcd816VT8Keo4GVAbovjyB781jDoiYaQrX5THeBGKOfu
	 MRKOE61WrdqQNbX0ea1L0WUpZMUVBwjGdKBRdd3BLd9zCqWHEmSVBCBmZ5NAdMPJkQ
	 IP5+5xSlkN3inj7B3CfCozNwqkEETOd4Z4ywUV60rlZHaT1HQ7FAwfHNpzwzZLSam1
	 xRhsNdn0j7co1gcFDIstDWZL47HcTGfKJ4ZBwUsyf4uBGjEvkahMB/Q9sva1rBVInl
	 yD3sndjaYh0bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BECB80BA6;
	Sun, 22 Nov 2026 15:01:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 628771AB
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 487C860611
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81HcXCD2LyXF for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 15:01:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F156D60601
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F156D60601
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 15:01:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6D8C719F5AF;
 Sun, 22 Nov 2026 16:01:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 16:01:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:01:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20261122131044.18778-1-bernd@kuhls.net>
References: <20261122131044.18778-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <6a3226dd4117ba006ceafb5926ad8e64@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to 9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/11/2026 14:10, Bernd Kuhls wrote:
> https://www.phoronix.com/news/FFmpeg-9.1-Released
> 
> Rebased patches 0001 & 0003.
> 
> Updated license hash due to upstream commits
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6e9100c64894728cd92aaf8ce2f1f33cfdbc675f
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5617631d684a2522ed21c2fa89ec3a94b7ab4930
> 
> Updated URL to rebased version of libpostproc patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
