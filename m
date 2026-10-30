Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA01606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gPwATklh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A3881680;
	Fri, 30 Oct 2026 15:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwICSRy5r84C; Fri, 30 Oct 2026 15:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 75668817A3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374150;
	b=KJzAC3Rl2L6PszwAC/FRIvFq+QOBvpfntmTiAxq5ek1xYlLeNycceq+Fkad/VCyCIcjD
	 45FDcfaSnvmrrW6Fo56GWlZMBybFFAxohZdRQUL2yBtsZ2kJrzoOoFy8xWthIwmj94R5C
	 69yOsb9jHlAg+f0/kaJXRp3Bao5TF0unFwD9uF4HDbbSig2VTrNkUgDM7RI/eBMETbVuO
	 uRS7iDlaSx46woUzx9Wb0g1sr4ZLBZxjYFuYsdBvbilR7IgGCNMtjT0pomW0Uo6UH4Ty+
	 AX9poxRELQADjrxmKfFY6F7YVkr74m8Ie6HrUjBftt5tDMhRrIwvxIbc3UUh/hJgKlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lTV8SgO1cU5skUurrreWnL46p94Nq1X+QsJ4UADI3tE=;
	b=itNwzZAK15IG1f5qZqWvIxfgXaBqbvHBu2rTfnJVot3SurZbe3ooB91MLpAqIAEu2kh8
	 kZz+o6KSgt/U4NJXN44+pDYmLoLhX8Ns0qOVU8h91u6BgRN46O/91p2A6USZaBJtP5af6
	 B3g6A0/v7AwRGbF8g2T7Xu9cu7c0/FohvWGZZokt8vy2elgGFBvhm8OeWixcX8oubyZcg
	 5BQNr5zFAogQIJtLlbO5altEJieCyUR/8Sm3tpXWKP3AfQMtxJ13pJqv8YfnxURJHzgMK
	 ThtwuE7Hc8vHcbplTCu0Ve722LNKGoBLVc0fouR4ej9/m1pc4hhOy48oX4x/5kRQSkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374150;
	bh=lTV8SgO1cU5skUurrreWnL46p94Nq1X+QsJ4UADI3tE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gPwATklhZV21cEAfKZt1//YtliLdB/4HKt/dVmTW3o2PAf2T07RBJrEjA93Ym0F/C
	 /+iWS4n5/s+idyv9E5S5nSR3QZxuKm7I9dZzLACEaHdV3gPWho3Uhbk7tgfCFyuiA3
	 rEU7l9TxZvbIRMixKNHZ+/fbkqkcvRfv7/OQu2eYcUlVNhb55VrOsyqduaKvu5d14E
	 vWYI6w12yFqRT7B5DiSKa6jjc8XHNxX94ikc5HJCG5TRzKy+RS25+R7umv+MOWZJyS
	 fKM5DgO1Htja25o5e23X0w4wAIV7Q3tR/OCmjSthvc5ZgijIvSp91cRBANwPAY4g7t
	 1m/nkix/gGDhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75668817A3;
	Fri, 30 Oct 2026 15:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57223D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4304C8177E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 955dpwcgP-Dh for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A4B281764
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374089;
 b=IIfb2byzNLgeJ/AfjFQGnkwcrS9X6kIoXSGMJ2sxUftTU89WiesXEbAuVsRh8Ubpz3q3
 ToWnRlPgbgw94b4pEBL/lshAfxwJajDZEFVzLg3ZHhZOBxoU2IKRQ353KpyaUJT3X2BtC
 Q7pxm5+T6p3KttMFa6XoCQ5SvDphSuMRLtyqVD6A8hRTvqI7+zwfW+xchS2aZhWcQP5cd
 zY8oxFurrDg4H2xLVQtVRiwI3yjFi+xHgD9Gth6NgUvIG3GKBOujIYmIBoyVUKQkPajSa
 TT767Nm4o/kvj3ozEr2K5W5vQiGp+momD/iGfrcAZcxG2Li+gKoHTHxb1WhhQr7YC1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374089;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=prI5+5V/aSmRUUSMFMfjVZoaBHCOY3gEnIpTjzzBCPk=;
 b=f+Z9NbGvf8csX671RHu0+XoNKgHHc9PPepv3YTmAyURoYP0wCuGwuJYuKnBhLMkInHt2
 JaaAHG6cZPJ7NfkbopWLywol6hDa61xP0y4MPwa5UVa5tBjK3iG0l+ThfMVtIASdomH+X
 NuyRdxMFOid+B4Ac9+hSZTXJ6czd2R/f6VBP5t/2tKIhx2Npl5oEubLtYSNDivOc7p+RB
 YN/UjWzlmcqbmJJFyVQnU8nb7dNNBoqPoiphraGQziYI4kBTvm0BAkksAlaES468Aj44u
 B3OuDH+X+t/9IhaPX6qMHEKmtSwlEU6ZbBB5TmCXtPIpwfn4XoR0pcz9p5SDafACoow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Ea4C/RRq"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A4B281764
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:08 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso9876425e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374087; x=1793978887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=prI5+5V/aSmRUUSMFMfjVZoaBHCOY3gEnIpTjzzBCPk=;
 b=jw4TbtpuTe600pk8SBvwnMVusM9o+xNl48c2FdS6WV7q5e/3MAx1xbyFhxJClew2X2
 nM7J2PlDpccBXYlhdA4i0IhmiWeCIp9I3rb5dByeYI/dKiYhM91VKHPopm4jqNqNzNQt
 BHZcfYk9f8Se81nrx39hLHGtRkDLjvExIruGGyvoI3N+m2cEsYPR2KPrnc5H9t41R5C6
 ToDMSkhpcbOEJNEk2mb3gcSIG7QTw3pRlWdvOnA4gXJEzMA8h69tv+ZkJd5q8qT4Ix27
 nJSB5pg4Ja+a0rzzWXs6GC6JQg30i2Rc2IfoLOkR+7cQWGQpYPuiNGyD1dm2g6l2x/4O
 BbIg==
