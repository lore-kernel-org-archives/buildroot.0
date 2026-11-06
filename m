Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C152A606D81A
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S2VlY9fA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D019817A9;
	Fri,  6 Nov 2026 16:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atIjK4w0ijpk; Fri,  6 Nov 2026 16:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A54FA81E24
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981444;
	b=V0MQp43+myV65yDSO5iz7OqeG2kFvrO8HEQZByc6DXdjYwaQyCX7+R0pEgQEBMyc8wJA
	 PjhdcRovRgFSru5oD9T74ZjlQUCftaI31Tm5AFAmnqPqeZZWOd3cGbmeMG0gdiAOFjPqZ
	 SiEt/sWKdzydZ3NqRXrclmGtVS57Y5/hHppNZ3LJv7mQeGrq4AvuUNguEs9yxTG2/U+CS
	 XP5ZnlTKMpA2DgCa7MgrC5OzUhsG5V/B+PiGdEEthoGIRWYxtEnrQDsn/1QDjUA0kyuCE
	 Cwou4KKPP1SM6Blkw03n3OEHic6E9Zp/WLlqvwvnQHs2Gl9v/jQhmiNMO0EaQVUirRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=n2PRLF2wbvZJEFimZPzlESUJhXAxn24Zzji4Z4bMs28=;
	b=oEbTfMEZCSkcZ+eBfRNZX2d3PCzrk4nEubq02GjGw0XfQOvEHOEklfRgYcCl47sGlIcH
	 7WtjwUnngtXrCaNxA1xJ4O86d7oUYiGPuUosr/6h/PN5s5RqdNpSh2ufiJ7vZWQhxD/tY
	 HYGIA+1jv3jdlrcLWPW+r8rNG9JiVFD8tLIb1EijLGo6Gxdcs+QNdyiggSNrjjgOSUZ3U
	 A+RV8qWH6Nt/UTw52hupoFxjlyTho/NKOJYQ/7sfYp0j7Mg7pHTYQNubMcRcdR5L1ypEJ
	 tf3H2YdhNI5Ha1CM4CAU9Dga50jA/kyyGUV2zjxhQcZEcCy1nAJ217sSe6vQSKA57BA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981444;
	bh=n2PRLF2wbvZJEFimZPzlESUJhXAxn24Zzji4Z4bMs28=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S2VlY9fAU1hgoZFhnAQj88NLnfeeGJQIdKFgWTDi2zcvS6u8d9V2NXA3Qvgm3HcKH
	 DCmIA3aj9FWrWzSM+tONdtOCZN7yX4WSo6YfjPUfDLWYD/kdm1gXmClMtEyBFdX90L
	 7qbmV9qMzmP4KMbNUjdlpBtvMoFZyVxAQuB3XdlPDxkX/QAakdFCymf2g1UQ8IyRCp
	 +KbRuDbWWGqRxzS7CEPc9M8yexOhjbppfnjAdtA0qPl8n9slFiHLKxYNCmlfWtRR14
	 6n5cszRLJOPa+ZioygHykqj5WbHTMouOu+UF1YDUzkMObeGiuMmiQ9Epnk2QGmrea7
	 4V2ZIoI6AbUmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A54FA81E24;
	Fri,  6 Nov 2026 16:10:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 014572E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB1E840911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExpYt4FYndOy for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C52144090B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52144090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so7600915e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981439; x=1794586239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5rfHG73bhneEHeSxqJ5FiE/Bn2XjbrWFziOVUjKozlI=;
 b=t/nxCAcFwCeAN1fqrIcxHY06qopjV8Wn8saJOvipMvWpJETKFDheZdOaenZNY510Fw
 PLGJWwoXqYY+ymJBETRtCQKKLh+Mz4mKEFp8vr0fqeDgicc1Ek63n9sAUpIazTVXTZY2
 uWQBW2TEAGQNaIsjyHs/B40UfTqbvy8aa+wXTitLdxaRdTaN5uLttNMclLcdQCHukRny
 zR67GCENFfUVXuuentfScE6+b6KPGzz9AZaUt3Yjf0b3Wovrz5Pqdb+IBNk0PnFH4koZ
 9BdsnKFXQyl/jy9J36VLDNYaBPElr/t2wexhDi1yuQXiabtScf4hpgWVl1cxtoPXQkBA
 NN8A==
