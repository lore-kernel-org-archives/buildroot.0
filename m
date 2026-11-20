Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643A606A6BC
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BgLuK05h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=faMVwLUP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D6C818BE;
	Fri, 20 Nov 2026 22:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BMUNA1_o2RZ; Fri, 20 Nov 2026 22:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EEBF4818A1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795212467;
	b=lgYPJoUNgb8O44A7+8IcM36El94HTyUyQzhtRyFgpinzeF/O41rdT9vvs/CokUQ+Txwi
	 rtP2SkBA1BesOe7i7Rmydco8k3M+3kbzzorgItP7L7Pt+JfV/SJ3vpgIn09XynVh0k8Sn
	 f/3heRSi15+YdbuvmZqdO9JVyNdZEIssbLqH8PgdhkPRxpcPEOGBbXFQZiYb2gJvNgZfA
	 jd/4ypX4kS5M2elloo7xk/mmGdH/MZXOZ3x9fT9F2RCYUFUVsxatWb3Eh1sUxoE/VOvsQ
	 YSNKcP3m4X1ShcXICnuYWcdNkwnbGoco3eT0FlK4+tteZ1VNKxm7ps3zuov4iEESTow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795212467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yERlTpMJAWHfZ390u7I5gE/9X7MXr4XX1Mj+EGAqTv4=;
	b=AZqsO+zFatvd8VyPO9ahJz/Ewgwbs1/FgxknEO2fqgKoKl6NR9rn24zckvWSSNO87uKJ
	 PwII09r5PnbjY+hCNXIWSVHnVwH4++Vhwu8M5K/XJT7GLnBp4+Lt1OX7uKH3cfIvRcb1I
	 dHKZIWkck7oIaEPGI6iHMxmmRibBzoB3P6F/eswsQW76CvSmMAtAwgz6hsOzL6B3KkAay
	 Ptxu5BWBACm6ueMtgxe0E76PZmP+BrKn+xyMkxufz90/uSxaATL9ATb5N7+tS7h+2fRLI
	 nA4Fe1x9SUqgKTTnDnNnsSXsX7H9pbhKZViOHjRpxMR2CtYyMLIXlfAFQDqt9kLnHiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795212467;
	bh=yERlTpMJAWHfZ390u7I5gE/9X7MXr4XX1Mj+EGAqTv4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgLuK05huSwTbl1OXO0umr+Z5YLkLFXHxsYz3W9sfX4S0CGEyTX9zAhUWhsW2PSVs
	 zAPz/HI2O+lUulB8bjeZD1raK5vK9oRxu8ZnzXIvT3mMcVkO8jUjYEw864dmuCaCc4
	 altnM0/9c1EFSOOxoOeb2BsZI9RAxC4fP1oeinDJRD3nT4X72N51lnz2h3YfbhmLbq
	 Ft4zAJGCSXQrHZqYR+XYMZ1MGKVWj6rlT/VatmdAeG6OzwNGBs2ct2o/K41T1HpA7j
	 FSlJUD7fvcs5g9qdLHswY0LWb1Ae/HFhq8ZEvuBygbL5QQko6vDD2Krrag8QBZgh0Y
	 VJ86siUCmMT8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBF4818A1;
	Fri, 20 Nov 2026 22:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2409C1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FA3D606C4
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4doiy50DnjuX for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 22:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3953660698
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=faMVwLUP
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3953660698
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:07:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so11123115e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 14:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795212462; x=1795817262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Sedrj1PQ9jlfM/IV5Q/X9nDnVYxXp03RHLaLl/rYT6A=;
 b=faMVwLUPmNXBC6LR5cio9IsT6+9rmP8dq4jJ1mVzzvVwAPJnAVyd9tlNIasE1I3rcc
 cUsSyIzVgGIvMTmw02TTaqQYABvKATxlud3wGWJCmL+jD8/07qBbjbsS1EehM7SnWxoQ
 La0prT/CRBQumiVmQmngIAQg9s6DjJTWPdIpvBB6uGlRqGwD6vuK2onf3OIabgN31/L1
 a2RQP/0vMXLSA+EcUGkdTv5nrk/KQFV1PK11MrSwWhkN76e2tdrWbUrUe5ci8Aci7AwW
 qhuwaIDU+gJgNyioCXNIuF9HgD02eId1pFRomZJyUf+Rng30EEZFyBi5QyYeq4/7qWwE
 MJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795212462; x=1795817262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Sedrj1PQ9jlfM/IV5Q/X9nDnVYxXp03RHLaLl/rYT6A=;
 b=vBOLNzu3mWNo9a+ST8E7+elrMbyifNDm1hlUms7H6aHZnUtFio0KV95GMhJUxdhGxo
 CYh81pRPpe2BzSIOyQT3ztmNfzVngw/rnX4j1B9w0T5aeDryPfqt3XnMbmOa/nFsZFFa
 SXGKUtECIyyCWt7pyt480ttduAefHq1u1apzWM3oc1rlfcTVkQQBiRETOTB+jC2QTRgu
 8CEaTxsaeZ1uY3BYckYhGe+uDSSj4SmHDv1TZU/zGWIcMNFvu1JseUaIJfmtKdxRThpg
 TEoU//QAD1PEOa6v8Rt1dK5h1HI4Cx0liy+CWMssxkNmTpnWIPSLmlpY/4x8cBEAC1nO
 L2Qg==
