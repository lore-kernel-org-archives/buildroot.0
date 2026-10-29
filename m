Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13510606A322
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rBNbQJXm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRX/e9c0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDD918102A;
	Thu, 29 Oct 2026 20:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psUQQjacRpD8; Thu, 29 Oct 2026 20:53:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 268C781036
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793307208;
	b=TRoo9KLlW3o5uss4Pp9OdtltC5wsMfWed/lgjgpUBZJkwHPrM3BFDVmkVdp/5g6j9Bx7
	 zX4mPRm4RCcMot9wNtWXyxN7gRc6ATyTRlOusF4I7dKc6ekVrbkwm5HenyfpEUB0Clicb
	 SRxhSweXcPU6leKZ3EhA9d7jVj7wkmi8UR1VQKLuzmsGALqKIdY0Rhz/nfH9aYaQJxRW2
	 Ucy5tvq4m3v1RihxgBc3NyjpdMsX3XbAAdJovwn8NHb3y0mKvynAagGaOhs7LpsCWPLdN
	 n30peO4qrrzNpMVgIuTXyADYHgfi5ElBSUm6q7E50Z70Mop1Cg84Mf3ObSjwDjFi/kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793307208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:Date:
	 Message-Id:From:To:X-Mailer:References:In-Reply-To:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5dGl60Q7trYDVL6WT9nbOsXE5Ud1+4SfaeTSOZsQzHs=;
	b=DIIyPn67pZa1P9dm5PoglyrFx38415eARRSSubdSOiwqyiTRMJ6hQ2UTC2XxSKqzKk7c
	 bmlDLeDFq+XvjKn42j3qU9zZrR2jr0vy9fTnvfLpo5jWqzhBddKM22uHpCcPhpavawfpu
	 QkOlc3bvMsHVPK6hkOWk2iNFibFhFHPb/uzg7TSl8Ieq6bhyBdui4sFmHh7mSRvFlZ3qI
	 Lg9+fDMPSzgzTmBvkacQgTAQJYqMQ9nVer5ZO3svbyG4Sp8t7qA2AnS3NhnbLw+rP9y8N
	 I2vWH5CG33Hlju3D2IV8QnFjrmuuQXtCDTw9BmMHgKjzyAeUWOZusn3jzOP5WOTMN4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vRX/e9c0";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793307208;
	bh=5dGl60Q7trYDVL6WT9nbOsXE5Ud1+4SfaeTSOZsQzHs=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rBNbQJXm8unqHPZEU6E76mmKxqXgeFImpTER0npOI2yqHX//NRTmcOcI2athnRYV/
	 OO3In4KFGPX4FwoSSgCbBYQcv4HBTfqmzHwgx31PhjugyhP7kEswizxmsvmeuCF9TO
	 B0Sg9ZhBj5JLbbqUsPHnR9UA7nIa3tOxJrcON2CZQUk5UCzk2oFyLstN1JSh1r3N8U
	 fKtVG/BCmTZquVOyQxq5osrn7W4G46Lkwz6D1u/gDeGBXQ/VfZt0LLVEwGL8ZiWslP
	 9h2XPi5etV5szkqbgsPc3bm/+zACvzS9RGQ0P+D1gFredl0+krfir0g6NWaaRX2Iu8
	 9CEzN/Fn1tD8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268C781036;
	Thu, 29 Oct 2026 20:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C539972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E59F381036
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JI6oS2FJDjsi for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:53:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FFCF8102A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793307206;
 b=FMnrFfFQQ5rxskBwQsk2EQ9+8M88dsl+oMoDyuHAto+YC+M/m19b1wnh4NcGBQEzyST7
 I2dyR4WovmxOiI4hFz08X/OfkF5AcVZ421IE+N4NCaB3iSoDWHf/R8ld1QgbxNJMwtIIM
 V7HffC1+z2T8twXcWkrMV9LfDzRxgN4P8Rb/S25Qj0oCnk2q6UuLXiRvVqs/m06qwgCVP
 Dp6GvqBN+gccmFgVScvnP/K7y+I9I/be0C17NMkzp5o2iHgo1h8AO0f9mmsKSOX3PvEHd
 HN9cl7e5ik4zBz2QBvMAHzSypWZGydX/TPxoMxKauZ+vA4PeZxOMUIkSnxzGMgXelNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793307206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
 bh=3Kx+8wNVhHZibz7vOZEdDoccsiPEVUmCleeeg0LSafc=;
 b=YCvBdBejnKZz9cP/eYGcqp9eXLlT8hvPaceuAG1H4JlKNXpJdbtd3UQXWjJbwe/+vFCB
 +acmRjiALR+IIRGKGn/A8AGqfCsp67MpdrrxTJ4bFtZhhO3qx6Dbxpf6rNa+lGKODdvqA
 zlKo3GxQrpdtWUVbTT/YG1GlZRM9cSXBEBvOs4dqziDdKeiieL5mqu97RLSfg+8GbbepT
 w+5bDD9LH1pe5vNY37hjYXrbDBWGVy5qA38+O4qx4mBCYc/WHsAA+JLrF8eE6NRaFbnjm
 Y2O2pPzn/8vOXyG+h6ofpzRYJK1J4utPGuAL+3QvEVULLjeF74KoWOy1qtFr5wtbSeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="vRX/e9c0"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=vRX/e9c0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FFCF8102A
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:53:25 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso390861166b.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793307203; x=1793912003; darn=buildroot.org;
 h=in-reply-to:references:to:from:cc:subject:message-id:date
 :content-type:content-transfer-encoding:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3Kx+8wNVhHZibz7vOZEdDoccsiPEVUmCleeeg0LSafc=;
 b=vRX/e9c0lXwNuAmn/7L5bXs/9SXqFch5lJNXpw1qF3f3kU1RZeXkAmJM0QIaWRy0Yl
 L45+Ixa/5Q/LOy2eW+IS73cI+MDq6P8uVMvuuxPHT6VjbkCt7oDB8Iv1Zp0Fo5bNpOw6
 J1clyStAHEFOIucGQOivlIMxCptkxh7Fq1JTLPQaZSMahI3D9m/9X5Pu7/sXivyQvOAg
 cNo0TezOKQL1Xtfus3RhTRalKR8Yd62QN2871E16PIbauzfsWHg1Pnv65DNtVnilP4wS
 Do4KPZLY+JhDkUqIgYLUQlQzVOcguwyH45GcrsiL9lzmewgeuXtjfM9DKGkb8jJ023qU
 uidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793307203; x=1793912003;
 h=in-reply-to:references:to:from:cc:subject:message-id:date
 :content-type:content-transfer-encoding:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3Kx+8wNVhHZibz7vOZEdDoccsiPEVUmCleeeg0LSafc=;
 b=pjNbMHcrSdLMNe57czq4rAlUtjXEGsmEqUE0WkQsrjdWI99LiNUWxE8DkKWeaUG/t6
 ssgj3mOJtK6MaEPJq7CgGrso8BpBQ5KuydB/bKTqE5mKlufcuLIw/2ToyrFDQzI8AtLr
 KxdmZtTxSbDLlYTHjzODVADF6YAuNFDgCQyuUe75if3VNlh07dz8o2sZIkXg4AktzyiO
 72fBSxWpaDGBVSluPAuaxP3PRV93gExBC8VCHRV/b7V6rNxwniTg6CMU8WgMiPpXiyiV
 eoiCZV/aGmOGZ19FH8q/ng7jgsWAU8jT/C/E/516WKFyEiUC1PqHZyfixKKkgzb7i/0g
 uPMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5OShMggpdkbfmWVNET3iLNVREDjaVQuSXQJEGOiWs/OWNr8FPHub0JXry7ncK1IAFfC7IbjNEIn8=@buildroot.org
