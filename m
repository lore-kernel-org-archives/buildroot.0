Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08A6606A330
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NZYMjT7r
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D0C40E0B;
	Fri, 20 Nov 2026 09:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh9RNjx1r9MW; Fri, 20 Nov 2026 09:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3CE4B40ADC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168774;
	b=YYHjBkJxSfB8g/Cbqvn9Hyh3A7xJiRJn/3bGA07nd/e00o9ueAuprkNeggKRjzCP6A6x
	 xI+8P3gjdgh8iBL4ykSVd7sHCxtIy6O+9GfiVZ7mChuh7TDDAr2nrvuzgxur71i9MCOfQ
	 V2Hk2VvdFNeynls2NOPlk6Z0EN91xfemN9PuCcEZcvX8esSZEJK+6Jo/hpmCQmQnh6nw9
	 zwiAAwRIZj0Whol57XYUrKwINlJyFmBhORz1pOz+XZhnYLTrJfG3rj0SmuhBHPhYgPUDk
	 Ajewo171pNtrhFFuNA9eJY16h2tkxCQevDFJSmiZZewKRjRxfAYAKQBUnCQdTQWpRhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ASlUWplF/5O96UAQB3ydFyGhzgoi7j4o/mLQSDHjHKk=;
	b=RZAgi8W0pQJIEpkfewojgIMiurcGvme3xw0W7Tq19NvyyD7+wvRGkrMnnIJSCqszKJBY
	 LtGkgjbud7W6PyF1fq3rLAdlUNWbVPiQX3IKe4hLyc3e1p2x2SoqHah6LpiwdRnTh722W
	 E3ccr8N4s5jwFwTO2rdZ4K7iV086fOY+pgD6DFhG+5GbyqbHIOY80z5VgUF+NiMf8sazs
	 R5heIPSkyxV9ODfGOD8e50QsPBLszX/no7O9K4B/tXHlJhcT++UwfwkGH8cMVOm4eqTH0
	 ttSGJefJ66ojqW2YRuEK1UdOcUgDeP2KKeLuFtIKUCDXnpea7q14u5k8CSEvNWedijA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168774;
	bh=ASlUWplF/5O96UAQB3ydFyGhzgoi7j4o/mLQSDHjHKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NZYMjT7rQ0Wy0HbbpI5gzDyCrqE0UOLj2xtkTzAEMZhGfv3Jvwj4+hUSNz6lWSHac
	 LNZ+YzcWEvejjp8bjmcKJIX9j5EYLLMgkCt9rIVSPNHXDy9mx6VxsG1OqQKMkFjqgE
	 kzYPT89hwR3+0pLtdEZ1+6wekaH/rey4JMlsq6l0ID0fny4s26+dbPF9ZzgEVMGYep
	 twq0wilKE/M6p147laY8FnMRanL+0LMaVFnxQeSe2qt8grwE5/2yY1n47V8d7q/+Pr
	 PNQW/EKgle6Qegz+MHRRgdIanzhMJEKzvhjz7SNWA2673HC/XggghRLqgTtD4kz5k9
	 O1zkO/IJXd4kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE4B40ADC;
	Fri, 20 Nov 2026 09:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD9EE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321D340A1D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk8WbY0yuSnA for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0B97E4020D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B97E4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so615668f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168767; x=1795773567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=92vvkBPtDvltyZY+HUvnbyMbcCsxCspstHe7yTYVWww=;
 b=1Kybp2bttjHKPNDNOvWI9mvDEsUKhra/ziWuQLoq+wFee9VZtiN/hUC5n0AFcAgR/s
 hZn9tJBnnWWTP/aqhORLqJg/64cGepfdBh1DG/UoLu21aPWVKNoD3UlhRVpQS6wZbNEG
 MgMpwQZIe7xxpRdrg8RvZdzC/3M7tAD0c810oHDUVqg1hkx1cNY4I+YjLnyExbPUTLvq
 tmliD7U7SrTGV/RmJ0w9dkYkicVVC9b5FMf99UUHVbVHGBrfsRftRBialO65wkpmZLQL
 4OxXxxNTOh4R+/fWmnTNOQVHjlTb3XbcaIbKTy5ZGqMGgExMxZdbrZkUCWOqxezZZ2rS
 rMtw==
X-Gm-Message-State: APuU4Z/bmviImjOsSuqR/Gq9GzLbfuEjc1VZ2W7A8YCvL66csdCxd0Zr
 UE9rcoHpSuTy9LyieZaLnQZhHM/ezdnH2MI6W3ikJyBHWHH/fQW27uIa29PaV4gAq4ypvNrR2eT
 kZqXpy6iB7Q==
