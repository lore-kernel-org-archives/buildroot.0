Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D40C3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B003582786;
	Wed, 27 Jul 2022 15:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B003582786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z86gTKwJb_84; Wed, 27 Jul 2022 15:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB44D82730;
	Wed, 27 Jul 2022 15:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB44D82730
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42D001BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6F8605A9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6F8605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-SgU1E4Fiy0 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:43:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFCFE60034
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFCFE60034
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:43:15 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:42:59 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Romain Naour <romain.naour@smile.fr>
Message-Id: <NNROFR.FBROLJPFYDGX1@crapouillou.net>
In-Reply-To: <efe0cf31-54a7-6abc-8034-c440327e644f@smile.fr>
References: <20220620115510.33792-1-paul@crapouillou.net>
 <efe0cf31-54a7-6abc-8034-c440327e644f@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1658936588; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAJC2SFF42sMLeMGlDS4g3LA13o4sI387M/JTfUfmSI=;
 b=wNn5/dcOY19RDYk4gocWrN4F9gDluS7iMtPAmifHl4rCMgh2CMy7oZJ76osVollzkbD2s7
 f5j4+Cgzx95U2J69xPHw/rTd2Ftq54b2usIOXlnJNNjV15dgzJ5LfsjEo4WAb8vC87/5/D
 bXYHkcQ4n4TIRB/Iy21n/jCX25ifbNY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=wNn5/dcO
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

Le mer., juil. 27 2022 at 17:06:52 +0200, Romain Naour =

<romain.naour@smile.fr> a =E9crit :
> Hello Paul,
> =

> Le 20/06/2022 =E0 13:55, Paul Cercueil a =E9crit :
>>  This option can be useful when building for a system that
>>  needs to somewhat maintain compatibility with previously built
>>  software, as Boost is notorious for breaking ABI at every
>>  single release.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   package/boost/Config.in | 11 +++++++++++
>>   package/boost/boost.mk  |  2 +-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>> =

>>  diff --git a/package/boost/Config.in b/package/boost/Config.in
>>  index b99b01f22e..60eb83ff4c 100644
>>  --- a/package/boost/Config.in
>>  +++ b/package/boost/Config.in
>>  @@ -16,6 +16,17 @@ config BR2_PACKAGE_BOOST
>> =

>>   if BR2_PACKAGE_BOOST
>> =

>>  +config BR2_PACKAGE_BOOST_STATIC
>>  +	bool "Build static libraries"
>>  +	depends on BR2_SHARED_LIBS
>>  +	help
>>  +	  Build static Boost libraries.
>>  +
>>  +	  This option can be useful when building for a system that
>>  +	  needs to somewhat maintain compatibility with previously built
>>  +	  software, as Boost is notorious for breaking ABI at every
>>  +	  single release.
>>  +
>>   config BR2_PACKAGE_BOOST_ATOMIC
>>   	bool "boost-atomic"
>>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>>  diff --git a/package/boost/boost.mk b/package/boost/boost.mk
>>  index f6e9a03220..162277b968 100644
>>  --- a/package/boost/boost.mk
>>  +++ b/package/boost/boost.mk
>>  @@ -109,7 +109,7 @@ endif
>> =

>>   # By default, Boost build and installs both the shared and static
>>   # variants. Override that if we want static only or shared only.
>>  -ifeq ($(BR2_STATIC_LIBS),y)
>>  +ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_BOOST_STATIC),y)
>>   BOOST_OPTS +=3D link=3Dstatic runtime-link=3Dstatic
> =

> So in a BR2_SHARED_LIBS configuration, we end up with static boost =

> libraries?

If the option is set, yes.

> What could happens with packages expecting boost shared libraries due =

> to
> BR2_SHARED_LIBS but only get static boost libraries?

Then they would just compile against the static library. Or what do you =

mean?

> Also a similar per-package option could be added to all packages...
> =

> After discussing with Thomas and Arnout, we are not convinced by this =

> patch.

Yes, I know that a similar per-package option could be added to all =

packages, and I know that we (both you and me) don't want that. My =

argument is that none of the other packages (that I know of) break ABI =

at every single minor version. Only Boost does that, and it makes it =

completely impossible to support old programs.

I've been doing this trick of compiling static builds of Boost since =

Buildroot 2014.05 and the majority of binaries built back then still =

run with my current distribution based on Buildroot 2021.08. Programs =

built against shared Boost would break every 3 months.

Cheers,
-Paul


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
