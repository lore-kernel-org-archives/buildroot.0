Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44334606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hZyvv2Fh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB8540C91;
	Fri, 30 Oct 2026 15:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1et89Hp66vm; Fri, 30 Oct 2026 15:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C0B040CA6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374422;
	b=TUN8c/wBIQ3HyDoVTrNJ8UCnIolpXkZKyrkaYMwA3BSVvCN6IaiWssULnPF92vf8/e5F
	 eEy0Vi0xkKki/kaz+TByFvNqqlA874TM1uLbH5wSErUkNeiOeLkZqhNsMG8wpxq9dE1kd
	 uRFPZDIo7u/khmJvLQqFBl4Q+zYfVrgvnvUSGvL5yUPZY0olgpDgjPuEqj6BuhnyaAzfq
	 sel31zqVooFB7RgDNAegVXJVy5F+M/cv72SME6xnPecWSR/crf3hSvuwPphe+91TKhfq9
	 0mgBOHVxnZ1bCPzu4qYRdflEOrfeTw799ZvdqTVMvn50CZipQ1LXxe3EjIBjqOaIa5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JWprEfnKGvzgITi9f9XgA41dk2zciW1dEKBuYioES8o=;
	b=g04DnpsVVR3dH+OTM6UD87yQM13NvDvDNldp+i5eV8l7xALfSnhav5+OqwXPYYOOPQ6X
	 nRGxNtIWDqCurWUAXA9AYn6a0DJM1Ha1Xu7VzlcLAwI2bBBFvd9miqYiD14SbD6bMyo97
	 2vqx5FFaFRmYCUSpFJQx/PgN2o2QmudmSOu3YARIb4FKg9jGkdeiacgKW75flGDF9Km6R
	 iDqMLPd2WNKkV+jgK0Ojul0cZP6w5cvYUVV7rQCblcBDysHGlw/pMg6HroTxbcXETCYJb
	 +KR4zqWE0Pp+cQVQohfZlnw1+c5oaFveogl1V8yx/H1xp3oYDeaHaGxEjkaHsIs4/Kw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374422;
	bh=JWprEfnKGvzgITi9f9XgA41dk2zciW1dEKBuYioES8o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hZyvv2FhyGNj8IPJeho9lxb5dIkUKa3qsNpuZjW39g/lVPIV85pjFumLo/9b+Vnxx
	 mbO1rcNSYiqeCwz2haeG7KFI5Z3kxNM3xiASHXKLqkZ1tlRWaWdxFkcSMzVYvWGwpl
	 S+ZjKg9D4Jyuhdm77vSaZmZgPlmv2Hf5LpoIE0c4QRJqd5TRZFcCdDKWhYuG770cYC
	 LmSJap+1tgeFa5si4HfHs40TZYbOiblMbw+wFJq2COyzibgqpI/wDiFRcYEuoexhVa
	 BSGcuNfRhicfALTjw9FljIMo6I+SnqxcYremRjdbzxO02CLyJ224ESxB9TxBEbMafs
	 UyjqbdkYl88HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C0B040CA6;
	Fri, 30 Oct 2026 15:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 168AF235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0416040CA6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H3m4lVyPkj1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C085040C91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374420;
 b=N4CODRsDhcEK+Vi7bvo3QYNGbzOUe4WrrZPO7UZC3K1t67MWksww4PsuPSWdzcq0L9x0
 MRRINLMyUk9uYL3G2gs56DKv5fhL8v3xARYgVIJeEZD4d3WrdM54BqU1LpY/srf4OZs0P
 T6aeFLekloAK48W9EzeGENKyZtU4sBYN2b7TdxgjCNqgXHibI3ul07DsEMfqa2P3TyNQx
 38PWvmB55PdQazwGdILGzd5V4wrrL0YhpMUQug6jxwOKFYX3Qk3h6egjURiaj4BLL0X26
 fpb8ck9Bz8irJk7+nqPVsDFymLc94a2nOGir5pVb/8Es2W+dMP13IRtZU2OM9tkZklg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374420;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=YA0j0UqpeH8bt+dh1n+FFi8Hz6Jjx84GT62WRHKhWUc=;
 b=Jm/kUwjgZNOoAa5ILMlV67MTZkHTUpLNblIypllWh+wkHSBUV5N9oA/AsUHamf4Ku5t1
 f8vW95H637FnVmLdchTzRReN6l6D1oE3I+FJiwugOtBEl+i5+e6hhmIyOWPu6gGN71IfI
 CQupzTAvKHWrz36p2JlFc+cHX19M26dJFA9MDy90GOSx1I+HJwnQjGaaSc2w05beqjD7c
 s4qoxm25o9HHNQINRAGug62g5+OqAYqMGoPFiQciO4j3lebwbJ44WRs7r8io0g5a3vhvY
 09Hw7S1ufDA9sjhxcnxU9aJBrRqygtqtVl8OrLHYQmpF03qE4rgrTs/rDzNQBKYQO+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Bp6Qv0db; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C085040C91
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:33:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso6580845e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374417; x=1793979217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YA0j0UqpeH8bt+dh1n+FFi8Hz6Jjx84GT62WRHKhWUc=;
 b=l7+Wm8PHlKqnbfNuGGPu/yWcPJJawAeY3LI0pXpL6d9/BtRONBL53CMGtYseSySBEM
 4Uf+cBKlDafMKaHEmICuK7Ct+RuyyyY355hmIDfA7s7qwmxEhKsGnjZbIPDi6VSdOnDw
 0k6PVjzMonvhiX2SFkL0OVZaIkeB1Vgyx4WmMidFrvqU1n7kDB/K8UyycN6o5TB7cRiG
 rFUREhkN5J2pPd6YPvRfoRxDoL9+tqGOPDSYgBu2T67HNLG1Csz2dLfqD/wOeJMh0g1d
 mu0yqMsAuE5wlCqEoYtx8+nhvC1mMWf6NHvEpz+kxb/TkLzB92YSmC07gNVnCUqSi312
 k5iA==
