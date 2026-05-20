Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0570BCD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA8783C50;
	Wed, 20 May 2026 19:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-0e8neQvI0I; Wed, 20 May 2026 19:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37F283EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306324;
	bh=A4zUeOlwYz3/UToKalg0Y6tjBs83F2eLyzUyG474erM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I9v3FyJUbCTHcnZSarpjzouCpeQciYmzH8GB/ItZ/CgNzp7KbEzACwl+DoNjrctL8
	 J1GeO9geOHZv2uk5jIEqklIzGaEgriLP6dZB38OL7+A3c5cStweZmEBW+IOOtJptkB
	 oIPXiD6BxrWa+VCrWUwk/jSyFCMtIwtxmEYmMGsj80EOdC8fvhYIzpI8i1H5sn0pt1
	 REBGFOl6UijCjrxr5lKHVtgvZ8NxvlDQHnKjx44FFqOu/g7EKxR+N4uxoD6XjKrjCI
	 5wS+nK8rsmFvIA65yJkk0yRKDBIQGLuepvyWCu2GsgoVfDF/tQbndrJNO9iXyAKjn9
	 UAu5AT+A2JLfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37F283EC9;
	Wed, 20 May 2026 19:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E91265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D0983EC9
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCo1vRC3PPpY for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE51983C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE51983C50
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE51983C50
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8329DB97C531; Wed, 20 May 2026 21:45:19 +0200 (CEST)
Message-ID: <93d0e9f2-9210-4ef1-b5bd-461ab849e8f2@rnout.be>
Date: Wed, 20 May 2026 21:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20260421190201.2722268-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260421190201.2722268-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779306320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CTGGE7OelFh4yz9B7Idhb0kxqRwLsVCu72SeR5ntVVE=;
 b=TwB9N0o3YqXTJ+oQ9IlbF2iaiuNF1WDiHxbnbOarQGXzqMaY5tmizFXd7yPMmIxASXgaFK
 EZEoyp6tFldooWT1du3w94PF1/mwRkRwmikiTS1N8aonKdEk3CAwNOUSPg/aQPx6JREpxC
 +Iu9tYZWxjQE6U6o/bt5+13kM5zh1zyuNOiT0lnnESAXSSAVOQFrYlZLenjYgkMxG6b73w
 UuQjCf7iHC1G8jFAfPWRbmgdZPphL/bww0BiSHQ1oW9c2HMTGDUWk8acLml3Tf/UPDQ/IP
 NtOMiJ6HV5QKTAYkN3b+sEr1Sjfu9PoOWb/w2i23wXhyphPL/aEW4Ba+HWyPbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TwB9N0o3
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix build with weston 15.x
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



On 21/04/2026 21:02, Bernd Kuhls wrote:
> Buildroot commit 2e6b2b82d5301977cf2f59adfd633d8774830f69 bumped weston
> to 15.0.0 causing a configure error with cog:
> 
> Run-time dependency libweston-14-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-13-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-12-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-11-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-10-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-9-protocols found: NO (tried pkgconfig)
> Run-time dependency libweston-8-protocols found: NO (tried pkgconfig)
> 
> output/build/cog-0.18.5/platform/wayland/meson.build:66:8: ERROR:
>   Problem encountered: No usable weston-protocols dependency found
> 
> This error was not yet found by the autobuilders and is solved by adding
> an upstream patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Oops sorry I was going through patchwork reverse-chronologically and applied 
James' patch instead, even though this commit message is much better.

  James, please check patchwork before submitting your own fix.

  Regards,
  Arnout

> ---
>   ...-Add-support-for-weston-15-protocols.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 package/cog/0001-Add-support-for-weston-15-protocols.patch
> 
> diff --git a/package/cog/0001-Add-support-for-weston-15-protocols.patch b/package/cog/0001-Add-support-for-weston-15-protocols.patch
> new file mode 100644
> index 0000000000..97ec65a409
> --- /dev/null
> +++ b/package/cog/0001-Add-support-for-weston-15-protocols.patch
> @@ -0,0 +1,29 @@
> +From b59d3a3c0feceecb10f0376ac2695d9466c9ecf6 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 1 Oct 2024 10:24:56 -0600
> +Subject: [PATCH] Add support for weston 15 protocols
> +
> +Weston 14 was released recently and the weston development branch is
> +now using libweston-15-protocols.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +
> +Upstream: https://github.com/Igalia/cog/commit/b59d3a3c0feceecb10f0376ac2695d9466c9ecf6
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + platform/wayland/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
> +index 74215f0a..dad47a6b 100644
> +--- a/platform/wayland/meson.build
> ++++ b/platform/wayland/meson.build
> +@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
> +
> + if wayland_platform_weston_protocols.length() > 0
> +     foreach weston_dep_name : [
> ++            'libweston-15-protocols',
> +             'libweston-14-protocols',
> +             'libweston-13-protocols',
> +             'libweston-12-protocols',

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
