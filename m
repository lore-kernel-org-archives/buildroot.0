Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE6DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5E8B40614;
	Tue, 14 Dec 2021 20:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhYAAudpyMQp; Tue, 14 Dec 2021 20:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA16940644;
	Tue, 14 Dec 2021 20:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 565D21BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45667402C9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBGc7A8z2GDY for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 625EF40261
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:08:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r25so66431712edq.7
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A5hOmvfptze9k4Hnc+oPpRlO2ILP7edgUsFI0Ue/M5Q=;
 b=RjYhuNvPt1/eCvRMS30w7fV+WYHc1Mw1ifpeomc1LXsE1+oSMc8vR9QG/lM5nCUtK3
 tgnXqyJaGC1GL9fqDfx6nCe0t8CJHqqrjCW7ywu6BVo367fDFjIoVKAeWSidXvUc/HWb
 2wbZm3h9OEVRchWzbX18RcBTZi5lx/oBIa6ir2xnpXoo83sESFWi+jNszD+UzKNJDYl1
 yzHs0AlGq8x062WMHd43FwBk1GOsz/joP0KqXRVrlO7k87j3uBNW3qBzc9+BIJZk/mMx
 0Q5VFd5+3QNZk1J2NBuqM4/QRizXu42OHz2F5QLyjDfdutAjBFHQwtX1qg8WbjGftX2h
 nUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A5hOmvfptze9k4Hnc+oPpRlO2ILP7edgUsFI0Ue/M5Q=;
 b=lQ/m2bD1lM0JL3Ep1nkobyoPAaXaKMtjrz0dP4B+Z8l+rF2c3gqwac3BHmKCzwLdLM
 MkB2YCI7geGP+GWQBYBqZUCdYwGNU/PkbazDkzkgNNT95zMshePecf9iRcCOyTmpszmj
 UhZm1jSxX8UQijME/m1Iu4GOd3jqDrBxke5ejFvwme7cM45HYmw6P1MR2x/3vwkwFzEl
 XnhoHJrlLN3rE8eIfdi4Ubkrz69/f4FRKfKIkQlMGbC+Hc2B4u7FMUko7t4MH9Cughvb
 EHQIx+nX5YPcRoAt4wgcWV5Gk+1hMD/RIbYmpZQWpAeAxwDtmwYKxtyfeH7ndqmlOK4W
 LEAA==
X-Gm-Message-State: AOAM53213fh8TGYcA5yhAJUpvSspKsOMVThwQtAUUh79oYdu/qez5i8D
 wswqoPqsrjzN55h4ECC3b6NKuw==
X-Google-Smtp-Source: ABdhPJxb87gpDhaLDscjdJp/D7WVRWOwrgdqMS9m5jepvLp4uT+UKX8vEBA2xHu6tCm41A+nbQ5eWw==
X-Received: by 2002:a05:6402:2043:: with SMTP id
 bc3mr11070366edb.231.1639512506705; 
 Tue, 14 Dec 2021 12:08:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qw27sm246189ejc.101.2021.12.14.12.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:08:26 -0800 (PST)
Message-ID: <c922f1fc-9f40-eccb-41c3-7a5aea0c434a@mind.be>
Date: Tue, 14 Dec 2021 21:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211213203754.16739-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213203754.16739-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 21:37, Peter Seiderer wrote:
> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libinput/libinput.hash | 6 +++---
>   package/libinput/libinput.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 31bf7bcf69..f18a727810 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html
> -sha256  0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883  libinput-1.19.2.tar.xz
> -sha512  fc5244dc90ceb710f7b5bb76a3cafc7dd5a8d5fa05c51122412615bfc3a99435d6a1017b79c3ce73561139fc2f5959acaf16cb9500796ea2f3eb6cb95d1a1acb  libinput-1.19.2.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
> +sha256  3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068  libinput-1.19.3.tar.xz
> +sha512  f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298  libinput-1.19.3.tar.xz
>   
>   # License files
>   sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 055c4fc7a0..2f9c639c22 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBINPUT_VERSION = 1.19.2
> +LIBINPUT_VERSION = 1.19.3
>   LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
>   LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
>   LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
