Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE3C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D93D812C5;
	Sat, 18 Mar 2023 22:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D93D812C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaWxVRK2Pl-D; Sat, 18 Mar 2023 22:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 029B2812EF;
	Sat, 18 Mar 2023 22:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 029B2812EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A78E1BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1656140886
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1656140886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdklGg1OlWTB for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:03:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD51440861
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD51440861
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:03:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E5A460003;
 Sat, 18 Mar 2023 22:03:36 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:03:34 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230318230334.7a73d654@windsurf>
In-Reply-To: <20230317202724.79207-1-ju.o@free.fr>
References: <20230317202724.79207-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679177017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nLseZTQ5oLyoZ283epddkA1NwOXmT482Uo5pgtM3r8=;
 b=RasygsYEvR3vdCwAuzgXswjpIFQ3dBiXSqpbQFJi5odprNesUF1hkZq5oH60/OVjhScVTs
 mm76VWyVyrB4bVxPx4CR7ZFqm843dReaWFi7JbNTeOI5cy2r3bRmFd7o0VKsBRedcB9FZs
 J+A4e3zHxezSzDHU0hG6eVNPj52SOXMshVCOZ1bR7S1fe4oI8q+BRFlHSxmwu+a7vt+xxv
 lgC4kIE9D14D6iey42uTVkC3p0eWGy7rCMHdwTx1ZhPsz6vgBRXtOfrNlBG7rgw5dKYLdC
 QrudrbfM/ZiOidfLcKw4+y8EzRDmX6MvXaJBPcRCBvgjqO4jTywliq6qToMRZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RasygsYE
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi/br-kodi: fix shellcheck
 warnings
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Fri, 17 Mar 2023 21:27:22 +0100
Julien Olivain <ju.o@free.fr> wrote:

> When running "make check-package" on a system with shellcheck 0.9.0,
> the command fails with output:

Thing is our "reference" shellcheck version is 0.7.1, from our
reference Docker container:

$ ./utils/docker-run shellcheck --version
ShellCheck - shell script analysis tool
version: 0.7.1
license: GNU General Public License, version 3
website: https://www.shellcheck.net

Since shellcheck warnings vary between versions, I'm not sure we want
to handle warnings from all possible shellcheck versions.

At least I remember that when Ricardo added the ignore list of
warnings, he did mention that it would be important to settle on a
specific version of shellcheck.

Of course, I'm all open to updating the Docker container to use a newer
version of shellcheck, but what I meant is that we should consistently
use the same version.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
