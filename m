Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA81C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C2C042368;
	Sat, 11 Dec 2021 10:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHdbWifu9fE0; Sat, 11 Dec 2021 10:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2257242364;
	Sat, 11 Dec 2021 10:03:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43D2B1BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E85842367
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpGR87VHs-CY for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9C9642364
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:02:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AC0B960012;
 Sat, 11 Dec 2021 10:02:45 +0000 (UTC)
Date: Sat, 11 Dec 2021 11:02:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211211110244.657828c0@windsurf>
In-Reply-To: <5c132e20-a74d-8505-18f5-9935d8cbca8d@mind.be>
References: <20211114175310.30573-1-dariobin@libero.it>
 <5c132e20-a74d-8505-18f5-9935d8cbca8d@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RESEND, 1/1] package/davinci-bootcount: new package
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Sat, 11 Dec 2021 10:02:31 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >   package/Config.in                                |  1 +
> >   package/davinci-bootcount/Config.in              | 11 +++++++++++
> >   package/davinci-bootcount/davinci-bootcount.hash |  2 ++
> >   package/davinci-bootcount/davinci-bootcount.mk   | 15 +++++++++++++++  
> 
>   It would be nice to add yourself to the DEVELOPERS file [1] for this package. 

I don't think it's "nice". To me, it is mandatory now to be added in
the DEVELOPERS file when contributing a new package. When I merge a
patch adding a new package, if the contributor has forgotten the entry
in the DEVELOPERS file, I always add it when applying.

>   Please use two spaces between the columns in the hash file (this is something 
> we haven't documented yet, unfortunately).

It is documented. See
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash
in the Buildroot manual, which states:

  The format of this file is one line for each file for which to check
  the hash, each line with the following three fields separated by two
  spaces:

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