X-Gm-Message-State: APuU4Z/0TMPKOn5/jYCxBAxShi8mhryrIlcVPP0Q1zna6rkkWTJ3fdUw
 w91KjzHnhJ/3+wwTLvHBwWkCyXcegw4N9mzw1qRZ91gNiZDXD/gPpH66Iv4k6w==
X-Gm-Gg: AYBFou0zYFRCmUgxP0WO53E/DnMTnoCMUY2gCWP7TBYeDC3s8KmT6iDpDfsAOinUKdR
 KyrmUc6k0Hun6QJtosLq/S8uE86DQRIASWOh3WamBFUf1ohP1p50W/o/2E0u1jDoqfNaX+s+6l+
 2/+jvek4t4NGT7Gw8cUx3iPnTXUWgAt1pFCYay2ZP3s7vkyNQR6Ujgluwsby+4WCVsvSL+Eac1h
 ATLziSoVlmNrjUWNyzm4y+Mre5HbEdril62Qy4D6fOUa9qEH+wVbLISi6UF6jYQfWlW8aQ1n7kF
 Tb/ozolorA5Fs73qkRZaxVx6ChORZLRv29ecu7iGI0ajrvJk8EH9htOEM+WsNXGGS1RnaG+mXVK
 SxJhuyNZQbRO9pd1SEorOah3O+5zVSy9LtfLuzmTwHP9JnGSRp09HPaKV0wpOjHXQdZEH+Lrdqg
 UdS9ZB14gkGcHr+zy2YXR369P0gE0m8rAJkYF8Wd9UC33n3xtQe16dy+XWJZo505o2Q1YHTuurw
 UnKyT0ALVhE9AiDahlwc9KvViRZsc5+W+R+u2Ac294LCMFp8oZdfJ8c9OCXu7Tps9bRp9/fIVGE
 bBFj1O2QqXTPqWm2Z7q2umNG1/7Y6/Rj54NNtxuvJlsGwUQ4+XT81xI204+/0XGLwbY+6HRa
X-Received: by 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id
 5b1f17b1804b1-4bb889323a1mr99068465e9.25.1795212461854; 
 Fri, 20 Nov 2026 14:07:41 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm138261525e9.6.2026.11.20.14.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 14:07:41 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 23:07:38 +0100
Message-ID: <20261120220739.629147-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108201347.3052372-1-yegorslists@googlemail.com>
References: <20261108201347.3052372-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/glibmm: bump to version 2.90.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/26 21:13, Yegor Yefremov wrote:
> Since GLib 2.89.2, GEmblem and GDBusActionGroup are final types
> (G_DECLARE_FINAL_TYPE), so glibmm 2.76.0 fails to build with the
> current libglib2 2.90.1:
>
>   ../untracked/gio/giomm/dbusactiongroup.h:32:7: error: conflicting declaration 'using GDBusActionGroupClass = struct _GDBusActionGroupClass'
>   ../untracked/gio/giomm/emblem.h:31:7: error: conflicting declaration 'using GEmblemClass = struct _GEmblemClass'
>
> This is fixed upstream by commit 00508a702de1 ("Gio: Emblem and
> DBus::ActionGroup: Don't derive gtkmm__Gxxx types"), first released
> in glibmm 2.90.0, which requires glib >= 2.89.4. The API of the
> glibmm-2.68 series is backward compatible, so just bump the package.
>
> The license files were reformatted and the FSF address replaced by a
> URL, without any change to the license text.
>
> https://download.gnome.org/sources/glibmm/2.90/glibmm-2.90.0.news
>
> This issue has been present since commit fabeb8ac213d
> ("package/libglib2: bump to version 2.90.1"), which pulled in the
> final types. It is not part of any release yet.
>
> Fixes:
> https://autobuild.buildroot.org/results/7eca302646c5469921b1699d579198ec95cf9276
>
> Fixes: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a ("package/libglib2: bump to version 2.90.1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

> ---
>  package/glibmm/glibmm.hash | 8 ++++----
>  package/glibmm/glibmm.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
> index ee50ccdb01..12e821d8ab 100644
> --- a/package/glibmm/glibmm.hash
> +++ b/package/glibmm/glibmm.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
> -sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
> +# From https://download.gnome.org/sources/glibmm/2.90/glibmm-2.90.0.sha256sum
> +sha256  e2efa45643f16b9fea2d6299f2f403d672eaeacddf0ff7f8094e1af9b0f5980b  glibmm-2.90.0.tar.xz
>  # License files, locally calculated
> -sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
> -sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> +sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
> +sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING.tools
> diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
> index da95329a3d..35eb3f2645 100644
> --- a/package/glibmm/glibmm.mk
> +++ b/package/glibmm/glibmm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLIBMM_VERSION_MAJOR = 2.76
> +GLIBMM_VERSION_MAJOR = 2.90
>  GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
>  GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GLIBMM_LICENSE_FILES = COPYING COPYING.tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
