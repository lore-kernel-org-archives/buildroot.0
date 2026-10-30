Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC67606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NDKhYKS/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F8E8146E;
	Fri, 30 Oct 2026 15:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGXJgVg_vljb; Fri, 30 Oct 2026 15:27:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74D7781665
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374048;
	b=aQdIJA3dLt6vwKTElitJNJ8ODNRNugqbt3rkG35QVYVqmaUVr7145+VOUbQtkV0BY3r+
	 Si3WnS30hnra9B/4Z1RthaxUwrgsZy409bg6pZAy4WqVQCorJEjm7zcC4koHw8Stl8efX
	 9bQyXOWzOSsZDbb2VtPpVPcdjtQZLHHhScPZpaILq5B8J1pL5cAQz66zgpWVBwWZLymZA
	 gEV6iZJpOdq/cMfjknUX/K6UwwjHRvc0uwtuv9CatLAjxS2tkAirZ82W42GpdeC4Ve8YA
	 HGGwxYfD5GNbOLxeKrvCuy/28NuMVet4ggIX4fNMGm7EmOuB+syjf7HQlSNFJBg5jjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=USyrlyKGyizgMqmZr7zWHFhzESWcMuX005oinAbwXag=;
	b=Z7vZMoN6nP2lHn5DO+uZnUxcm/m9lXBHMS9lBBc60K0Oc9dY886N384ZD3oONbh8BYK3
	 7ktyZ3gnwBQp14P+PBSmNufR2Evg9QZIq6kNtkqk/idG1LRIEfm4yk4buK37SUIuaDr/0
	 Gq+shF0o/fpbtXDfVMIZNVILPKgx/q3rSkdOka4qNRYynBRvD1cHzqXyfV2WOtsxnUmQk
	 zm2+AX9qAXjXvNB0fXTzviMwx0GUw79mGOoBXTwIuPnYgWr5iZj8WvYqbk9D/J+gkNiTX
	 ElysRrZAuhqJkUpjvzfT9nfaV3r+4C9UirBvlwuOTrms+N7eGU1b/WntlPdvxKRc2vA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374048;
	bh=USyrlyKGyizgMqmZr7zWHFhzESWcMuX005oinAbwXag=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NDKhYKS/r04Vmxg9+fyFZ1ouokSq+SJMTmJ1foVO0sAFbdpTVQz66CpRj/1cBt6TO
	 aLi+B3OhLXfI4M7MMnnZVQ9NfnS89f/ey7MO3q5S/gtVlIq5i3TpGvKvmbhfapgoA8
	 F2ccB/mRyDPvr8SD/EsE/VljNqQ4VEEYt+z9oULc6OgJE6UZgVNjZGjZDYKJfN4rjE
	 bUZGtL3+CZo83/YECMIPtMUFoAgf2Rbmeixbt1XxznrPD/QDDEZbSg3/sw29lbwVUu
	 A4xK0invOwQ7NX8Rwi1+JfyuEhma0jMJLCLGb4j1rpRVzEMEqBwmUxr7qfAVzi81r6
	 F2d217HyLhfoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D7781665;
	Fri, 30 Oct 2026 15:27:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13706235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECDC140BE8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjUuRlSs9sMk for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0ADF040BD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374032;
 b=JoQFlId6cYP3VotSXTy7BKkEb74vQzKvzCbyTVpl18YstVNB+EE3iUKjax0/1lPJ+2j3
 nxkx8EAOpFfTDHiy6HJJdnySOl9E5JdsZGBaXab8QF22Yv62fTkcWxX9bKGS8PBIH1ld2
 0v2Ts+oEAw476hcC6jpuVEk4p+JjXiD7/tS4jAVitiAtlvpadDzqdzpLPQ1hlyEaFDdPf
 6dPRZPdchVfO7bCmQw0+7MrrJkjEvwX8I6LqhK208+7M/EWTOaPYvrLZGrtgdybZqvbxy
 lHxlp1hzZTBeCzCM9rRi8d1KXFi7QfpDeA9asPilGEv0LBHpwGK/JnCXrbkHMU/EjMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374032;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=BRbBuqnALLMFW0iGlGB/U9/EmgapKIlWfDkVbZ6l4eE=;
 b=PhHynsax4uc1VWD82+H7cVb2wRBE1BOdFj/NV5vX6W4x1uJQjwhFuv/nuLHv5UwQ/S+Z
 I0cKPiCGEN4ULcREMUDzjkwKVISos+IusfFpgl29G2wOKjzrqRSfJHhKT7/Jn9II1EiwQ
 ZMjI1ZO+69AJhdmBau8rKM6c03MsHCYQlXx7QsdY26vPB2PXdIVPJUcdkLuZYIMNOH7Gu
 +tnAG2BUIbDXByiMIUrjILDS1H3HZMsX1ybrPjnIDzVEBu9NJ8HgS7DQ6PcWO4H1XXwTh
 QbiDQgjYi5F3ekb5dae2WCDsI4V4+Z4fbL4u68qGl/n2YHBcW5mnnckVn5PRFozBO+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=B7DJkmGm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ADF040BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8718125e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374029; x=1793978829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BRbBuqnALLMFW0iGlGB/U9/EmgapKIlWfDkVbZ6l4eE=;
 b=15RmVqO9kJ3S2gzR6mpP3qohcsjtBRgGywrhkqZVLNxYxq2UnxslKuT2+L7uDaxFjv
 dknhKztm5kzrWKCHqdm+rHTnMRQq7wGOc4OstDk4T53OQl2Vv8NMV7eMUo9Z3CjIt7zf
 L9e575pe1I78TFjR1mdM+zTjsVgpF56LVGaaACglxKi0etKoAxAnHYf2QLKfHyqDXtTN
 ZGr4v+qKdFlstAdrZayMZm6gE+Svy6RkIaf5aLQ3a468R1h5m6ufD3pzlxJ/N2X4jfBz
 jenJ2RjWtHFmZX4vHmK/pCsqAwpk8NP1aYkIm/iSDwRGvOnOvoyQJnC/37FRqI8jnjyf
 Phqg==
