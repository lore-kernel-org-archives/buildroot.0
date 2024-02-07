Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B0C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E6F983841;
	Wed,  7 Feb 2024 08:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuHZrNx-6bSi; Wed,  7 Feb 2024 08:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287E983A4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287E983A4F;
	Wed,  7 Feb 2024 08:58:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6B7F1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B322E40B2E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5IxLyWyMheo for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68E6440A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E6440A59
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68E6440A59
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:58:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A95260009;
 Wed,  7 Feb 2024 08:58:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXdl6-00EwSn-2x;
 Wed, 07 Feb 2024 09:58:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20240207022157.2560531-1-christian@aperture.us>
Date: Wed, 07 Feb 2024 09:58:20 +0100
In-Reply-To: <20240207022157.2560531-1-christian@aperture.us> (Christian
 Stewart's message of "Tue, 6 Feb 2024 18:21:56 -0800")
Message-ID: <87ttmk1wib.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version
 to v25.0.3
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > https://github.com/moby/moby/releases/tag/v25.0.3

This is also a security bump. In fact, it would be nicer to first bump
to 24.0.9 which could then be backported to 2023.02.x and 2023.11.x and
then afterwards bump to 25.0.3.

I see the buildkit issues are not fixed in 24.0.9, but I guess it is
unlikely that we have Buildroot based systems BUILDING containers, so
that is probably less critical.

Care to rework it as two bumps?


> Signed-off-by: Christian Stewart <christian@aperture.us>
 > ---
 >  package/docker-engine/docker-engine.hash | 2 +-
 >  package/docker-engine/docker-engine.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
 > index 931d6529e1..40293be7e0 100644
 > --- a/package/docker-engine/docker-engine.hash
 > +++ b/package/docker-engine/docker-engine.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  16a2cb4cf4d314a070085e0df06e3a6bd9ec678d28715b64060af694fc9051d5  docker-engine-24.0.7.tar.gz
 > +sha256  4cdb516f5d6f5caf8b3bcf93c2962277ba727cfd2d1620176a3bb0cf153b3590  docker-engine-25.0.3.tar.gz
 >  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
 > diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
 > index 262be2df20..066959e0c0 100644
 > --- a/package/docker-engine/docker-engine.mk
 > +++ b/package/docker-engine/docker-engine.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -DOCKER_ENGINE_VERSION = 24.0.7
 > +DOCKER_ENGINE_VERSION = 25.0.3
 >  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 >  DOCKER_ENGINE_LICENSE = Apache-2.0
 > -- 

 > 2.43.0


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
