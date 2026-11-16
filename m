Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB3606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L46aHmlV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1294073B;
	Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxVLMyOuUBu6; Mon, 16 Nov 2026 15:39:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B11D40768
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843567;
	b=iNYwbeqPYrwu0YFxn1oJfPsSmAmDnskhzIl4T8OABOtl9WPLCWQNvzjPDHMwzwAd0FFE
	 WeDb3vnzjUFyxiZPYWro0fNRQozfnag5u+PUJHpv9Ebjrl606bmyUDKfRZOSiRelWan3l
	 IYU+TbjP7ij0nF20uMYsPYt3t4i63Jg29MxY3eSpWcZk5EsOIT4yAHjY9+jZGCDW0NkRH
	 40xOFcN9iCpJSng1jtPktcjLJo9sy61zGvLC5tTA1Kr5G67+c60+UjmQKF4njas8s/GBo
	 46mfxO0s91ENw1XyJWCh8su4yLhBfDl9OawmAKITPWyaDWXylv180+y1UdAlsm8dKzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xPn1kinPl1dAs8zv0lWjhk/P1fQb5deWCUNsj1O0I4g=;
	b=ipRxG7MOBv/7zF8s0km/BV00Am2Pt84NblHurF4A1WWDdycWMDF896LgTeYCtm4Hluih
	 Wr7qLJb1h+KDMKa1ZXX/EXvug+x5dZ8P+0mk9vXP0eHsv5uFWk3OoYB3XZmqjoqoDFvWv
	 TQIfFJVku1UALHZ7a/PbHkIR4XWP2f63aNV2CI6OY6I4lc7HabKL7ZIT5PAuAzqH9GpWh
	 sc5ODhb1ZQZnY7oRhhoAQWKz9SOjWTAbtbzLofoUkySwRGuXFkiYvDpYakPbT1k9kGf6w
	 c6/3Hond2hN90t5C+q61o6NUlhFPRJQH5kd6wkXAr76qYHhBNYd6IrF9g0qepXU50NA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843567;
	bh=xPn1kinPl1dAs8zv0lWjhk/P1fQb5deWCUNsj1O0I4g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L46aHmlVrvqtGtxBX8kjsrYxJiNujPNQ7JPEcv3Iarq2UfvRKhYDH45GXo9xZVkkd
	 7mGQVI+Cyi+sIzGFBfQam/AYVDNO2g7Yz8uvty0mXEz6JOKYpAiJ97Ywjp7Ue6Z/9W
	 aimAxsTFAVAmZEGS5hGi9hSu7tjOp037pG0qhFqNiWbdnE7tcr6gf91mOR8a9W+ijr
	 2/6KoFFUQlh6/RCa2ofy/o2FWNhKErTOOvq6ar/xve2Engi1iprcNCUn3rVtPWsfDz
	 MUKk5BCedgsxJpSwes8ktoc2JN7Z9bFySbQxqsEJPgr9xUfTjGu5oU7FQ44uUtXiLi
	 NTlg8bhf7enIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B11D40768;
	Mon, 16 Nov 2026 15:39:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4392109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94D9F60828
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcZznKT_XhRV for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8EF76081C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8EF76081C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso37828615e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843562; x=1795448362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8M8hjBz/0mixEAcd4xnCtpoUWCCeziPsBtJrRmuKzmQ=;
 b=aZaiykxeVrrQmPpUSVAdqrbIeB6J2IlIsF/0asNwllVS8BLMjeX69oX90xB4IiZ8dx
 G/FiCY547TxcQZ32la04IxV9NB/BgtC2CRaUKVNAAETCa/Y7d3HEqUwYjJAAjIZXBAOb
 CDRr+3i+WbfuDAIzGwYSQ4tpFZ9ZbUTCx5S4Sypy396bgCD85LgPwduF6PO4v1zkBSiP
 A5HQquQp2Vra2t622fTPHd/Q70u6TFAEoFYQen22JcbKKtChkrCOen2a9gB1/v/YgDdP
 BvQK9ZUpagMlLrEmwQZf7HfJQ0Xnh1b5ZpOIoR3mW3vXBAEAOZsc3UDz1D7JtYO/bcWK
 KTAQ==
X-Gm-Message-State: APuU4Z+MiAm4FpbpenZPxq9HDSiqsI5X1T3bzBPwzzQDIyG1QmzJUxm/
 57+mRH6yJQrocaz66vy9uhQy84KoifEr6/FLnuvSIxffKiD5C72mmnA6mTtYceBKfVeWXwN0joT
 icjU8n3s=
