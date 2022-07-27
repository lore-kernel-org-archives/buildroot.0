Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C771C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF939409F1;
	Wed, 27 Jul 2022 16:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF939409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5sBJGceLBXl; Wed, 27 Jul 2022 16:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C653C409DD;
	Wed, 27 Jul 2022 16:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C653C409DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A74791BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B913409DD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B913409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2NNfkTeOVT3 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:49:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19761409BB
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19761409BB
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:49:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 17:49:22 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-Id: <AQUOFR.XHG7UPPE48DS1@crapouillou.net>
In-Reply-To: <20220727155711.GD1134587@scaer>
References: <20220620115510.33792-1-paul@crapouillou.net>
 <efe0cf31-54a7-6abc-8034-c440327e644f@smile.fr>
 <NNROFR.FBROLJPFYDGX1@crapouillou.net> <20220727155711.GD1134587@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1658940571; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDW685hqk2uIefhyw6nVhZbDts1DBExuUH+tVxE6xiI=;
 b=ACKTLTJPiYOUT0RseGF5Pi9yarbFV4ieb+eyoJTsosVpN9+esqkx2vFFWzVfnTBRbUG6YZ
 2V1pJvpglw/VxwQiiFsz3EW/3JEBr1MlVtY9lS5r/WLvzYENdxRiqvQlP7CVYW+9JLolVY
 M0IVjC1Xeq2ZWqqvPpUC/s+pmvfBHKk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=ACKTLTJP
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: add option to force
 static build
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Le mer., juil. 27 2022 at 17:57:11 +0200, Yann E. MORIN =

<yann.morin.1998@free.fr> a =E9crit :
> Paul, All,
> =

> On 2022-07-27 16:42 +0100, Paul Cercueil spake thusly:
>>  Le mer., juil. 27 2022 at 17:06:52 +0200, Romain Naour
>>  <romain.naour@smile.fr> a =E9crit :
>>  >Le 20/06/2022 =E0 13:55, Paul Cercueil a =E9crit :
>>  >> This option can be useful when building for a system that
>>  >> needs to somewhat maintain compatibility with previously built
>>  >> software, as Boost is notorious for breaking ABI at every
>>  >> single release.
> =

> If you need to link with boost libs, it means your program already =

> know
> the correct ABI?

It knows the ABI of libboost that was used at the time the program was =

compiled.

> I mean, you have two situations:
>   - you have sources for your program: you don't care about ABI
>     breakage, because you will build from source, so the compiler and
>     linker knows what to do, so you don't need to force static libs?

That's true, *if* you only consider Buildroot packages. Because as soon =

as libboost is bumped in Buildroot, every application compiled against =

the previous SDK is broken, and needs to be compiled again.

>   - you have a .o file for your package's, and you can actually link
>     with the static libs, so it means you have the proper ABI, so why
>     can't you link with the shared ones?

As soon as libboost is bumped in Buildroot, the symbol names of the =

library change, so everything need to be compiled from sources again, =

and not just re-linked.

> Now, if you have a binary-only executable, then you don't need to link
> it at all.

If I have a binary-only executable linked to a shared libboost, then I =

*need* to have in the rootfs the shared libboost of the *exact* same =

version used when compiling.

Which means that as soon as my users update the rootfs, every pre-built =

application out there that links against libboost is now broken.

> So, I am not sure I see what the actual issue is...
> =

> Also, I don't think it is sane, as Romain pointed out, that the whole
> Boost is bilt statically for the whole system; that does not fly with
> me...
> =

>>  >After discussing with Thomas and Arnout, we are not convinced by =

>> this
>>  >patch.
> =

> Neither am I...
> =

>>  Yes, I know that a similar per-package option could be added to all
>>  packages, and I know that we (both you and me) don't want that. My =

>> argument
>>  is that none of the other packages (that I know of) break ABI at =

>> every
>>  single minor version. Only Boost does that, and it makes it =

>> completely
>>  impossible to support old programs.
>> =

>>  I've been doing this trick of compiling static builds of Boost since
>>  Buildroot 2014.05 and the majority of binaries built back then =

>> still run
>>  with my current distribution based on Buildroot 2021.08. Programs =

>> built
>>  against shared Boost would break every 3 months.
> =

> I don't understand what you are saying here. Do you mean that you =

> built
> binaries back in 2014, and drop them in your shinny new system, and =

> they
> still run? That's fine, do that: install pre-built binaries of your
> application: you don't need to build a static boost on the whole =

> system
> for that.

Those binaries built back in 2014 still run now because I already had =

the "static libboost" exception back in 2014. If I didn't have that, =

these binaries would have been linked against the shared libboost, and =

would have been broken as soon as the shared libboost bumped its =

*minor* version - which occurs every few months.

Since these old binaries are not linked against a shared libboost, =

thanks to the "static libboost" exception, they are not the problem =

here.

What I am trying to do, is to make sure that any program compiled today =

against my buildroot SDK won't link against the shared libboost, and =

link against a static libboost instead, to give them a chance to be =

compatible in my distribution for a bit more than a few months.

Note that by "programs" here we're talking about applications and games =

produced by the community, which may be closed-source and very old, =

which means that they cannot be easily recompiled.

> Now, if what you need is a way to initially be able to build those
> programs to start with, and link them statically, so that you can
> install them as binary prebuilt, then build a static-only SDK, build
> your programs, and drop them in your other configuration that has =

> Boost
> available as shared for the rest of the system.
> =

> Of course, unless there is something else I missed (entirely possible
> as I am having a very bad day today and can't think totally right).

I want to link everything dynamically for the flexibility - for =

instance all of our old games (including closed-sources ones) gained =

support for rendering on DRM/KMS through SDL1, just because they were =

dynamically linked against libsdl1.

I only want to link statically against libboost, because it is the only =

library that breaks its ABI at every single *minor* version, while =

every other library breaks its ABI at every *major* version.

Hope that clears any doubts.

Cheers,
-Paul


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
