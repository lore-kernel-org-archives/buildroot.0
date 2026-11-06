Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71C606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T8oeyqCs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD1981C2F;
	Fri,  6 Nov 2026 16:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vehkvgF9nYk; Fri,  6 Nov 2026 16:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C80D781B9D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981400;
	b=mIDp07MoK/jmtqYSLFNURNBs1QaOxqE5B0dhK436bB2Fmw9jcbAzqgFdSHue7+2E6l4/
	 nrpQ018mqmm8FGQfRsSCWRgAMkP4lKFEU2/aWva3B7T+U9o/Sdffb5W9SPXBT4Iqr6FLm
	 hJpjmKy/5xjNe5cnncDy528Wxgl381y+/KsUWREAVd0tqokPxvEjTscSxPsQPTY7HbYXA
	 xJ6nvz96gys1zaQg1FODbTwD2k3XJEOChsRrlUxD/okuRjJiD24dLIT0eCd0cxshDZPby
	 Pdbu+1UthdBT7e30w6hkQT7OHYYk/Gab4hULSxqsx4K/feVsq1Ax+M7pSa9H6ggq+7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vQijV/dlSmhBuA4k33uW8ZcNG1fcqcOwEdi8VZHhnkQ=;
	b=lpQ/FNpNpsaI2W7aWDBT/58LoVgMWXgwokxuHudErKML0C+Wae+ZIsLuBfI+mq8zc10e
	 yVUIcGsW71XUUavgrmim91Vn/uzGFsKLR7vFov83p+Fix0w8DEAawLqPSuRPGZlcZLvf4
	 kEYUTMKCEsX/+VePlbms8YEH6fn9onF68LSylJ3cUg0NzPi0oTz5i27esMf1WjIFCziNi
	 a+dy9BX0qQZDhYFlmRGXi6yQpb1Rq0GHJpwNdGlIy/JTxnbJhe1xrpSX9Y3orfwpmYAOl
	 le8HTSaoCh+OVWuoyVedMOFEWF1bLHrII39NAX/l4zXrqyvK+zo0uxVhARx7OlGsDJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981400;
	bh=vQijV/dlSmhBuA4k33uW8ZcNG1fcqcOwEdi8VZHhnkQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T8oeyqCslVIrFtaZq7lMkNBhvL/nP8Xmu3YGcIeGZYT40FGyBeTeFjpmXaz+BJLO5
	 lKl6V1VmfU/TGjmxyoESVRsUYH7eEGIqaPBQxIW1avAHmMEkHnyOitoYem7jYDay/t
	 TRxU5Pc7Akhz1iSRqY9/bLgCpKS97s81iuSwMtyuajk1q8JD1AXEFp/rAgXuujY0pf
	 anQMNfDcp49hi5sDM36eTd2mCfwh1TxKw49iTQOGUragIQ16B3x8dMprVh7hvQwmdX
	 y8D+UuisyAYEpCasmmjciHahyUPLZl63fwiLRNITs16az5DsQQUkAwIJDOTQVQNRHK
	 JGWFz4LSSJLhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80D781B9D;
	Fri,  6 Nov 2026 16:10:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 058BD2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA79C8198A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fB-WJSsCw2k0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFD47818E6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFD47818E6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so471761f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981382; x=1794586182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HkryTzqri32Jtc5Oz2cXZQmJMtlc//ogIVuhEKgQmw4=;
 b=CKYP2U2Viwd6HwuuPG8YseXtffuksYz9+jU14orgLaKy+edRBu90c0nov20wf4eq78
 9yf9VbzCxAA/VgoZ1wFl4ENdVtp7v7vvWy8qpTGpXps7ENtd93NcyDnNthGt6seFrpDi
 uD4DYBKEqKlc/noYFMAj+Zz8RTnJTM+H1+99X2usVdvYc/T1Kq2ump8826NhfPXrkrNQ
 jO2hVb6kmkcN7OCk3qsQN26lcFgYGV30gkzj93/RZ6aMnBeYE7roC7U7lta6/X8Zm7ec
 mGUfAYn3ZKkK1RnvIVW4hTHEgDN+lB3MKBxujU5HYeOKXb1iNT0x8xY/fzpjqcyzGCKE
 SVbw==
