Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3789606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f2wlK17i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6ZwuBjG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0244607B8;
	Tue, 27 Oct 2026 15:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOghgwqjv-84; Tue, 27 Oct 2026 15:12:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5E06607A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793113929;
	b=brTlUAWOQ/zIBBrA2c+sOIpsV+heiYxVoeKGEEbSgLzRy7nkeHmVLkFcCjTneACu0/OH
	 LvssFVymgRgSIXVCmzMFQFANQdOLEA6CMn12BB29Sigx2eglDikoAt9tMiimC1fCN7MF0
	 pqlmKeBiilLLZrL9nisWcDaek/b60Xtztc1AFFhVn07Dql0BPRhTJRETQsAY6U9Wi8mSV
	 NI7w8bLl+lpEa9vd/cx0u8uV0EXNs2BAf3GU6V+kcmDonfmAbpu1PX6SkaHgjanbgAI8l
	 FiAtsqnnz3au0k5n9IXTcB+oqeoQyjuu/te2zdCFx3kSP53dO3m0Ot0OxEXxOQ3FX2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793113929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:From:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=HLYI6pDCQNHmxonvhOd3TueON8eK7lU5CNfcZSpJByY=;
	b=h3ZqLYhxYfYyH4lc4D/upyn4hZg9uRVWefyfZZcxa6BxrPVY5X4dWaKQHG92JEc3Py7t
	 FcsrWi7sYl6T2ZP4nvF+998NjpjIlmZe5nN8pXWtuxLe4fQCTuMowAy1XKF0uVk4hAhbd
	 lmVGdI+Q744Tc4V72nFY6nUi0g8yqwiz6+b5G+YwkY+ZGoLhDcWcaB9M+qWqOEjTRm8ST
	 0+aByGGkuLL9CMQ2w2I25eAAyYs8cCpF8zw2Xe9IH+8hHG03/yUiYUSL2LmVmYIe2t2ai
	 LwGKbYVZ4m8VrRhJmhwBjFntosj6s0HbBRmS8iRqlsIYAbNom8jW51B9mT7+UHsN1Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6ZwuBjG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793113928;
	bh=HLYI6pDCQNHmxonvhOd3TueON8eK7lU5CNfcZSpJByY=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2wlK17iDI/mEa2pVLVp/KU7Pz9jmWyZlB0052/JN8iGeo2vJ5B4ZI2YrLG91Lk0b
	 pgUVlI/mgFJa1ZTB5+FseldOxSrZ3A2EVb6pMRbxI4o7HcBG2DnRsW1aakLTlyST1o
	 cw+6oI+2oq13WfC4+iydaWOBc7gZe7wxsKl3laan1M3uO+W/46g1aGFNoRzgh7Cz+D
	 DhYqTLMB9vg9b2z2ThSwAx/b1M8xDqavOzCcwLbcG7FyRk5sUzy3tOck914mx/tvWe
	 5J06L5oAuXPYIR8lAFR+LPxmPAf18ng9tdrsqMETtC5RL8Ue6cjPOsgEkNe7xQd+uX
	 JnT5eH8p0rlug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E06607A5;
	Tue, 27 Oct 2026 15:12:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0A8279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95170607A5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23EyICQnFu60 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 15:12:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3C6060794
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::122f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793113926;
 b=ahjv2O40JjuLufSoPivlGnsuB68QjjuLHsAsdLopXFs0wYS9dk8O7KEw8RlFsanc30xl
 BNj9DtknS3X55FRSrCPFvsBSdubHIJk9UDg067hrjoNJbk7HVr4Lsq3L4Q9UMGgOTKZO9
 rLtCTVkBws3Ld9lbNy+E00Pl2sMVSebzFvdHNpstmKstBub6wxZvtUfRTyZqDEGQEGXiN
 gV1tl8wtoD7RFM3x1vaCuOBo/SP8Kd/kotjDMfC7Ij2X2Nk3RwUu259bG8RfyHaIelcqR
 WaAZVmm9RGprDnRQeD58h0vk1IIZ3n1N9Ypz0JmWV0yFtYMoPfEHzWK8yIdUTYyWJBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793113926;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=FjElHJZTlKAAdVjtZFgXfS1rmqpGPjBoMPNZsxikCew=;
 b=Ihy9vp9ZEZ5pYg4zFa8KgCSHGKko4AJ4m4STUPjjURTmsr+jiOu5U1dT4ivmS7DX+Qnt
 3jtaiRSe429gnjJ3QJpAoFd3XxCvSMl7TyaBi+t3BbdlrWRmS9M0Tqg7CNeqVaVTJPVY/
 FnWyP25CLhgsU3EEI3DSTdjRO5FepCmokhsz1FmHcchqhonOjtkRAt5s8S6mut+1mnFu/
 goVQHxYAM9LfF9LcXgU/fy9Btm3xy+2kQcTh7pZvhXNp7yxUXL52mPa07hkKjc4TTGy5B
 W/boi65JYIycybPmOETCh6hMAvEh2uT6Khqa5WePXFWVkIw9z6kysjr0n225FOrN/sA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=d6ZwuBjG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::122f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=d6ZwuBjG
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com
 [IPv6:2607:f8b0:4864:20::122f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3C6060794
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:12:06 +0000 (UTC)
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-157fe9d771bso5242161c88.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793113925; x=1793718725; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FjElHJZTlKAAdVjtZFgXfS1rmqpGPjBoMPNZsxikCew=;
 b=d6ZwuBjGYf3Lu2IxvLRH0G7s3aiBOj44Fl9AlVX7+188fMsmFsMAwM0e3qTKPsf+2c
 XU2QMSbOtqqJV50gMaXjZP3utUQfFoL7sbooDARFU8EDKpj+To5kPfrdim3zOqmp1UOe
 9k6R/4N22y/zno1ZTDMG7cZKEo1b8R5xnTGaWi0zIxgEsUq4o3i9m1MvoJtEr0JTuId5
 ilGsBYHfS04pcLpnU7njzHlfCqkKodO8A57VPSz2bkfBvEgnU9jbJybUK6pe3u5HSCs9
 4bGlDhZrI5QitkC+hM57TCm5ZZa19rgAcaIK2B1WCTH3yjtzVCgVAxnHJaZSFt97UPKd
 1u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793113925; x=1793718725;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FjElHJZTlKAAdVjtZFgXfS1rmqpGPjBoMPNZsxikCew=;
 b=KqI4XVGRFoXNqDabDRovoVaekGizPEiwRE0WUppJwFTVm2lS75/n8lUUbJHuxTx4+H
 vZV0Z/Efq7CpXKz2meU5cVpmIGolQUsfS1rxcJzALvKJGIvfut3KRgrYoyFkkDI59Nwb
 qMp8qlxnvpVrIXF1ZC7vkNdQzI4gNwCai4tes8W1ejbtVkTTcsvAbWyYwtjJJCXqxlU6
 jBIQN1FEkzSdZKDr+F0q8ak2rSdxWB9nPEinSzptRuOGORdt3c9A1OOK1AVKP/2TKuY8
 IUv+Mh8gQVWN7i1jT5WoDM3Geqh7/GM7O6+kTfJK6WyXqIeZxot9Fxot11U+fkvE/2/P
 tExA==
X-Gm-Message-State: AFq9FYLzuJNBOp+MIlH4tC0SiWWrZ/hZUPWVRuEy4fIFseCss7iseaz3
 63uxCCDcCOFWAue8V1t3cyoI/zuMRvPrcyVXT6PsspAUhBXyCDU5C8RLf4Eb9sJJ
X-Gm-Gg: AYBFou2z/UuUlimxQBXTeTDwtUEX/0sm4GK899PtA8KMf5AISy2lnABOgTZ4GrYSY6F
 TSLsJ5davDh4l0oYbIqNIHfO6A5Edp+f+mNJH0CfEEZVoUetbl5gSOgQsr24t8+WNNO21iYdkMq
 BzalXIh+r9dTI94qsotZk3HfjTHnT6Oztm6/n20u0NIQcQ4zXua2bAZ5UD0X89O+1t2/91zPwVL
 NKY2jechlMrVaHr3PtNeFDYGBIyI1B9G5ktiVIN3wQOvXwyu++12NFg+ddo/arLuPnQbnuCJIIU
 z0kjAaIttRQU7TLnc5xEeRGUl5vOj0MHvV+1anQqH0YgAHNX1J1pzkIgG96VHY8xAsBi1ngEBo/
 Ra50zdGwhj73AA8813a/bOpeKhUc6h77HgIBradOc6ikGDiCztZNDkLXZgMtDRz68ez0JfrcxLv
 rG/csSbwjSqTlLs3UloDBzIbbpbEFS3qalmTJqLDFKzUqAasn6DMLcEAWzsYSylAjYcLA6cwt5x
 y865xSDdiQ15dspknm30bXlfo6qJMHz9gg0nTFUmcfL0X4bCbvuQilt4jcNdMAMrRJUn0E8m5Va
 r7cUA86rLn0OUCMW/+TuT2/S45Su/L7fBpZhXT3whzIduA==
X-Received: by 2002:a05:7022:f50f:b0:186:5b49:90d8 with SMTP id
 a92af1059eb24-199292eef48mr14377444c88.4.1793113925106; 
 Tue, 27 Oct 2026 08:12:05 -0700 (PDT)
Received: from [10.0.0.229] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1989ff2ee69sm46012448c88.4.2026.10.27.08.12.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 08:12:04 -0700 (PDT)
Message-ID: <960efb70-2bcb-461d-ae19-adabb9f78503@gmail.com>
Date: Tue, 27 Oct 2026 09:12:02 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
 <a4b6456aaf3f6454e8969b16a443dac45aae70f3.camel@gmail.com>
 <auBewZx3hr2_dgX1@windsurf>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <auBewZx3hr2_dgX1@windsurf>
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just wanted to chime in and say I'm using syslinux as well, and I'm glad 
to see it will continue to be in buildroot. Thanks for maintenance work 
you guys are doing.

Lance

On 10/27/2026 2:20 AM, Thomas Petazzoni via buildroot wrote:
> On Tue, Oct 27, 2026 at 06:57:44AM +0100, Alexander Sverdlin wrote:
>
>> If Thomas makes his mind about the existence of the original syslinux
>> package at all ;-)
> Considering we have interest, it is pretty clear that we should keep
> syslinux, so please go ahead with submitting new iterations :-)
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