X-Forwarded-Encrypted: i=1;
 AKwUvByCDr+kq14yR77OZUuV17z/c8dvKlmxjR964u5iZ2pmWFKbDfC5IBkXEQe5PZwpuDNShsqKqwS5VsU=@buildroot.org
X-Gm-Message-State: AFq9FYJIxv+GXmsd3yaaFpSoas/Y3laid6D612N7ucQf6Y9r7B4GXGud
 ZPhWBvLMXEHII0Y4aklsrtxH9cfi2KQLwlaH1u8OvkmN7qqACGZZdzDhmQqfvgDaVAo=
X-Gm-Gg: AYBFou0vQ9YK0hJAjg8Ai34fRKUWyOLz0ki8u/arVgn2pvspNm5adqT4rT9ZzN2ngqK
 lbw8+a/tgY0zWnElzhKs7vZ158vXujpeyRc5fii2/KQXANMJkFr/9JI09bTMXwO/DLQ5fFs4sdP
 E5fZJEceJPtAIiqktpIJS+wyAeotUA1eQxyx+3EkISxzBmiUrluCvcuigukzBTKzbpan/MYTwe6
 6pDyKPTuLghQSbo4oYkNH7c4zPRFnr4Bk3WbVeJSRUVouMWm5Jz35ZlfV5/u0cprHdRLVjDrQc+
 AzYUecwC4ylE8Xh4E/7SwgNrIKslxzH+Q/zDzVn03LB5ifr917gvdhYjkhdZci2LLiDglVtWe1I
 SCc4hprlPwMrfqvs3SSxnw9XbKglpC1e+gdz+ZDYy3gXd+cxZyXBUDAz8sYEMBOz9Ucd3Ei2rgN
 FexsThg3BDgN+M4TvplKhaRgyF504tgtRbnnRMNw2MkedTaMkVdw5FzBXl+kTj3zPIAlKRyZGYd
 JuRMhSnNxrYPoK5bVVK3YSAHMKMfhbg+qCoxJ3e6p/ULnI3hDXc4IcYL+sc+sEbmO7ln6hVKg13
 YnQiBiJJC70DPgkwcGUq/w==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id
 5b1f17b1804b1-4ac1275c26emr54261295e9.0.1793374417601; 
 Fri, 30 Oct 2026 08:33:37 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b728ddsm3798861f8f.9.2026.10.30.08.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:33:37 -0700 (PDT)
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Fred Lefranc <fred.lefranc+evs@gmail.com>
Date: Fri, 30 Oct 2026 16:33:36 +0100
Message-ID: <20261030153336.141878-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
References: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/openssh: fix
 CVE-2026-106583
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

