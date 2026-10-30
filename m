Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D2606A327
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AGucaaUL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F373B813CE;
	Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckoQgZcmXTsL; Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27475812C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373968;
	b=J0Cl/GenmZpr+saKK1LFP41hihKmSnM3bJUtxHKoAeIL3YeGuYMTKwzD5yrjFIHQvK6Y
	 FhOKKMQHIop6xqNWL8A3F5unu0HGW9YQeR50RyTa1/lMB9KbAGjx0if6bl7IFOpw7l6D3
	 /2GmMac4JCqCWYhBe/1YFMObq3tH2nU4pQRwGPo5VcWKUfX5z22Z3KPFl7dTOfqZEoNqU
	 LC0NRqRy8/c4RS8LEaiUt8c1OR8YtTwhpb7fEcM9gbnAh8vDknOuRTkiGip89ZT4/RgnH
	 f3oTM4nbjo/nTj/ZxMWplIq35huDSo/jzLu3r4YQgQ3niiX/qzhWijy8lP8sJ6sYkBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t7JW9egC4Ni4GAtz6tA2yk2hLB/ZZ9rnBzS0KBSAz94=;
	b=cChXrLFgQIFo48IT+8q3oxZCspGSyOsHEnVv01sIXtD43LHuqWRDEpENH5d4MTtAyC2h
	 Tj5ZeWCrHhwK+TGQzUt39CTns1aTtomkzQrapOR3UipQG2RnNYwbWjDOAgIFZLalEbgCC
	 kt8Zhnt9AHJPYuPhB1rcjRT8fZIt6NSCFXzQR4YBvKj4TchPsD+FwUihmL4fUKivWvPVA
	 XLVERiwz/UXL3QJmYcwmXQ8V17rysG+6Q0WZcW1JIM6M8jXNXk7ldk7/1B4891EpRUOcT
	 B2UXHja9ysasn9u+8XT81kiza9sSaWYMC43/ZcGcl1sR1LD4/+AvgENpteiG/SLiGpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373968;
	bh=t7JW9egC4Ni4GAtz6tA2yk2hLB/ZZ9rnBzS0KBSAz94=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AGucaaULbv98JmTaHNWC778Om8DcNvmzzKXi/Zs3aWeEjUnFP0gVVzdipQkkgRdSW
	 eZ7Y6A2UbgkfVOAdCf8w2Mq8RlHNx4EWco4mYuvaqJ6L5J5vY907Al1j68iLkvvidG
	 0LeqzsaC27kmz3BvhG662nXW4ZExnA2XmG/UKHH4eripHN7EM9x7WLGx54EGzHJiay
	 OXt1Ao+HoNb5iATbb9TzEkOUqZK5uGc/RhJt2ifK9M/8ZJxEPKvCdnt2z+Mr4cYW88
	 RnDlmxuT7iOqNLNqTbcztRS+ebCWuSYb9vtzTtpT9TWPOhdvjgjR8IjCf6yHcKKaAO
	 r3r6tnCxSOOZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27475812C1;
	Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28DC2D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1969B40B96
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWwYQRTufEha for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0157B40B91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373962;
 b=dVwjtS6Wgr/QeUv1eHtC7imfAO7I1LDgWiCtXtVFJ7k8q8ZSfarQNnUDZBNRH5ginbcc
 rVoWjdsojJOvlY0lWmAewrXxcP2I0rtlaqhvsNZrgmWWm17LnOPVHixN1SjqN2evkxWVF
 /3fysWc/7OwoByjz2MOl60Sinb7kS7g7GZPB37AlrmCud14a1fqjxibqWWupz7zYWu5Lu
 ykhzaRdzYjva939D0OHwTNJwtDX9wOk7Clf9IiOlGUQH37rG/fgvxdjzC5/TsYF484qsN
 5qHbvIafSeFToNiZG94RZ44ZYEl+xk6OKUY7q87qjxvSZCMeOkp3KeMq1F5oC+RzXeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373962;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+SSXSuVm76iL87iVxWAdDSiIxlGxd0e1yPvLMMSL9mI=;
 b=hbOZaUn8NESg8HRUlvFXDI8xMlurKRjN9B/aqZGOdL6dP4RFbFlTMadIcFTNcdCQmloC
 SzYRvqE+12sUA6NPjDnrZlFg2xzOOxG82ZoPnM1kCXNaI5y2Jk142AG3jDkTWso7046qk
 rDnNQxHYyAfd0kSbDazM1+UZBm5gA+eQfAi77Efd1I1nRN6Jsrmkg1LKz+OJE3dUG7Lsp
 29x2UVMPXmAGL1JoMde6IBMfqRnWZh8SP+XDa+ncrY7YKPZsEV+HypiylzM2bUdGMcctP
 WIQSNsV+flIAuhizGtqiVqSHhI38pyMG2WEUD7sgdJwMoUt31BswpfUU+BmWBOSSwFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=edg94Gkt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0157B40B91
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so700282f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373959; x=1793978759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+SSXSuVm76iL87iVxWAdDSiIxlGxd0e1yPvLMMSL9mI=;
 b=Hr879zMh3lOrBQxU/xgcDpWAzrNKuL0q7kzhAd0bj+Ka/2MT/sfz1vszCVFLjx6fL8
 4KzFmTKOJXziiiuJon1gU+kN1qd2QzLbtgVPdRdXgE8xdIIAcHrXY+DqYxVOtCCp3lXW
 yLLmDXKMnSkdCFPh0LVfLcUGKh0o7IgI0iBY0DI1tR52cTHJRCSDLX0jAyySi4PQJuOj
 Q03+8E5ImeIffP+qEyDvu0zoQKmevrRjk4InWXeg4atcgH1VHMVJPna2Czpq5uOrvSA1
 RJeTKLOUyc8RM4QoyPmFJ2YWD6ko6bTYzwyiLcbw67Q9i4+CwsLYLZf0mSUQH6rX/6Gb
 CMTQ==
