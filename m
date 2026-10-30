Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697B606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NZJsD5u9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B7981D24;
	Fri, 30 Oct 2026 15:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkvBuDyOAJQJ; Fri, 30 Oct 2026 15:31:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B20881D34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374276;
	b=EDEecF7s1rYRjv2UfQAe1dgdciQak/gQSbK4+g4hPcXB+i9W2MdLP/eRVArN0Pe93tbF
	 u3Hd7V2oWbIFGiTyuYqXpPj0KII05b3sH6JhKlYJgXYw7rqzMV0rqPvqptflB8W8NlQ1/
	 Ka+htFCWH9CRVFJ2r6b2m9DzDP8EXS41ghqrCttSxOE9lSE1/+3I14Ei/aycOoLMpS2X3
	 9GZEFfwFhjmmvhAEzGEjCsiWLL6rH71jtswR+cVPucm3+6AwlmTzghQl7iMy5C2kXsS4t
	 PlLuTMs7Nl++5t+UJ1vSeQ72Wx+He8xifztmoOVH042aJ+k9uJYXaAeIfHqQlxEGY4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nxsj4Ol11ivD8tRStEIeSYQ0BTKGsGZNFH+qYSp54bI=;
	b=OeAeg0xhPk6rHJd62zQwgnooU90MHUoKuOAwfFfiEfttrUbpkXPTTLRWSgaDefl6grmY
	 PUAtlZdtdXsisbfAMqVh/wGGT9rfVfF3ihAObkR+Ui7bR06sOmaMupqSWJf/1IAnyVUhg
	 OaNwuD7v7qri66WisDDN0sr5f8Y4ncbbAq1KsMHs8XG/CBzTYD5J8U79wn85eDk+K425q
	 cXrxn/uiNW4fJp64fFathamqjw95YfBRIlvAiAgpw5BmVUBMgQ/bQweEDV9TlmBAw7sMX
	 1kiQJnDk8CE22r91VcD3TtoQ8BVbLXxlQokqe457vhu8sEJNIdALN1BeMRAD9Jw0mGA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374276;
	bh=Nxsj4Ol11ivD8tRStEIeSYQ0BTKGsGZNFH+qYSp54bI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NZJsD5u926d6pTHyb6FWEBJPafi9ve4FNuQxqrKx/1IoFMXJYoY4fYHRtaL9atmKF
	 Flgd08EXnHum4nadpf8rjJfYUTqtYegIvL2NTmEiQ+EcoDnungG9qjnBOzbPVFHDOY
	 WR8iHbfWfGLaZ62D6Nt9hCjrKyd9Ikfnm5EvPJPNnczKQ8Y8IuQT5G6bvwRyrX7Atr
	 dKE5w0nChXFl5M4DRqkNKMKJ1nV0viHnGqA97q79m7VHTbi0gaw/a1SXRnz5snTa/B
	 kveZjPfZhSfRL2ELtrbKqP5iQ3lFPJXFiy9qaX0qwJMEgMPtrwxkeJFxhBXtl/JIzG
	 PdBkGnuPjVhbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B20881D34;
	Fri, 30 Oct 2026 15:31:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E85F235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BA781C38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM7DVm3IGlKt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF45B81BF4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374202;
 b=snU0Tv40bHC4OcYk+/voc76Y0pVC61goEv+f1WhuXDP7bPqMPGPSW5dmcBsoZ5IWR8m5
 h45Bff3U871vSCERutA6m84npKpdmSImAcyI1uBwQMo1ubHtK2ea/+oHc3tTA1O7a5kdL
 hnzMtS1uJTVlEA6REuHcDpGG3cJyfOyuZHG9kRGkACaj2ZCJJU8qs0DSb7sPnIfY4NS3q
 bgppJo4SWdRp9yqptDyIYunwAgrfxyu5PtC+TCf9AbAY3MqTE3SR18H4cHeEHGCv6WaKt
 Th9RGK3jaQyYWmScHs+sjVJX00kxj4x+DZVdaSFAjuqCnEIXpgXpL78A1veFLL4/Tgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374202;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=m49PLhuOkMpg22P7nPhhR1m5fkHp9f5etb/0P3WBbp4=;
 b=RhoG8yKrKb6spV19IrIuvXZDJSXGKfuqthOR/4H9eCjHCpTZi9Gma50bEfIIzWzk8Kbg
 zs4NN4N//JbKfUCBUBBdjmu1Ta8zzT2fNOdyUuCHw/b2frBs7hreYhPf7KzgAvQU0xJcq
 QknI6huiVJtYQCt9+SzaBFv1fjVWPoL77ZihTXGppORSfWjvUtMZcvks6+12mjxWUgBiz
 XjC32ugKyPZyrfd6iOXd97FS55wEAij+Qu2OL/Fj5q7Tu1wJfwof/d/DFj+xTAKtC1sBH
 mh3RgXJZpAZRnWxkeNPuyts37Rdv5Si4zzxUFo9Ix34Rh4vCpIN9CYOfHo7w02w/MLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YnjJUHfP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF45B81BF4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso7171135e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374199; x=1793978999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m49PLhuOkMpg22P7nPhhR1m5fkHp9f5etb/0P3WBbp4=;
 b=dVzvaKRkWuuNkRk/0GPIFNJIC+PMfKDAhhpFhNr+iIBpjFB1trK3rPcdNVEOOfSsI8
 nwHtTJCGvkiYnfxHjJDQtFzzphCTcydiWoNDbzKgQgdmJSIskFdiS7CZ9g1ZJgNKtFKe
 EoKp4B4wHaRGRpTIJ5bI7hvhT+Fx5vtC2FdhIIAem/rcPFDnX2HS4IWmKF3UkVMcq9mp
 u1JcPUGrhinMO6iKoDsg2d2cZXPRVb7ydgUng9gZdFxFNPZWyjlcvNzr9NgemeSfRDvR
 bK235MrCVkSUxxE4iSN5V5r8wKE5qCQJJF1t8K4H9WyYA8Z3KSvVAIQArCZ17nCwSl06
 RmVw==
