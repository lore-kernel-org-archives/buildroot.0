Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF15C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2B983E02;
	Tue, 18 Oct 2022 13:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2B983E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_cRbXjKG1MV; Tue, 18 Oct 2022 13:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB0183DFB;
	Tue, 18 Oct 2022 13:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CB0183DFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 707221BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BFA16109C
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFA16109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYN6xOKel2Q6 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBB2610A7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBB2610A7
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:14:50 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1pISYL3S91-00bJ4L; Tue, 18
 Oct 2022 15:14:46 +0200
Date: Tue, 18 Oct 2022 15:14:45 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221018151445.42d376ff@gmx.net>
In-Reply-To: <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
 <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZP+c3PqSmspuV3tom549X9CMeKhgpxB2jLFtVSEWYe8/Ysrgp2q
 9v5aSyCixK1FYyOOlE/NRAietfiDQ/9kZxZtzGwZjwFhad3VwcY7POC9jUrTresZcLOaRqf
 iyWX4DNjNmMsj8zC/NX13ORJwebp2dhOhftgtQxFLk/OZrmmXysYNoz1yTySKhl6xX25JsB
 MkaxqPB6WYF22BOndkEyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JI1KbJLspuk=:AvdAcwK1AZ5/9EsS7xUGdH
 UX98YL7vSxKUTfDwzl61+N9q6FmH9WIas6w+qjL0E8morvsnhMYM3AGg3Kwms9negMUwEnAOC
 t5wgjCqjzw1BtJT/fFI/7MkNi/RsvMugBisItx9VoL6cxfe7j3TWL3hjCaEyi/Axmze3S0QG3
 o8Yb/h8ajQkd0ksz+yHAqk7Wy8v+V72ppJ0B7zKvyu+ExvAW1/Aj4oGgVaRs0SBd8V1qeB8ig
 1eA11r2384L96Q4t3LGqVYQCJ/9Ihgygatgp4M5wW63eKeeVj+9OOtL0i2NRo3QDFxHlZ0IIx
 i5puqeQ0iJLF/zwTWa6HqFGx8TBqrhSLp+Hd8Qwue4i5mFVP5Bn4+aj8gWkAj8IX7hT0f/djM
 DFBciqpTDfSFjhxRL7sQFF7sAkwvfI7RbcmemOk7tY5hH4+piMCxGbe4E2wVPUAWf4E+UTIXK
 jhnATNsu6XJyuv6EbF7E4ZopXXC0D9OEeMq96t7YMsS9UT0JjWUNTeVt+ks+aoofDo+aJBuHH
 kadQD0LtB8t+QFoRYR9PhKFXmS/B2FVD7t+sIkznH4lHaGMxkSnNLqBswFepSU/omckyHP2dR
 y2QTNHxYaz+f0DuOjRWBWeRvN+anrf8RK/8rLND/aGY1IdTrnZrdjSPi/TgeR1JOHEh6k1S9b
 734bi4l4KiD2pgOI0CeXTTVRAfY7xhzuSDxpPtYhZ9/7s5JVuX5RnZ1BSIVaU2ftp3/Co8/qo
 46s2PRrpoZXA3kdqAfJ9kIbdq+3eC9T9Wx2ytFkBDpM5kw1k3avpSzk3oWxn58fCI77PnbE5m
 HhL2KAgN8x8Kv3mqzSgxL5WIDWuy607WU2LDgNn4W40h6MXtSvIhd8s7D5Hyeb9h0JVj81IDJ
 cSFJgFZRtW+Xx7H4ooPGURJml1xXjBU32iQCQlpVEjXAYSeRbljgJ1rIC8X8RlT7X2aOaZhc8
 zSaQQ54NFhL+S7Eo/dwy3tOfYMX3A3EiGVZMZ1ZX4WB43++FxOIzSiQWczHMNhkNr7YwM5llI
 69SaT3fqtJX4I4R7DoW8CKZx0qGHvCL1a0+xsOXV1AaSC+SNonRQUnbyEuivRJne2o4WvOC31
 /lUyKGZ1M8xeUaOdrB6wPAm72G/AcnLQ82cgvjY68zeQ/JN4QhnJhLjaBk6vhKdyuXc7CN8Lh
 g5UKHFgTRsD7VXB5FLL4xDmf03KI88UBOkTFamrIgISvjP9DR0q4hRFlrVQg8wcoyf36aUWJb
 l7YwSFCv9+Q3j8N3dnGYdumbcodGVOSgN/aSSo8fbfFj0cdxy//9aDeGLAzN5xGrzZpq9YYaI
 vlb7e1ahiFYYcXH9v3rdQWcxWeYafDtoBSwWrfxgXLIayb/cjnuCIvPKhQ8RvCGutVQDVzI76
 nJg3VFOv9wPsgoePmUZmcP0Q04x405OFCdqfIt+BKAPjqysEF7vhWAGzpMMVY+YVlz67DkCyJ
 NmiPD4pV3LwvW5+0QivCpEDsaQedMe7YPUkF6nTW9VsQS3dTajJrQf4rv+8XigFW8CD6X3j+a
 BfiscqUzy4/uzY2GCHDZ+INe15T0pNrtzARm/pzGeNXLL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1666098887;
 bh=MVXyphMKTIiKkmhNs3bT1f1HQ+j5D1L1b7plFJDtCR4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=T7alvAC3thbwteQeQsUBBNDLITSE5iXo/NcW0BmajU2LPUf0IN2KGbabZrkq4BJOk
 gMP4dRkHxcPttJS90761SaVVG3D7vsdkW+BWq/F94GN6ztoJCCVrfLYlPHVLPPKIZ2
 eGToaQHEwvvmE/E8CJA/OrDWFkVRmvp/Jb/pwtK8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=T7alvAC3
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Mon, 17 Oct 2022 23:12:39 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * use specific upstream commit SHA1 since the latest is buggy

Please mention this in the commit message (including the breaking upstream
commit) and additional mention that the used commit is from the
branch(?) not master..., will save some research time for later updates...

Regards,
Peter

> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index 9c7f2de4b6..ff8c0a3418 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
> +sha256  e6106521139cc463eaa74d1491e212437b2106c3aa0005b1b7b93f1d8a090237  rtl8188eu-7a7c5e0c0bc168ec5083a707e300e298dd4811fa.tar.gz
>  sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index ebce4617ac..99f8248c05 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
> +RTL8188EU_VERSION = 7a7c5e0c0bc168ec5083a707e300e298dd4811fa
>  RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>  RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>  RTL8188EU_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
