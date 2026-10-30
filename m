Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCC606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S6YMbb4y
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7642681B3E;
	Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxMz1rJGRluI; Fri, 30 Oct 2026 15:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D84E81B9D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374197;
	b=AfYmJTjwK7LR1rLoON7XQQsmSZpFW45JAlYlCeH0UGlLq32rQUJi/YIa/xH35BopvKyc
	 u01gGPjJmZrsibC2I1KiQRcfYJtTO5lE7q7snkqzG6NT5QzhRWOOPa2QFvi+Gd2i63hXx
	 4M6jKBE7nI1PAOqO7fKOMrv9pSP5OpFLaogR/TJoUCiqbkMTJTcEqH/28MVsH9eGsmj+m
	 +t9x2ck0TqukoKAhByt6voFidTL+P0Sk+asGr4C1/n+Yv6WHaCBvCLuETwb1YWQDXFlG3
	 33CUztSGZRFviSnGc7XRMPqEMXjmu92gROGjcC9gUa59MXsI8AI/NgcAZvckcyer1bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s6Fq4iCAH5EFC+y9bL6n6ItmRfPLRdYLwMI6Wf+Grrk=;
	b=WcGLjzzethLxBnIC2X7Oz0tJ3V343RzHtFTK8SGQlRtjwlK1r+S+R4G/M6l6GrDCUcsw
	 orXEecA9JFtZDr4Zm8wpwu/D6TyLfkS/VnqI4ji/rY1rPOoEK9RyWJ3z0+CZJ4yKdQmf9
	 eZkcWtwTSDp5eyIFNREftIreh9Q7Se7XM4WFjz7dOjZAqimM4XtmVC+LpDwmKwtFKW5Bh
	 HMSXjnNGBy+ueuXMv4S6QFNPwqNhtOK+kFdEw0ioHKx12emAeojXR/WNAVI6I/068vSC+
	 TYTb95u85REnmnk94q3RPVBas9qQPE4APj/tKNY62YMIcDdC+CscPfg0WNdSQnxdi9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374197;
	bh=s6Fq4iCAH5EFC+y9bL6n6ItmRfPLRdYLwMI6Wf+Grrk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S6YMbb4ymkUuEMpuC8VHe9IKYQVx7n+cio2YjeS6grELiLFBflOGmUB5UVJ4QmRMS
	 ++07Ij/lxzM2DozsHxxcmFhOvlzXEG7lYRF0UDYCzkAhDK3LCdEq840eBDntBX/3OT
	 MBWFpY5Z3Pd5T1W3C5nPSVJBWz0gZ5V8QfSEUca+n5yaYtTTsA4gvRaAAV+f32qOWe
	 C4f6bwdDJ9rtGr5tTCPybDtJ8+UPAjDNKK8ak6ebIJS28etYmSM44xObaPfmBN4l4k
	 OGCj5TNtJXS1aLyHwf7iWO+o+8QLbcjlmfTTDvcHRcFGtyMxTF9vcrrDmWHwcdTU5y
	 gK3gcflMEzG1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D84E81B9D;
	Fri, 30 Oct 2026 15:29:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A73D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 287CF60B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD8C0Xx2mNXi for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E2BA360B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374170;
 b=ke7QmpPVcbPcTXgcb0Ncd1xP43txK3UWWdB6KeebjigTr+zmo+m1cRNpFnLG6aoWAc47
 jbgIBqZ1qSmwRQHmLVIK/MVhoa/0pOrjrWTL/68e4WoilOzrvTU+7j60pAGDokfL0oOBO
 12MR86jQ6skxQHYnwipHTnfL/YdQe9Yx4B01z27ImRINmEWGMetrDBoEe2Mgjfamd8iir
 bC/0OZ4GK2LXqm2WHsMCcpfzPNok9m2m6M1093pGLDmJ/8BBhSHrac+o57xmeEOZCJLko
 cMR6FtcOvU+nXPnptQ8lsC+dvGiLwAJqG0298bkuXG0DSMj6mYrn7ONPueSwLvj0Aaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374170;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OLt0DKnu9zPmKBRtCZJ5WC8Q+eZl3ydn4wsdyFxxZ0Q=;
 b=lKAKsafmu4S2/uM+eGJClUQyp0R3aiUFGspr0QE4tQyLZVrvyXzcyVz7DXIG9ApDFnca
 5Y9c0T++4+k7TUl597MX79s+5Zya/wDhm8oNdvF5sVx/bfNok1QAOM9eW/zxT+991CcgN
 Q0gcZh3karQuZEQvJiQFMSAG2IjsswsOiWNGaopykM8v9p4BGqKmC6I/s8GdPi9LWDIcI
 p/DPA9qMdg5u9/yJn7EQAaDeU7ja7xhVA4pyqBVpjuac8+xVXkdslZk0ooPQgtJXibCqL
 HtKUdw6wt95VTVSMwnkQSBnJVuli2V6mQo/QMF7mTEmKJShwvqZ9nrArSR5ZsfA9AEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BrdEHs51; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2BA360B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so478984f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374168; x=1793978968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OLt0DKnu9zPmKBRtCZJ5WC8Q+eZl3ydn4wsdyFxxZ0Q=;
 b=yB8FPTW4x3ufGfvXQ8yeopH0cvqTTFk0H0PGwau94qnCiikDF1fJc/IkzMPulkinks
 B1H1o5v5wRgp79rhb3eJNyoIM7D7jYoW8+gGjdpVy0uSqjpzd8aq6zkeQsEUGH/0WTGn
 7Ws+YtgugeIoE7rBOXcaY2pJ9IKbF9uEgM91Zh4FrrM1iuRliDV+FZyOyMUcm9Ar6XQZ
 wMulopFmOVs/hKMAB8/cJk3Rz4utDOYaROQhpFcYMiQRJBz5Ez0oTWAp4AtsxMawKAuq
 aT9x07MiwQ/DibfK0TxKGH1P2UtJcib9us48dUDD+FOZVxs/0dy3iGYpD8Nj4rYY2HBC
 ksOw==
