Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D070C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 11:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD87A41D9B;
	Sun,  1 Jun 2025 11:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGjiwwJVG1mQ; Sun,  1 Jun 2025 11:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F401A40C89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F401A40C89;
	Sun,  1 Jun 2025 11:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AB48222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31A91400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrlLD-NaV89t for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 11:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A25740443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A25740443
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A25740443
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:52:49 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id BA163E00461; Sun,  1 Jun 2025 13:52:46 +0200 (CEST)
Date: Sun, 1 Jun 2025 13:52:46 +0200
From: Florian Larysch <fl@n621.de>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20250601115246.3yq77vy4diatl2lx@n621.de>
References: <20250404182407.45244-1-christian@aperture.us>
 <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
 <20250531165014.2npnkjv763aecffp@n621.de>
 <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748778766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LGYCMj3AVCBX7AzMQU57s72opgOy0b+Cn3GFxZ46lA=;
 b=O+7PD4+Qdc5ziJ1f/tDVUMvjM5nh7MOMSsWLA2dz/RHOuBxHODwBBxj1pVPSD6yh48OYr2
 Crqh4Pe7cKYz2A1dZCNX2pHzes5M3bIg74xUc4G+KioBdKEGTT4doR/1YPvHujeRIEhwyT
 J/5oweN1XFiknnuPc3pykJW75Zgs1BU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=O+7PD4+Q
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Olivain <ju.o@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 31, 2025 at 06:32:21PM -0700, Christian Stewart wrote:
> How could that be dangerous? You mean dangerous from a security
> perspective?

No I mean dangerous from a "don't randomly break stuff in non-obvious
ways" (especially on stable branches) perspective.

What this flag is effectively saying is "well of course every
CMakeLists.txt is also compatible with 3.5" without having actually
reviewed it on a case-by-case basis. This will flip a bunch of policies
and maybe a given package implicitly depended on some of the old
behavior.

Now you get weird issues that might not even result in compile errors
but show up in more subtle ways. I can imagine policies like CMP0053 or
CMP0063 causing issues that are very annoying to debug if you don't know
that this change has happened.

I'd rather have something not compile at all than silently compile
incorrectly. That's the whole point of the CMake versioning mechanism.

If we want to help people who need to make things work with CMake 4.0
hosts in a blanket fashion I'd rather suggest we force building/using
host-cmake (which is 3.31) until every package has gotten cleaned up (or
provide a toggle for that). This is what I've been doing on my internal
trees at least.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
