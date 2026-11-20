Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E0606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tA87vBtq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936CF8167D;
	Fri, 20 Nov 2026 10:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDuG51PMAxvL; Fri, 20 Nov 2026 10:01:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C9958167E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168898;
	b=hicaHHG7TE2CAmAqQjjA+A64/g+04JJ5Yn2taD4AraxTrcrJGYizAhZZNlDMjcEUaHBj
	 EGApcQQZ9ge0G+Z3N2ut/BiB2jQr5C6N1NgssXgOToJ3QifrB8+WXLhuJ9Ps4DSPntisG
	 fg8TlVga7GalinDpytS8ko3vm53h+fW3aqTdyrje+K6qTracayQtIF7ma6DGNDJsOnOf1
	 MhWR9PD+dQgK2xfm+fC+byKeZxbsZSc29JBwxrBrq3+miTRG+lPNtm8lvKGs9Duolp7bg
	 ImKD5FIplg3egoKgPcV7zjkCgKB8zGHisbt/Ul2qMEdrNNH2Csdf3Ww1MGjr9FyGCYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tOb05VNNAQjZOKjZHq+mBJInnZ6iYqdsoUQB3YWQvjM=;
	b=Nr1s7xKbfDUbk2bjyajgn3Di1Cq0rpt7A5PL2PmNHviiEU2rUmyAmUKeB9iGpE33tMh7
	 rj5SL5b+5fnXFMlvt/EVQ95GX2xHZR45Xxgp+CjeSAHcsotBqEUPIPduyDFgLg1gFL5Qr
	 Z2iMvhX34XKNXKz+WcjnO7CSqLKV9NsIy4oF3/eJC7uhPBSG5KGvc+WnrMXeyC9CPXuga
	 R7Cixa8PrZQYN//KB875gNkGeCZrK1H7yXO4w9E7iC3w3W4cMK2A/+z1aacafI82E59S6
	 yFRcp6NKm5JU3hDbgLKB+s8ChEjA3TQ7mWBYN6GG5UdWgP97TyBAv5v48G65wW0V6nQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168898;
	bh=tOb05VNNAQjZOKjZHq+mBJInnZ6iYqdsoUQB3YWQvjM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tA87vBtqscb1WlguzikUZ8PzHnbRpn3nMX2GYRL/kxyW6uqK00UWfPFp/asCByOHN
	 HT0tJrhJZ4osnB3G/dtnOU4nOma/TVB99bcoW0NSeXL7BGkp2rG4Qme4+rTgK/sLYc
	 a6hUpOOX2HI0Q5fO0b3Un/2hk4Y9qn+NxN2eaGTrXxe/G9d3r4XXGhIGDkFLWPs/Tv
	 BzhZJBqFw8wKLNVc4lBvUKM0WFz3d2PlRCI/aq6SQmeErGHiZALmHr7coOAAKDH3GZ
	 06aNdlmE0Bbj3sjyCIJLPwcC8Q8WYMNFiu0e3QO+3APW1MHh2ZRP3iYSpjazgYEFIw
	 MMb3mRmPoyGJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9958167E;
	Fri, 20 Nov 2026 10:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42579169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F58160E43
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIfnPCF5hAXn for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E023F60D8E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E023F60D8E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso6159105e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168894; x=1795773694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E7w+SVh89wvVTEfD2SSPCg3gD7f1j4jwOur/c7RMNMk=;
 b=wefpo8qSvc7Ke/Hz9geRJiL8uH0lFNN4S8wGXB7h17DGu/guQzQ1EBavKV12bt9MRe
 WOGaxZQ2yu6eIJcwTSkADpc3zYVB5N2AXEOthuHUoSzbFjvOnTtMJSbupPhihK8XCD1N
 eKT7BM7FHQBrO9N1iilw1ZWka0PnPKSghuSWGTUuwP/721SHg/N9Ku0ILs4Uk+EExL3H
 urfFmm5J3iNlQz5CuMb/Jek8AMf3I62rC4nZPSYv1mvyXIiPhc4zoMXADqlxBS1I2+SO
 ihHNcYYolZybsH+XpCFl/5WQgW61whhZnjDfNFTvSxDPK01RhDYrmixYp1K7TGezCU/6
 XTDw==
X-Gm-Message-State: APuU4Z91ambXiahu3lePhn+Op4iM+1fDRCdUR+x/VTOxHboucgPoX+nI
 UoL5pPm30+MGutAgskKYldMarHtf8ju8IKZ2Hh1xvSDtrOfUzmlSfxfVqrDrTrZigRpC3J3zmM4
 zUtUjsaWK8A==
