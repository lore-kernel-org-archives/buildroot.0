Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBC7606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r+1BINuo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9700780EBE;
	Sat, 14 Nov 2026 20:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afAcULhDEYjn; Sat, 14 Nov 2026 20:03:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6086E80E11
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794686612;
	b=MAyKduDhUcaQeAfVr8l9GHmcDS2Qt4lLxZIjrY9E4GvnFhx1igT5G7cN0lkwjrV0juZV
	 +Q4Xkrp0EU6Lvq7CdvCh+atAEC0x1SaQZx/cUgBsTJfjK6/JzYk3n0AcP4PIiGHKl+P9P
	 d2lmXCMR7yJ2VedNgO4ymo73r+AnaiRDCDprmy0IC21ZgjKpv1bJ9q6I1CxxAbsZ73aWw
	 BIQRfV39q3yb0H+dnecl6NbD1mBkyyoG8FoKGqbszs69/FAyrwqK2rJ8MUweL3ed3AA2p
	 FPcC8//6O2TjrC0xTtHtuaz0ofV9drSgA7Lgok3sTaKG6euN3oAVgr35HJJ/dVR9anw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794686612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RdlulJ+hWPBIg70P62FVK6+iVe/APzXgNeVRJNs809o=;
	b=DfVcTtePPTG5sixQY/m9kuCfWG/4lawmengOb9wLvgI32XbQqfnSHFLK773Y6rsnyTQm
	 0lpwW3NGLLoHLkyFoCCC1IYh7SyNSNAoBNlNpQzTvfWbMpbnevJQrDDCoOYb2eTK/KUQ2
	 8vgdhHA/Bb52l0JY/MNXnFiMupeZOxf+7V4XvqwgOmDLFunj1wiyVwS3BfFI7jnC8Z1fG
	 qvLmyPha43d0eJZVoVYN5Fe4EefxnVggjttccVAriLWcsYZXV9bSZNBUZHBvDqXHsNLmY
	 dXN3uj/HPgrZM67upgYm3k1nhuD0IWhEnUcxBjC8NaNGm9ufGM6XurO0koC9pQhGJIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794686612;
	bh=RdlulJ+hWPBIg70P62FVK6+iVe/APzXgNeVRJNs809o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+1BINuotncbJTJwPXHfj0rUhj2IarW9JVUDG3IXE+i0KXH34C/KbuDY9Cxgrk3IO
	 xRH8JUOWDM7ZoNqJOr4eEP+tlfOfxpG/YM1+gnFBybkaw4Bsp/HXJCwTubBXydM8fZ
	 dWfscCWHgfWCEOVr7Spy5EMqGkXJ9X/hMLavu/gz8WcpLbTCbn2FOYMEsIk0INWn+A
	 q5CNTEXvKeYn+T560oYIfFZ95Jonddra5jUL1Gd0zFAkoqIermpD3aBCpJyw8pfbps
	 tmMja9fD286+JUBH8EgFImlPpWjEUBOv4sr6hWVRXDCT9B6OQyn59A7XxNM3wnArwP
	 7uR90xbARa6oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6086E80E11;
	Sat, 14 Nov 2026 20:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 946E372D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6036064E
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShS0DZB2FySg for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 20:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D7FA36061F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7FA36061F
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:03:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8DC2619F59C;
 Sat, 14 Nov 2026 21:03:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 14 Nov 2026 21:03:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 21:03:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20261112190953.100951-1-bernd@kuhls.net>
References: <20261112190953.100951-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <b06781e20440a4451527d33f0a1bb5da@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,

Thank you for the patch.

On 12/11/2026 20:09, Bernd Kuhls wrote:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.3.0/docs/relnotes/26.3.0.rst
> https://lists.freedesktop.org/archives/mesa-announce/2026-November/000875.html
> 
> Removed patches which are included in this release.
> 
> Renumbered patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/1b0f77577ee2fc8a8ef7fcd26916d4ff30f362b2
> 
[...]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f20f02190a..fe62de1446 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 26.2.5
> +MESA3D_VERSION = 26.3.0

Running the weston runtime test with commands:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_weston

fails with error:

Dependency wayland-protocols for host machine found: NO. Found 1.48 but 
need: '>= 1.49'

I believe wayland-protocols neeeds to be updated before merging
this mesa3d bump.

Could you send a patch bumping wayland protocols, please?

>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
