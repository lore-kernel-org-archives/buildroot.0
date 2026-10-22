Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001F606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kN2xwCVz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9BB4093B;
	Thu, 22 Oct 2026 09:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXy0X5eF9K_I; Thu, 22 Oct 2026 09:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E9D8740937
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661547;
	b=HX5dTISDU/701yy08oyle7oQaFzZLtyzaerfn8FZcwDW9lmDKruH2p9t3FADuW/z8Oyy
	 /npKQcx/aczeLgwQkiYEMAVeH+o2Vom+iJKE964dbOZ9ggRnzDvA4DnTmPvLNgKNYXV+1
	 j7hSixuquegYAGhsd4ltadZr/YJ36av7K4YR2jOv5TISt9dG2g4JuHiRP4bFcrVHLJigs
	 DSmANR2IDTXEiwflMHk1AhLpy8FMTiplEfVNQ2gdzu5hszm8yUURUvu7M/Ameh+XGHga8
	 TvWXr6uUdNTInBGWDTspskF5IuKVXrBdwywrlZfpOvboYJ6AJl/4viQz78GYTcpeigg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QcM5ivKPwClQnYOrNi1i/EuoVJDow4jwTpjLPoheRa8=;
	b=p+DeUFTd6W/o4E2A5OVdZsZiokSwkoTBzrQ9G5EkIjEa+ZjIzDSZQSBUbRBV4jf4Qmac
	 TkqDTPa0Rpd5B6dh9fgRaWvYATUumWTdTnCZBxq8WSgok6KfSGyq98t23/1xQtbtyijb4
	 WqnW4v8lNfmWdRBXpcOOmyCH880mjjs/9gdVaipa7wA7BGTUWYlWfs9I04db3rs+ylHZ0
	 8mLyNIpp0ACaI/AY0WobulHAPHxvs230wr3umNg19BMBND0i+s9tP1HV+BBUxgbTJQzTc
	 DoXFXNcaL5OijDajLO0o7gyFCiHMdiRvYndAlqMYITKIv1arAmSz+Ycdjp2VjtxQ2gg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661547;
	bh=QcM5ivKPwClQnYOrNi1i/EuoVJDow4jwTpjLPoheRa8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kN2xwCVzbGulsHJl1RkB2W+yzmvJ/AQYbP9UIsz0o4fWbL27uyr+pTpaMWqd2LlWJ
	 qbUlTBBoyx9/3yp0HjHUau6hYe10AUQZw7Q7HewwLYUOEqJ74QdqU8XG7u3sl7Npkx
	 FOnJjEX2Hm9brLEAqbqZiM8j4ZPkXEjJfEps9nCiNc8cuonLn3I/QXiVpbM+eU+9tK
	 NQxDiC2rvf3Pky3llwOWXg7K0yue3dwEOLNdby36FYE1jMSvrYE12ORvyC5QaIj/4f
	 vtBr1ysCM04xi2gWzbn1cRTpr6JD2M4hHdVH//FfqiVg1gmLZq/bbSWueS/6GNF3eX
	 0v+7LcWapSxBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D8740937;
	Thu, 22 Oct 2026 09:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 922BB3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7840B60846
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TXNQZf8Uqdh for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:32:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D358960823
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661544;
 b=PU2FM+bsyiwPrx1cm+HnLzoID4LCvT8Vt2ywWtgLE74CFHl/yoFuxPXbh+lFel+Y3/Ah
 thw2wm3FFZHTzeu2+sgLRtW4Qmeni+jIAQKDS5SiZUKVyUpSCUUipLh7Sf/sQlD7jIMUk
 zf0+yNggd5gyncScIEU3EpenbZBryypHsSgSS+qqvYoOqBux44F1rzbZDu/x8Y7WnCi4f
 G1fsA6OHH1uFgXmZR16Fqy5D5KZWxgXTezbzk7P1cbgu2eezE6HOeuIYHT9viEbQcPUUD
 UzHn5ZDBforODAiboymDdEVebqEYW8plZMWEtkamWz2Z8Exdn9W+fN5OefuHwbSrXPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661544;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=dMj1xIzPkaV80sNjyxi2XNg/c/L3heQ9emw7PaaKciU=;
 b=g0W7BgRBbirTJKNQFZ9nVYAAkXzQYmWbDerOM1BGTj31hEcoMb/7WcZcVNT0f7iSO0Dp
 SEKPMywPc0WRe7U2Sd1UnbLJGeGZHVoRhNV2RCr9M510XX1mOfGHqWlUQsTS5v+e6h6QI
 H2XuaoiBDVxz2CGwKuPZH+4xo94ZI/keij6RM3SufbTVDIVl0cNwBmRVCGm1YtKxtNm5w
 xcSVAAL1F8OI4LCcfY+acz3EzNzO+VwhcX+xBGbgE9zJozAFbMeFlmD1URkrnRVFpyN4g
 gvMfdUG0pqHuUCG7vHHeKorCe/ew7UBcaKqX60at4gMYeFneI3tFBjau//Xar6rvgUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=i2qan3jB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D358960823
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:32:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A7E34C58471;
 Thu, 22 Oct 2026 09:33:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5DD5D60360;
 Thu, 22 Oct 2026 09:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7482310328E09; 
 Thu, 22 Oct 2026 11:32:19 +0200 (CEST)
Date: Thu, 22 Oct 2026 11:32:18 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atnYHB0ChkKie60F@windsurf>
References: <20260922105323.2939955-1-yegorslists@gmail.com>
 <20261022075734.2659243-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022075734.2659243-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/valgrind: fix build with a
 libgcc built without optimization
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:57:34AM +0200, Yegor Yefremov via buildroot wrote:
> The 64 bit division helpers of libgcc (__divdi3 and friends) are
> compiled with -fexceptions -fnon-call-exceptions. Buildroot passes
> TARGET_CFLAGS to gcc through CFLAGS_FOR_TARGET, so with BR2_OPTIMIZE_0
> libgcc itself is built with -O0. GCC then keeps the (empty) exception
> landing pads in those objects, which therefore reference
> _Unwind_Resume() and __gcc_personality_v0(), normally provided by
> libgcc_eh.a. Valgrind links its tools with -nodefaultlibs, so that
> library is not available and the link fails on 32 bit targets:
> 
>   ld: libgcc.a(_divdi3.o): in function `__divdi3':
>   libgcc2.c:1226: undefined reference to `_Unwind_Resume'
>   ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
>       undefined reference to `__gcc_personality_v0'
>   collect2: error: ld returned 1 exit status
>   make[4]: *** [Makefile:1180: memcheck-x86-linux] Error 1
> 
> Backport the upstream commit providing dummy definitions of both
> symbols in libgcc-sup-<platform>.a, which is linked after -lgcc, so
> toolchains providing the real symbols are unaffected. They can never be
> reached, as Valgrind's core is plain C and never raises an exception.
> 
> This issue has been present since commit 0fe633cdff66 ("gcc: explicitly
> use C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace"), which
> started building the gcc target libraries with TARGET_CFLAGS, and thus
> with -O0 when BR2_OPTIMIZE_0 is enabled, instead of -Os. This is not a
> gcc regression: both gcc 11 and gcc 15 emit these landing pads at -O0.
> It therefore affects 2015.08 and later, including 2025.02.x and
> 2026.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4a58c34308095e4d8ae91e0a779c94123ee497f6
> 
> Fixes: 0fe633cdff66febadc50bab3e0af4b3be53811c8 ("gcc: explicitly use C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