X-Gm-Gg: AYBFou0cpNwESvMgDu77Ywhpc+QIuyQ5aBKKyAZ5mC3vQotsB1JucdUVS5tLcXMttV4
 two3KviET9EODSk1iEgqCLRXKUDXczNcPdQpgv/jxEPjR4OSLaEX7KS2eJoXSVZgKAdH6YloJXm
 h/IVgutbikVZAcNV9yocSVVY3Wm7wkHMlxB6PAy4QcziC3q7h1TwsPM/Y/f5uJStNcHg59ogKdw
 /2RHnmIiQnKB04DCSlNzUq5ZLDW1AlTkYEQVMKqAq0Ff+OcIZxspm0t1jJIiAZsfErycPNp2qvU
 VX5aBgcFdZ4uswZjelEi5QJ3H6a/C7U8XAUV4YiEncLGxPhSAkhlSVfAkkZUbz0sFMqq9Zwyqxv
 MkLACFXH1nlVvlhHMiZk6xRsAFUEHJJa7bRFqP4+zJ78qnFP0yXpTMTJphXjew17A0LU9Wksq0A
 uptvcZ9xnAbeYyG06Ook6i9m8MJv8CEGsEg+6rfTTGUdUhrT30Mvp53Dut5eZ1oBpCGZOE9To9L
 SOSCUXgM294FVRgWl1cBE68a1Yj/4YJG/Gk8XNuSX7SWQtL6xH5zfVjp477WkMRZSRpiVo+xTLi
 t5B9b6iFuqhTNjMKzCXIyC5AL8rpAw==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id
 5b1f17b1804b1-4bb8881b52dmr52338945e9.23.1795168893803; 
 Fri, 20 Nov 2026 02:01:33 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm71722015e9.7.2026.11.20.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:33 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:30 +0100
Message-ID: <20261120100132.543094-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116143240.968418-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/{glibc,
 localedef}: security bump version
 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulenerabilities:
> 
> - CVE-2026-84243:
> 
>     The gettext family of functions in the GNU C Library version 2.0 and
>     later accept LANGUAGE environment variable entries that contain '/' or
>     that are equal to "..", unless the program is setuid or setgid
>     (AT_SECURE).  An attacker who can set LANGUAGE in the environment of a
>     program that uses gettext can make it load a message catalog (.mo
>     file) from an arbitrary location in the file system.  A crafted .mo
>     file can crash the program through out-of-range offsets, or supply
>     translations whose format directives do not match the arguments passed
>     by the program.  That causes undefined behaviour in the printf family
>     of functions and may allow arbitrary code execution with the
>     privileges of the program.  The safety of message catalogs relies on
>     them being installed in trusted, read-only locations, and the
>     directory traversal bypasses this.  The fix for CVE-2014-0475 rejects
>     ".." path components in locale names passed to setlocale or taken from
>     the LC_ALL, LC_* and LANG environment variables.  gettext reads
>     LANGUAGE directly and appends each colon-separated entry to the
>     message catalog directory, so that fix did not cover LANGUAGE.
>     LANGUAGE is only used when the LC_MESSAGES locale is not "C",
>     "C.<encoding>" or "POSIX", so the attacker must also be able to select
>     another installed locale, for example through LANG or LC_ALL.
>     Exploitation also requires that the attacker can place the crafted
>     file in a location readable by the target program, and that the
>     environment crosses a trust boundary without the program running as
>     AT_SECURE.  An example is an SSH server that accepts LANGUAGE and LANG
>     from clients through the AcceptEnv directive and restricts an account
>     to a forced command; the attacker may use this to escape the
>     restriction.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-84243
>  - https://gitlab.com/gnutools/glibc/-/commit/bbdd55995f66a155ac043a49a8084e2414f96cde
> 
> - CVE-2026-100290:
>     The regcomp and regexec functions in the GNU C Library version 2.3 to
>     version 2.44 may read freed memory and free the same heap block twice
>     when a memory allocation fails while a regular expression is compiled
>     or matched.  The re_dfa_add_node (the NFA node table) and
>     build_range_exp (bracket ranges) grow several arrays with consecutive
>     realloc calls and store the new pointers only after all of them
>     succeed.  When a later call fails, the pattern buffer keeps pointers
>     to blocks that were already freed, and the error cleanup frees them
>     again.  In regexec, the back-reference cache (match_ctx_add_entry)
>     frees its array when a realloc fails but keeps the pointer, which is
>     freed again on the error path.  An attacker does not need to supply a
>     crafted regular expression: patterns large enough to grow these arrays
>     are common.  The failure has to hit a specific allocation, though, so
>     the issue can only be reached when the system is already under memory
>     pressure.  An attacker who supplies the pattern or the subject string
>     has little control over which allocation fails, so the expected impact
>     is a crash of the process.  This issue affects all architectures and
>     ABIs supported by the GNU C Library.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-100290
>  - https://gitlab.com/gnutools/glibc/-/commit/92b93a3bc26c9f56e8347bc47ec047f9639fc6da
> 
> (alternative to commit 43f47f795cee1422416b4f7c7d1fa46cdf54acd5)
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 8 +++++++-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 5e7549cc42..21c70b6612 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  glibc-2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d-git4.tar.gz
> +sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0c702cc1d4..3ed1fc1e46 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
> +GLIBC_VERSION = 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -87,6 +87,12 @@ GLIBC_IGNORE_CVES += CVE-2026-77117
>  # Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
>  GLIBC_IGNORE_CVES += CVE-2026-80489
>  
> +# Fixed by 2.41-173-gbbdd55995f66a155ac043a49a8084e2414f96cde
> +GLIBC_IGNORE_CVES += CVE-2026-84243
> +
> +# Fixed by 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
> +GLIBC_IGNORE_CVES += CVE-2026-100290
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index a4b871ccc7..9467ae1b85 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
> +LOCALEDEF_VERSION = 2.41-174-g92b93a3bc26c9f56e8347bc47ec047f9639fc6da
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
