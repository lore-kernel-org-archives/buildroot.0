Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E83C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 23:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40FAE6073C;
	Mon, 22 Nov 2021 23:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eoagMihYUTw; Mon, 22 Nov 2021 23:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6BD60646;
	Mon, 22 Nov 2021 23:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4938B1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3301160646
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r23cPFsRsvMD for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 23:11:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9FFD60626
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 23:11:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e3so83772215edu.4
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 15:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ciqIUY/5wntDhBB3UI1EEej7/OTLXXZfCuU8H6/QT5s=;
 b=RtqzcfFbkWxWgjPIt1oa+559hQCrsBVZY19Jsmv7TJzNBwLGWnVRwfIHkk2OmZCwqc
 IfqeANrFnixS3KmsO3naDUtRZ77ouMNlVjsdIMs9VIkgcWfJNT1OZyKZwt/bGyS19JKh
 l2PTEmSVE49BNaJC+lLOAuP6FjWrydiS8To4INAgOufDYtZOmwRWu8ZpZ9Q+xgh6pOB1
 QQv7xjKyKLtAyL2vnvuqRydnTql1xN1ISeOP5vYZbNYiB0mhyrfZiNMrp/4l6tWTsM5t
 wUlRkb6ItvNux+x1/tPaZiZJECSnvtHkRsLOQAoHQJj2eqda7Ro8bTNMEgOebFmTCuT+
 +sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ciqIUY/5wntDhBB3UI1EEej7/OTLXXZfCuU8H6/QT5s=;
 b=ZvORspmYGsaVe4VAB4clxHzoUlozwhLj6kPasjXpfPCIEKEBglvc0lQUBddE1fc3DS
 8Nw9+THGI78T1TDCXGNSSclBmYyT788xMTL5Q5G51I97PGzM2b6c2D4ePZaKl6j9cUNr
 CA8A8nBhspt9gZ+CpU7seSSHAu1bAZp6T6pQtst3fIeSRrIymXRMrHCPnySrrFv2j/9s
 jXfFAZADPTb97XFuyXx3CvFAyDvUuVbCWbDeQAYhR/HOpy34IAle7kqM0MnGG8rKIdMM
 747rD+SmT/WFiYNHfOU/VXyNDaXVmvR5roPdHxDKHuvflJBz0YnSAyJsV73p+NG25bav
 WujA==
X-Gm-Message-State: AOAM533grLgmM1gaL5g06veITbxePQ3k1q6OjQZKRITekszKTcF6LPag
 XxlcrN9aKr0yL/gNQij7VvuEA/6bLT81xA==
X-Google-Smtp-Source: ABdhPJyFr3xZ/aSntYxU60dDTgaV4FSCfb03SZt4zaxHFsULAUss2cuZgV+jYnktnTZsa3geJSK4Tg==
X-Received: by 2002:a17:907:3e22:: with SMTP id
 hp34mr1277423ejc.491.1637622709838; 
 Mon, 22 Nov 2021 15:11:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bd12sm4740543edb.11.2021.11.22.15.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 15:11:49 -0800 (PST)
Message-ID: <1ac1eba2-b623-b962-fc24-f17a76495e41@mind.be>
Date: Tue, 23 Nov 2021 00:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211104003607.2022984-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104003607.2022984-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH vRFC 0/4] package/midori: bump to version 9.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 01:36, Adam Duskett wrote:
> This is a huge update that took me a few weeks of playing around with
> to get going.
> 
> Heres the tldr version:
>    - Midori now lives at https://github.com/midori-browser/core
>    - The latest version builds with host-python3
>    - libpeas is a requirement of midori 9.0
>    - webkitgtk has to be compiled with introspection support
>    - gcr and it's ui plugin is no longer optional
>    - gcr ui also works with wayland and x11
> 
> I tested this with test-pkg -a
> 45 builds, 38 skipped, 0 build failed, 0 legal-info failed
> 
> It's huge, it's complicated, and it needs review.

  Although I did spend quit a bit of time on it, it was pretty much perfect :-)

  You're not in DEVELOPERS for any of these packages, so I guess you'll be 
monitoring the autobuilders by hand for the coming month or so?

  Regards,
  Arnout

> 
> You're welcome ;)
> 
> Adam
> 
> Adam Duskett (4):
>    package/gcr/gcr.mk: enable gtk backend for wayland
>    package/webkitgtk: add gobject-introspection optional dependency
>    package/libpeas: new package
>    package/midori: bump to version 9.0
> 
>   package/Config.in                             |  3 +-
>   package/gcr/gcr.mk                            |  4 +-
>   package/libpeas/Config.in                     | 45 ++++++++++++++++++
>   package/libpeas/libpeas.hash                  |  4 ++
>   package/libpeas/libpeas.mk                    | 38 +++++++++++++++
>   .../0001-disable-vala-fatal-warnings.patch    | 30 ++++++++++++
>   package/midori/0001-fix-bug-1492932.patch     | 44 ------------------
>   ...ion-to-specify-path-to-g-ir-compiler.patch | 37 +++++++++++++++
>   package/midori/0002-gcr-for-x11-only.patch    | 32 -------------
>   package/midori/Config.in                      | 46 ++++++++++++++-----
>   package/midori/midori.hash                    |  4 +-
>   package/midori/midori.mk                      | 19 ++++----
>   package/webkitgtk/webkitgtk.mk                |  8 +++-
>   13 files changed, 210 insertions(+), 104 deletions(-)
>   create mode 100644 package/libpeas/Config.in
>   create mode 100644 package/libpeas/libpeas.hash
>   create mode 100644 package/libpeas/libpeas.mk
>   create mode 100644 package/midori/0001-disable-vala-fatal-warnings.patch
>   delete mode 100644 package/midori/0001-fix-bug-1492932.patch
>   create mode 100644 package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
>   delete mode 100644 package/midori/0002-gcr-for-x11-only.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