X-Gm-Gg: AYBFou3D9X1lQHO6RAs7pwe08SdnBwZZIOTWGl6n2UfntpuermEmnDlX/PVuG4Wu2q/
 QNWdUbEmUw1FYlA58LywPh2SFrM6zkU7bjlNQnw90U9KCMj7PxwnXkAgXNgdBYtjCN+DPX83b2s
 sHmgJIQxXxiz5Cpt4c0Eiwb3b0FaTIwVxMc0F73guBfwezCumSdSNcrtQvKoGVZcAry6DAQoztB
 PrpBmVnt1Y2zxsJLQ0dhj6v2Mf14hRdUpJnwvN15cOGbAkvPgrC2ENPIN89Rl44rpviTfiMGMDe
 hB2Cdw6BO+n5KTH0RgEV1396nC6yEFrsDH94/FCBY88zRV0k9ckeAliP5tp9D0SCNq47hdiKiDK
 VsQOQ/TH0SWL/c9ZwBKFgck0UZtFt8SO/5skRf1P0c7c5hTwhVi1x5k4qt43B4iz2iKKyPLLaen
 ICFKARQ06mMIvPIxlgUOFxpvj9vO06JOWEuNKUwB5jdIv4XxNTdaeMxK89ZFftxIKCpXovbjfky
 hIs5TiLgJ1G0c1VrDXlyGDvvLW2nUQ8WKJioOGhL9CsQ4U6ZpkXSHSa5xIXuXiHSEdbz/1UW1Hc
 HfrtSN1/3TkhA0uJiGydOANrDrp3Ecia6WGPK9EFDS9+
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id
 5b1f17b1804b1-4bb88938a62mr52180455e9.28.1795168766951; 
 Fri, 20 Nov 2026 01:59:26 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88f148aasm23566435e9.0.2026.11.20.01.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:26 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:18 +0100
Message-ID: <20261120095925.539928-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111081946.3850218-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix host build
 with GCC 15
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
> The host pasm assembler fails to build with GCC >= 15 on the host:
> 
>   pasm.c: In function 'main':
>   pasm.c:437:9: error: too many arguments to function 'ppCleanup'; expected 0, have 1
>     437 |         ppCleanup(Pass);
>         |         ^~~~~~~~~ ~~~~
>   In file included from pasm.c:75:
>   pasm.h:576:6: note: declared here
>     576 | void ppCleanup();
>         |      ^~~~~~~~~
> 
> ppCleanup() takes no arguments, but main() passes one. The empty
> parameter list in pasm.h hid the mismatch until GCC 15, which defaults
> to C23, where "()" means "no parameters".
> 
> Add a patch, submitted upstream, that drops the extra argument.
> 
> This issue has been present since commit 725efef8313a
> ("am335x-pru-package: new package"), as the bogus call has been in
> pasm since 2012, but it only shows up with a GCC 15 host compiler. It
> therefore affects 2014.11 and later, including the 2025.02.x and
> 2026.02.x LTS branches.
> 
> Fixes:
> https://autobuild.buildroot.org/results/d6e70d200a3a7003a1d3fb03000fcfbd6b9dcc56
> 
> Fixes: 725efef8313ae5591bb497fec3aa7e62717af9a2 ("am335x-pru-package: new package")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...Cleanup-call-with-too-many-arguments.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch
> 
> diff --git a/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch b/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch
> new file mode 100644
> index 0000000000..1f0f853882
> --- /dev/null
> +++ b/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch
> @@ -0,0 +1,41 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Wed, 11 Nov 2026 09:13:45 +0100
> +Subject: [PATCH] pasm: fix ppCleanup() call with too many arguments
> +
> +ppCleanup() takes no arguments, but main() calls it as ppCleanup(Pass).
> +This went unnoticed because pasm.h declares it with an empty parameter
> +list. Since GCC 15 defaults to C23, where "()" means "no parameters",
> +the build fails:
> +
> +  pasm.c:437:9: error: too many arguments to function 'ppCleanup'; expected 0, have 1
> +    437 |         ppCleanup(Pass);
> +        |         ^~~~~~~~~ ~~~~
> +  pasm.h:576:6: note: declared here
> +    576 | void ppCleanup();
> +
> +Drop the extra argument.
> +
> +Upstream: https://github.com/beagleboard/am335x_pru_package/pull/73
> +Assisted-by: Claude:claude-opus-5-5
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + pru_sw/utils/pasm_source/pasm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pru_sw/utils/pasm_source/pasm.c b/pru_sw/utils/pasm_source/pasm.c
> +index f8051ff..06fa9bc 100644
> +--- a/pru_sw/utils/pasm_source/pasm.c
> ++++ b/pru_sw/utils/pasm_source/pasm.c
> +@@ -434,7 +434,7 @@ USAGE:
> +         CloseSourceFile( mainsource );
> + 
> +         /* Cleanup the PP and DOT modules */
> +-        ppCleanup(Pass);
> ++        ppCleanup();
> +         DotCleanup(Pass);
> + 
> +         if( Pass==1 )
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
