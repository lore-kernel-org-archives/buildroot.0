Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2BCD33990
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 17:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0161961CF5;
	Fri,  5 Dec 2025 17:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3EbWHAizfb1; Fri,  5 Dec 2025 17:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1059F6EB4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764954506;
	bh=QW4t1WUXS2K624ULiU4Ih+ZSB+bqFtu8b++DPh4GHTs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R5pATviIbpEWrUZsKxLYgJBJzfYIwMH6dLPajW/BFXY2e2hjOPTKpA6wP7T4sWmC/
	 7MaRRZRUCsFnDzcxih5VFIbjCt7q7TXsyTrKwuGI187B0QlFMltExG41NgLkZKu0kN
	 E/c0xehcj5fXMw/suJfODVKQxd0OttxN5RjoPOI0Ooh3LC4716cXMAaWFFmqiIKkeS
	 bd/sQjW4XldX3CEobPQnBRKF9kevV4FLIcBcc6ZPrvGlaC3fUaCHSUdrv3b1Iamn6p
	 C4sXJ72iFNwkfyB3WXYE/c8rTAKNPzd6kyvfIlKiF/ZCccOzrW+CVb7Vz+S68iKOiZ
	 MZ9dy/Bk0/DnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1059F6EB4D;
	Fri,  5 Dec 2025 17:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3049DE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 167E4849E5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyHgCiSbnrf4 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 17:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CFCF81C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CFCF81C19
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CFCF81C19
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 17:08:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.96.62]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7KU-1vKSpF17fe-003d3b; Fri, 05
 Dec 2025 18:08:19 +0100
Message-ID: <a7c5c09b-2df1-48ca-82de-9da4ecb7d46f@gmx.de>
Date: Fri, 5 Dec 2025 18:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251205121905.578982-1-buildroot@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251205121905.578982-1-buildroot@bubu1.eu>
X-Provags-ID: V03:K1:1hWONmVY9PReMmO8GNqNsdBVvxwJ6jBJkFOLnCiJO6Ess0gYlub
 PPBoWWaNdrKua2mOW15e7J3uB7QU+6smSZ3NBX/km25ukDcfVD/UesSfvE65VlnwM1li4kH
 E5jVTNFU5/2yLXtlt22LMdd/peG87p2ESzvaoGRUorcufMNqixXMxbO2jqqVEhW7gQZyovJ
 rjjBVKqCBOyQFDoxLipFQ==
UI-OutboundReport: notjunk:1;M01:P0:vObSHg1vWZc=;2S+FFcQ4zUatJg6WVZj5f2M/XI8
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1764954499; x=1765559299; i=fiona.klute@gmx.de;
 bh=ZmoafLcMF9fI8KJ74fb22tW+akAZSvbvErKwMZ6yxcA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CKUbh/JzWrromwKrjv0hc7ClIcRKt00FFvrvfZ6sCnly+/Fe/B+PYzkPS5INKQs9
 30756wyu3V/AJDF9F0rKiyUY6wEdZu1okTfGlerqJ3aOP8uGcHfSbOwuXUMLWtkd5
 c3H89DFAHpuXAfCBXJ/ouV7efkusXHV/iPcNxMTX72Likwoj1sea0ew9jWIJZvi3D
 WT0phFa2mMf29ymuCRZ2eKl69q58VoLb9okrmtK7hOegMkApAEUG9tzntQNF/Xz4S
 m0PY6ATLOwoKHASJDleNEUw6vMjy6hoiocEt1x8l4tCIl+OgJZXjKdG3mFd9Yolsv
 fZjuc3iM5oUJHkLH0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CKUbh/Jz
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump to 2.86.2
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

Am 05.12.25 um 13:19 schrieb Marcus Hoffmann via buildroot:
> Release Notes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

RAUC and NetworkManager build and work fine.

Thanks,
Fiona

> ---
>   package/libglib2/libglib2.hash | 4 ++--
>   package/libglib2/libglib2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index e4b9a7c5ae..6698db8389 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.86/glib-2.86.1.sha256sum
> -sha256  119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57  glib-2.86.1.tar.xz
> +# https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
> +sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
>   # License files, locally calculated
>   sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 0957d946bc..1c5109f4ec 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBGLIB2_VERSION_MAJOR = 2.86
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
>   LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>   LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>   LIBGLIB2_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
