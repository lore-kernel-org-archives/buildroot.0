Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96499606A32A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JZou/stg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7215460ACD;
	Fri, 30 Oct 2026 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSDVIiVsMKKP; Fri, 30 Oct 2026 15:27:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4008960B14
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374039;
	b=qbyieOSJQjjZcnZ3hZS01WcyeJcou4LuCD3mHKaMImc4funos1owNz7k4YIM/t+JSxvv
	 HYg1ds5DEOgobbArj3BKytWUdQErvLe3iIimJV6xp48VBAWYjZJMNNdr5ZCOz8xIvhlLd
	 9XeLeC27t+O0SohXa5aXZyjVlRAmCRsLYWgFYYtUvJjjjPQXQZrM6MdfrBhrlA54PC6og
	 WEeEnLeTqD4w351iCmvSmhe1RWIkhVoqbJ2lEF02WADcGIQOTWhHQB3iFSnPFOyW8EUBD
	 +9VSH3INbXLKKy5Cn0JG5zMCtFQCj3kCrvE9gJD8IgMhhlFb9qO1ITI2Wz4XpVN/gqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5jAOtYtUezGV7wH/F/KfODMfDWWB7tmwL4Gg55iXEdc=;
	b=Q1tPrvDGebks+Bxfv0gfrzyL8h1ntsYbhsYp+bxghmWLcTk4vMuLdiceZ04JVGPPMLib
	 KKv6PrkHA3c0SMYppCqpwrlF5bky//voxovjmbq32iTUrsEoEMl6R4/vgtTWE1u39XfyZ
	 ASAuzkd5cTdvCkvXquKXbdeETOARvEB/sRubD6ifoI9AyM3MoPrJTXqKUJoRFeBly245w
	 AhBHE5m+fK3YNHlD7IG1CZJFGNFk9N1JP2/f93Fi3bLZY3k3Y4GTxEgsVZeS11rf4m2rm
	 3Lo1TchCh/MoHjPM7u62DNf3CFGJGXcQ8AZPrhu4Ly90zkEdVD/VDTnw5KjH043l7Hg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374039;
	bh=5jAOtYtUezGV7wH/F/KfODMfDWWB7tmwL4Gg55iXEdc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JZou/stg9ArluDPqxI8NA264EiC9A9c9tR5wz/amuOH6oaK1iiFvRWYncto8bqsqI
	 Q9xyMQjE8nzB56blGGVu8mLzSvTYm5OYeAmVcRHC6mVSmdTV4kF16wwx13RYFnV6T4
	 b6Aab1iyvNTUplUn7DRsbPPiEwLXYtFR6H+2deb4fOAV10t570MxDel08MwU5xhkLE
	 mvfjM42QVUOc0cqnV1R9M4YBKWejmpyTpO5ndg8oTaGp1eZH58cluI7xghmWYROn9O
	 00W30+Z10UcvYfJLFZY3pqGLLYmAI0ORUiNIPVkB9Q/HE6eKUeR6WBLqpDEjs20GUB
	 Mj/Fp6ch0vveg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4008960B14;
	Fri, 30 Oct 2026 15:27:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CECF0D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4D4240211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4tHY24ATizK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6725940530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374012;
 b=lIP3YstOHl1Vssp6E1AnSgt38Acy6e0Y3jdeLtp4mohJqbvSej5XvzGIAM6mB5caDK7T
 NTktv1xoIwMygE+OXfRAv8obAuOHTo5/n/6cX4MA3psv78cXQSPnD6cH7ULLO9WBBeSiv
 KGQyA5vvCLMrL4eQoO3lMdBEv4XFwpHCjB4+xvhzZ+S2jSrg0mkN9fprEkHMuxZPvTMqy
 bMT3ZtA4WMgNTJAq45HZIJaZQxHH+JTIewY/r0ahp+LeZpn5nRJLTX7spRZgc90MDViS+
 xkh+8J+bcz1AHX9NBh4rLDysreQ5CYuYOUo0YPhnlr1ZjgaWB1iGSCSLQudEDF9e8tA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374012;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4PBxz5HpNb60YdQFKbYdWPyF4VChC+P8wz1BmNa/Mo8=;
 b=pdYLfEIHhkkbwWiXSon3zNDIK3G7E4eEohyyr1BD7gT4xUwfgW5dhJTHHu72iowL20ze
 VXVcHROucitI8aPxkbReOMEwp+URv+WKY03BChslpBQLJEvthpioquO+6g2RwoB26+/FX
 J6+AKlBkfSc9wJdWIBJcX4/KOHR24Y20WUmC2nsy+4uh0tgkl91Po02RnrV2qhK84YuJU
 bNN+Dfo/oq3u9CDh6FLwnatBetzHMAhukOLqzVdLsRT4eRxfkGRFod8OjwojB1aW/H5sC
 F0gIHKtv0V0su0gGo8ANaElJsPbh+QNmVa6HbyergWHCvxiuEUx37LjXZGDMWFQax4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q34R54Yi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6725940530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e47347279so567560f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374010; x=1793978810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4PBxz5HpNb60YdQFKbYdWPyF4VChC+P8wz1BmNa/Mo8=;
 b=ydOINZaMcG8gVTFguB2/OOPMkUli5PpPDNTFb6wvpTJ4lruev05NuohOCFovltpI9g
 /nMehOcitCOAboN7Sj0NJcsLMjNCxLScZP+wABSBUePNp7ZWgUUqhpyZclmmqwcytB6S
 P3dk4HVHHb9V8XQWr73WpNZl9g6lwFx/zdxS5YJrCGu56b+9u6BWoOcSbRPF5UldQZ6G
 +UDcpIphEztcI39ku44l5vkSVX/jNo7/5Q+A2qAnCUHkrenMCls+AbCbmjptJKVJqD2A
 hW0iJI1JhUKpPqc3qVvGQFITyReSf2lh6yt7z8lKHaehINu7/eBwas6p28R4sAPDIJrP
 6TZg==