X-Gm-Gg: AYBFou36jdVh2sUZwGBRoOan/Ysx659pX9XwPvqLFPB9ENXdnV0iSc35odpD2Kbr8NA
 QCJCl+uGHyq32cdzBp4Bxq97rFD2fI8viSipucLa0Y0TtrubxlheMY7ycw3tmst5OkmkDruhJPs
 9bmAWkpyD+rHCZtpfoKBmeMsxnfLr9zJ2nTQEczhb0Y/MJR6l+ZKAWpcU4hwiukG4qPRzjnL+G3
 8bAOQ5+9sSDL2picf3kXptfif7qPw5eLdMocoywYcGIWjmiYzaMUI377wngLxiYduIiC8C3Cdv5
 QZsF4q1PgW6P2u8Pw2Cxsju4Pc9tV8lp/2teZfCN8N79JcdaNQnJdjMx4f4gjE9cIwkLxXU7fRL
 I8mWHYlrcwl3K5VPYmtIvDIbTlxlh0/glfGbfO6/L+4eUzT97e3rHF4HJ6j9AZZCYJxfgPe6zA1
 frT2DaJGbgarWUZCW4x5ysYRjTI43P1lSISj/fnQNslucfgp7sW6n74dwBtG1VoTV8SuLu5MDSn
 aazseShBXyZq8uRSoqtPWNujdE/QV09rNciIehTVYPB6f9VZfNCXejchxn4h2dakRWVatbduHu4
 gk+AwrDvC9GtOAMkfZxyHUmI9kr1UUI=
X-Received: by 2002:a05:600c:83ca:b0:4a2:1612:637a with SMTP id
 5b1f17b1804b1-4bb55a4e680mr232521325e9.16.1794843562486; 
 Mon, 16 Nov 2026 07:39:22 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb62d5ec30sm318733855e9.15.2026.11.16.07.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:22 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:19 +0100
Message-ID: <20261116153921.725359-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101191738.2091630-3-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/ffmpeg: remove patch 0004
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
> Buildroot commit f30bd1eb69c44793485e9f013249d020e3e19fc3 added patch
> 0004 to "add -latomic to pkg-config files".
> 
> A patch addressing the same problem was committed to ffmpeg 5.1 several
> months later:
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/2f0a214a6202516b4dda2bb22b6b3ac20e465d6d
> 
> so we can remove patch 0004.
> 
> Buildroot commit fa36a6375dbeae131c596070570cec66c7bd2456 bumped the
> package from 4.4.4 to 6.1.1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series until this point passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/499900ce5babc40628f021d0a39fe60c1221089f
> 
>  .checkpackageignore                           |  1 -
>  ...igure-add-extralibs-to-extralibs_xxx.patch | 47 -------------------
>  2 files changed, 48 deletions(-)
>  delete mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index a8c1baacbd..cd21cce1f8 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -322,7 +322,6 @@ package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch li
>  package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.Upstream
>  package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
>  package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
> -package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
>  package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
>  package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
>  package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
> diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> deleted file mode 100644
> index 050b34fd89..0000000000
> --- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 0c288853630b7b4e004774c39945d4a804afcfa8 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 6 Aug 2021 09:17:20 +0200
> -Subject: [PATCH] configure: add extralibs to extralibs_xxx
> -
> -Add extralibs to extralibs_xxx (e.g. extralibs_avformat) to allow
> -applications such as motion to retrieve ffmpeg dependencies such as
> --latomic through pkg-config
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not upstreamable]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -[rebased for 6.0]
> ----
> - configure | 18 +++++++++---------
> - 1 file changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 0bb3a7cf2b..3bda99e415 100755
> ---- a/configure
> -+++ b/configure
> -@@ -7986,14 +7986,14 @@
> - source_path=${source_path}
> - LIBPREF=${LIBPREF}
> - LIBSUF=${LIBSUF}
> --extralibs_avutil="$avutil_extralibs"
> --extralibs_avcodec="$avcodec_extralibs"
> --extralibs_avformat="$avformat_extralibs"
> --extralibs_avdevice="$avdevice_extralibs"
> --extralibs_avfilter="$avfilter_extralibs"
> --extralibs_postproc="$postproc_extralibs"
> --extralibs_swscale="$swscale_extralibs"
> --extralibs_swresample="$swresample_extralibs"
> -+extralibs_avutil="$avutil_extralibs $extralibs"
> -+extralibs_avcodec="$avcodec_extralibs $extralibs"
> -+extralibs_avformat="$avformat_extralibs $extralibs"
> -+extralibs_avdevice="$avdevice_extralibs $extralibs"
> -+extralibs_avfilter="$avfilter_extralibs $extralibs"
> -+extralibs_postproc="$postproc_extralibs $extralibs"
> -+extralibs_swscale="$swscale_extralibs $extralibs"
> -+extralibs_swresample="$swresample_extralibs $extralibs"
> - EOF
> - 
> - for lib in $LIBRARY_LIST; do
> --- 
> -2.30.2
> -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
