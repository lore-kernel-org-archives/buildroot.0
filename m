Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1498EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F6483404;
	Thu, 21 Apr 2022 17:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5wReYodbV7G; Thu, 21 Apr 2022 17:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A399E8301F;
	Thu, 21 Apr 2022 17:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 598031BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55770418F9
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MCm5dN3txd8 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC341418A5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:54:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso3920432wml.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qePmORQskxXy0H/dH1l6xCAigY2yzIi/0R+yxuXV4Zs=;
 b=Kkh92qlXN1IFxvo7CXvCaCWEsNbZbrLVAsZA2KPL7k2jyj7dcRD5CEAQfDqgOsj6/d
 gc2HQY6UftYTSKWaZ6SbpQ854omT0rwxYRNBG/qP4qvxrTIUVk3WG2tBU6fTxhvENKT2
 qp/NKsvauKHz3jZ7k/sGhBh0ARWUDko0VzXRzNkR8qr+2S6AYDhS6nF7ewssjEMHG/oI
 VfJXLCfnqE0QuGWey7wJkgm57IDnUmgpEGds3DUsb72amCuJicssAB8z4xKoMAKXrldU
 05E71utsVSB+Q9aD/THMEDKhGV3H68ak3t2XM2/J6vaGP9CpbmvTcwEj2nBESiekpucM
 kcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qePmORQskxXy0H/dH1l6xCAigY2yzIi/0R+yxuXV4Zs=;
 b=dG8G6DPjGOIGolka0YCn4NCm3U3i2Gt46WrE4qEGVn1Yr1GZJC+h6F5pj8UXStL+Aa
 GMmOaCSCmH3mvr0/zY4naWiUZsvo36RFgaszGQhIvj3u/ZEElXvM1p2Y6aHHEj7GpMCA
 L0PSUcyVDQel6FmrkLWbUfk24Tb+YcOo4BvbBB/5B7Ys8bAD5hrTdyXhRhGRsZvnHtPu
 Jeb37yRzA9AawTl96gp2K0ZcljveyQk9DLxKlTDWljpjl5oo1e0AM9QvF02kwSviBW0e
 H9K26D4VRrd5yhHRNIqRNm1snkOLXTdp85wPiCQR3fS43Qi9l+9AvVMvzmBl6Ma0lzrx
 dScg==
X-Gm-Message-State: AOAM532aN6VX5SKYTm5QhgwCX9GSyw1J9hEoBEUwV5N9P4eU7m0Y9OtS
 EkVqOYmK39OmU5wq2KzkmPuPhw==
X-Google-Smtp-Source: ABdhPJw9/xqp1Us8994seA/wYWukmfSkVvXFlB/vZJM97m6osyuVcDjHf/WOGGTs5oNyz65JsUXpSA==
X-Received: by 2002:a05:600c:3d06:b0:38e:d74d:ac4c with SMTP id
 bh6-20020a05600c3d0600b0038ed74dac4cmr512602wmb.42.1650563694842; 
 Thu, 21 Apr 2022 10:54:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056000188400b0020a9ec6e8e3sm3239704wri.55.2022.04.21.10.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:54:54 -0700 (PDT)
Message-ID: <4988200c-3844-33b7-642e-ec5b3a0f4ce0@mind.be>
Date: Thu, 21 Apr 2022 19:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220411162107.8704-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411162107.8704-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: fix
 maybe-uninitialized errors
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
Cc: Min Xu <xuminready@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/04/2022 18:21, Fabrice Fontaine wrote:
> Fix the following build failure:
> 
> local.c: In function 'create_and_bind':
> local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    218 |     return listen_sock;
>        |            ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-fix-maybe-uninitialized-errors.patch | 93 +++++++++++++++++++
>   1 file changed, 93 insertions(+)
>   create mode 100644 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> 
> diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> new file mode 100644
> index 0000000000..5275323e65
> --- /dev/null
> +++ b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> @@ -0,0 +1,93 @@
> +From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 7 Apr 2022 18:27:58 +0200
> +Subject: [PATCH] fix maybe-uninitialized errors
> +
> +Set {listen,server}_sock to -1 when needed as already done in
> +src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
> +avoid the following build failure:
> +
> +local.c: In function 'create_and_bind':
> +local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +  218 |     return listen_sock;
> +      |            ^~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b1097414979367655a27fa6d60]
> +---
> + src/local.c    | 2 +-
> + src/redir.c    | 2 +-
> + src/server.c   | 2 +-
> + src/tunnel.c   | 2 +-
> + src/udprelay.c | 2 +-
> + 5 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/local.c b/src/local.c
> +index b1ab040bb..47d634ce5 100644
> +--- a/src/local.c
> ++++ b/src/local.c
> +@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port)
> + {
> +     struct addrinfo hints;
> +     struct addrinfo *result, *rp;
> +-    int s, listen_sock;
> ++    int s, listen_sock = -1;
> +
> +     memset(&hints, 0, sizeof(struct addrinfo));
> +     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
> +diff --git a/src/redir.c b/src/redir.c
> +index 4a5a489f0..e60bd4870 100644
> +--- a/src/redir.c
> ++++ b/src/redir.c
> +@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port)
> + {
> +     struct addrinfo hints;
> +     struct addrinfo *result, *rp;
> +-    int s, listen_sock;
> ++    int s, listen_sock = -1;
> +
> +     memset(&hints, 0, sizeof(struct addrinfo));
> +     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
> +diff --git a/src/server.c b/src/server.c
> +index e9cdc2619..073e38b22 100644
> +--- a/src/server.c
> ++++ b/src/server.c
> +@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port, int mptcp)
> + {
> +     struct addrinfo hints;
> +     struct addrinfo *result, *rp, *ipv4v6bindall;
> +-    int s, listen_sock;
> ++    int s, listen_sock = -1;
> +
> +     memset(&hints, 0, sizeof(struct addrinfo));
> +     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
> +diff --git a/src/tunnel.c b/src/tunnel.c
> +index e0886bdb9..6641fe62a 100644
> +--- a/src/tunnel.c
> ++++ b/src/tunnel.c
> +@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port)
> + {
> +     struct addrinfo hints;
> +     struct addrinfo *result, *rp;
> +-    int s, listen_sock;
> ++    int s, listen_sock = -1;
> +
> +     memset(&hints, 0, sizeof(struct addrinfo));
> +     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
> +diff --git a/src/udprelay.c b/src/udprelay.c
> +index 23a042497..580ad4bd8 100644
> +--- a/src/udprelay.c
> ++++ b/src/udprelay.c
> +@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char *port)
> + {
> +     struct addrinfo hints;
> +     struct addrinfo *result, *rp, *ipv4v6bindall;
> +-    int s, server_sock;
> ++    int s, server_sock = -1;
> +
> +     memset(&hints, 0, sizeof(struct addrinfo));
> +     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