X-Gm-Message-State: AFq9FYJ+a2AiFEUgZWf4fLDgshsNZHxEYIPNC+ZdwL05V30S3p6WT2SI
 sCUwFdT1afGLvDAbu21BSqrEJyX5YzjuOz80bYGgAukrR9fn0EzuQTSWxVnnSr62O9u34x9lEyl
 pRxB9OJU=
X-Gm-Gg: AYBFou0AOQK5MFcNdqttDHsVx3BvxU5J+BaeINzxCRWTbp3p2TbAn490lghzHy71ly3
 MfM8/5g1nAYEQj+FFpKNjRB/5jhxXRj4nx9HqKRQ0o/ju3THNbTNS03KczLpTsSQpR9QTr425gr
 ltn5KLl7ZAdIMnwW5x7yp/EyiMZniBuly56SZ+JE+DE8xsymt+BdnIAzDkQ3I7eyXQXPTWkrfBG
 HRz3SLR8lozXAtEho14C8Yaxd4MEZAFnuvyN5BRp4mP6tyosqPRQLKX8JrlVbDN/sHZbPzDTNhb
 t/B8kUy9//w0UiTB6IeXr8ONaQoO2FZKyHQALM7gA4QQguFUWqb9zXWj9HPGFWfYoznG/eA2st6
 tDw0wLuvzBFJARLGaB4whKmL7Dp1vr5/2ODLzezZjZ/inaPICmANLwrN7KxNE0tmeVoQ/cctrRS
 /kegVSVHn6pUuRnPzgPgOnTPhaFxtWaTb1sHS3BHtNI8SaE0PiwCVNI8x6uOdcWQEhqn9Hxo+Y7
 9WzNX7f68bvB8RPkJfUHUxLNq1qhFSgiAPgUZ6I5qjU5Zw8861nXvuiJ0J2JqvtTn5Sdqk/WyN7
 6WBz+Mrs8GyVFITUv1yfyjLIvz/rtgoQyv938rtwZdszpi//eUvKJripHesNynWQ7m7qIblu
X-Received: by 2002:a05:6000:4b18:b0:48e:6092:deb9 with SMTP id
 ffacd0b85a97d-48e6e2fa4e1mr6112983f8f.14.1793374009968; 
 Fri, 30 Oct 2026 08:26:49 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b77f06sm3816338f8f.21.2026.10.30.08.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:46 +0100
