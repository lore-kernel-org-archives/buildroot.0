Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B880C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 12:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C96EB404F7;
	Fri,  9 Aug 2024 12:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHBpwt65_pCE; Fri,  9 Aug 2024 12:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A82484105A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A82484105A;
	Fri,  9 Aug 2024 12:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451891BF30F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0A7404F7
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 12:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1QzwnoCD0fo for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 12:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D6A74105A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D6A74105A
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D6A74105A
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 12:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 975011D869;
 Fri, 09 Aug 2024 19:11:03 +0700 (WIB)
Received: from mail.athaariq.my.id (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 08C0E1D877;
 Fri, 09 Aug 2024 19:11:02 +0700 (WIB)
MIME-Version: 1.0
Date: Fri, 09 Aug 2024 19:11:01 +0700
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
In-Reply-To: <20240809114345.693108-1-gael.portay@rtone.fr>
References: <20240809114345.693108-1-gael.portay@rtone.fr>
Message-ID: <4357b7cb92a46d0f3c40cc3bcc210c96@athaariq.my.id>
X-Sender: foss@athaariq.my.id
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:content-type:content-type
 :message-id:references:in-reply-to:subject:subject:from:from
 :date:date:mime-version:received; s=dkim20240121; t=1723205463;
 x=1724415064; bh=h4nfyXrBfS3j+5M7KnxHzdhXm7AUvL9Z0pFC1hOFcy0=; b=
 EM43WV7dPejjR5sZiKEck9Zybo5rvzyUQjS6dWfeLaCB/bIg1+K/GnLnYRpS/h6o
 SKallE5OgN0BWo4lpEAhN8/XPgh0GiV+OMX/+ONQt1s5XS5W21izWhZQKbmbNC4b
 94uNyiIzGfa8vmguA14uwZnhgXTJNu9Acf7vMmLO4tgQVWvx0xx4kk7H6t7Esqi+
 MtEr+bxj2FWFtK4YoxHjjHBDVK1H86bRy8CyO2hvxT8em2O/VDQEq3rweRFT4/tB
 s0i8ca3+q4m9mEWsEuoLP20RhkXJlYoQAMlTvVhkchnwMYJENk93cbR3wMi4l+L8
 EiuR5i7N3pOyIszEkihsCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=EM43WV7d
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi5_defconfig: use
 correct CPU
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgo+IEkgaG9wZSB5b3UgZG8gbm90IG1pbmQgaWYgSSB1cHN0cmVhbSB0aGUg
Zml4IHlvdSBtYWRlIGFib3V0IHRoZSBDUFU/CgpZZWFoIHN1cmUsIHBsZWFzZSB0YWtlIGNvbnRy
b2wgb2YgUlBpNSBzdXBwb3J0LiBJIGNhbid0IGFmZm9yZApSUGk1IGZvciBub3cuIFRoZSBwcmlj
ZSBpcyByaXNpbmcgaW4gbXkgcmVnaW9uLgoKUmVnYXJkcywKQXRoYWFyaXEKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
