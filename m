Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565A6C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F39D82C7C;
	Wed, 10 Jul 2024 20:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDgdozwAGQ8C; Wed, 10 Jul 2024 20:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379718343E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379718343E;
	Wed, 10 Jul 2024 20:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 062BC1BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 006B1607DE
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1lHHy_Q9_hE for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73271606A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73271606A2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73271606A2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:06:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70EF140002;
 Wed, 10 Jul 2024 20:06:21 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:06:20 +0200
To: "Michael Nosthoff" <buildroot@heine.tech>
Message-ID: <20240710220620.6ae4b41f@windsurf>
In-Reply-To: <27bb6-668eac00-5-6e811900@44543821>
References: <20240710081348.60978-1-buildroot@heine.tech>
 <20240710104842.16dbf85c@windsurf>
 <25518-668e5180-5-147108a0@236288521>
 <20240710163928.4fd390b1@windsurf>
 <27bb6-668eac00-5-6e811900@44543821>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720641981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDtnTCFUgMyq+f+9oXmyrtu1TNP3UCiuudwdNzV6r/s=;
 b=nU22BVDOrnMie9FqCrYkK3apCC0wac0ymjvRhZp5Q+7bL6ysFPsoHTE7YIt8U/sg95qCyF
 aOZoF8rRzGRyXjcFC31qstpny07Hs6auQ+xTviJxIJZXLUz3wEE5tbjrs3AGa+duQ68Ni4
 JT0SzSMZOsRb7+8jbrsNhfUrBg1SD+cmLHA5ax9o8uNg3bAyTtPiBiyyqZkEDkAOy5ypc6
 QgQd7cwQJe5z4Jq3By1zbbSnvlHMZlOvPwygKB4/2mocPyQaRK8tOVpxBeocAZL8AgmJJZ
 ehorAfTRbrVH89mjnhsu8hGXsooMhIuB95JP+sK1FIvhXdwNSUrY1aKeBUlY8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nU22BVDO
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: new  package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 10 Jul 2024 17:42:28 +0200
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> > We need a gcc version check. Which version depends on which C++11
> > features are used. Some packages need gcc 4.7, some gcc 4.8, some gcc
> > 4.9:  
> 
> then I will prepare a patch for this package.

OK. Make sure to figure out exactly which gcc version is needed :-)

> that's what I feared. Do you have some advice on how to test with gcc
> 4.7/4.7/4.9? The oldest toolchain on bootlin I can find is gcc 5.4.
> Is there any other toolchain located somewhere with an older gcc?

You can find a collection of old toolchains
at http://autobuild.buildroot.net/toolchains/tarballs/ for example. 
But not sure they are sufficiently old in fact :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
