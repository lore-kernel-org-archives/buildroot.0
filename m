Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A79CCD1AB
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 19:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D64822E7;
	Tue, 21 Oct 2025 19:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ps1XxmegXtIo; Tue, 21 Oct 2025 19:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBE082301
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BBE082301;
	Tue, 21 Oct 2025 19:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAD4A277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A178D40BD2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNmHexWN51RI for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 19:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A518640BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A518640BB0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A518640BB0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:27:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A7DE85FFAA;
 Tue, 21 Oct 2025 21:27:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 21:27:33 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 21:27:33 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pieter De Gendt <pieter.degendt@gmail.com>
In-Reply-To: <20251021141020.55010-1-titouan.christophe@mind.be>
References: <20251021141020.55010-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <a8f25fd8049e1226b01eb5c9158f84c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761074856;
 bh=MqP4PY1+5LTDm9l3jZZO/TUvIE1pK7vP5VT3dykDX1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fNlmok4j1K/hKCdHYgdYT0YlAjoFkpm5bigJOTUHxzGy8RQzeyXp6NcNdM9cIYMhV
 szbOn/VGbyrcNVUPUp8zkaZOauR7QdK05fH0npmhkNWmYrOBXMR8WAVncBlOJaYmVB
 CqFYNxf3YEG3fUHwID8Hd8B0sNWKhtQ96qYcQ9b3M8xyw3fzfNuPhuMftgBptQdBDw
 DUq1ceHxWSvXin2ZkEWrNs9RVm6WRrRIkA5E4h5GGgkEUUxfkXlNvtrwg0B56PRhQH
 pHiwsFEoRipmSeqXUnrcaCvRf3hJBbcm7nD9QuA3KdkBBfvuhcmSrzQKmFbbqCz7j4
 IZtv8uVKjr+lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fNlmok4j
Subject: Re: [Buildroot] [PATCH] package/libvips: security bump to v8.17.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/10/2025 16:10, Titouan Christophe via buildroot wrote:
> See the many release notes: https://github.com/libvips/libvips/releases
> 
> Along that version bump:
> - Change source code archive compression from .gz to .xz as this the
>   new upstream delivery format
> - Switch from autotools to meson build system (see upstream commit
>   
> https://github.com/libvips/libvips/commit/538aa2a8415e10e5c30e4e8671ab5387ca4869fb)
> - Update the LICENSE file (see upstream commit
>   
> https://github.com/libvips/libvips/commit/057703938e76083f78760d64ece983dcf7be65ff)
> 
> This fixes the following vulnerabilities:
> - CVE-2025-29769:
>     libvips is a demand-driven, horizontally threaded image processing
>     library.  The heifsave operation could incorrectly determine the
>     presence of an alpha channel in an input when it was not possible 
> to
>     determine the colour interpretation, known internally within 
> libvips
>     as "multiband". There aren't many ways to create a "multiband" 
> input,
>     but it is possible with a well-crafted TIFF image. If a "multiband"
>     TIFF input image had 4 channels and HEIF-based output was 
> requested,
>     this led to libvips creating a 3 channel HEIF image without an 
> alpha
>     channel but then attempting to write 4 channels of data. This 
> caused a
>     heap buffer overflow, which could crash the process. This
>     vulnerability is fixed in 8.16.1.
>     https://www.cve.org/CVERecord?id=CVE-2025-29769
> 
> - CVE-2025-59933:
>     libvips is a demand-driven, horizontally threaded image processing
>     library. For versions 8.17.1 and below, when libvips is compiled 
> with
>     support for PDF input via poppler, the pdfload operation is 
> affected
>     by a buffer read overflow when parsing the header of a crafted PDF
>     with a page that defines a width but not a height. Those using 
> libvips
>     compiled without support for PDF input are unaffected as well as
>     thosewith support for PDF input via PDFium. This issue is fixed in
>     version 8.17.2. A workaround for those affected is to block the
>     VipsForeignLoadPdf operation via vips_operation_block_set, which is
>     available in most language bindings, or to set VIPS_BLOCK_UNTRUSTED
>     environment variable at runtime, which will block all untrusted
>     loaders including PDF input via poppler.
>     https://www.cve.org/CVERecord?id=CVE-2025-59933
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
