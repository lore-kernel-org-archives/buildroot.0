Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21FD606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c0SpBObF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED67409A4;
	Fri, 23 Oct 2026 13:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGM8t98Aey5U; Fri, 23 Oct 2026 13:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C09C6408F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761612;
	b=f111GgBYjSgu1gAIQspy8ItYuY4/RhJ6hnpCGEIifyD4prXys4piqhvfOCxtGcOPj9wR
	 KT61AierlpeB8UskhmALAQe3RWrFlmYCu8RbqI2LIPmWvtLrD4QBu7WmJCtDDY3hcsaik
	 4Xpo6ejydrD4LgAlIPqwiz9sXC1imsb4UhuKc3GYMWc1OEGWBVqMvH7sApF40ShfedoZK
	 f18w2l/vFjwHWtcHPvSyXjtJmLgie7CMOPCyxFEMDzcvKXCVE75NaX20LJ5BUcV6oUAHw
	 wiK1h28NPNKY+QhiZNKXiZmHzcVQz7+Aiw3sfmJ5AR4MW7c9kZKnB+xcZaYQhlcHNjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bk1EKH9XgeNcETODmjiRvk9JjILPJI316NHXeK0ImEs=;
	b=Esau6+qQnuGDWhErUbQM2QAfyXncUrHZZJS5NOVdvfNEkp0zxfogYEwLSvw3xjGl0U2W
	 i/41twRw7ZdMd8fbQ4YNSREk1N+IRMxiKK4Dz31KgMTYoCfnbfiRp5F0ejfyaWABin4XU
	 4cjdiLRt8CaA+GLL/EL52ClmCZrXF9PCZztdLTXf1bLDwXrlCKaorQusboJC0OtpqPfJG
	 vdkLR9wZcyw516DeAbvxkDLYgmr485K/ZwdWAursGEex6HZmLTE0JvsGAr7taRSYpor6w
	 UokAu3GHAZINHjpxbsevareVq/eg2J+TzOeAM/BN1ohW0ML9ddRjJm4uSd4IRCf5f9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761612;
	bh=Bk1EKH9XgeNcETODmjiRvk9JjILPJI316NHXeK0ImEs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c0SpBObFVDxI9lCGeMnYOQZI8e8RnfwocKJpqILtl8ouBNbJ/3Cvmt/6Gn+0u7cy5
	 kthzDCOomoMvLdPp2+CkV1XwVoV19K7TCLJiZNUhr1ZgMYQmAN/UfqlirlSdzudHg1
	 tBlU26AQLnSbucmfvAu7SoDjOQw66uHr1AYP7i3HM4GRY/g2W5wqiYRvxYeX64yhXO
	 Ns3Uv1M7NUY8Up/DmkadY+wT+KbNsciShNDeG7iZv7hw0ralmG3xdNQp1uuRUQM+f9
	 GbmE3qRUj1cz02Z4quIFoHk2HS5pRzYn9EJTe8SpsXSv2zACW6wSywC/xLppzRGDrb
	 pYbxe9pKRgwsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C09C6408F8;
	Fri, 23 Oct 2026 13:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D55A356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12EF4408EE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvUGxo6cOL-W for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 351F940981
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761604;
 b=CGKL0yee21FlS3u6QvHKzth/D//WcjUlVWNTvVcK4kxJqyHO0HsPQf3XHZGwwK2iXc+W
 rWGDitHymixpLLUs3RmE3d3NuRfu+LLScfWNPv9kqhgGIXk+mRT6h86LavDkzoqvel0W2
 3gg3Yk9uN3huhR/pqRFVS01w+n2szu0XbmANFDXPJhLA85NcSbYBDPbBlI/+9plSqDSY5
 fEJi+D6LhtXREsUa5s7uWPa/v0vUwslccIyS6EvfLH0ZogB9L8VweSmshniB4yi2dH9S0
 CrWb/5tX1m8PvubqlQ8KDlK2+/TViN4/Yb+TUaWXFN9hxUoilp0JtFWorvthTHN8qBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761604;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=dEn5Jj0aTxa/8qrEz7yqpYzyyKMrdLw++01mtCYsEoo=;
 b=EQraw9osNl9BDn9Pjo6qFzbvxMJnJwlzWzF/4o2ZgJtYFqr1ABFf7vvH2UHIBsIrAv8f
 TeadNLB/42y9XiyacIEc7oNCkkQSHvG2N0mivDsjMMnQie+yT1c9Er1yP1HtI7B68JPyh
 1766i9jGcPJ4StPe0IvpAo7lyIPDhkhv6TWQJlbK91VhUgIt+Nc4Y2hvnkgXUbydjfinO
 kniRwVbNNi9oW7xCsPF+rffcgjq2g29YQoZXOW52w5JvTxQcAxHVTe408O4BrGxJx94Bc
 oFP/n5sxUjEMvHLgzYpT6I45QgZywfKXL4kM2enrZ+zWATEnSvDpfvJFDHxX00+et/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HoNA+HsC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 351F940981
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso535205f8f.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761602; x=1793366402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dEn5Jj0aTxa/8qrEz7yqpYzyyKMrdLw++01mtCYsEoo=;
 b=lfmLmJWOB2vnf8cldx375MjSeNc1oAW9HCda1KpjPJZsTAtWeg/lcatL90D/m6WszE
 xU9EQjDZDEfa/wIIQUT5tzNvbQQ2uiwgKj1X0//lKJ0noFArZHSuBRFdx2AXVLKQEAdO
 5PayomesnFd63UcEaST5ZU/bNXImhqsnIbX4MIUeOvtUrvoi8aAEf0b+TCeoOFAD2Yy0
 YuBy2wRJO4h8C22XgziGpRf3iSdse1C9t5HFuqWlHV+a9oxkrXUclp1s2fErXyCJzXM5
 9RbsC321Yd/jywVSCnH9OuPzc2/nX2Rl9n7r972FHBwJGdWdHB677HeJnBMYjvJpA1q4
 ePWw==
