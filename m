Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BF064011F;
	Thu, 10 Mar 2022 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izEMs5acwyEW; Thu, 10 Mar 2022 21:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84CA94057A;
	Thu, 10 Mar 2022 21:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0B461BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EF14057A
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbVExmIn3DMB for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED00E40132
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:22:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s10so8700261edd.0
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nGtFXC2/w9SHjkHpHCbMZAtNexA0H+7YjKB/bbCDnoE=;
 b=SwfptzCqGJKDLPQfjaaTkUYRx6nPEBKXuE4KQ/XCqhf901rKRk4wzskfpegYF+OuW8
 MTyHaRs1i7H8fKAN0Q3CabvPkGyFN+yUOxfvv+1RKRwJ/4+aK0gCxISBU1DhYFAQb0bd
 F8QLG31dDyWfXAblBY1o8hxtCOiySzIGLrJxJxrvRjW6mBTu25mAiteulxSSoXv/4PRp
 D5l3G7v5qIkUL5pRPAEhS8gCLSRUbydqJwxwvnUU84JurYGiivddsONPKp8Yey8uxQAM
 pc14VScxljEkBgaUlbWk6AFr/ebroyggVAL7XU8riiY/cUen2UbaBcIi+0yLJzIxkqwI
 652g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nGtFXC2/w9SHjkHpHCbMZAtNexA0H+7YjKB/bbCDnoE=;
 b=4OeVgtUl6PfnOnB+00wAMfEuuI4jibDxP/HsHHWWZJao3KoyVKTYPIeiVyVT3LCMqI
 +3ciRI6mKwEg3RNwPWJmXxDMnMqRXfLLVSDW1Nd1/FKUfECGLR14W8MmZ182HPtvh6C5
 RoUn3Z3LsrBG0Ik4ggQxZHoS07Xpcb3G0bcOJvNJdZQD3x3rxL7uUd2ngc4CQZ8vNP19
 KQiAiOvVIlvCwzPq7ZvxErJK2If39Jcop8aw8kvjyeDLJzF1slWuele04j1e3OCuld0W
 LnHXSFQ5PLxIF99J5pSr82IG+mfhE98yF7gqh4hMsVADo5A4uRDQPQdy6pe15I7O28/W
 zRpA==
X-Gm-Message-State: AOAM5314jh855988qieSpVmkRkWOVR8LiR97om2k5CaRBAbXrJvv9E8Z
 Bl3jHjUtqKiR6V6oRf6o7SepWdZnNuh0BQ==
X-Google-Smtp-Source: ABdhPJwbMJb2v5knhDdrxvhtm7mplGma9nKi2M4cdgWIat+cFmNeNhGFfHuhz5un7PvMKPfMOzbSEg==
X-Received: by 2002:a05:6402:26d0:b0:416:7165:269a with SMTP id
 x16-20020a05640226d000b004167165269amr6249394edd.61.1646947353249; 
 Thu, 10 Mar 2022 13:22:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a170906c0ce00b006c5ef0494besm2153928ejb.86.2022.03.10.13.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:22:32 -0800 (PST)
Message-ID: <403e117c-e579-f96e-764f-7f69d6fdf8fe@mind.be>
Date: Thu, 10 Mar 2022 22:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220206212824.1790375-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206212824.1790375-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5wayland: bump to version
 ce2caf493a1343fbd9f8e4c85baf6a61c057f242
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 22:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5wayland/qt5wayland.hash | 2 +-
>   package/qt5/qt5wayland/qt5wayland.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> index 1a7400de67..2acdd1643c 100644
> --- a/package/qt5/qt5wayland/qt5wayland.hash
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  a29d52c7b12987ed56d922455e0776e161075392969f7c6a8b141b00bd3dd46b  qtwayland-b6d85c2a75f5618e87267f5b5c361455be257a17.tar.bz2
> +sha256  f43c8ce9070249dfa91b94c09bcbf7c4fa881daf5eecdb9ff93c0eed43a3b7b0  qtwayland-ce2caf493a1343fbd9f8e4c85baf6a61c057f242.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index bcc4915022..61182f611c 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WAYLAND_VERSION = b6d85c2a75f5618e87267f5b5c361455be257a17
> +QT5WAYLAND_VERSION = ce2caf493a1343fbd9f8e4c85baf6a61c057f242
>   QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
>   QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
>   QT5WAYLAND_DEPENDENCIES = wayland
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