X-Gm-Message-State: AFq9FYLkrySNCDWdb4THtZB5AsX14Kg2BgdhcJqXw5sPIO/853InkqU9
 RJBp1X/LdxOIp+EZtOY+iV/4ObAB7gBNBnxmSrBs4x2KnBopYSM1seGSRTceNEF5x4Qm/XxHYcC
 N3mOb6sY=
X-Gm-Gg: AYBFou0DarSJe2Sn5uzZhzbfsafJYsfdxz/rR1hfT1FWBMkynLFKameX4knBq7fAlSF
 Hzij71DtCiQOBAoKDHma8JhpuhhukZ5VhgKK/l510Ng5I/r4t5JBxvPrL+htFP48gHiqto0ysOQ
 hSYgooks2OQQ7hj1lDyhhKV2/Df1VMp6+k6mfTj3MBrxl75y1VCXkvxJgdVbZWiIumfTv+XrD4/
 j5aHABS0Fuc0zONefd8m6RorAK5MThTYQopBrQKkNmUXACFUcbHDXgX81X6MhikmEMzeF3eOWza
 pkvvJtZO/fyVEnAK1T2T1RYJkhT4LOMudGO2799+mUMubqN6klnV+BtSdAhO5hQC8t7T6c1T5CT
 X/EvShTYzbSz1tJGUXqQucmwEMyRzEb+kqImT892BWGib7Xev3ZsOTJdCN6x/osAYA0GLI5BwVo
 07kmq0Lwk3l/a4m+V9emSuRFRqy34Rd9yxu6v6O4XIdzv59UYN3TrrpyimjnEWXe7kNBxii1jaR
 DxcIyEN/EZTrMvz0BEMde/PAUA9DcbxKTOF43rgC/MauqG2T3pPOYnU6UjGqt6r4Ss6XqM0R1Bs
 rPNTAAcMGv9MTytRfvLSDY38vKDiDsw3FdUaxVIqqghEWo5Dm5fQ1OCgxC4VCWLChQSHXJdR
X-Received: by 2002:a05:6000:310f:b0:488:83f7:6352 with SMTP id
 ffacd0b85a97d-48e6e2c33admr6088425f8f.4.1793374168038; 
 Fri, 30 Oct 2026 08:29:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c6e9sm3729707f8f.43.2026.10.30.08.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:27 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:25 +0100
