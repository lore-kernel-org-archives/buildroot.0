Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4818C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 13:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF554167E;
	Sun,  7 Aug 2022 13:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF554167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dwg6c91WIYWF; Sun,  7 Aug 2022 13:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB84841686;
	Sun,  7 Aug 2022 13:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB84841686
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8941BF3CD
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AFCB404AE
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AFCB404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 550YsGXBSpAx for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 13:55:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 063E2400B9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 063E2400B9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 13:55:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE4E71BF204;
 Sun,  7 Aug 2022 13:54:57 +0000 (UTC)
Date: Sun, 7 Aug 2022 15:54:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220807155456.0be10777@windsurf>
In-Reply-To: <20220727071557.3434892-1-james.hilliard1@gmail.com>
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659880499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G5s8KabiX+7iPHbVC7YgMIj7NLE155/A5wV0GWSKEg=;
 b=SLjUqMjhsALWxTsdlGIvv8tVZ22ugz+rPgpqKKCvub5Tmqbz29iADKmo6QgHemADNlLGdl
 PZbA4jed9Qw7AsmGyn0JTEKNG+jpod3Uw7cvqRKj/0/7Nhs4rHMIsFvo+e2AxWf+4kd5yG
 NM8x4B54FTS1LKAZ1BgOtDG00Fawufjhcldh1OLQsPUIsfvBWNIvJAJuICaYyOzQF1HC5M
 VdgepHRHW5Gx/LcWFoyFjLsJXa6QFp9dEoEoupYbS/8kqDndvs+jymjKxJrheqJwTcGhlH
 3K119VrZpw8K5dNze5HNUHI61u4SUC8hLln5c34glTaW6bmVLGw3IJSxnkVyOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SLjUqMjh
Subject: Re: [Buildroot] [PATCH v5 1/2] support/misc/toolchainfile.cmake.in:
 don't set PKG_CONFIG_SYSROOT_DIR
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 27 Jul 2022 01:15:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This doesn't appear to be required and seems to break for packages
> using meson's pkgconfig.relocatable format.

Thanks for your contribution. However, if you want us to merge this can
of contribution needs much, much, much better commit logs and
explanations.

An explanation that starts with "this doesn't appear to be required"
and continues with "seems to break" is the opposite of a convincing
explanation.

Here is the sort of commit log that we need:

"""
Defining PKG_CONFIG_SYSROOT_DIR in the CMake toolchain file is not
needed because it is already passed...

In addition, passing this in the CMake toolchain file causes breakage
of the following defconfig, once meson's pkgconfig.relocatable is
enabled, with the following failure:

[...]

This failure occurs because ...
"""

Note: I agree that passing PKG_CONFIG_SYSROOT_DIR in the CMake
toolchain file is probably not needed because our pkg-config wrapper
already passes the right value. However, I fail to see how that can
make a difference. How something in the CMake toolchain file can affect
the build of Meson based packages?

We very much appreciate all the improvements you are submitting, many
of them are very relevant and very useful. However, to have them
merged, we need detailed and convincing argumentation, no vague commit
logs that seem to indicate the change is actually papering over a
problem rather than addressing it for real.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