X-Gm-Message-State: AFq9FYKpVBMc6hnemInMwVbZ3lNeu0JTklvLxDNrezWgcLiuqRp6B2mR
 dgjCupKWvcWg6XmW7e030mh8G34DzfaKQKWg95Sx1YkfeR/1Xu7sPieVYeS5/7bGp6VffhUZiaq
 59g4Ix2s=
X-Gm-Gg: AYBFou0zYYOxpEbFkI5mFyZMcEMoYIsFSFT2S36yg37/D0gBVPGVul24+Z8luYRkFt4
 eOopJ5WliryItX+peBmopA5ctBn1OvVMEqhs3UcrlKBOaMN3d+CPskEvGHBiqFESkzpmCWLfp1H
 y07Z8I9NF1fkgw8S8kNMogmzClzMke2Fs3j+77BbYM7qmG9opbQHreBJeZLgRiWUaRDyZT11Rdq
 q2AA/woOVAghBvB4V1yswncj7ShRaTSLn51H9aYe9/0///qOV3cwvY0ag/MnEu//GMlSK+ow/M4
 CMzfBIw+B1vmxKb4Si5u9rifZZBh5MKphInVmb3Gmz/lU0IV+pkzrYQIBGPMSU21elxrrRNriwF
 Oj2NMCxLlejzTazZ00/bNhfpVZoonP4mSgNX2MckJZDLiLLzoLvPEKzL9UmQWNkHh7aJvbG0GXI
 YH6p41ComKxfir+W2wyrXZgmcGkJYGCu30sxM7dSeg/7bby846BC0kvZhzGgsEResvNy71cyFyb
 UmNN5VGTrwkWKvI/oq5KsMVh6QdREMIlFmQeYSpc3VVfGfSaotY7saaoA==
X-Received: by 2002:a5d:64c4:0:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48e3854e27dmr3537505f8f.4.1792761601835; 
 Fri, 23 Oct 2026 06:20:01 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38062dc6sm4828607f8f.55.2026.10.23.06.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:01 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:58 +0200
Message-ID: <20261023132000.1606570-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014164625.1474866-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> --with-... arguments need two dashes.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libtpms/libtpms.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> index 7bc69a50d6..0ece84ae04 100644
> --- a/package/libtpms/libtpms.mk
> +++ b/package/libtpms/libtpms.mk
> @@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
>  # Required because a plain Git clone is used:
>  HOST_LIBTPMS_AUTORECONF = YES
>  HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
> -HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
> +HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
>  
>  $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