X-Gm-Message-State: AFq9FYKf8uwFTwDfu9l/Hu5djgAJyp/maPXFG9oAvMcHBh6t1lilICmC
 hVWenJaTykJ/G9Hl2B0niqmrIFX/zfvRqHoawq4atTTzopjRCNXQYrkVVSeglZCbnLpxgM2rFEL
 id67uYFs=
X-Gm-Gg: AYBFou2guZvZS7IrSJ+U3A/oVJpedjAhxrFCTqcf0t1nWU41wgnXMcuOJK1SUCBhnW+
 DJqVJo2KLz4c4OjCme/8e33W6JfORuVD1Pz0+GB903/FibRhM0aHGiJkTWpFul7TKjBFlWJZps7
 EfmYlBi+t74/c+B4BirhJ5cWmWEm7FojVELtyXbZ4ImtUFmCk1vmy8J7S23KI/gGIAn1yQU/fYz
 4BuH6EDFC8OiacFvnxUnpTGD+/xaWv6bS1k/QIIqH3HbuBuKAp66oy/Te1ukJ82otYlwIeue9s0
 yH9dKRkAvkySuF91C1QACq/2Fwt5Cojk7B7B1VSEvcGVPsBL9LVwvFyJPsRYn1IDKTmZO5Pq8TS
 YHe1m8TnhanImcAlsJMDU7VgZk7jRwiXlXSJKoDaM0ufVLlGKTvpAMctRr5AAk+pJ3r8Mp1P1fj
 WOtPkjmM66WLquKQMovERw9qp+tGJxrpYMcpI8DjGYlARXWV0PJNUpJh6odMIzs/hPcdtG2v5Te
 byMQsLT9GNCrKi7VtJ9TnQAq6N17Ub3/gkyc4xGkckeWW4oc4/S8loVYdd2YGXE8DZhHWQrFRFS
 AIAhM7+iELxr3lsSZo6nqY8gjmdALGGkQp6RomK/WfP5NCmjqUGRvNTadUnQCQfxTSl67E+T03S
 kDwzENj5f9NT/yHi/Nw==
X-Received: by 2002:a05:600c:8183:b0:4a1:f9e6:f418 with SMTP id
 5b1f17b1804b1-4ac19802178mr49720105e9.34.1793374087018; 
 Fri, 30 Oct 2026 08:28:07 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba24f6sm3682786f8f.51.2026.10.30.08.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:06 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:04 +0100
