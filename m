Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB3C5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5944941CC2;
	Tue,  3 Jun 2025 06:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPCA2DF0elty; Tue,  3 Jun 2025 06:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B4240B2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B4240B2D;
	Tue,  3 Jun 2025 06:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 888B7DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DFC46154B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haX1VSDQ0Cq1 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B5F16153C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B5F16153C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B5F16153C
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E06C01C00CA; Tue,  3 Jun 2025 08:22:59 +0200 (CEST)
Message-ID: <f3ce8e9f-d3f0-4b45-87ed-61b8d207f56d@rnout.be>
Date: Mon, 2 Jun 2025 10:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, Christian Stewart <christian@aperture.us>
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20250404182407.45244-1-christian@aperture.us>
 <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
 <20250531165014.2npnkjv763aecffp@n621.de>
 <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
 <20250601115246.3yq77vy4diatl2lx@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250601115246.3yq77vy4diatl2lx@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=STS7FjsNzcciFcQY4EUOPhePEy77mNSSScg9CnsL9uI=;
 b=DYJCKOEXghBHwuE+mc0LHVR6gLJpNaHpAr/3TaSkC12ZfzMD4KSlRDWiyX5Kdge6cDymVw
 R5AGr82+nQNrzeNRmM4NS3dUDjK+O87ks8y6J8gvMFFp9VjhJOSouYpsmPz/aNyYd2DVxg
 KkJ5iOhqKrgwaPLb/83J8WUU/6AagROQhkil4mBQ8tVrmAGEwjqBcPMFtoMUi4ZGg5+sZz
 ryVwc3HbUEZ+B1xi2qooMMLet19wxEmsA3GIUigii2UCEBgVixL201EqWHHaZNKMvYavRh
 Vb5iSBI45ZL68Dtq5zi6Uut8aWvgMWPcGYsbvYeNsyBZDuVHJdkisU8gBq9djA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DYJCKOEX
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Florian,

On 01/06/2025 13:52, Florian Larysch wrote:
> On Sat, May 31, 2025 at 06:32:21PM -0700, Christian Stewart wrote:
>> How could that be dangerous? You mean dangerous from a security
>> perspective?
> 
> No I mean dangerous from a "don't randomly break stuff in non-obvious
> ways" (especially on stable branches) perspective.
> 
> What this flag is effectively saying is "well of course every
> CMakeLists.txt is also compatible with 3.5" without having actually
> reviewed it on a case-by-case basis. This will flip a bunch of policies
> and maybe a given package implicitly depended on some of the old
> behavior.
> 
> Now you get weird issues that might not even result in compile errors
> but show up in more subtle ways. I can imagine policies like CMP0053 or
> CMP0063 causing issues that are very annoying to debug if you don't know
> that this change has happened.

  It is rather unlikely that a package relies on a pre-3.5 policy _and_ does 
this in a way that doesn't lead to build failure. However...

> I'd rather have something not compile at all than silently compile
> incorrectly. That's the whole point of the CMake versioning mechanism.

  ... If it does happen, it would indeed be a pain to detect and debug.


> If we want to help people who need to make things work with CMake 4.0
> hosts in a blanket fashion I'd rather suggest we force building/using
> host-cmake (which is 3.31) until every package has gotten cleaned up (or
> provide a toggle for that). This is what I've been doing on my internal
> trees at least.

  That is indeed a good idea. Do you have a patch already cooked up for that? 
I.e. something that checks a maximum CMake version in 
support/dependencies/check-host-cmake.sh ?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
