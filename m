Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328CDC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 15:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF267400AC;
	Sun,  2 Jun 2024 15:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbRGX9aJggrb; Sun,  2 Jun 2024 15:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3477400BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3477400BB;
	Sun,  2 Jun 2024 15:37:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F19801BF287
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 15:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA42E8143E
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 15:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqgbej_1B1ww for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 15:37:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8F1181434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F1181434
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8F1181434
 for <buildroot@busybox.net>; Sun,  2 Jun 2024 15:37:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 48E7013F879;
 Sun,  2 Jun 2024 17:37:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Jun 2024 17:37:23 +0200
Date: Sun, 2 Jun 2024 17:37:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZlyRs_aj7sXheiBt@landeda>
References: <20240602070634.597337-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240602070634.597337-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717342645;
 bh=31AlYAVc0LtbpgJG2S5bguaqBMbv+h3dwyAcC1toDE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HsfdrB5zCjVaflvlyLsdUHPTWpz3yOJKODxyA5Qfegdj+vS7voka3Jg6VeEoaUf4r
 mENVegitxDo+9raENz6MiyG4u1X08sTrLz4IGKEtpFpIGo6f76ek5qLM3MruuFqZ6G
 lBC1PvdB9HfzbyV9WCACVb9XHdGoA7hs2CZKCmkRAP/C9YHFUMrXQsqt/NEw8Odj+C
 g8kklc2866SQXX+xHhiyjlTPsF0xziIcRKOBjrk606lgJSTZdl7h+/KWKSr7PlH7yy
 CFjFnY7zDL0ewy13IVB6jay2qxesVtCM+bECsQwKIOKGQxdxvj2seOn97wWg+MMUEz
 DS9jJgJYsMmJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HsfdrB5z
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157_olinuxino_lime: add
 hashes
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francois, All,

On 2024-06-02 09:06 +0200, Francois Perrad spake thusly:
> and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thank you for this patch. It uncovered a very nasty issue we have had
since we introduce _DL_SUBDIR more than 6 years ago now, and for which I
just sent a fix:

    https://lore.kernel.org/buildroot/20240602145542.2485828-1-yann.morin.1998@free.fr/T/#u

Basically, Peter and I spent quite some time trying to udnerstand why
we got a hash different from yours:

    $ make olimex_stmp157_olinuxino_lime_defconfig
    $ make source
    [...]
    ERROR: while checking hashes from board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
    ERROR: linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz has wrong sha256 hash:
    ERROR: expected: 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93
    ERROR: got     : ee94af461da08f406408c70094582232a348b14069bc4dcbe7ff97e16cfe0c70
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack

However, what was even stranger to us, was that the download was OK when
we actually tried to directly trigger the linux download (there is a hint
in the trace above, but we did not see it immediately):

    $ make linux-source
    [...]
    linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz: OK (sha256: 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93)

So, sometimes the hash is OK, sometimes it is not? I seriously
considered Gremlins at one point... ;-] Of course, when we identified
the delta between the two archives, we eventually noticed the download
was failing for linux-headers, not for linux...

This is something that you too could have spotted on your side, if all
you had done was to run the download from scratch to validate the change
(I pretty much always do that to be sure):

    $ rm -rf $(pwd)/dl-empty
    $ make olimex_stmp157_olinuxino_lime_defconfig
    $ BR2_DL_DIR=$(pwd)/dl-empty make source

Anyway, that was a really nasty issue, but we now have a fix. Could you
please help test and review that patch, please?

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                                           | 1 -
>  .../stmp1_olinuxino/patches/linux-headers/linux-headers.hash  | 1 +
>  board/olimex/stmp1_olinuxino/patches/linux/linux.hash         | 2 ++
>  board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash         | 2 ++
>  configs/olimex_stmp157_olinuxino_lime_defconfig               | 4 ++++
>  5 files changed, 9 insertions(+), 1 deletion(-)
>  create mode 120000 board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/linux.hash
>  create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8f5fc0a47..201ec2a85 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -253,7 +253,6 @@ configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
>  configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
>  configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
>  configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
> -configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
>  configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
>  configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
>  configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 000000000..5808d92af
> --- /dev/null
> +++ b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
> new file mode 100644
> index 000000000..8691d5ffd
> --- /dev/null
> +++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
> diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> new file mode 100644
> index 000000000..a991a1922
> --- /dev/null
> +++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
> diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
> index 8bd8e10ca..ecfa78135 100644
> --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> @@ -5,6 +5,10 @@ BR2_cortex_a7=y
>  # Linux headers same as kernel, a 5.10 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
> +# Build
> +BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +
>  # System configuration
>  BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