X-Gm-Message-State: AFq9FYJ+v5wGa5KnAkAkqprYXgEH22nD6T7zxmEN+A+GD8ACCj8bA89x
 ct566HFzSojItBUivmMO0Jq1Kar31p0OlOthJr4BOrg5sfBZJs0yx3MSEM5fGUnyc1DR1wVwiFt
 KRIQ5wkw=
X-Gm-Gg: AYBFou3gxrdTqhUtQKkR3qvdp7CM1w3o2Q8lYmgG5FP2ldMEucsMbEWVzswlZFLwDZ2
 e9QmMWRlZDriEz/RY4YI9ce4JPNXZ9ClPJbXi5emjIfmogvdXZjCD8L99e259C+hMIxL26BnhLU
 imMdYVPhthCc4ZyX6hr3YWj10OaA7SU7234JgtAxxZBe64D/f0eiKPd3g4g2KdYboBxjrd6Qqdm
 PVgjKl2CzgptKhl3x+LC93veJKvEbpgjTN0Oat9RuXJXKRqrotRV254RjKTGX+/c3sz7hBLVCzE
 yjRS4z58x9og0MyNz17k/HUc2VFA9B4ddDEwcuA5O1R/4ej5urqkLbazA9vyjh6ifWaGYs3nmGX
 SteNIT576j1sw16IUjnQGOm1/P/455gH0Fv/nfEQpXj0qxM+vR58UHu8W2MV0UZ/Ugfmk4Lql4Z
 XIT71g/4zlZs44/+K7gECbmSIsNT1TUl5n8owbEdzrkPWRCX6eotXmjwrYZNfuPuFIcIIAbypGM
 xpcz8vCZok/QcAPlBtRZ2GQL/7FfESU4Txyta27VBMPsEfstzjFa7voa4AIrhzkoWuIWVFq15NM
 TrLqKvGiIKc3P8nm71KRQscS3lzpvIKNZwdMUWr97qpyBPV3Ef431HEEf69UDUqqFYkFt1gBFA=
 =
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id
 5b1f17b1804b1-4ac12475a61mr57904335e9.0.1793374199463; 
 Fri, 30 Oct 2026 08:29:59 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a0a3495sm49672415e9.4.2026.10.30.08.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:58 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:56 +0100
