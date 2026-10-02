Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30487CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 09:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 973B440A2D;
	Fri,  2 Oct 2026 09:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpyMkcqSWFGy; Fri,  2 Oct 2026 09:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A2A3E40844
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790932361;
	b=cQ16oZvNpqL04F7Bwuywl3QLw4RMUldUx5SbT8GVafuBHamRDqP6Bm2EmLmwmwRr4Bpk
	 DCsmsenvw8RdFC4GnhPxBgDydJJPy4oesgF3A+XcDPJtSV8OqxjrYftXS/9g6ZAMNhEAU
	 uEfyrnJEKdWxPZvbQQsZB8hCw7S396lvxOu1vPGOupXNX9957gJBggshIMRz0IY+FtiDo
	 lCXREHKwJoBYlwejSpErtkVQvtlp+eXVvOetjOhrekaQOUWFNj0Si4xOf0e54BOdluuml
	 +Pm6i0RZRhhDPL5elgyrfMY27ziFFXNl5ghrUpHlbtNdWFfuvl+KuHGv5QJtShkA5UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790932361;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ltthpe/tO1KUvSjOQtHgrbvDXbIBYj5vrX9T7umOWm0=;
	b=P9+VAdPfKxYSyffnhOrLG0TURItXDjJzB4NArXQK0bYQ4VCvxFgPsd0Exk6qbY1hkx18
	 oil3KLT8y9jZwCX/YphfAsX4wmoTVyTjVl96CVrzE1d+uMnd5bbEXwHhMpP6ecONJkHzQ
	 aP/bvNcglSN021+D+ExI/pfXCwFMNzK+4++HnCNiadkI1aJZxsuYlkaEnmzxYw/mcaH93
	 3uljMIztWKgELS2CHdQn16ul+et7dHlQwgEiMmCis/M04EE5h3lmvLEXswiBR34KW9NfN
	 E46siYCR5+Hlcdd7cOzvcdRS1hSIsA9j7c6+akIcwUedlF3mIL2FKvVfHZ3xdF9UQcA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790932361;
	bh=Ltthpe/tO1KUvSjOQtHgrbvDXbIBYj5vrX9T7umOWm0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=i7ySd9WaL4HNKJhwR7nIhIpGIjBiIqaoVIGFJ9kIkMI97C0/Blratg3TzuiQerBLi
	 9nIzxU8TxOIsD+IR3E9DnLvf0Vsi+AwPPA+VB/YCfn15JTv0UTKzt06q3r4PV3TZX6
	 +x77zIDeFmfU12L12G1K8E+K28i7/jMJMiiSPMDQBHqoAaRL//LKA5ZmB6kEvmGkb/
	 d+2JiSuHl1Rrtx0+gFyePPPtWXF/t/atXJG2kdJCOrOLaWqa/wO+dQlH0ymIweiQal
	 UUcQxX9WWwrlbrh4YtXa/oD0FzfmpN2IeX2+OpRtBmPb8AeRyBhShjVz4xe8yiUGPB
	 qLULVaPRGxXvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A3E40844;
	Fri,  2 Oct 2026 09:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA2034C2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF8EA80C98
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 09:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXiZZMBfYWTF for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 09:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A1DD80C7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790932360;
 b=HhiQd+X8qgiJkdDE5OzqdM+0imfjYljRaql9dmSPdJqs2OJdHSBitUhLm0CrnkteuVVN
 eSeM6kP5cKxDVtlgF7Kvk7ZxzFMWgWwEgRMftEz+BoyVxcalHObfJDbgeZKh3T6L/97Lj
 5hpRx4AUiB56J86LWHIQfET2bWIRj/g9yqfdZtjh48omzF5c2JRorJW9pR5vmUsYRpq1r
 chHaG3iEHYPoOf7ISTjwHaCO2ygBKqsbvNMzjRQSLGaIHZZo2/BqPlRQQekqZLITayBNf
 7GSskwBQQKUiELv1ilZq6aahna5m4Aur0DDfOvmk9dUJK2mG0NA6qOvmvlql9yb02DQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790932360;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ZCZpf3U/0/ydpkozeIhEdqUSLE+VfviAHRNbQEbMBAM=;
 b=iezUJor3Nhv+moyna6jhtijlfu/XQ0kGlOu6NM/4WwQxVbfe8lkNXJJQoP+JG0IMNW8V
 8b0Fv9sv7IBcFlRTAljrmkCUL44HuPzSZB+Vlvd/GDZOmKWD7gCm3bHUBK2pmPLpRMTyK
 UhNoTt15gOkkhH5sTr4w4BMKX8906EfwE25KdrX1r/hG1IF8PEKQkyPGn+ChY9g+tX58G
 WHkYIAqWwh9MkU4slrxqpcX4YuX6g1wjDyHv8cjWgADnxSYjWMUDbuRdLUud/waj1Bl4t
 x0FmDnrx3smqdk9KLPmEHu20bZ7HYWBQ6DKuyRR1rYeak54o4uycAbdZuorqmPWakFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bd03lHYg; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A1DD80C7A
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 09:12:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1walj73qBe-00Zz5u; Fri, 02
 Oct 2026 11:12:36 +0200
