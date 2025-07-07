Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FBCC83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 15:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A586144B;
	Mon,  7 Jul 2025 15:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQUMMhbr23vC; Mon,  7 Jul 2025 15:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB0D60AE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB0D60AE7;
	Mon,  7 Jul 2025 15:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C82A15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6B240DBD
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGTR466vciew for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 15:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAB214057D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB214057D
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAB214057D
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:43:10 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 7053DE0056B; Mon,  7 Jul 2025 17:43:08 +0200 (CEST)
Date: Mon, 7 Jul 2025 17:43:08 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, yann.morin@orange.com
Message-ID: <20250707154308.pchu64peqfpfwxqd@n621.de>
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
 <20250706171341.azx6v4b6k524gmsw@n621.de>
 <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1751902988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hsKvUwdY0G+LhnKCdOnsX9vucaOc8cXRM3Tjf56GSZ4=;
 b=Q/j8T7HRQxamnnwx3e/MD9KDLUaJFfxYwg2SvTMVNRcnlqD9yP8+9RfgIoLoJ6yawPEcDw
 z9R0g4M7ya/7y2tMM3hCFTLePM0R8kvwBZlxlC4Y/zwSGmRyYoYomzUwH+iUurxIMsHxaC
 4RmBaDmzUF+4+OmHYrHv1brOSPFWopY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Q/j8T7HR
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sun, Jul 06, 2025 at 09:59:53PM +0200, Romain Naour wrote:
> I believe there is an misunderstanding here.

Yeah and I'm afraid you've lost me completely now, sorry. :(
 
> When you say "we can fall back on the pre-built toolchain", we indeed fall back
> on the pre-built go cross-toolchain (host-go) but since
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is missing, host-go can't be used to
> build go target packages (even if it's installed in HOST_DIR).
> 
> Since it's a pre-built toolchain there is no native build involved.
> As you explained, the full bootstrap via BR2_PACKAGE_HOST_GO_SRC is not
> supported on aarch64 hosts.
> 
> With your patch applied, we can now use host-go (provided by host-go-bin) on
> aaarch64 hosts to build go target packages. I'm agree with your changes, it's
> just the commit log that needs to be reworded (with the link to the commit
> adding host-go-bin package).

As I read it, this is more or less what the commit message is already
saying. Can you please explain where you think it is incorrect or
imprecise?

The only reference to a native build in the commit message is when it is
describing the current broken state that causes a native build of target
packages to happen erroneously.

I can of course add the link.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