X-Gm-Message-State: AFq9FYLfDoBlDPtnzmeHsIC84StSCEtdrX6Ch9lQQf7JxvRCX2OCFYxR
 FLNM7dmPiCOB71VolcuNH9KEtWCCI/E0W+N1KSwhix8IW9n123MYSIK/yvCeBsTK/jtdEN9tM/d
 zgewJ4+A=
X-Gm-Gg: AYBFou2WDgXyDrJulr0v1dgUUwR4Z6VIAGHjzbx9DikTYNVodDV+ZjHPikmAddTWxSU
 rdEexHU0uFM+hcwv4eL6lSJQb4SHNo9B0zc5i4oPMWK0AEYInE7C2079MP4LVbAWmdZL26KXtkH
 4G9+4olGeRhUGku2e6dy+mLP4tGG0LpRJHp7jTpdh1+XqwMz+lMABYll7jwlg2bu51xBxgAQj0g
 sCK9he/6MXnEhY1syh/nIpfYEEJq0JAOn83IAQAnz4h13o4XOEEIHMTHslTqcTQ29ny6Fe2zcPK
 0g6iJzqUETm8JCOirCpQj2rply1jvQb+toNMdp1OrDQUoSvFq8sJrhU6P2zkis6Yefj7UiR49Ml
 2OTNYH9T8JTgcOacuzeevM9Ee/8Nu86bKRUbiTEcFJOOyAEh8alKWP3Dkh3I0Wzd4NpJYS9o1nX
 yOVxgO+gtvHoq++Y5aGGa9jIBCMY5MzE/qBpetKDOVojlXTqUJiyA83yN853G/58/ysxocFF3h1
 0lBzVhtW2SBkIS7v7sAOiEn81vDjUjXSRStuOiGVo6FaRH0sUJFp0N2I9iNHemv52+npa8HLIdA
 7jSfEGZnjPUoFXogjgg1eZj1UngaUPEhArq30dxx51ihSYwDCdnPE7r+AaSoK3F390/vtFWK
X-Received: by 2002:a5d:634e:0:b0:488:5d44:6680 with SMTP id
 ffacd0b85a97d-48e6e2faf41mr4765731f8f.36.1793373959265; 
 Fri, 30 Oct 2026 08:25:59 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7270asm3836750f8f.11.2026.10.30.08.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:58 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:56 +0100
Message-ID: <20261030152558.1905856-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002192648.3757582-1-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v7 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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
> This change sets the default GOPROXY value to match Go's built-in
> default of "https://proxy.golang.org,direct" which provides several
> benefits:
> 
> - Avoid package breakages due to missing module sources
> - Better alignment with upstream Go toolchain defaults
> - Faster downloads via the proxy compared to direct Git clones
> - Maintains reproducible builds through Go's module checksum validation
> 
> The default value from the toolchain can be read with "go env GOPROXY"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-golang.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index ffd50adecc..26da7be71b 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV += \
>  	$$(HOST_GO_COMMON_ENV) \
> -	GOPROXY=direct \
> +	GOPROXY="https://proxy.golang.org,direct" \
>  	$$($(2)_GO_ENV)
>  
>  # If building in a sub directory, do the vendoring in there
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
