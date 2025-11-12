Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24063CD3438
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D230382C7D;
	Wed, 12 Nov 2025 19:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hK9b9v22DAFG; Wed, 12 Nov 2025 19:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0887C82C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0887C82C99;
	Wed, 12 Nov 2025 19:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D922230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F57A60E20
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qR5oSBadJUXW for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A675360E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A675360E1C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A675360E1C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:25:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -523007921; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 19:25:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJGT4-00HXAu-34;
 Wed, 12 Nov 2025 20:25:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
References: <20251112093116.481902-1-francois.perrad@gadz.org>
Date: Wed, 12 Nov 2025 20:25:22 +0100
In-Reply-To: <20251112093116.481902-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Wed, 12 Nov 2025 10:31:16 +0100")
Message-ID: <877bvvt5nh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jUXGPv2L7aYekJT+cyJDDpTfs6a7Z/rnSKpOf1TuhNNY/FD0khj7Rq5DZ8WHzetGNzs7h4E7i4K6k3RX0j5EVM7GQBm/qO/QigOZSnrCdGta/9CbQ+kbnpa9Oi/W1ucIxh58/zjinuXyng6omuY2KQb7UhnNQiqDd2zdATm6YlKAIL085xi/3+Ffc6HwTA/jR1zDDm88JlPZLsBBGeLzofbL6kQoYO7hMT9zihDz4h4DSHGuks75TRsWNdq/X7nO9OxUzSKuMAIzVT4iPbeeR3kFvbqRKxkuPT45addGGzCMALYXSmWd/9MqgBPKp6ZOb2ulk33KNMxaPg1FlAihVA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=e1lYfs0KqYYYlL49APvBmBpvV6a+oyLekCPQftElHYI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=jUXGPv2L
Subject: Re: [Buildroot] [PATCH] package/kbd: bump to version 2.9.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

> ---
 >  package/kbd/kbd.hash | 2 +-
 >  package/kbd/kbd.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
 > index 25866751f..d46a60a80 100644
 > --- a/package/kbd/kbd.hash
 > +++ b/package/kbd/kbd.hash
 > @@ -1,4 +1,4 @@
 >  # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
 > -sha256  519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926  kbd-2.6.4.tar.xz
 > +sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 >  sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
 > diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
 > index 953adccd0..8008a9b3b 100644
 > --- a/package/kbd/kbd.mk
 > +++ b/package/kbd/kbd.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -KBD_VERSION = 2.6.4
 > +KBD_VERSION = 2.9.0
 >  KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 >  KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 >  KBD_CONF_OPTS = \
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