Message-ID: <20261030152927.1907919-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024075628.3205436-2-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/openocd: fix static build with
 jimtcl
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
> Since jimtcl 0.83, jimtcl enables ssl support in the aio extension and
> the zlib extension when openssl and zlib are found. With
> BR2_STATIC_LIBS, openocd then fails to link, as it only uses -ljim to
> link against libjim.a:
> 
>   jim-aio.c:(.text+0x16f4): undefined reference to `SSL_set_fd'
>   [...]
>   jim-zlib.c:(.text+0x11c): undefined reference to `deflateInit2_'
> 
> Backport an upstream commit making openocd use pkg-config to find
> jimtcl, which adds the libraries from Libs.private when linking
> statically. This requires the jimtcl.pc file installed by the previous
> commit.
> 
> This issue has been present since commit 283821fc31c4 ("package/jimtcl:
> bump to version 0.83"), as jimtcl 0.83 made its optional features
> enabled by default. It therefore affects 2025.11 and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6436c7c81cda5eeb8331f18d40f33f4bf1dadd79
> 
> Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...-configure-Use-pkg-config-for-jimtcl.patch | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch
> 
> diff --git a/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch b/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch
> new file mode 100644
> index 0000000000..65f0f9424b
> --- /dev/null
> +++ b/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch
> @@ -0,0 +1,83 @@
> +From a8a0b4c50768fb8bbcbd1683d020a31ad2bb0cad Mon Sep 17 00:00:00 2001
> +From: Marc Schink <dev@zapb.de>
> +Date: Tue, 2 Jul 2024 17:14:22 +0200
> +Subject: [PATCH] configure: Use pkg-config for jimtcl
> +
> +The jimtcl project supports pkg-config, use it for a simpler
> +configuration of compiler and linker flags and to enforce the minimum
> +required package version.
> +
> +Since the jimtcl pkg-config file is not available on all systems, use
> +AC_CHECK_HEADER() as fallback.
> +
> +Change-Id: I6fdcc818a8fdd205a126b0a46356434dbe890226
> +Upstream: https://github.com/openocd-org/openocd/commit/a8a0b4c50768fb8bbcbd1683d020a31ad2bb0cad
> +Signed-off-by: Marc Schink <dev@zapb.de>
> +Reviewed-on: https://review.openocd.org/c/openocd/+/8383
> +Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
> +Tested-by: jenkins
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + Makefile.am     |  2 ++
> + configure.ac    | 10 ++++++++++
> + src/Makefile.am |  4 ++++
> + 3 files changed, 16 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 647b571cfa..2230e628f8 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -48,6 +48,8 @@ AM_CPPFLAGS = $(HOST_CPPFLAGS)\
> + if INTERNAL_JIMTCL
> + AM_CPPFLAGS += -I$(top_srcdir)/jimtcl \
> + 			   -I$(top_builddir)/jimtcl
> ++else
> ++AM_CPPFLAGS += $(JIMTCL_CFLAGS)
> + endif
> + EXTRA_DIST += \
> + 	BUGS \
> +diff --git a/configure.ac b/configure.ac
> +index becc531b0d..b7aed245e6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -594,6 +594,15 @@ AS_IF([test "x$use_internal_jimtcl" = "xyes"], [
> +   ], [
> +     AC_MSG_ERROR([jimtcl not found, run git submodule init and git submodule update.])
> +   ])
> ++], [
> ++  PKG_CHECK_MODULES([JIMTCL], [jimtcl >= 0.79], [
> ++      have_jimtcl_pkg_config=yes
> ++    ], [
> ++      have_jimtcl_pkg_config=no
> ++      AC_CHECK_HEADER([jim.h], [], [
> ++        AC_MSG_ERROR([jimtcl is required but not found via pkg-config and system includes])
> ++      ])
> ++  ])
> + ])
> + 
> + AS_IF([test "x$build_remote_bitbang" = "xyes"], [
> +@@ -781,6 +790,7 @@ AM_CONDITIONAL([DMEM], [test "x$build_dmem" = "xyes"])
> + AM_CONDITIONAL([HAVE_CAPSTONE], [test "x$enable_capstone" != "xno"])
> + 
> + AM_CONDITIONAL([INTERNAL_JIMTCL], [test "x$use_internal_jimtcl" = "xyes"])
> ++AM_CONDITIONAL([HAVE_JIMTCL_PKG_CONFIG], [test "x$have_jimtcl_pkg_config" = "xyes"])
> + AM_CONDITIONAL([INTERNAL_LIBJAYLINK], [test "x$use_internal_libjaylink" = "xyes"])
> + 
> + # Look for environ alternatives.  Possibility #1: is environ in unistd.h or stdlib.h?
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 6d79cd6311..4d1c1a2509 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -17,8 +17,12 @@ bin_PROGRAMS += %D%/openocd
> + if INTERNAL_JIMTCL
> + %C%_openocd_LDADD += $(top_builddir)/jimtcl/libjim.a
> + else
> ++if HAVE_JIMTCL_PKG_CONFIG
> ++%C%_openocd_LDADD += $(JIMTCL_LIBS)
> ++else
> + %C%_openocd_LDADD += -ljim
> + endif
> ++endif
> + 
> + %C%_libopenocd_la_CPPFLAGS =
> + 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
