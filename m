Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88F606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h9dwxuj7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFD681200;
	Thu, 22 Oct 2026 07:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1gvHxZeA2vk; Thu, 22 Oct 2026 07:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9E9AE80CB6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792654854;
	b=PQaSuwZykkZ2MiSjg8frAhnqeYdwFHSzsUSeTUzv35bb42W2v4Pc+TDrTZx+9l6QKtvl
	 vHuoV60b/LFneu2g7aPScdpzzSmy2IAJYVad4MpT+/1etx9pSYZE0ro0xAfTu3SosywF6
	 XO1xc1jQ+TebnkHnBAnjKIogxrHTD1YNTbSwLm1mTaEMrPm5T3pyCF1pRHmz0qpLk0NTj
	 pMCCL48zPuet5g3BO5LQdwLZpQ8TWx1XKUDtfEFmo779dxdlMKwP4Nuesnd854fth1+Ex
	 RKrtyfGpqQDV46+ZwbnKVzZtkqsHV1qBuWdO37ca9B4fCnSANUd7B1Bobnujhw4pjWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792654854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wKtSSCqVTbaapp3tV74cRb/miMs9x+rbmYSXtM09es8=;
	b=h1hBcHtFOGP+u2H/2TNJkr8iBmX6lJPes2tdNxKeyfR55/2vWTfN7Hj4Z5bwZtM8Ctf0
	 bMjQNJkEIbgBgtyXEktQhSWVs52ESo12d8cbA5QfS27RNgtkHEy9XRmGjbgby52x2Jwe9
	 V1vNrTJJe/IDS7ukdmQObPajMLkSu2z5JlUDdyyToeGlH6N1Bo7Fz41aHiKWqndQRKKg6
	 ogyTV9OX2IzrPZC6PQvSpwqxa9S9PEBjNgOiq2Lu+qLni2O4uJ88Gv/Uaoe1g3GS+vjkL
	 J+HFPLsHBo2HoZTg5j+IGGA2C7JtNoQncGuFUUPahyQbaQQVsczicRHnNKyhkeAs1Lw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792654854;
	bh=wKtSSCqVTbaapp3tV74cRb/miMs9x+rbmYSXtM09es8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h9dwxuj7SUF314IZjH9PJUUnEARuXbN0Xw9uEiexbHWtamP3REjNzZi3NkWc1Izz5
	 p0SyrvSdTBpL89qQ9w5EisVsUyJyeXkYQDKzbZ6O9LMdx53kbpD0wLBXG9p5I+0Z6k
	 VS5S6/r8NO4DtoCYQdnAv+QMqNCYlkmNSbZcLk8ytHQihU8Mq64/qBgnAuIEDG2TmI
	 R7IKecP+ofe7Fb9wmTUCvCAV1wa/zEkNxN3kumB/4og4es+5yJ1HDuYHSqlFyc7T8H
	 jn9EjwJeTElWSRLxiVAjNedMigky4SSClaEoSWbVR2a6p/nstJxFCfX6xCfypT4x/K
	 IINHiC5oGc2BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E9AE80CB6;
	Thu, 22 Oct 2026 07:40:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CAC356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B0940877
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBMIn9d4AgOy for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:40:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 989C640867
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792654852;
 b=EfVRqVwvag9kHgwcZS0+N1lQmGGb6FcX9OmL7rU5wYWr1rts2HsBhtlUA/DxO6r9kczo
 WVQdOfoomK4SHugsoReyaR8OZFroI+BxwOJCjqwanqiUm6JvVAp+WG6Phx963/xZOOiTR
 m3FpErT/nbE0bt7KI+pqvJc3TuA8urFHBzgatdcFOEZTps+Uyj8u4hR+O3A9xMXJ7Knb+
 bCfVywdEdYW4qdLBZB0XwzQmuIS6b4l1C2R9pGId95dcB+fztUvFPIzHZ86coD4olOa4K
 BeB9OOlhZ4K3KI/PcxvYxSwGkWMdxW9dRmNc/VDgy8cCE/E+zI0qNkwYnaFotwQsZtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792654852;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=86ALMTFsb3H+rbKCX7BW8uWMsNiJhfZcm0zioBJNne4=;
 b=qU974S89q3RhKkzHGUaaKGw/Otaf8FaUEE2+51mflWoACsnEVo/w2R4ynjnLVzbxH/5j
 QSULcaLU3zZej473iZpxEsKYxNC0/u+8PSiGChAfpN/RSRuUt0b8ycrlSGzhNhuZiZtez
 32OZO8GsUFQsDA/oTVjl2fN/QFsNAd+q11oFkEgON2ImjzGRFA7dpvF1q1DWXzNTlKKzm
 tZRwlxFPP+gppl5rYtehwLYfDWzEwGLtfXWOz/4fEgRVKwdXOPznc2R1KzDNEEI38/aod
 mtXEjyec8Jfu8iIP+fZNqsl+3jTuAz2KI/yE37NPeGazyTI5wtOajdbhIJrneC3/fPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AoWOO6K3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 989C640867
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:40:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso1629265e9.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 00:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792654848; x=1793259648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=86ALMTFsb3H+rbKCX7BW8uWMsNiJhfZcm0zioBJNne4=;
 b=i1GPA1DqPYSOIyG88rwU/FQ46x5q69xPFOMi4pNTDHD0q3QvSed0zANdjS4lo2P+iB
 +0uROgPEk0zDfs5LpQUB1SUjw9703AWjdjlLX87K4vyM2mKuc02RXmT6Uv11L+WzNijn
 bM8/s6/aaOQMLDmkN6irHyOQcJ+3ONIA/WDmz8YaeGnz6TOthQmN73G3FsYj0dOV5+PZ
 8gvgN5/it057+a8fPcBxyGMyy1SrF7lav3BQNR4t3iRVOhGXOZXA8ofTu6uc4mDLslY6
 s49PKch4cZ8RYSeqT8JBe2beYI993ItAKQiuHH2OkxQosfXzrzNjlkPGpgGiIOdlwF22
 WULg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwwZORyH8wrQnJLuRtbq9JCXEGYZy0YphavVHiqbzSIvhsFx3Foeurvsin/WKiJsAK1CO0ZNBDcQo=@buildroot.org
