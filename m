Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KZryL+kQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1FE8816F9;
	Sat, 24 Oct 2026 11:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGw_LoRRUQnR; Sat, 24 Oct 2026 11:55:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2E6B68124D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842937;
	b=s4/DMUDnk3xF467DCKciBqNwpH8/bNzcXwEokvqLgy7faMRGhoEEomDXSIrQ1aYBTUBM
	 IPyGHOoYlbWiDAqBJL+9rVnEpPrgzmdSQmPqGazeMzA1+XqfPcqV4FY35kvTMzZVX7VGy
	 cEwbJTgm7pKlcNB9xDyYhS8AGex6Y+wsnFKUgNOL4IefxRI92h+XKLNVYw3yt4oebsRB8
	 SrCahvAmIsms+Ewlf0RgZdy5G5MZdPJEfIuWEyJIAhznc9vPwOklwIcbOPTZ/t5J9BsLv
	 vzc9r3rFko94ThEw4imtgUOHfEkHCVBzXFTO07toAi23vt7X/Q2reftzLpg/Q+pbWDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=H8woos7a/0YXzzOeDan7N1/hP8d94HPUIC9OAoHDL1L0O4qo12/WOMU62NJYo+XSIvr3
	 CHJtTEnW54iJNFtKA2xAZLs9Kg9/JUznn30NrxBP02uoBgsgbOGBuUQl3xCUJ2sRAkBOd
	 I0Kibe2jVHkoVfO3dt+aF46uD7hkABim9PNYoF1PnFyqvH53ROZpDtoabKSjKDuurB4z9
	 z9FGSF396NPl+pnKT866kso2kcaOnnJkKcxDKnAZic2lKb86J/EHrjr3j7K8YZoXxxpXa
	 YJq7RKWv57sSDKK7GVetQMLQ/+EzTrH1DpdwmEtvKPWgtsohTdxpe0g8jWAdvpoCMtQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842937;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KZryL+kQpYU4vz322cmRCptp/u+P7lmMRUNL/YccuIkEYgGsD/uIHwT6UYz3/swkW
	 mMHwwaDesjMk1pKV1hQkG1QvLeeNbbzt82lJFadG7D+iPuoS++4B3lz5KCbueQS2bu
	 kFVSihi2wE2dsLuD37PuXSLh+HpM5Untt+mXx+/cPIBHj2dELTKraXvYRjS0YA3Kt+
	 3b+cLYL08u9UCsvQwpd2bXAwXSfwA+iFjHNEVAuSPNjTW4v1hhmLG0pngvsVOMjcSn
	 svpi+ffkjBxaigWrDaDkPM0oRSb3yoLC0x//3AwGsqd8oVDFzJafs6xML92T1ciLJm
	 3KSxnNESUv7Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6B68124D;
	Sat, 24 Oct 2026 11:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B821A356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BE38124D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdzJK4oh34sW for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:55:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D89380FA3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842935;
 b=rLYN9Kzfviqw4v9JXuqASu6pJp24q16k+a/xTt8OI1ou/eCgzxxevf2LAVjlIS9XZMRz
 JCsofY34tdCvw/JyqLV88F+/HjwA6ewciXsM4Z6/viA8Z1pMte/8imqsLVMHiwm9r8uVW
 X40FMRZ/Zja2jAxJVqyKPoOFvbKcEjAIVCPG7Jv+o7WoFib6M/X9UkzXGNkYs0VJLy6yU
 J+CLOyrc7HWjhbv2WL8p3TO7AKUpjN2/9wqbfzjuMHb4WXgJWrbSA4DIOoBw6w+RgfhwO
 Uk91BSXUs1LPY1QaaGlRVyqev82FhJay8RsUGXi0dWm5qusd3RaRVYHTNVwhxCIjWlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842935;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=mwzT6p/mG4pOcAmGc9xYLpa7VSmwSpuKlkxcjMvq0CMuALKwePusTQRRGy+/1zVUU5DJ
 A15zv4HdDc312syjcUq4kFMFnI1BqeEVAHCmXSELwbKzco9qJVTzVLnXV6iNPmI8qPwBb
 SfLcBD838cOmR/WF8blurj4dXyvs5YZ4QquJkuiOZLcSJ/lthso93qZz3yZkPzpQ/vxvS
 jUAasFrvGDllQeOCgKglQP2ciE193v37fgxdDNTvG0VWDsVE0+RpEeMFHEMPg8iV+kerK
 9tYusm4sWt+KzyNaGJEhN+yggAuZVjfaD753spChkp17zmhL61ItUp7XbS6mq3sAd6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ojTEKtya; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D89380FA3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AEAFD19F593;
 Sat, 24 Oct 2026 13:55:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:55:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:55:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>
In-Reply-To: <20261023181818.920329-25-james.hilliard1@gmail.com>
References: <20261023181818.920329-25-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f9950bbd75713c750e2f375018c048c3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version
 2.1.6
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