X-Gm-Message-State: AFq9FYL+ULZQgUh+gw27WIiHAqXZD4TSkZY7aJ8P7XhT9QG+ktOPE2mr
 rtamX3PINDWMxJ1sUyCAasCEqoDcxt4bbhlIAKoUd1jdLTm76o4G8Ls=
X-Gm-Gg: AYBFou1h7fynLkqqdeh6Z9ZfSM7zgeCYySC6gblg7pDt68oQDlj5q7F37GfqsgpfV8K
 3tTaOLGhgjlea12msQFnAK9bcclrkkE+/erhE+9j7KlVgcymgxwJus/K3WvGieIl0tDMuAEcy4P
 DjBOv7vkA3OHLfCy8rdo1EGWtWFxNA9z7cmsD/mRqvrtSkM0FXNTQaBaCib53xTTCcJBQ7j+vqJ
 H9QmXww4nCP/4SnIfSFbCLUOZErnCnL7fOFyW6HwbO9yi+QUM1hr++nzbHJufYvTdh1E3VLFXy+
 5FaJ68Y+ry6Dd4biGS5ikFxSArlmm8xAwf05TEfNmfS+ZS6HfGuP2XQyEf2xXFbDisLu79f9NJU
 KB0Zu602mXn9pxvaQeELxtwH/vZwWs1Yz/vxoDzMiEwD9Yr2kaO01QZZ0ilTnTHZcFpeshgGevY
 HRNQ9ovG5VcHt9d0oj7f9jxOg6aWoqOfMyRUtLxA5/KOCVQvXgyQlB4ogEaJE0fYELaRJsoT9rP
 v496lyqDDZ/Tx8VdkcxPQrSy4YDcWZaqoGx8e1DASZl/pIQTsjAWa+whOv4n/y/SIMnYEqpgYv/
 gpZ7fPwmWGdxCLvYztsg+RK2j8fqbw3Ym4ACAAisU1RSTMnk4uuh2eXQbKdaoshq