In reply of:
> In ssh in OpenSSH before 10.6, a $ or \ character can occur in a command-line username, leading to injection.
> 
> https://www.cve.org/CVERecord?id=CVE-2026-106583
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>

Applied on 2025.02.x, thanks !

Best regards,
PERALE Thomas

> ---
>  package/openssh/0019-CVE-2026-106583.patch | 41 ++++++++++++++++++++++
>  package/openssh/openssh.mk                 |  2 ++
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/openssh/0019-CVE-2026-106583.patch
> 
> diff --git a/package/openssh/0019-CVE-2026-106583.patch b/package/openssh/0019-CVE-2026-106583.patch
> new file mode 100644
> index 0000000000..f116edf016
> --- /dev/null
> +++ b/package/openssh/0019-CVE-2026-106583.patch
> @@ -0,0 +1,41 @@
> +From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
> +From: "dtucker@openbsd.org" <dtucker@openbsd.org>
> +Date: Mon, 5 Oct 2026 06:03:40 +0000
> +Subject: [PATCH] upstream: Further restrict the characters allowed in a
> + command-line
> +
> +supplied user name, disallowing '$' and '\'. Reported by SecBuddyF KeenLab
> +Tencent (CodeBuddy Security).
> +
> +Backport to OpenSSH 9.9p2 with the existing username validation patches:
> +drop the OpenBSD revision update and rebase the functional hunk.
> +
> +OpenBSD-Commit-ID: 13671c178f492af63b5c1296f284818c7809ed9a
> +CVE: CVE-2026-106583
> +Upstream: https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
> +Signed-off-by: Copilot <223556219+Copilot@users.noreply.github.com>
> +---
> + readconf.c | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
> +
> +diff --git a/readconf.c b/readconf.c
> +--- a/readconf.c
> ++++ b/readconf.c
> +@@ -3319,14 +3319,11 @@ ssh_valid_ruser(const char *s)
> + 	for (i = 0; s[i] != 0; i++) {
> + 		if (iscntrl((u_char)s[i]))
> + 			return 0;
> +-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
> ++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
> + 			return 0;
> + 		/* Disallow '-' after whitespace */
> + 		if (isspace((u_char)s[i]) && s[i + 1] == '-')
> + 			return 0;
> +-		/* Disallow \ in last position */
> +-		if (s[i] == '\\' && s[i + 1] == '\0')
> +-			return 0;
> + 	}
> + 	return 1;
> + }
> +-- 
> +2.34.1
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index b3a4b0274d..29e29008d6 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -48,6 +48,8 @@ OPENSSH_IGNORE_CVES += CVE-2026-60000
>  OPENSSH_IGNORE_CVES += CVE-2026-60001
>  # 0018-CVE-2026-60002.patch
>  OPENSSH_IGNORE_CVES += CVE-2026-60002
> +# 0019-CVE-2026-106583.patch
> +OPENSSH_IGNORE_CVES += CVE-2026-106583
>  
>  OPENSSH_CONF_ENV = \
>  	LD="$(TARGET_CC)" \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
