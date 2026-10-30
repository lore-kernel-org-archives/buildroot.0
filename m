Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3893606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IK7PPDW8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F01640EF0;
	Fri, 30 Oct 2026 15:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpHonlI9YKwR; Fri, 30 Oct 2026 15:31:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BB1D40E5F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374279;
	b=rPJNYrD4im/t6W3fWnMzqBrn9kI5cf3LQ7rod+V9Z97dZu7tBx++WjK1dFhZmZyddPKv
	 U5oYnlxMX2bQ3xq57C33AskdF54qpZIFina5Kk+I/QeAh4iKUN9NQODzaap4nVN6Wx/R4
	 hCYxDMfQKqP8MBfqG2Yf1bMIEhJQjLN3+KaHnXJHiotKLib3iSQcChS992ZvuecL6A7w0
	 5qBoGqDIP+0nYZOPrEOSl6LW2THXlZ+RQlX5U2+4J/OASlbC6a798jyQGlDyhPPOTfVw3
	 53D7pfKT1TTzqtBbq5RPrqMv808hiQZH2MHHtnhrtdXGxFur1OiXB3Q+4fB1UgRxeWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jYCE0Xj6W902DSjBFLHQON3jhqxj9bVF9b8ZboKVn1k=;
	b=q0bilYGUnxeSN2bt52HIrb+8k683e90TplbYhxtISt2S4JLhjsvKrKKwNzKu8SCKGc3Q
	 7HYFzUAHRm4wRMKh1fSawQ1XdS1nCaMiB2C7488pE4uiX0B1mV8U3/RdmD486lA0TcySX
	 4XKpxp1rKzMoPO4gvz3z8cAOkyMc5XBSfGRi2e+5dEp7r2sjNiTfXpDt8c5Zg4LrXGcNM
	 LDQRbVATgdh+9waifSoSTbG0ZgY4m2WxJ4zSt4W3mc1BfvxuvhV0/dP2e/mKgkjbDVErQ
	 OxPngeEsqkejd6VDxTGtCBjYKjwNx84Qx1T+mBZ/DmPirYoGAImcijRswMaeqRtHmHg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374279;
	bh=jYCE0Xj6W902DSjBFLHQON3jhqxj9bVF9b8ZboKVn1k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IK7PPDW8+qAxhEJl8WyilA7eNPhM4wxFe407yEDPHlafRgzAylAkUcrTDQIl2m+ts
	 jXYm/oBCB+yxeoRWV64BYYgSMCgUHHHgROX2QqaYw6N4lgPFG14A5AKNcAwtymvaRC
	 uK53fMQXfgKzQTxSAK0fb0QseMmWZGjrCowN38unLLmQvJyJvoBlbSw7ZpIchhCe8y
	 OPwriJ/VuxU/3i8aFnOSTfJjMUEozpjVTeb1AoB0QOwY7bzInAlektHpBtmri05/uW
	 Cy0+XjvzcLc4hQtWfu0JTDX3OwDn/9CsYQk524HdUVQ6t59Poeyn6uL/FsycgXBitU
	 krk90V4I6rO8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB1D40E5F;
	Fri, 30 Oct 2026 15:31:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97AA9235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 895FF40541
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEvReh--Zm96 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A0EF54053E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374208;
 b=POwFHNoGu5082aHQ2aaXRWtPiS9DbiNB9RH/j0/MPB2hNY7F3kHyGfUvkbzLu3fVQa93
 guQSO1ipKcV96BZIbWRbajo/K6qNk5QyJRnZEYb+FqA49yKUvJFlUqx4POau8H50+kGS+
 URVG9eDuH2mYOR+OAbedDQhIw8RD/BPjWdzXS8ca9pLwVDkrLo7WTYBCopx4P2hU/BjUj
 RcYb3enTTp9q96+qvatCLudZAfuzJRSD7GQwelN7CaIAY6wKRjVOY5Hf8vP3MixJ4gQU9
 x6Sj8mprPm2jddgxX2MxZv5izD3+kg0hj9mf8GAmp64SSma0U/o+n2QQKjPGbo7IeCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374208;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=tdHAnCPMjMJ65LwTkBqgZXbxDdbd/vc6DiL836snJFc=;
 b=ganBhn3RyE+2NYdJ+U7bxebNB5q3jETChD83jwYan+90OQLkNSCcFzAh0yhUK321Hc+M
 UyqZ4l46D8yZkAMPZLbVYnF6168c+zoUSMQPMDGrEhtlNXbkvpZawbvbsMeGS45oQ7EXO
 0CVmw6H8BjnYLZrihzaVmNG06ZHEizgMKS79RB0BpKY74hh/5O8kQSqf0RQ57D2YbXHUv
 OVt38Y1OtyT9oCxcq8ncs7TWLoWiMa+osDS6upmrrvPIFSO7d5OAwZ0m2k0vzNaDTHvoQ
 lCTfal4x8YM07ujhAQrzmwKN65Nt6SZpVGd+YUr17+OIwhR5dh4A8JnC/pAF1weSijw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ELsW9sVH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0EF54053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so6460985e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374205; x=1793979005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tdHAnCPMjMJ65LwTkBqgZXbxDdbd/vc6DiL836snJFc=;
 b=SDMetTVPs8+YsuEUO8nUOC9FzroGcC9o8HoqnqzYnkybaBn3ast9liVdEE1dAncAtC
 wSJRSLJ/sHd+TaLltcCDFaB5vFCf4FoWZNxG3uvYdp4wiJMTW45HlFCP68DSo22mdAWB
 qcqUMNydR3zKQfX8U/NVSbS4yHEZcgNZryymr+HwE50k66L7bMf4aLLjOyuz87vhi4mR
 9zPaLLvSeHFGmBhALvwz2yn/VYPDYb/xg97WJh/5lA12rZ5mykeLJkiwrYmrocXjf0sL
 932a1anyBUWaNO5Rn2qiWPAVDo9pfps55TR//kBBYyqZAMJQWOBSsveY7FUob/OPKbMj
 e3qg==
