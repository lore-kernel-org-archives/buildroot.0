Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEC8C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9D3C40573;
	Thu, 29 Dec 2022 09:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D3C40573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id He5JXzubw10b; Thu, 29 Dec 2022 09:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC1340102;
	Thu, 29 Dec 2022 09:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC1340102
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2F571BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB43260D4E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB43260D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uZdY2jc1WrT for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A577E60D4D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A577E60D4D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:38:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5D19240006;
 Thu, 29 Dec 2022 09:38:35 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:38:34 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20221229103834.24ad4c8d@windsurf>
In-Reply-To: <20221212095050.14950-1-yegorslists@googlemail.com>
References: <20221212095050.14950-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dK6//CmIFJxbcmo7J3ukdhXFzZLKe674C+g2m1EhWFk=;
 b=PIn2u1pV/hBrjRpEhl1Up4V3VVnU3weJK2Zj5smIyVREJ9ru1a6tNTd5mavujVVbg+qEoY
 zbSNxvB/g0LvBWoV8UtWhw8STaFvd/lYuN5s6lYH3z0HmAJTxvQF5bfssTRcDUtJbS9RP8
 LemZcHBufeLGno0T7k9n4VeO9j+vGl866gsoYHIcLcdx7GvGqy4FQgRRIEUUVzZpmDJvBK
 m3hXUCYnrD+nVew48kOj7395OJGZi3nzinlUma4Ql7q2tvYpNJD6hJ9O384tGWoey8AGul
 fgHRhIoQWFNCujeGigFPUqbM0ugmML3OFC8d8/xXaTF+OESoMQhMk24gfmJc1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PIn2u1pV
Subject: Re: [Buildroot] [PATCH 1/2] package/python-munch: select missing
 runtime dependencies
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Dec 2022 10:50:49 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> munch requires python-setuptools and python-six packages at
> runtime.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-munch/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
