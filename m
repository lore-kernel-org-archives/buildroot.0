Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B6CCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 18:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA4F6127C;
	Fri, 19 Sep 2025 18:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eltEQ_liWGJk; Fri, 19 Sep 2025 18:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF43861271
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF43861271;
	Fri, 19 Sep 2025 18:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBDECE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1EF56126C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv0gvPxQ-FYU for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 18:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C96506126E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C96506126E
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96506126E
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:42:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F2E6B31E0CA0; Fri, 19 Sep 2025 20:42:30 +0200 (CEST)
Date: Fri, 19 Sep 2025 20:42:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aM2kFrdPdzNWbXhj@waldemar-brodkorb.de>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
 <20250909120822.1069595-2-thomas.petazzoni@bootlin.com>
 <14e1befe002ce593820b4bc1dd63d04e@free.fr>
 <20250915080605.579fa2e0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915080605.579fa2e0@windsurf>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758307350; bh=jyXbsfAvuOUF52ae8Pk7827VpIQKbXhtGwKfSQiaw7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BatOgQkb3swrwNiy+SDD1Bed5rVB4/MtReT0VJLJOuMeHj6babOXnqfxwR0x6xYtv
 7GE6+DX512GCsiZ2UqO2inIZANQbC2pXgzPrHBKTOKUtCWsSSgcRgs3iUX7UMJgdrv
 MGaMK/soDcna6wofBJ4OCVULQgeS36A3XXcH4iylV9VT4bjtIb9tflwwQnnh4cynPL
 EucnExfi3AwwfPa0icOm/3wYtUknIYIaLeHCl6FODs5Drru8NZ/RtSB+dNmp8YCrP8
 FwdB1o2B24m5h0VvnC+kL+F8VF7Z/LMX5RCSqaKdrybUxRQTnHWpgJhrZAVcppNwxq
 YWh6o5H2MHvBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=BatOgQkb
Subject: Re: [Buildroot] [PATCH 01/11] package/libselinux: fix build issues
 caused by 3.8.1 bump
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
Cc: Julien Olivain <ju.o@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Julien,
> 
> +Waldemar in Cc, uClibc-ng related issue.
> 
> On Mon, 15 Sep 2025 00:28:28 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
> > I applied the full series to master, thanks.
> 
> Thanks!
> 
> > While reviewing, I found one corner case build failure with libselinux 
> > 3.9
> > on x86_64 uclibc. See:
> > https://gitlab.com/jolivain/buildroot/-/jobs/11350151899
> > 
> > It seems to be a followup issue related to the one fixed in this patch.
> 
> Dammit. I must say I don't quite grasp what they are trying to do in
> these matchpathcon.c checks.
> 
> It seems like:
> 
> #if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
> /* alias defined in the public header but we undefine it here */
> #undef matchpathcon_filespec_add
> 
> /* ABI backwards-compatible shim for non-LFS 32-bit systems */
> 
> static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
> static_assert(sizeof(unsigned long) == sizeof(uint32_t), "inode size mismatch");
> static_assert(sizeof(ino_t) == sizeof(ino64_t), "inode size mismatch");
> static_assert(sizeof(ino64_t) == sizeof(uint64_t), "inode size mismatch");
> 
> is for 32-bit systems? And here you are building for x86-64, but it
> gets detected as a 32-bit system, or something like that. Is it due to
> the fact that we always build with _FILE_OFFSET_BITS=64 even on 64-bit
> systems, where I guess it doesn't make sense because off_t is anyway
> going to always be 64-bit.

So would the right fix to enable _FILE_OFFSET_BITS=64 only for
32-bit systems? Or do you think something in uClibc-ng is wrong?

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