Message-ID: <6ffb4bde-4f9e-4701-9f32-c2d239186fda@gmx.de>
Date: Fri, 2 Oct 2026 11:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad.86@gmail.com>, buildroot@busybox.net
References: <20261002054300.51538-1-francois.perrad.86@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261002054300.51538-1-francois.perrad.86@gmail.com>
X-Provags-ID: V03:K1:HYFes5XckXliKJlWO0vKeJIWJz1zChKoOYu87P0Tqm7VxCUehAP
 dNnMhFKNcOe1n++22cYac2y0VJv4XeoWNgokR7r1Mm4Ug87tIspC6pxK8KWmar1VMnNCYLD
 ncry84nFVtnEfhq7h1nY4OJk83yidH0LdO4mMZkJpKH+blHzDylyGN6iq6BTZqEqQO8dV1G
 /8ckcL43krSL4eq6DAMSw==
UI-OutboundReport: notjunk:1;M01:P0:TcQ5Yjj3UO0=;oZxzylgXaTRgHJGxhfGr0PLbDOS
 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
 QdVa2bpNJYnfMfQ4EJsFJc5uO+HmT5cO+graRs=
Subject: Re: [Buildroot] [PATCH] package/kbd: bump to version 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

thanks for the patch!

Am 02.10.26 um 07:43 schrieb Francois Perrad:
> remove upstream patch

Removing patch 0001 means 0002 needs to be renamed. Looks good otherwise.

Best regards,
Fiona

> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
>   .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 -------------------
>   package/kbd/kbd.hash                          |  2 +-
>   package/kbd/kbd.mk                            |  2 +-
>   3 files changed, 2 insertions(+), 37 deletions(-)
>   delete mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch
> 
> diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
> deleted file mode 100644
> index 1324d0b53..000000000
> --- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
> -Date: Fri, 5 Dec 2025 16:45:36 +0100
> -Subject: [PATCH] libkbdfile: fix zlib build
> -
> -Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/libkbdfile/elf-note.h | 5 +----
> - 1 file changed, 1 insertion(+), 4 deletions(-)
> -
> -diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
> -index a0fd9e2..d3b8d5c 100644
> ---- a/src/libkbdfile/elf-note.h
> -+++ b/src/libkbdfile/elf-note.h
> -@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
> -  */
> - #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
> -
> --/* For symbols being dynamically loaded */
> --#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
> --
> - /*
> -  * Helper defines, to be done locally before including this header to switch between
> -  * implementations
> -  */
> --#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
> -+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
> -
> - /*
> -  * Originally from systemd codebase.
> ---
> -2.47.3
> -
> diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
> index d46a60a80..83b45b0e8 100644
> --- a/package/kbd/kbd.hash
> +++ b/package/kbd/kbd.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
> -sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
> +sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 34401075c..d31b11e2e 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KBD_VERSION = 2.9.0
> +KBD_VERSION = 2.10.0
>   KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
>   KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
>   KBD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