X-Gm-Message-State: APuU4Z9VIWJDUPqHILMQr8zZ6Nut2nYMEkf61fLf6NAu2mjL/VPQARu1
 yFaBmOFnI3CSy+pqG07DYwwE5a6f+L+PPQ6pRaNhT/NX5aGFEFaD42RoSHeL2eRAtejr8U4L1OB
 gYAXjflI=
X-Gm-Gg: AYBFou1OeTRC/5Ko8nrXlUJFuMoQcDbGqFm2eDNzuvhHHXYwzeyTz5kxmMFxjJqTGU5
 akBwwq+pjaHBLScellv1uItFquwU1FV84oL7ltkEieMLAaRe7gKvIsdGR5/am5MHJAD5UYKRsqO
 NNESbdUYe92PN2VEjVRKrDhnDosrkTO7fSsex8Kltvjv8yb3XlLm0HxxSoRwlljeWKO5u5+o6Gi
 HgkNQqwnQxeApzXUzQS0MXSQfdiK8xethm/pbH6nZN0QdaaOqSl8UFvqU4BMjhsdhYEeGFmz+WF
 ILraVJ4WHVLXahHYBJv2JN59VETxKjgZBfspuP7MhemmPFuuyGN8XWoveitaVz5iAT04L8zfNW7
 uXLgXXbuWAee130X7K6fwArpPQ73Ut369PdVaq8PHnEA5q89Mnx1e2V/+8AZrBXBko8Rlue16e2
 Rp0NaQfhWHe8bIESLzz6sETzdB21ojV+W9gf7z7ftWefPcNlnP+GfhvqNza0R2TA9kEdHmk58oR
 +jEyPP3v1l6KxLu0PpXrcC/MdqL+ASaJwmBw/FdnfIOnYokt53AEVqKBnI8CjULir9ZRTB/BOjQ
 OGnnanjGNvYNpvXrtu5lFXBD2m9qW/A=
X-Received: by 2002:a05:6000:460b:b0:492:20e0:f200 with SMTP id
 ffacd0b85a97d-492764aedf9mr6063310f8f.14.1793981382239; 
 Fri, 06 Nov 2026 08:09:42 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63ae2sm4814789f8f.11.2026.11.06.08.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:41 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:39 +0100
Message-ID: <20261106160940.607282-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027054034.4556-3-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/6] package/docker-cli: Fix go module
 version information
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Apply the same change from docker-engine to the docker-cli.
> 
> Docker's own build system (hack/make/.binary) uses "-mod=vendor
> -modfile=vendor.mod" flags, which are crucial for preserving module
> dependency information. Adding these flags makes the previous vendoring
> workaround obsolete for modern Docker versions.
> 
> Patch downloaded from
> https://github.com/home-assistant/buildroot/commit/dba1173fb4cfb39624621f328fd2811f50a34513
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/docker-cli/docker-cli.mk | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index 8ca74af7d0..216cf70b95 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
>  
>  DOCKER_CLI_TAGS = autogen
>  DOCKER_CLI_BUILD_TARGETS = cmd/docker
> +DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
>  DOCKER_CLI_GOMOD = github.com/docker/cli
>  
>  DOCKER_CLI_LDFLAGS = \
> @@ -29,13 +30,4 @@ DOCKER_CLI_TAGS += osusergo netgo
>  DOCKER_CLI_GO_ENV = CGO_ENABLED=no
>  endif
>  
> -# create the go.mod file with language version go1.19
> -# remove the conflicting vendor/modules.txt
> -# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> -define DOCKER_CLI_FIX_VENDORING
> -	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
> -	rm -f $(@D)/vendor/modules.txt
> -endef
> -DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
> -
>  $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
