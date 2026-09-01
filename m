Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDD2C624D0
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2902406C4;
	Tue,  1 Sep 2026 19:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9Rz6DcE-rgM; Tue,  1 Sep 2026 19:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788290209;
	bh=4Z9Bwu1DF+mxw4Gzwow999dPeM5mLKetXdevCInMCO0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rZ7ey/9IrxHBdNBGgXczyiY0p+46RI1GElCtjcfhQk+Jfc9vIVmN8gFWaQBIT9uqk
	 Bc1hn0E3u0KiM6+wC5ZLCUntAFIsHG0ysqFqkl9oWJBZE8OpgjTj+bpbTzJLjB4gZe
	 1f8K6MJIweGM9aBxSjhdv23nbobkVHehF2LelcVnBcJcjpS4azDnMn9h62ALZy9lRr
	 QMNrQIDezAxj5Sw4P2P6hYXPfblw5asQx1k2v7K4dg6Ka/Xer2CmpwnRtdviw1qwqQ
	 f9JAEMk71mBSu+y10JXatUvbv3eHQWHO/HqC3a5gPjNIncPgPpS+XdzLUVgvHnvt4O
	 q0qRwJrHrsEZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE22C40756;
	Tue,  1 Sep 2026 19:16:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0EC1363
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6FB2607CB
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7JcSVMNG0sq for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3C32607B1
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:16:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 13FCE5FFB7;
 Tue,  1 Sep 2026 21:16:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Sep 2026 21:16:40 +0200
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 21:16:40 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Arnout Vandecappelle <arnout@rnout.be>, Thierry
 Bultel <tbultel@free.fr>
In-Reply-To: <20260831175358.1092247-1-fiona.klute@gmx.de>
References: <20260831175358.1092247-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.18
Message-ID: <314e234acfd4d69314dd40d7479d1a47@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/dracut: pass
 HOST_CONFIGURE_OPTS to make
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

On 31/08/2026 19:53, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Dracut-internal executables were linked against system libraries,
> instead of Buildroot host packages. For example:
> 
> $ ldd host/lib/dracut/dracut-install
> 	linux-vdso.so.1 (0x00007f578cf06000)
> 	libc.so.6 => /usr/lib/x86_64-linux-gnu/libc.so.6 (0x00007f578cccd000)
> 	libkmod.so.2 => /usr/lib/x86_64-linux-gnu/libkmod.so.2 
> (0x00007f578ccb1000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f578cf08000)
> 	libcrypto.so.3 => /usr/lib/x86_64-linux-gnu/libcrypto.so.3 
> (0x00007f578c600000)
> 	libz.so.1 => /usr/lib/x86_64-linux-gnu/libz.so.1 (0x00007f578cc92000)
> 	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 
> (0x00007f578c536000)
> 
> The reason is that Dracut is not a "real" autoconf package, and the
> hand-written ./configure script does not preserve LDFLAGS for
> make. Pass the environment variables directly to fix this.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks. To make future maintenance easier, I
also added your explanation in a comment in dracut.mk. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/45acb281caa9fa30799426ba7ef4694c0b61fa85

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
