Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B118BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6733B60BBC;
	Thu, 10 Mar 2022 21:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMHUInZK1AQt; Thu, 10 Mar 2022 21:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776B360B09;
	Thu, 10 Mar 2022 21:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7CFD1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96A3E84222
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjPdvA6qYkEK for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:25:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364CB841DE
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 21:25:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id dr20so14846388ejc.6
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iK76a8CocrfEiwArK1nV7JEfGn3sKOUf0Sefa/VmmC8=;
 b=M0YuA6LMezTp4UwPrwrUO0LvEDSSwDwHg4PjAe2n+9XfHStz8IYzSM9NHc7UWC3iyD
 7FLout9/RlvLe69kJ1Myb9/qVbIC/ePiu3xmS383gmTV7oLBNyrWi9122LETFoFVXWbo
 XFuqxzzN+YOUXW5mWbmox6XNVX5ETrDrdV14JV1bpvtHxp1OLhAIjedVpRh/wfubuVL6
 OfR+Lem9siHN+/2d9+8ovYZ1spS2DmItJ70Hu2xibyztN7V1v0dkPew5dgH5mjBTkGGS
 kE8v6I1eiOfbq4Ihw6qFy3nB2fY18RjogZdpf7CaxykItd/RzB+I2Zg/IkeYkoIFmoH0
 QgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iK76a8CocrfEiwArK1nV7JEfGn3sKOUf0Sefa/VmmC8=;
 b=nwlhb2PKPHtw4ut/xugn/rvPRoVo38MTf+cmA/1NpQYBrOP2qQD6m6eU0STBE7uDTy
 mhsUziPjJlLdlSGYCnDn8ZbKII8Pau31UNx+emto73Qo9iUQ7leRI6RnBGPEpxzZFi4Y
 t4ncOS2U51GMnEiwEZHGX45OI8w0pWt6e5kUXrbjCYtlUBea7Ny84poKcqf5kv+pS4JV
 fW75pVB2UPV8W7rqBSFjlbQBsegFYGdfU+zSrdX9huo97cjC4+yN1+CBHFLIWUjheMGa
 fox4rwUbBSrRjicCRDx3JR2yCWMQNJZQyi6XCfCRMz6Ijnf/FX9zD42RJRtg258zyuiA
 j2Cw==
X-Gm-Message-State: AOAM5310LGMJWxqXgtkBDD/dKH8j81CjZOST1TCPYgwItr0bavf0qtRG
 vWgFixMpD1984/u+2q7B3HDmzw==
X-Google-Smtp-Source: ABdhPJwQ2a0mF3E1LIy5MI6j6hXP/NBlSMlftQD6R9uuxsUfletyLs5s48ws+aY4fjKkUqb0xusMkA==
X-Received: by 2002:a17:907:9606:b0:6da:68e4:d880 with SMTP id
 gb6-20020a170907960600b006da68e4d880mr5856224ejc.405.1646947512188; 
 Thu, 10 Mar 2022 13:25:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a170906270800b006bbd3efa6b8sm2205655ejc.80.2022.03.10.13.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:25:11 -0800 (PST)
Message-ID: <a730da07-4eec-fa19-e3af-e405ec69d491@mind.be>
Date: Thu, 10 Mar 2022 22:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220215070739.2199760-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215070739.2199760-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-gd: bump to version 2.76
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 08:07, Francois Perrad wrote:
> remove upstreamed patch
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-fix-cross-compilation-with-gdlib.pc.patch | 34 -------------------
>   package/perl-gd/perl-gd.hash                  |  4 +--
>   package/perl-gd/perl-gd.mk                    |  2 +-
>   3 files changed, 3 insertions(+), 37 deletions(-)
>   delete mode 100644 package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
> 
> diff --git a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch b/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
> deleted file mode 100644
> index af053c560..000000000
> --- a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 11dc017e902397c452331425eb6101b3315572fa Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 24 Jan 2021 10:59:31 +0100
> -Subject: [PATCH] Makefile.PL: fix cross-compilation with gdlib.pc
> -
> -Cross-compilation will fail if gdlib.pc does not contain any cflags.
> -Indeed, if cflags is empty, Makefile.PL will use the default value for
> -INC (i.e. -I/usr/include -I/usr/include/gd)
> -
> -It should be noted that gdlib-config has been dropped from gd since
> -version 2.3.0
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: probably not upstreamable]
> ----
> - Makefile.PL | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.PL b/Makefile.PL
> -index 25f2f93..7da3651 100644
> ---- a/Makefile.PL
> -+++ b/Makefile.PL
> -@@ -47,7 +47,7 @@ If you want to try to compile anyway, please rerun this script with the option -
> - END
> - }
> -
> --@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
> -+#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
> - @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
> - @LIBS    = qw(-lgd) unless @LIBS;
> -
> ---
> -2.29.2
> -
> diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
> index 780b1d1e2..97f1da821 100644
> --- a/package/perl-gd/perl-gd.hash
> +++ b/package/perl-gd/perl-gd.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  c2bf1ca56d15e33d2432e4d8ba5aeadf  GD-2.73.tar.gz
> -sha256  491c9e73238522e2987e66725a20935f4268a3864202ecbaf4659a1691ba322b  GD-2.73.tar.gz
> +md5  fb4bacab10ed4f28d52c2aabdaf866bb  GD-2.76.tar.gz
> +sha256  693d9e3d709e9188a682cb9090a77b70aac12a04e84128677577b94e4331775b  GD-2.76.tar.gz
>   
>   # computed by scancpan
>   sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
> diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
> index b402dfff4..9787cc12f 100644
> --- a/package/perl-gd/perl-gd.mk
> +++ b/package/perl-gd/perl-gd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_GD_VERSION = 2.73
> +PERL_GD_VERSION = 2.76
>   PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
>   PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
>   PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
