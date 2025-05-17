Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57C8C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C1F960C2A;
	Sat, 17 May 2025 10:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIup_RtKu5r4; Sat, 17 May 2025 10:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88AA3607E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88AA3607E9;
	Sat, 17 May 2025 10:39:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 806FE223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71BAD406E2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGBJ4J7XU90q for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6E4E40BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E4E40BEC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6E4E40BEC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2F7C1C0F1F; Sat, 17 May 2025 12:39:00 +0200 (CEST)
Message-ID: <e9e19b56-fa0c-48cc-aaae-0bbcfb75125c@rnout.be>
Date: Sat, 17 May 2025 12:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <3d35742af4e065dd031c35c85eb86a1a65a52e1c.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <3d35742af4e065dd031c35c85eb86a1a65a52e1c.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747478341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QlbyqQkSuua+uyJl5K6AdY5CDFWpJ5+cIl8iPNKPoDk=;
 b=msk28CspOztcChb/Af8qnhd4fPnSQfwvc+aVSlewVoa+I4RNzWopuvtDVEkxNtqiFZb04z
 7XxrlfWQ+0lJ2DobTAkDaFll8WlwBtYkg9suG8ouUxVC2i5Q/k0andzv9vYcPVGSYvKwCX
 1zK5omiphlguIdWitShnAFnE9sb2Dz2zPvvjzVxZL+l0iwjRDMuoCTTCHExzkRTb8O1V6n
 LeBBe0pOTmdPRwSRGjy6mG+rR4O1RikhYxXqyJ/nfxJRr3+YbI9/nqAq+4tHbMNxaTE5me
 9RUF6cNvrFu2ZrQUlb8/7Ix2kfnPuBWIrOWd9wmcIxDlZlMdx0lAB4KC1M49Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=msk28Csp
Subject: Re: [Buildroot] [PATCH 09/13] package/systemd: require merged-bin
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 18:58, Yann E. MORIN wrote:
> Since version 256, systemd will taint the system if /usr/bin and
> /usr/sbin are not merged, known as merged-bin. Although this is
> not yet an error, it will be in the future.
> 
> To be as ready as we can be when that happens, forcibly enable
> merged-bin, like we did when we initially added merged-usr.

  Except that this time we don't add a comment about it :-)

Acked-by: Arnout Vandecappelle <arnout@mind.be>

  Regards,
  Arnout

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> Cc: Sen Hastings <sen@hastings.org>
> ---
>   package/systemd/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index fd7671480c..5eaa092444 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
>   	select BR2_ROOTFS_MERGED_USR
> +	select BR2_ROOTFS_MERGED_SBIN
>   	select BR2_PACKAGE_HAS_UDEV
>   	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
>   	select BR2_PACKAGE_LIBCAP

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
