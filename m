Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49E6D68B33
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52D568057E;
	Thu, 14 Nov 2024 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqjkVFeIJSVP; Thu, 14 Nov 2024 16:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F090811DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F090811DF;
	Thu, 14 Nov 2024 16:03:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E4B968
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1961605E8
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TM-ac45fnOq for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 456C2605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 456C2605D7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 456C2605D7
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:03:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51ED11BF206;
 Thu, 14 Nov 2024 16:03:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBcJx-002R8x-2L;
 Thu, 14 Nov 2024 17:03:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241028223754.2462242-1-bernd@kuhls.net>
 <877c97yujm.fsf@dell.be.48ers.dk>
Date: Thu, 14 Nov 2024 17:03:49 +0100
In-Reply-To: <877c97yujm.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 13 Nov 2024 17:20:45 +0100")
Message-ID: <87ttc9x0nu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libpng: fix arm soft-float
 build
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> Bumping libpng to 1.6.44 with buildroot commit
 >> 583bb434ffe1eec0dbf6887dd719c3f41a6253e9
 >> causes a build failure on arm because the NEON code is only available
 >> for softfp and hardfp ABIs, and not soft-float.

 >> Fixes:
 >> http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/

 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> ---
 >> v2: updated LIBPNG_CONF_OPTS (Thomas)

 > Committed to 2024.02.x and 2024.08.x, thanks.

We unfortunately still have a number of autobuilder issues on
arm(eb). It looks like we may need to pass -mfpu=neon in CFLAGS.

Is that something you can have a look at doing?

I didn't want to hold up the 2024.02.x release and the 1.6.44 bump is
not really that important, so I've reverted it for now for 2024.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
