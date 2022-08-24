Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEE1C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20AC60E67;
	Wed, 24 Aug 2022 11:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D20AC60E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDd3LXq9P0eQ; Wed, 24 Aug 2022 11:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA8A60C28;
	Wed, 24 Aug 2022 11:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA8A60C28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA4391BF407
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 781048161D
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781048161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZypNtB4HTVWk for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:26:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656B6813FA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 656B6813FA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:26:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3523E240005;
 Wed, 24 Aug 2022 11:26:15 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:26:14 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20220824132614.11268a58@windsurf>
In-Reply-To: <c471e49b-5842-78e7-dd11-5d1371396775@green-communications.fr>
References: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
 <20220808224145.2705f093@windsurf>
 <c471e49b-5842-78e7-dd11-5d1371396775@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661340375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHN8jN9wAjvIf0ZQ2qjI2+lo5eMjnQjt/IUpFyUMgiE=;
 b=oU3gBB60iL3AGdmxQi0gHtuzjrj2aCHM4o/fTfIMFgOEnmtMXJvi6N2KobXnqS1cK0kcuy
 vGho89vN2mewCho2J22yTvPlgAk2MDknjTJSvhgNUv0heRTIzumPsnrOB/5cy4+w99USIw
 HKbzhlVWAeHvP8EJTbVf/VfTMrRiHpv+Ogl+/ZkO2TIrGD+XjTvUkYJuXoAoyWeRwH7lse
 ouS6Hwgy/62yglz1kP93eFcNM/ZLrA9PXuAtb6hEUp6Jq7Gg4JYoPZ6ZY4QeKgyZbuD3Xv
 Xp+/MBoQMlVK2LQBtMxeQxb8Ore2kkdoU05cOXFeVVhrVRpkHS34ODKAo5Cqow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oU3gBB60
Subject: Re: [Buildroot] [PATCH 1/2] package/libgit2: depends on native
 64bit atomics
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

Hello Nicolas,

On Tue, 9 Aug 2022 17:57:16 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> It's a bit more complicated than that and i probably mixed things up.
> 
> libgit2 can use sync builtins or atomic builtins depending on the gcc 
> version.
> 
> But if we assume that the new gcc minimum version is 4.9, then I can 
> probably just ignore the sync builtins.

Looking at src/thread.h in libgit2, we can see:

# if (__GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 1))
#  error Atomic primitives do not exist on this version of gcc; configure libgit2 with -DUSE_THREADS=OFF
# elif (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
#  define GIT_BUILTIN_ATOMIC
# else
#  define GIT_BUILTIN_SYNC
# endif

So basically, with gcc >= 4.7, libgit2 uses atomic built-ins, with gcc
< 4.7, it uses sync built-ins. However neither are guaranteed to be
present on all architectures.

So if we want to be fully correct, we would probably need something
like this:

	depends on (BR2_TOOLCHAIN_HAS_ATOMIC && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7) || \
		(BR2_TOOLCHAIN_HAS_SYNC_4 && BR2_TOOLCHAIN_HAS_SYNC_8 && !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
