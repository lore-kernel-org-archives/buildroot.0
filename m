Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81069C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 07:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B39418F5;
	Tue, 11 Apr 2023 07:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B39418F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_FRb9EpThcC; Tue, 11 Apr 2023 07:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFE941742;
	Tue, 11 Apr 2023 07:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFE941742
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C54C1C3BCA
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9A7282050
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A7282050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1oBhpFPF1Dul for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 07:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD6F82043
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDD6F82043
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 07:01:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so11600623wmb.3
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 00:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681196479;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vtvnUDzmMhjQoWS+VVff61srl2K7RuNHUz4/gxrNyHI=;
 b=54Hmtx/APBYw9jqniBfFB2aOemUYtTNLr3TvxDLLU3TfgCzT9Y50Jl2drQxCssh1vh
 Ft2mvwzhnyiYfsPNLSCt4tzlRId23AAgBMjLXAe0bZamqtYNBEnYyJ6o1bQD8/aT/7A9
 +xX1vSR2cQ3FwsPoN6tye4SkwG8o9fa8/Tg3Jq1GI7xt6ZzdRCxYs0XeIkDMV9DNhRCA
 yLGGRW25jRedkBG1bc9RV93BzS4ynJHPeozkJePlm9L+6jUUGB6rVyOWMDau3/FAaZy5
 w6F83a/v2mAfODSAH/v/SoJ7NTFMx77hMO2kaJkkBDY0401VedHunJSGsLtJ7nGGhbYK
 wKfA==
X-Gm-Message-State: AAQBX9fUDtH+giq548sLo3bHcc2tyfpOzA6o9qCY0T8C/nr2Y9G9hDw8
 LIisNVl7gUpp9iodt7D6trzoKA==
X-Google-Smtp-Source: AKy350Z1Cnm8WPX6lizbqq7PDfXO4I/7jrtTq5jWCX4s0cb1j1uYN0d0+2YQhrAiSVKveo6BngDoAA==
X-Received: by 2002:a1c:7216:0:b0:3d0:6a57:66a5 with SMTP id
 n22-20020a1c7216000000b003d06a5766a5mr1275062wmc.0.1681196479086; 
 Tue, 11 Apr 2023 00:01:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b002efac42ff35sm11528599wrh.37.2023.04.11.00.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 00:01:18 -0700 (PDT)
Message-ID: <450c49ee-8e38-41de-6704-46d60fd8f258@mind.be>
Date: Tue, 11 Apr 2023 09:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230410211718.6B8AB83EB6@busybox.osuosl.org>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410211718.6B8AB83EB6@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681196479;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vtvnUDzmMhjQoWS+VVff61srl2K7RuNHUz4/gxrNyHI=;
 b=dl/U4qSwNWGJ3noZM2Q3vg+Cj7ydm1NCOqpnlhMXEaV/8/gyYk/O2mISIfbux0DJZS
 So02q+Cf9MTWYfXa5Pi+gJmnRO9dmBy7aAYpuw0vdU3LwEGCkfUA6U7GqM0dV5RwfN2n
 Y+8pN4NJV1eXhNHRBQKerzVApWbaqRpeU271KityTn+9LjdeDh0bopKGIrrX+iSgNYbO
 jEKEm2XB2Q750hez3nPJS4CQ+ibXk0K5noC4nN2cVKfa2vptJNy/WdeQBXKaSqvKCTPc
 dWRqd6EW0E4KbpTlZoSNbrbt37uNAa9TeR/w3PKCQYZUcEfskNwa4NaTH2Of5MNE++Y4
 L5Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dl/U4qSw
Subject: Re: [Buildroot] [git commit] board/qemu: fix shellcheck in
 post-image script
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



On 10/04/2023 23:16, Yann E. MORIN wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=b32d7c99c64d6dcb7a68036a7abfa86b8b558627
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Commit 270759aff3cf (board/qemu: define start qemu script outside of
> post-image script) touches board/qemu/post-image.sh, so that exposed
> existing shellcheck issues.
> 
> Fix those now.

  You forgot to update .shellcheckignore...

  Fixed that now.

  Regards,
  Arnout

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Knight <james.d.knight@live.com>
> ---
>   board/qemu/post-image.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
> index 57306dd546..ccd0fb78c9 100755
> --- a/board/qemu/post-image.sh
> +++ b/board/qemu/post-image.sh
> @@ -1,8 +1,8 @@
>   #!/bin/bash
>   
> -QEMU_BOARD_DIR="$(dirname $0)"
> -DEFCONFIG_NAME="$(basename $2)"
> -README_FILES="${QEMU_BOARD_DIR}/*/readme.txt"
> +QEMU_BOARD_DIR="$(dirname "$0")"
> +DEFCONFIG_NAME="$(basename "$2")"
> +README_FILE="${QEMU_BOARD_DIR}/*/readme.txt"
>   START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
>   
>   if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
> @@ -12,7 +12,7 @@ fi
>   
>   # Search for "# qemu_*_defconfig" tag in all readme.txt files.
>   # Qemu command line on multilines using back slash are accepted.
> -QEMU_CMD_LINE=$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '${DEFCONFIG_NAME}'$/!d; s/#.*//' ${README_FILES})
> +QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' \ "${README_FILE}")"
>   
>   if [ -z "${QEMU_CMD_LINE}" ]; then
>       # No Qemu cmd line found, can't test.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