X-Gm-Message-State: AFq9FYKGYyNQq/nD0qK/yC4mcJbTyR0RY8Sj89mn/Wq6KWjfvFrBGtvq
 3PHWivKNJJZzbfZwgY8n46GLCAcgqTMicZLZbkjfxT0BkZjywa8YqwjVWQ8zRnFCw9nuUVq5mpH
 RDr9K
X-Gm-Gg: AYBFou0f6DrPjx6M7/T+Sy/bCzNQYwW3z9Y/vooGLx9JOf1Z/+n+Fe5miRTVnTflLjK
 1aTv38JpilB1RjE2m4WRslBdeXOTEZl+zD+5oV2IOAM4V1XHLmP2HXzjfMvffTCWwZAA0Nbn+Pn
 Rz7PPbMHmeNLx/rC6FnP61SNybLy4fmjRvRbsvoYhHpEOGVgGvmv6K9OZw+ONYfudp1lt82caFt
 qXwaDRyIOSu6N7zOBItgM5zmxBLpeoyeG9uvOl6rUXch9zOi4sfd7RHpWFOE0Q9e06XCd/bdLvj
 8lindvFxy+OZHPDYONpxRWWRCmS/yXK/mU3KbssTM5qJYvl/22JwoaprQGxTjoZeWKAo6khL+4h
 NkChs7vTJ7QoHwl5tPMKsOah+juLZPfcrNowPgufcAFsHtDsKPOrmSwFSs9TkNMPxjP5vs1/Fp4
 V+/Iya5NIMhxEytYS7wiAxCPZjIHQ52j4k+g+zmGtZ1j/FGhxJdUMQqNCJPDrmLS8pBRGg3l078
 d8HqJVosN/oLVlIseZrbjc6g1+0xK5ePAjkzx6T4spL0Qsf
X-Received: by 2002:a05:600c:5252:b0:4a1:9661:14b7 with SMTP id
 5b1f17b1804b1-4a1fdd641ccmr84090475e9.32.1792654848577; 
 Thu, 22 Oct 2026 00:40:48 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a207fd494dsm13279885e9.4.2026.10.22.00.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 00:40:48 -0700 (PDT)
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Thu, 22 Oct 2026 09:40:47 +0200
Message-ID: <20261022074047.7528-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021205653.895333-1-paguilar@paguilar.org>
References: <20261021205653.895333-1-paguilar@paguilar.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: Use typing
 annotations needed for Python 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Good morning Pedro,

In reply of:
> Python 3.8 and older evaluate list[str] at function-definition time,
> but built-in generic annotations such as list[str], dict[str, int], and
> tuple[str, ...] are only supported at runtime from Python 3.9
> 
> The generate-cyclonedx script uses these built-in generic annotations
> that cause the following error when executed in a host with Python 3.8:
> 
> Traceback (most recent call last):
>   File "../utils/generate-cyclonedx", line 222, in <module>
>     def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
> TypeError: 'type' object is not subscriptable
> make: *** [Makefile:23: _all] Error 141
> 
> This commit fixes this issue by replacing built-in generic annotations
> with "typing" equivalents that work properly also with Python >=3.9
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Thanks for the submission.

Indeed implementing such a change as already been discussed in [1].
It seems that multiple users have the requirements of using this script with
python version < 3.9.

Acked-By: Thomas Perale <thomas.perale@mind.be>

Best regards,
PERALE Thomas

[1] https://lore.kernel.org/r/8636dc29-19d0-479e-a48f-c0f67fb7a3bf@cherry.de
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
