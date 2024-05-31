Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7202C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 17:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5680A4242F;
	Fri, 31 May 2024 17:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qqt7Go4nY4vu; Fri, 31 May 2024 17:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4E942433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4E942433;
	Fri, 31 May 2024 17:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 201AC1D556F
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B01F4243C
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUgLMTT7le6S for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 17:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DDFD42434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDFD42434
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DDFD42434
 for <buildroot@buildroot.org>; Fri, 31 May 2024 17:30:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50B19FF807;
 Fri, 31 May 2024 17:30:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD65H-00FInT-1L;
 Fri, 31 May 2024 19:30:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240527134505.4017771-1-kieran.bingham@ideasonboard.com>
Date: Fri, 31 May 2024 19:30:31 +0200
In-Reply-To: <20240527134505.4017771-1-kieran.bingham@ideasonboard.com>
 (Kieran Bingham's message of "Mon, 27 May 2024 14:45:05 +0100")
Message-ID: <8734pxnb2g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kieran" == Kieran Bingham <kieran.bingham@ideasonboard.com> writes:

 > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
 > ---
 >  package/libcamera/libcamera.hash | 2 +-
 >  package/libcamera/libcamera.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
 > index 1ae74b3b18c4..1566356b9991 100644
 > --- a/package/libcamera/libcamera.hash
 > +++ b/package/libcamera/libcamera.hash
 > @@ -1,4 +1,4 @@
 > -sha256  f9c3e949f9d6a42e29322833e57a0e6e8c54655507c820636470ea597e767fd8  libcamera-v0.2.0-git4.tar.gz
 > +sha256  1e0a3feff93577a30bcd4e67aa4c1969aecabcd90f78f540a637bb77553c5a7d  libcamera-v0.3.0-git4.tar.gz
 
 >  # license files
 >  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
 > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
 > index eecbaa44b91e..dfcd340b75a0 100644
 > --- a/package/libcamera/libcamera.mk
 > +++ b/package/libcamera/libcamera.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
 > -LIBCAMERA_VERSION = v0.2.0
 > +LIBCAMERA_VERSION = v0.3.0

Committed to next, thanks.

No new configure options for Config.in?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
