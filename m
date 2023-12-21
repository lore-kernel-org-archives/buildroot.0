Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FDEC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 07:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D14740323;
	Thu, 21 Dec 2023 07:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D14740323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMMhzivBOVW0; Thu, 21 Dec 2023 07:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D67241A12;
	Thu, 21 Dec 2023 07:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D67241A12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2A01BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 07:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8DFA4087E
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 07:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DFA4087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pde5MSbmLlkT for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 07:42:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8222740129
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8222740129
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4069C60006;
 Thu, 21 Dec 2023 07:42:53 +0000 (UTC)
Date: Thu, 21 Dec 2023 08:42:52 +0100
To: Davis <davikovs@gmail.com>
Message-ID: <20231221084252.287ba580@windsurf>
In-Reply-To: <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
References: <20231218183230.1899-1-davikovs@gmail.com>
 <20231220212445.16494c0f@windsurf>
 <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703144573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hytqK4L058aFnQM+XzthGtYC+65LEzS/lsO6vlsUG+E=;
 b=PKj++EJP2lrcCH6nFhOVb9tNK4v+frgAqe8OJZAdThMQsGjoLYW+4w8TrIqrfL8xeKoHFE
 s7Lqn0uPXYm5I+l7uRE/vQPUKxkE/ALNJqxm2M5JMYfqco0JIetfBP+2d43RdTstwhjeP9
 me5LWs/rV2zNqd7aoCU04z+91ZkgpslZnI49HvbcmRf8YXU4A7JvXVStBzW+W2S4hN6GEj
 8AWA0zQS81B4X90P6C+wLxQ+19jmYjhMA7/DsZtH/OTiYya350ubgWU4QhNsPC0jQSTn9+
 q908GHHDSiwZiBLhVXDt9GzjjAHRuCxFt5PMxHjpssNvRRDnwazGD5rZwZMuDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PKj++EJP
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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

Hello Davis,

On Thu, 21 Dec 2023 01:31:28 +0200
Davis <davikovs@gmail.com> wrote:

> Can somebody who understands the legal side better sign off this change?
> I sent the patch as discussed here
> https://lists.buildroot.org/pipermail/buildroot/2023-December/681118.html
> The patch itself (the few build configuration lines it adds) was
> created by me in my spare time and I submit it under Buildroot's
> license (GPL 2 or later).

Then, you are able to add your Signed-off-by at the end of your commit
message, and resubmit the patch, that's all what's needed.

Look at all other patches posted to the list, it will show you an
example of what the Signed-off-by line should look like.

There is also a great deal of information on how to submit patches to
Buildroot in our documentation at:
https://buildroot.org/downloads/manual/manual.html#submitting-patches

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
