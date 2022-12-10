Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86ADE403BF;
	Sat, 10 Dec 2022 16:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86ADE403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hzr8PTRPIA6I; Sat, 10 Dec 2022 16:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D142E403A4;
	Sat, 10 Dec 2022 16:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D142E403A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7224E1BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D48581902
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D48581902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TK5SWA4XzgyX for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:27:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506A1817B3
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 506A1817B3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:27:49 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 2BAGRhDf001617
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Dec 2022 17:27:44 +0100
Date: Sat, 10 Dec 2022 17:28:36 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20221210172836.0e872e46@x230_1.trabucayre.com>
In-Reply-To: <07221b04-b25b-1f24-6ad2-872c66a086e7@gmail.com>
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
 <20221209233009.6b003e99@windsurf>
 <07221b04-b25b-1f24-6ad2-872c66a086e7@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] Specific toolchain components version support (was
 Re: [PATCH v2] package/gnuradio: restrict gcc to >= 9.3.0)
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Sat, 10 Dec 2022 17:02:37 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 12/10/22 05:30, Thomas Petazzoni via buildroot wrote:
> > In any case, we need to patch out, because we can't express a
> > dependency on >= 9.3.0 in Buildroot, we can only express a dependency
> > on >= 9.x.
> >   
> 
> If we go down to x.y requirement of toolchain components, we also need
> to be able to select specific x.y (minor release) components version
> when building the Buildroot toolchain. For example, someone targetting
> Raspberry Pi 4 may require GCC 10.2.0, Binutils 2.35.2, and glibc 2.31
> (these are versions used in Debian/Raspberry Pi OS 11). Linux kernel
> headers are unaffected, since even custom tarball containing exact
> kernel version can be specified.
> 
It's my fault: not a closer look to when std::filesystem was introduce and followed
gnuradio's commit instead of checking gcc releases.

Sorry for the noise...

Gwen


> Cc'ing Yann and Arnout to help sorting this out.
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