Message-ID: <20261030152958.1908212-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025094056.71854-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: security bump to 1.34.9
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
> This align with the version of python-pycares bumped in [1].
> 
> See the release notes:
> 
> - https://github.com/c-ares/c-ares/releases#release-v1.34.9
> - https://github.com/c-ares/c-ares/releases#release-v1.34.8
> - https://github.com/c-ares/c-ares/releases#release-v1.34.7
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-33630 - GHSA-6wfj-rwm7-3542: Use-after-free / double-free in
>   c-ares' query-completion handling, remotely triggerable via
>   ares_getaddrinfo() over TCP.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-6wfj-rwm7-3542
> 
> - GHSA-pjmc-gx33-gc76: CPU-exhaustion denial of service via unbounded
>   DNS name compression pointer chains.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-pjmc-gx33-gc76
> 
> - GHSA-jv8r-gqr9-68wj: Memory-amplification denial of service via
>   unvalidated DNS header record counts. Please see
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-jv8r-gqr9-68wj
> 
> - GHSA-wpr3-8q3r-4q8c: Memory corruption when an application cancels its
>   lookups after a connection failure.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-wpr3-8q3r-4q8c
> 
> - GHSA-fqh5-3x7m-wp44: A DNS reply that arrived from a different server
>   than the one queried could be accepted.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-fqh5-3x7m-wp44
> 
> - GHSA-97vq-4mxv-7vhm: Use-after-free of a lookup after shutting down a
>   failed connection.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-97vq-4mxv-7vhm
> 
> - GHSA-rf6g-ww74-97qh: Use-after-free when an application cancels
>   lookups from a callback, or shuts a channel down.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-rf6g-ww74-97qh
> 
> - GHSA-mw23-pfg6-2x9r: Use-after-free of a connection after the
>   socket-state callback returns.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-mw23-pfg6-2x9r
> 
> - GHSA-v33j-65h4-4ch8: Use-after-free when an application cancels
>   lookups from a server-state callback.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-v33j-65h4-4ch8
> 
> - GHSA-pj7p-v3cw-hq66: Use-after-free of a server record when an
>   application changes its DNS servers from a callback.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-pj7p-v3cw-hq66
> 
> - GHSA-grv7-fq5q-9vfc: Use-after-free of a cached DNS answer while the
>   application is still reading it.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-grv7-fq5q-9vfc
> 
> - GHSA-ph6c-3cvx-mq6v: Buffer overflow when ares_dup() or
>   ares_save_options() runs while another thread changes the servers.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-ph6c-3cvx-mq6v
> 
> - GHSA-cfcv-8v2j-qj6r: Uninitialized memory returned for a numeric IPv6
>   name with a prefix length.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-cfcv-8v2j-qj6r
> 
> - GHSA-wrgc-prmw-27xh: The query cache could return an answer obtained
>   using different EDNS options.
>   https://github.com/c-ares/c-ares/security/advisories/GHSA-wrgc-prmw-27xh
> 
> [1] 728ea9f901 package/python-pycares: bump to version 5.2.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/c-ares/c-ares.hash | 2 +-
>  package/c-ares/c-ares.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index 7bf4163e55..8459c18393 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
> +sha256  9364b70a12eb59a06830fb488d9357f90100dff0d98b23ea3593a183d43e6f2f  c-ares-1.34.9.tar.gz
>  
>  # Hash for license file
>  sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 1653b16c28..b977c3a122 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -C_ARES_VERSION = 1.34.6
> +C_ARES_VERSION = 1.34.9
>  C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
>  C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