Message-ID: <20261030152648.1906391-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019141801.1653017-1-yegorslists@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/ncftp: fix cross compilation
 detection
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
> ncftp still ships a configure script generated with autoconf 2.13, which
> determines whether it is cross compiling by simply trying to run a
> trivial program built with $CC, instead of looking at --host/--build.
> That heuristic breaks when the build machine is able to execute the
> binaries produced by the cross compiler, which is typically the case
> when building for x86/x86-64 on an x86-64 machine:
> 
>   checking whether the C compiler (...) is a cross-compiler... no
> 
> configure then takes the AC_TRY_RUN path for the remaining tests. Those
> tests link against the target libraries but are executed on the build
> machine, so they fail as soon as more than the bare C library is
> involved. The most visible victim is the curses detection, which links
> the test program against the target libncurses and then runs it:
> 
>   checking for curses library headers... checking for ncurses.h... yes
>   checking for curses.h... yes
>   checking for curses library... no
> 
> With no curses library, ncftpbookmarks is silently dropped from the
> build and installation later fails with:
> 
>   install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory
> 
> Other checks are mis-detected the same way, e.g. the 64-bit integral
> type checks, which end up breaking the build itself:
> 
>   checking how to scan a 64-bit integral type... cannot scan
>   io_get.c:763:96: error: expected ')' before 'PRINTF_LONG_LONG'
> 
> So add a patch making the generated configure script follow what
> autoconf has been doing since 2.50, and consider the build cross
> compilation as soon as --host is given and differs from --build,
> regardless of whether the produced binaries happen to be runnable.
> 
> Regenerating configure instead is not an option: the macros in
> autoconf_local/aclocal.m4 rely on autoconf 2.13 internals (AC_LANG used
> as a value, AC_FD_CC, __oline__, ...) and upstream generates configure
> with a patched autoconf 2.13 (see autoconf_local/acgeneral-2.13.m4.patch
> and acspecific-2.13.m4.patch). A modern autoconf fails with:
> 
>   configure.in:53: error: AC_LANG: unknown language:
> 
> This regression was introduced by commit
> f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to
> version 3.2.9"). Before it, a pre-configure hook regenerated configure
> with autoconf precisely because the bundled script "doesn't detect
> cross-compilation correctly". With 3.2.9 that regeneration started to
> fail, so the hook was dropped, which brought the broken detection back.
> That commit left the host-autoconf dependency behind though, so drop it
> now.
> 
> The issue is present since 2025.05, and in 2025.02.x since 2025.02.1,
> where the 3.2.9 bump was backported as commit
> 6b0e4d82c31ee04e8a6abb48323252a7cd97c177.
> 
> Fixes:
> https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v2 -> v3:
>   - identify the commit that introduced the regression and the affected
>     releases, including 2025.02.x (Thomas)
> 
> Changes v1 -> v2:
>   - explain why configure is patched rather than regenerated (Thomas)
>   - drop the leftover host-autoconf dependency
> 
>  ...cross-compilation-from-host-and-buil.patch | 60 +++++++++++++++++++
>  package/ncftp/ncftp.mk                        |  1 -
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
> 
> diff --git a/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
> new file mode 100644
> index 0000000000..c3ecd61d1f
> --- /dev/null
> +++ b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
> @@ -0,0 +1,60 @@
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Thu, 3 Sep 2026 10:00:00 +0200
> +Subject: [PATCH] configure: detect cross compilation from --host and --build
> +
> +ncftp still ships a configure script generated with autoconf 2.13, which
> +determines whether it is cross compiling by simply trying to run a
> +trivial program built with $CC. That heuristic breaks when the build
> +machine is able to execute the binaries produced by the cross compiler,
> +which is typically the case when building for x86/x86-64 on an x86-64
> +machine: configure then concludes it is not cross compiling and starts
> +using AC_TRY_RUN based tests.
> +
> +Those tests link against the target libraries but are executed on the
> +build machine, so they fail as soon as more than the bare C library is
> +involved. The most visible victim is the curses detection, which links
> +the test program against the target libncurses and then runs it:
> +
> +  checking for curses library headers... checking for ncurses.h... yes
> +  checking for curses.h... yes
> +  checking for curses library... no
> +
> +With no curses library, ncftpbookmarks is silently dropped from the
> +build and installation later fails with:
> +
> +  install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory
> +
> +Follow what autoconf has been doing since 2.50 and consider the build
> +cross compilation as soon as --host is given and differs from --build,
> +regardless of whether the produced binaries happen to be runnable.
> +
> +Note: configure is not regenerated during the build, hence the generated
> +script is patched directly.
> +
> +Upstream: N/A, patching a generated file (upstream has neither a public
> +VCS nor a bug tracker)
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + configure | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index d955e20..2311c73 100755
> +--- a/configure
> ++++ b/configure
> +@@ -845,8 +845,13 @@ int main(void){return(0);}
> + EOF
> + if { (eval echo configure:847: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   ac_cv_prog_cc_works=yes
> ++  # If --host was given and differs from --build, we are cross compiling,
> ++  # even when the build machine happens to be able to run the binaries
> ++  # produced by the cross compiler.
> ++  if test "$host" != NONE && test "$host" != "$build"; then
> ++    ac_cv_prog_cc_cross=yes
> +   # If we can't run a trivial program, we are probably using a cross compiler.
> +-  if (./conftest; exit) 2>/dev/null; then
> ++  elif (./conftest; exit) 2>/dev/null; then
> +     ac_cv_prog_cc_cross=no
> +   else
> +     ac_cv_prog_cc_cross=yes
> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
> index c56fc86848..4075449c53 100644
> --- a/package/ncftp/ncftp.mk
> +++ b/package/ncftp/ncftp.mk
> @@ -11,7 +11,6 @@ NCFTP_TARGET_BINS = ncftp
>  NCFTP_LICENSE = ClArtistic
>  NCFTP_LICENSE_FILES = doc/LICENSE.txt
>  
> -NCFTP_DEPENDENCIES = host-autoconf
>  NCFTP_CONF_OPTS = --disable-ccdv
>  
>  ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