X-Gm-Message-State: AFq9FYLz6f/zLWzlVScfss9meACBMyypWSSmD42mNzC4iEQWsyHH8yAJ
 BFOA4iSuSTNbjGwY8vvNwga4Jr/3z2AFm4Kbe+V5MfgOPhyGOFd2SSExmNoWD7eA/9DNYXo4c2c
 Po6jnPlk=
X-Gm-Gg: AYBFou3FDQY9ytHMa6wrk2uoayn2ZNgD98r1CJAskw6B71PGu+KRmiMNJcmq3t1oVLM
 IBl723G28hQdBbv5c5VbNa0qrLDb/oX4t8hX5/Di7WkL5PEwVWIgKcoMp+QrfRH1Ksz8+pWs7j4
 itPhKrElELETVovlZ29UBsqLP89GIZeQ1xzP3lCCdrqy3UUSrXi5WabuzSa5Cp8Dcb2KWWuDOTC
 AlMmZSPyo3Daw2pSWPg2nVqBFQjUenMcWsJyi9nuMm7hxAtCmk4mG5xaYL2pRiKH1RFaS00DGl4
 WOFymeVASSpJqIolkhMva404SE9gmTv//3w1YI0bPVbWb75z3gFDsYCeLG5S6fG7SH13E8O1Ceo
 u85BkhJuh6aU4+yOFoYx5eiW378wem+NKH5ukNaj0JIfOTPag+ZAb1/wkhu9aEfxci/+kzp0KAB
 eJlTctUh0hFdxmS4+o4NTtt39BG43JnYOUq+AFyBhUNFy9qpGpXUV6zgmHfANUms+zrSoC+t94j
 0oxstbJlKlNc4HHyT5vsK68ZOlvxjfGUQaPdDPWLmZfkJYuDm0fzOH9d312jmpV/Z5qjBLLpSDF
 oZD0q2eVPALKEOL5jExkwEtjc5hpY43T5svMe+bJCIsmOqu2OD1r6eI0p0ghAI2sPpt5y+uNLG/
 RH7GjZBqcPe8c2DzEuw==
X-Received: by 2002:a05:600c:4714:b0:4a6:30c3:1114 with SMTP id
 5b1f17b1804b1-4ac180f1c7amr57994315e9.12.1793374205226; 
 Fri, 30 Oct 2026 08:30:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa8213ead6sm142518595e9.14.2026.10.30.08.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:04 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:02 +0100
Message-ID: <20261030153004.1908275-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025131531.45754-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: radeonsi needs wchar
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> BR2_PACKAGE_MESA3D_LLVM depends on BR2_USE_WCHAR, so does
> BR2_PACKAGE_ELFUTILS.
> 
> Buildroot commit a24698054b4cf6c994c91d49513bbe5e7b270201 removed the
> dependency to BR2_PACKAGE_MESA3D_LLVM from the radeonsi driver but
> forgot to propagate the dependency to BR2_USE_WCHAR needed by elfutils
> which still is a dependency for the radeonsi driver.
> 
> Fixes Kconfig warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_ELFUTILS
>   Depends on [n]: BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_USE_MMU [=y] && (BR2_i386 [=n] || BR2_x86_64 [=y])
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d1b6a38858..7fafc598ea 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -253,6 +253,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>  	bool "Gallium Radeon SI driver"
>  	depends on BR2_USE_MMU # libdrm
>  	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_WCHAR # elfutils
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
>  	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
