Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66228C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 202BD80E3B;
	Wed, 29 Dec 2021 09:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhRAwxpO8Hdj; Wed, 29 Dec 2021 09:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E48E80D8C;
	Wed, 29 Dec 2021 09:26:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F41271BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF0744013F
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCA-RHq6ze9d for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9586A40022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:26:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7AA0A20004;
 Wed, 29 Dec 2021 09:26:36 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:26:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211229102635.11cb3e61@windsurf>
In-Reply-To: <20211228220302.2886460-1-bernd.kuhls@t-online.de>
References: <20211228220302.2886460-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: needs host-gettext
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Dec 2021 23:03:02 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Build fails on systems without /usr/bin/msgfmt
> 
> Fixes:
> http://autobuild.buildroot.net/results/3c9/3c9893dd92d784a0520a287c4d4a5e760393c95f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since when is this failure happening? If I understand correctly, it
manifests itself as follows:

/usr/bin/install: cannot stat './vlc.appdata.xml': No such file or directory

I can trace back one such failure at

  http://autobuild.buildroot.net/results/652/652055f4f517e5056d35495fa5e52d72a5e61b6e/build-end.log

which was with vlc 3.0.12, back in February 2021.

Also,

  http://autobuild.buildroot.net/results/fb1/fb12d981f7ebb859618bc17ed5f18a9fee1e98ee/build-end.log

which was with vlc 3.0.11, back in January 2021.

http://autobuild.buildroot.net/results/7e6/7e6f07179ddf3b4cab1445214c064921f2b6f8bd/build-end.log

Same vlc release, September 2020.

http://autobuild.buildroot.net/results/e2b/e2b670ab75e980ab27955c3759854faa9985731b/build-end.log

This is with vlc 3.0.10, in June 2020.

http://autobuild.buildroot.net/results/f80/f80e6c1d7e11144fba8cbcde491c28554e710d06/build-end.log

This is with vlc 3.0.8 in April 2020.

http://autobuild.buildroot.net/results/e9a/e9acb796dd062d7829db9754e209bf349bf459ea/build-end.log

This is with vlc 3.0.7 in August 2019.

This is the kind of research that is needed when fixing such build
failures. We don't need to just fix it, but also figure out since when
the problem has been around, so that we know if we need to backport to
our LTS branch.

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
