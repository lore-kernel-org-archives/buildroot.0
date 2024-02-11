Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B5C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFD2C81F5D;
	Sun, 11 Feb 2024 22:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElRQTcU0tfMo; Sun, 11 Feb 2024 22:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC73281F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC73281F62;
	Sun, 11 Feb 2024 22:08:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3689E1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23EEC41B5B
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ChWdkI0qysK for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:08:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9C2C41B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C2C41B57
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9C2C41B57
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:08:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7F54240005;
 Sun, 11 Feb 2024 22:08:27 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:08:27 +0100
To: James Knight <james.d.knight@live.com>
Message-ID: <20240211230827.3d820fe5@windsurf>
In-Reply-To: <CYYP221MB11409B6225528EC480F68A11A0442@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
References: <CYYP221MB11409B6225528EC480F68A11A0442@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbNyppRRSJRrX3yuSObSHH1fF4FJw1GewI9lBdOAky0=;
 b=BM+xlyJu7cp04vhmjfc/wHymDJDVXPbceKXo9f0P2K5YirK4JqTRwf4OfypKG1JM/ORaEj
 8GgcsGd+rvsx32Hd5BCr24AWT7O/9Pabe5egVSFKbovNu6Pi6mayp2bQDsGupgQM0iiAvE
 VdfVojqCzfbPBXbgWy+GgwSzPs9u8YPYXrnDeij1fYZmosflNljmNSK7Q7CzDIFnsa/lbn
 EDq4YXT8sgFoEv2ga9V+cd9SFVfr5lvJ/391hkKKWbA2h8/P3aqgXWmE0gTjQzWhb+6qFc
 BHBZUamq6aA3tbO/WXYeE3tH7G5qlJEf2SGLoOflfh2FXEtiI7Vl8411vSHJJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BM+xlyJu
Subject: Re: [Buildroot] [PATCH 1/1] elfutils: drop lfs tweak
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Feb 2024 11:55:30 -0500
James Knight <james.d.knight@live.com> wrote:

> When the elfutils package was first introduced, it filtered out
> LFS-related compiler flags due to issues with the package's
> implementation. This package has since evolved over the years to support
> LFS (e.g. using `AC_SYS_LARGEFILE` [1]).
> 
> Filtering out `-D_FILE_OFFSET_BITS=64` can lead to a configuration error
> when `BR2_TIME_BITS_64` is enabled:
> 
>     checking whether gcc supports -Wl,-z,relro... yes
>     checking for __thread support... no
>     configure: error: __thread support required
>     ...
> 
> With the configuration log providing the specific reason:
> 
>     configure:7175: .../output-1/host/bin/m68k-buildroot-linux-gnu-gcc -o conftest -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Ofast -g0 -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -shared -Wl,-z,defs -Wl,-z,relro   -latomic -Wl,--build-id conftest.c  >&5
>     In file included from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
>                      from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
>                      from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
>                      from conftest.c:13:
>     .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>           |     ^~~~~
>     configure:7175: $? = 1
>     ...
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fbfe131673ed78999a07dbc879436e0ef6a8a1c0
> 
> [1]: https://sourceware.org/git/?p=elfutils.git;a=commit;h=3425454a10d307fae891fb667cf7969e945cde79
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/elfutils/elfutils.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
