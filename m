Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B974BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 754E64146F;
	Sat, 12 Mar 2022 17:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_lfR5Ac7AzM; Sat, 12 Mar 2022 17:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 814D2410E5;
	Sat, 12 Mar 2022 17:02:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00C351BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F130260E5A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN36cJXX59-7 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E332460899
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:02:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bi12so25444677ejb.3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S8HP3xRCkFR2gLLgjsXW3UN14HKn0Um+SIPxE/kV77g=;
 b=SqCNOfe7zm2HJid9wX/TY1BYBTQxxqMYwIPqk0lnh/bxOA40uYQlgSb35qqSZQwGb+
 SJ3XPASjF89dtcRmQJK3Uhe22P2Xrnw7lXad7gR9pQ8bBpoYIX3/1p1Z4pjGfMsZ9UOP
 cha9V9aGOGUxmqeoG89SwxwpAJtYnTAuk9eIiw/Qu58J7iuYXLz5LdhXzNrRyOSfn9ej
 kBNZYtlh7fP2pPgYKf3M/iO5jpFRwU4E5XSfupJM+XwO78WBNltLJ5Ro5Z/Hd7OP+jFq
 cVl35XZ/jRsLTki9fw105gL9l5hqIr7U5Fbw6zUAbHrSvQw3qWgJWFTNks35w8ljoFUi
 9Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S8HP3xRCkFR2gLLgjsXW3UN14HKn0Um+SIPxE/kV77g=;
 b=aTdbJ83KvlO1a2qqbTOdHvWTCwC/aL987Ur7mlMswls3RHIptp6l/cCts6+4wWDdRD
 JTWauAiaUxynbJe36d82jvBpz3fwsAh92THfK/IDjYAKSQEy3kl6my1gXsQ561wY1ABr
 f1V0GZSqO9aiOzwgo3/VOrZ+Glytcuf3/KXmrF2FjVSoAoZyhuziVE55q5PRU1WrFPRR
 JR38lwuPycRdGKNHsp7X03S8qa2mReP7YlFFIIfNFAfFldKunnzXZaII2qvdEZOCIB1/
 tHHbFO8V2EMzGA5bZByKTltjjMIE3IbeooFKEhO+II4rTLEW5mXhJYgZjrMXpC6q7TgK
 uiZA==
X-Gm-Message-State: AOAM532KvfomPPXcPqMU/9lDtL0iYI1ifR8SSsyYpoUE+uFDH3bmEIyi
 wAUoQiOhAhs/hFzHjrN7jaSp3aza4ShFWg==
X-Google-Smtp-Source: ABdhPJzJcfVGqS2TdPzXsBaRbVyZDcdXRdVzKnZSawrxq+9I3AHYlFKWo0ZmPFLAEdtxT25rkuzg2g==
X-Received: by 2002:a17:907:e8e:b0:6db:472e:804a with SMTP id
 ho14-20020a1709070e8e00b006db472e804amr13182386ejc.529.1647104529124; 
 Sat, 12 Mar 2022 09:02:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm4466436ejc.66.2022.03.12.09.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:02:08 -0800 (PST)
Message-ID: <84862d80-ff12-8e92-e3d7-a0ee1a44485d@mind.be>
Date: Sat, 12 Mar 2022 18:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
References: <20220221140628.2295-1-abrodkin@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221140628.2295-1-abrodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/qt5: enable for ARC
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2022 15:06, Alexey Brodkin via buildroot wrote:
> Double-conversion got pulled-in Qt's sources from the upstream project
> quite some time ago [1], so now Qt5 is buildable for ARC perfectly fine.
> 
> This reverts the last part of [2],
> commit e453fb9e3280 (qt5: disable qt-5.8.0 support for arc, nios2 and xtensa).
> 
> [1] https://invent.kde.org/qt/qt/qtbase/-/commit/425df43d7fed19866fc7ceb3d26b6cc4190523f5
> [2] https://git.buildroot.net/buildroot/commit/?id=e453fb9e3280a1a1ce6180e165aab9c4f1642555
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  There may be some qt5 packages that still don't build on ARC, but I guess the 
autobuilders will tell us.

  Also without JS support, half of qt5 is still not available...

  Regards,
  Arnout

> ---
>   package/qt5/Config.in | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 8557fd1000..cbb2e06a21 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -13,7 +13,6 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>   
>   comment "Qt5 needs host g++ >= 5.0, and a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
>   	depends on !BR2_ARM_CPU_ARMV4
> -	depends on !BR2_arc
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
>   		!BR2_HOST_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> @@ -26,8 +25,6 @@ menuconfig BR2_PACKAGE_QT5
>   	depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
>   	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
> -	# no built-in double-conversion support
> -	depends on !BR2_arc
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_QT5BASE
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
