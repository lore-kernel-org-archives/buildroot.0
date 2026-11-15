Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15E9606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dK7SKj0I
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9811860777;
	Sun, 15 Nov 2026 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk2t0QWY82jn; Sun, 15 Nov 2026 16:30:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C2230606F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794760235;
	b=CrOhsEgPgVePkGA6rNZC4mBhZEg0YST/HQT5F8zqHpF/LYMu9jJ/szu5YlIx2aeohPdG
	 SAASpNPahrTmUCZR7WWRHnJiINB45Q7XqYxr0VUQ3ygAqprgUw4CVOW22DqHmpaaS3GKa
	 kSZLxGzdCPJpZbgm/YE450urJAqhtSWjbCI+sXXdlcBT7FrOtxFNKE9cnKcgEZjggRqA6
	 Bnx2HO6Du1DTQhM891iS4un8DuHDrG60/R7YTarmRLY2zP53JKLfFxnnmtJz/A4AqBPY/
	 FjoQNnNe005NrkY3RjvAwHIUUjx8B4XFmrbHp/ZE9jlHfgeruqKgWQxqe1TXmBcZ+gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794760235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=E9NjZgdRqAKrkQLyZC598vsgVO6aaRlh1aitxVWy4V0=;
	b=iWfXs2rHzEnAnqDK3akh3eZkUA+hrYNsqRt66MUn85IiGs1i2CYVEjHIHR3GxD/twa5j
	 gF01ebaHd8FRXTUi+TbAvTYZV8iyzMdvieGkXmtG7uwJU6dZP6C5QJ8w0CboNi9pX5BFw
	 dk854+4gULFyziZ+r1UCACYquEgAy28tP2mDvs9N+0Wvj9pMWIrMtILiprLNLqrxoro4c
	 Lau0KPcKyv1Q0Hd7ngzyqwVMA2kLCuNDCt3YqSVHNccMqNPccmid/48BITfui4EiHBVdi
	 zHsYkqVuybhcw5WSBpbQu0qVtCsYSiYgMy5agRIsPCvApdpcL635k6zQ5AyFPBm2YrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794760235;
	bh=E9NjZgdRqAKrkQLyZC598vsgVO6aaRlh1aitxVWy4V0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dK7SKj0IrYWTp2NiR+WvrP4XPAAZ7nIRrTW3ZQXD0T84Qcz3kleBT7DeuoZlMwB7r
	 D/dKOcGCMof83Pm/Mcj+XRqYbw6AoMKTKjob+hPFxSowFtmsgDU1BT7A2TQZgnss7P
	 HsuIVZR/qrZF9FS/8t/Hj76FS5tAlutuWQX87Z3NSVztLnKEW2E2XUcHwc75uGzHQx
	 TU541bx82EyfDlweYlo8EeLQDhr+tXyzQ14ketid3pC8xUPFuNOi1kKs1YCgjXmAqe
	 Qcc66s0bqqhPi1E+AAkIKVTAAjmB1DUAF+Vqd5UkZD0MPikIdZ/ZF/OL7z31bm8Hx5
	 4PdDk0hRIHQqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2230606F7;
	Sun, 15 Nov 2026 16:30:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A62842FE
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9856D400AA
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhGeQUUsZegS for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 16:30:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1144240061
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1144240061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:30:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8CBBA780389;
 Sun, 15 Nov 2026 17:30:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 17:30:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 17:30:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261112191625.102355-1-bernd@kuhls.net>
References: <20261112191625.102355-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <6964088532415102f5d00ff6d4148ddb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.4.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 20:16, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.4.2
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since it's a minor bugfix release, I applied this series on master, 
thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