X-Gm-Message-State: AFq9FYLY04vu9MYYn8H9KQ1dHQy/ph9ZExA50qXGk9T1J21gA9uVBAgJ
 yhRe+lv08mST7kq7YF21ZmYSDrdZHpvGrH6x5UHA3723HitvdeT7OVOMpurelXKn5iQDRPyYLw3
 NCXAC30Y=
X-Gm-Gg: AYBFou3o0D2zA2PanTUHDa66InQw+5qBqQbvJbMLOE36+cmBl9fv7v9LkV+LdjKhUOX
 v35h1o/6JXpFY/mfg1jDLloqOtRlmmGGp9qOgTdcK0c/kmo8lK7RxsiDyoBDkhanTi+UCGTumT9
 AQTzD6OFbd6KEM2LLww4Af+ANz824dvigVpPL6nzQ74qHghW5nZ4vH79ZXoIhDKTdp7bfPe/Vna
 BguV1bsuF//n2e/RSEYSjxhcrNJwImIzh4fYnI4Xh+sv4jjeWKyaENPbB5xzlEj0Qi7wkvGDzTF
 eNG2ri1aSF79jPcKWmHBiN3fT5L4qNubm/1fvHTg6ce7AKZTvNi/n1wCvrszguXSaf0rHakxfZr
 ixPhjSfgyqFto1U9g7pfmz8bAgKI3M77sGxVYmChZTuibclaY8jhjvzi9n8FtO1/sqW4xW5cSqc
 LH2GkWN0ykxef7C0oszbX1Us7OZ3sxxJMab9ZM8xF2GRsU1+uu6jzYfk1xeg5LHJqa2O9H3yt3L
 bYyisoCIeLOExOJ7ULKlDc1REYDqJ2W+ZV1qWGBNeUVtjZiQtRA04en78WXhHA0C6fhoEk8lhyX
 wYtvTerUg6D8nD29zUEkeZJ0dnIjMBBLz5mKksKkukv5Jdv3s/CD0YM+GdzmV4rwDYIYXTKE
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id
 5b1f17b1804b1-4ac1899353bmr59936565e9.31.1793374028877; 
 Fri, 30 Oct 2026 08:27:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa8213ead6sm142367385e9.14.2026.10.30.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:06 +0100
Message-ID: <20261030152708.1906566-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-hare: refactor build command
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
> In order to avoid duplicating the build command, use an intermediate
> "target" shell variable to store the make target to be invoked for the
> build. This is in preparation to extending the build command.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Acked-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/pkg-hare.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
> index 14e0cfce5a..15dc769311 100644
> --- a/package/pkg-hare.mk
> +++ b/package/pkg-hare.mk
> @@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
>  # but in real world, the target "all" is not always the default one
>  define $(2)_BUILD_CMDS
>  	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
> -		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
> -	else \
> -		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
> -	fi
> +		target=all ; \
> +	fi ; \
> +	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
>  endef
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