Message-ID: <20261030152805.1907134-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022075734.2659243-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - replace the local patch with a backport of the upstream commit
>     0ff27aab0831 (NEWS hunk dropped, it does not apply to 3.27.1)
>   - describe since when the issue has been present and add a Fixes:
>     tag for the culprit commit
>   - fix the trailer order
> 
>  ...winder-entry-points-needed-by-libgcc.patch | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch
> 
> diff --git a/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch b/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch
> new file mode 100644
> index 0000000000..78ebf3e5f0
> --- /dev/null
> +++ b/package/valgrind/0003-Provide-dummy-unwinder-entry-points-needed-by-libgcc.patch
> @@ -0,0 +1,88 @@
> +From 0ff27aab0831786c7f419e73a2b5217cbbcc792d Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Mon, 21 Sep 2026 23:45:52 +0200
> +Subject: [PATCH] Provide dummy unwinder entry points needed by libgcc
> +
> +The 64 bit division helpers of libgcc (__divdi3 and friends) are
> +compiled with -fexceptions -fnon-call-exceptions. When libgcc is built
> +without optimisation, GCC keeps the exception landing pads in those
> +objects, so _divdi3.o, _moddi3.o and _umoddi3.o end up referencing
> +_Unwind_Resume() and __gcc_personality_v0(), which normally live in
> +libgcc_eh.a. At -O1 and above the landing pads are optimised away and
> +the references are gone.
> +
> +Tools are linked with -static -nodefaultlibs and pull the 64 bit
> +division helpers out of -lgcc, but libgcc_eh.a is not available, so
> +linking a tool against such a libgcc fails with:
> +
> +  ld: libgcc.a(_divdi3.o): in function `__divdi3':
> +  libgcc2.c:1226: undefined reference to `_Unwind_Resume'
> +  ld: libgcc.a(_divdi3.o):(.data.rel.local.DW.ref.__gcc_personality_v0[DW.ref.__gcc_personality_v0]+0x0):
> +      undefined reference to `__gcc_personality_v0'
> +  ld: libgcc.a(_moddi3.o): in function `__moddi3':
> +  libgcc2.c:1249: undefined reference to `_Unwind_Resume'
> +  ld: libgcc.a(_umoddi3.o): in function `__udivmoddi4':
> +  libgcc2.c:1204: undefined reference to `_Unwind_Resume'
> +  collect2: error: ld returned 1 exit status
> +
> +Provide dummy definitions. They can never be reached, since the core is
> +plain C and never raises an exception. They live in
> +libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains that
> +do provide the real symbols keep using those.
> +
> +https://bugs.kde.org/show_bug.cgi?id=526075
> +
> +Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=0ff27aab0831786c7f419e73a2b5217cbbcc792d
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +[Yegor: drop NEWS change]
> +---
> + coregrind/m_libgcc_sup.c | 33 +++++++++++++++++++++++++++++++++
> + 1 file changed, 33 insertions(+)
> +
> +diff --git a/coregrind/m_libgcc_sup.c b/coregrind/m_libgcc_sup.c
> +index df509be08d..10ad8ff86f 100644
> +--- a/coregrind/m_libgcc_sup.c
> ++++ b/coregrind/m_libgcc_sup.c
> +@@ -60,6 +60,39 @@ unsigned long int __getauxval (unsigned long int type)
> + }
> + #endif
> + 
> ++/*====================================================================*/
> ++/*=== Dummy unwinder entry points needed by libgcc                 ===*/
> ++/*====================================================================*/
> ++
> ++/* The 64 bit division helpers of libgcc (__divdi3 and friends) are
> ++   compiled with -fexceptions -fnon-call-exceptions.  When libgcc itself
> ++   is built without optimisation, the resulting objects keep references
> ++   to _Unwind_Resume() and __gcc_personality_v0(), which are normally
> ++   provided by libgcc_eh.a.  As tools are linked with -nodefaultlibs,
> ++   that library is not available and linking a tool fails with e.g.:
> ++
> ++     libgcc.a(_divdi3.o): in function `__divdi3':
> ++     libgcc2.c:1226: undefined reference to `_Unwind_Resume'
> ++
> ++   So provide dummy definitions.  They can never be reached, since the
> ++   core is plain C and never raises an exception.  They live in
> ++   libgcc-sup-<platform>.a, which is linked after -lgcc, so toolchains
> ++   that do provide the real symbols keep using those.  */
> ++
> ++#if defined(VGO_linux)
> ++void _Unwind_Resume ( void* exc );
> ++void _Unwind_Resume ( void* exc )
> ++{
> ++   __builtin_trap();
> ++}
> ++
> ++void __gcc_personality_v0 ( void );
> ++void __gcc_personality_v0 ( void )
> ++{
> ++   __builtin_trap();
> ++}
> ++#endif
> ++
> + #if defined(VGO_solaris)
> + /* At least on Solaris 11.3 ar does not like
> +    empty .ar files */
> +-- 
> +2.43.7
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
