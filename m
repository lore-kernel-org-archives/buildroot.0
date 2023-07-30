Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCCFC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83A1F61019;
	Sun, 30 Jul 2023 20:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A1F61019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCjgg4iysN7Y; Sun, 30 Jul 2023 20:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D893D60B0D;
	Sun, 30 Jul 2023 20:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D893D60B0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 862BA1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6652D60B0D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6652D60B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKy2gqSv63Sm for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:39:06 +0000 (UTC)
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9998560A9A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9998560A9A
Received: from [192.168.50.162] ([146.241.4.160])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QDBuqzAm7QDLBQDBuqv7pV; Sun, 30 Jul 2023 22:39:02 +0200
Message-ID: <de27ee1a-8d34-e89b-9b7d-fa1a47c35b21@benettiengineering.com>
Date: Sun, 30 Jul 2023 22:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230730164117.3064024-1-bernd@kuhls.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230730164117.3064024-1-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfGjQyUeAwaze+vbeFHtCevYVJToAQ896k1U1kpa4px9o9b1aVicx9TjMCgmA+LrJRIiWniPuSguxbQ8ExyJ66qNcdIxEo2tkva5Evs3JriGX7uG72wGh
 LWz6ANHVoiwUw8Rnvc5KPcbYn49PV3DyQ8mQUk8TQevb18e2YambJHzpp7lla8TDrbSUFhZIhKD2G2uOUnrXpVPhVz1gV1h6EXJyBO64y+Svvcw+r8trM39J
 o5YTHKDDOfY6ccj6jQ23AQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690749542; bh=p8fDqyk6yWyFFeUIXjwCKu55//SntS72WpfsgCTX1AY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=P92h5CApb2XIVieFCMVCFbKWZVsju5a3uEA/ENrvG079OTgGEk0g1agVAJy95C0VD
 zyiRxFcIHYjKlglmfW5OPMackD3KMuY8IjkValYHBQJBLerSf1zOkA+nzdsmmL4bzm
 zcG9fiznDbk0SubsUQRw6Qco1QkuR9+SdtOnIWp+Y+JILAOpuBpVdzuMuiFhuDvf2X
 bXrJr7PKIcS4ivZvaJ8tgnmtWsEWeqakOHJg7Ap9CcFrhhPiAsltHyRBMhkdtr0tzL
 39IW2bSxnufgfgXfsP40Mvo/CrIwszbCTolmTKmsa0H1K/QgucQnw7jgKgUFuMt0l3
 GIka2WECrjuBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P92h5CAp
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 8.0.1
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

Hi Bernd,

I had this patch ready since one week and I've forgotten to send it :-)

Can you reword it like below?

On 30/07/23 18:41, Bernd Kuhls wrote:
> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS

     Since the major release changed, all the packages that have direct
     dependency to harfbuzz has been successfully built:
     - efl
     - libass
     - mupdf
     - pango
     - qt5base
     - qt5webengine
     - qt6base
     - sdl2_ttf
     - supertuxkart
     - vlc
     - webkitgtk
     - wpewebkit

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

With commit log reworded like above:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Maybe a maintainer can reword it while committing.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 6b3dfc22b7..6b71e3819c 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  20770789749ac9ba846df33983dbda22db836c70d9f5d050cb9aa5347094a8fb  harfbuzz-7.3.0.tar.xz
> +sha256  c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620  harfbuzz-8.0.1.tar.xz
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 981d911014..3118ec62c9 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 7.3.0
> +HARFBUZZ_VERSION = 8.0.1
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