X-Received: by 2002:a17:907:9621:b0:c40:6ed9:b962 with SMTP id
 a640c23a62f3a-c4ca7a40679mr25122666b.26.1793307203197; 
 Thu, 29 Oct 2026 13:53:23 -0700 (PDT)
Received: from localhost (2a02-1811-bc80-f7f0--e02.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0::e02]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4ca3003e16sm21290466b.28.2026.10.29.13.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 13:53:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 29 Oct 2026 21:53:21 +0100
Message-Id: <DMHMCJ0D7M3R.3KAAA9M0Q8NDE@gmail.com>
From: "Pieterjan Camerlynck" <pieterjanca@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Peter Korsgaard"
 <peter@korsgaard.com>
X-Mailer: aerc 0.22.0
References: <6ae2cb1e.ef735cbd.21420e.a28d@mx.google.com>
 <CAGm1_kvUUsz4tKbbzn_z6cTSjgBVFjy44yrx5c3c5Y9BUcCPdw@mail.gmail.com>
 <875wykygsz.fsf@dell.be.48ers.dk> <auNue788AnaV07z7@windsurf>
In-Reply-To: <auNue788AnaV07z7@windsurf>
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-10-28
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: pieterjanca@gmail.com, Bernd Kuhls <bernd@kuhls.net>,
 brock@cottonwoodcomputer.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 29, 2026 at 5:04 PM CET, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, Oct 29, 2026 at 10:52:44AM +0100, Peter Korsgaard wrote:
>
>>  >> madplay-0.15.2b | 1
>> 
>>  > Unmaintained since 2004.
>> 
>> I would say drop it, mpg123 is a better option today.
>> 
>> 
>>  >> mender-3.5.3 | 1
>>  >> mraa-2.2.0 | 1
>> 
>>  > Last release was in 2020. Low git activity.
>> 
>> And Intel Galileo/Edison are dead, maybe indeed drop it?

I lost access to these boards years ago, have not used mraa since.
+1 for dropping it.

>> 
>> 
>>  >> pdmenu-1.3.6 | 1
>> 
>>  > The last release is from September 2020. git repo shows a very rare activity.
>> 
>> Indeed. It was also dropped from Debian a long time ago, so maybe we
>> should as well?
>
> Just to say: I fully agree with dropping those packages.
>
> Thomas

Pieterjan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
