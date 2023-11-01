Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2044C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFCE82327;
	Wed,  1 Nov 2023 18:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFCE82327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tpiRyo6gYuA; Wed,  1 Nov 2023 18:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C6382368;
	Wed,  1 Nov 2023 18:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C6382368
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C628E1BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC6AC70470
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC6AC70470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBKJISpQFBxr for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:06:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45CDA70483
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45CDA70483
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0664420002;
 Wed,  1 Nov 2023 18:06:26 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:06:26 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101190626.06c5f6c9@windsurf>
In-Reply-To: <20231017173611.2881905-2-adam.duskett@amarulasolutions.com>
References: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
 <20231017173611.2881905-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698861987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixCT4zefkcNWw5dLe8bdynQNZ9e5UpaXCW1R7kscgcQ=;
 b=GAcflTJ5pVg0PzIMnq9ESGQIC+1NldE+bbiWMhsze+1eNcg+Iz8O+RvDXFFgLq4lzjJGTI
 8IfO+BPn1l9q0abUDjTJ3+yME0NqKwG4DCwJ4Ule+rGOhu0NeYl+TvW4+9FxyCFK3SOeTb
 qYKsntvwFfGFvNcJzHWUuENUcBDD0NI2cMYx96yChe8wdd2DEZVFzqH7oVrf8vt776utVZ
 L3qkASV61e0tl+g7CLR809ZbjsFJKe4MLPQN0si05T0sPaPyf9qzSWIRbrG6cHEIYXZi0J
 lWKinozCogKR+fN3PjApE4rENnQs7QAIVXNUapldHfmuqAlvoprjAX6Sbl1KhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAcflTJ5
Subject: Re: [Buildroot] [PATCH 2/2] package/openjdk{-bin}: Drop OpenJDK11
 and add OpenJDK21
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 Oct 2023 19:36:11 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> OpenJDK 21 is out and with it, OpenJDK11 is now EOL.
> See: https://endoflife.date/oracle-jdk As such, drop support for 11 and do the
> following:
> 
>   - The 0001-Add-ARCv2-ISA-processors-support-to-Zero.patch patch now applies to
>     both 17 and 21. Move it out of the version-specific directoriy.
> 
>   - BR2_OPENJDK_VERSION_LTS is now set to 17.
> 
>   - BR2_OPENJDK_VERSION_LATEST is now set to 21.
> 
>   - Drop --disable-hotspot-gtest as it has been removed, and was ignored in 17.
> 
>   - Add two separate HOST_OPENJDK_BIN_VERSION defines in openjdk-bin.mk as
>     there is not a point release yet for OpenJDK 21.
> 
>   - Update the expectedVersion variable in JniTest.java from 0x000A0000 to
>     0x00150000
> 
> Tested with:
> ./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .checkpackageignore                                |  2 +-
>  package/openjdk-bin/openjdk-bin.hash               |  8 ++++----
>  package/openjdk-bin/openjdk-bin.mk                 | 11 ++++++-----
>  ...-Add-ARCv2-ISA-processors-support-to-Zero.patch |  0
>  package/openjdk/Config.in                          | 14 ++++++--------
>  package/openjdk/openjdk.hash                       |  2 +-
>  package/openjdk/openjdk.mk                         | 13 +++++++------
>  .../openjdk/package/openjdk-jni-test/JniTest.java  |  2 +-
>  8 files changed, 26 insertions(+), 26 deletions(-)
>  rename package/openjdk/{17.0.8.1+1 => }/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

I've added a Config.in.legacy entry for BR2_PACKAGE_OPENJDK_VERSION_11,
and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