X-Gm-Message-State: APuU4Z8zy1EJjiLJ2NaAtpO/+M2BOR/y2F4M4k/zqmzdHEKhYiDDXay9
 dwmq5QadUjjh6Y3ThzCQyZeWhYsU5/eYpRK53m+/vCgdld/Vj9TD+4cjLNeoQvv8xdrA97CwGnw
 uY/oc6VI=
X-Gm-Gg: AYBFou1s2p0kxPVHgbETAFgfKYZJFttwwULdHPiUvKPKKqjNPN1CWMvDplGf7VVhaxu
 OHklBzFk9ZSkd6DaTbf/evtcVHw1jYfTqbv472nPbPF70dkhTCuOkm535BAWYYyFH6w8GTMU8Wv
 Ta+24ST00hq02J3KYPHX9WEmmO18WyS07xem83JzAi1TZhyt7z7M2ECWYESVQbSecwM2gehyctU
 YmDFEO+swc4VCfYSWEQuZCv5oov9lFmkOxbXXzzexecPfruQCzhGi5rqsCxP8DL+PBpbpJt9Sic
 l+q4gLtNgFoYNbm9s3QsCkHDTA1MCHSNdnOwSjRmY6DzJYetQupeca9D2yW2jYiqru36V3uAmsL
 +fsUHE4reTGztbFExoZpaYpoEZR7xZLEATscGD5C7qnYHmQGMTileTZ7FeqxI+Xaa2+t6OioGom
 3YNN8yVUhvTSv6KigtH/TTTgIrAsSFTGzmOPWEVI0zjQyfbahCxUgo26gw8gI3ULIcw5hYD7w4a
 8qxMeUWVw6WIofUjhniwrw5I0yruB8rABd+DZHjqoXgYwt0ZyqZVYOXbwqnx+w712gZj2X99nG/
 3zT+UoL9I3tf2HHZ1m6mFB0GeS7lIOg=
X-Received: by 2002:a05:600c:8107:b0:4a2:a8c:22b0 with SMTP id
 5b1f17b1804b1-4b6dc4001c0mr49679215e9.1.1793981439345; 
 Fri, 06 Nov 2026 08:10:39 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6ed5b8159sm64004755e9.2.2026.11.06.08.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:38 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:36 +0100
Message-ID: <20261106161037.607728-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030115016.1094292-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/18xx-ti-utils: fetch from the
 BeagleBoard GitHub mirror
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
> git.ti.com no longer serves git clones through its cgit web path, so
> the download fails:
> 
>   fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403
> 
> The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
> requests, but fetching all references, as the Buildroot git download
> helper does, fails for this repository with its ~1000 refs:
> 
>   error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
>   fatal: error reading section header 'shallow-info'
> 
> The cgit snapshot tarballs, used before switching to git, now return
> HTTP 400.
> 
> Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
> R8.8 tag is identical to the one on git.ti.com (tag object
> 6e8dcab3a39a, commit b23772347318), and the generated tarball matches
> the existing hash.
> 
> This issue has been present since commit d8b15b078aeb
> ("package/18xx-ti-utils: switch to git repo"), which introduced the
> cgit URL; it worked at the time, until git.ti.com stopped serving git
> over it. It therefore affects 2025.11 and later, and 2025.02.x since
> 2025.02.9.
> 
> Fixes:
> https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f
> 
> Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/18xx-ti-utils/18xx-ti-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
> index 3e6f715730..6c04b60723 100644
> --- a/package/18xx-ti-utils/18xx-ti-utils.mk
> +++ b/package/18xx-ti-utils/18xx-ti-utils.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  18XX_TI_UTILS_VERSION = R8.8
> -18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
> +18XX_TI_UTILS_SITE = https://github.com/beagleboard/18xx-ti-utils.git
>  18XX_TI_UTILS_SITE_METHOD = git
>  18XX_TI_UTILS_DEPENDENCIES = libnl
>  18XX_TI_UTILS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
