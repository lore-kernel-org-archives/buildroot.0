Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080D0C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5EC760DA5;
	Wed,  9 Aug 2023 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EC760DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNEGdO8kdTVR; Wed,  9 Aug 2023 20:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDD260BD1;
	Wed,  9 Aug 2023 20:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEDD260BD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F32B1BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B4460BD1
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B4460BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIZCPUbfe3DA for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:22:14 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83C0660590
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C0660590
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BFAF37802E5;
 Wed,  9 Aug 2023 22:22:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Aug 2023 22:22:04 +0200
Date: Wed, 9 Aug 2023 22:22:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230809202204.GD421096@scaer>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
 <20230808003527.1469175-4-adam.duskett@amarulasolutions.com>
 <20230808195621.1c5d4242@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808195621.1c5d4242@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691612531;
 bh=42wRMOsK3W5Je7tGbfoq65OVxcc41jhzpraMf295574=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5q7vExcrmOsFg4lTVPyxg7rL5me312qiu/idFYkziPVuIbrpYSeiCzRlTQWAmVVf
 FEANFQ/qbwUWmOmPGMy5TNYCyjP8LOqQUadMSrTwEYlRiLth5iResCsbmxwZV9448e
 RYq1dd4NRIIsjveMZrIRXyhFcAp89oKMTM8iYkA892wV6rAKfL3mrPhrdkwOxABizw
 GZ+1dw4PV6ubCP7M34q2Qx52pVwvCqUCBeNtQ7x2l5ZspqDCYYriia4rQvo1h57Qbe
 2naRXfOSIzlreFg10dagA0QKUgjmprFwOG+wdT/sTUZNhGtQ+WW3MfKBEtvaYg1YxK
 Vw/Bp9Vif4kZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J5q7vExc
Subject: Re: [Buildroot] [PATCH/next vRFCv2 3/3] package/flutter-engine: new
 package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, buildroot@buildroot.org,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-08 19:56 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon,  7 Aug 2023 18:35:27 -0600
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
> > index 0000000000..572c055bea
> > --- /dev/null
> > +++ b/package/flutter-engine/gen-tarball
> > @@ -0,0 +1,108 @@
> > +#!/usr/bin/env bash
> > +# Call gclient and generate a flutter-engine source tarball if one does not
> > +# already exist.
> > +#
> > +# Author: Adam Duskett <adam.duskett@amarulasolutions.com>

Authorship is not needed: it's tracked in git.

Also, it is going to be wrong the moment someone else changes that file.
Using the authorship from git will always be correct, though.

[--SNIP--]
> > +main() {
> > +  parse_opts "${@}"
> > +  if [ ! -e "${TARBALL}" ]; then
> 
> I'm not sure about this condition. Why is there? If the tarball is
> already there, I would expect this tool to re-generate it and overwrite
> it, rather than "do nothing".

Well, we do not redownload an archive if it is already downloaded. This
is what this test does: skip the download if the archive is already
present lcally.

We have the same test package/pkg-gemneric.mk line 190:

    if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then

and in the download wrapper, line 67-onward:

   67     # If the output file already exists and:
   68     # - there's no .hash file: do not download it again and exit promptly
   69     # - matches all its hashes: do not download it again and exit promptly
   70     # - fails at least one of its hashes: force a re-download
   71     # - there's no hash (but a .hash file): consider it a hard error
   72     if [ -e "${output}" ]; then
   73         if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
   74             exit 0

So this test does exactly the same thing.

Regards,
Yann E. MORIN.

> Thanks for this work. Seriously, it looks quite good, and close to a
> state where it can be merged. I think it no longer needs to be in the
> "RFC" state.

Yes, this is a very good work overall, for such a complex stack.

We've been discussing this series on IRC, too, and it looks like there
are missing pieces. Adam will correct me where I'm wrong, but here's
what I understood from our discussion:

 1. flutter-engine is a set of libraries that implement the runtime,
    this is what this package will provide, and flutter apps will have
    to select it and have it in their _DEPENDENCIES;

 2. there is a package, flutter-sdk-bin, that provides a compiler to
    compiler flutter apps into Dart code; we'll need to have it packaged
    as host-flutter-sdk-bin; flutter apps will need to have that in
    their _DEPENDENCIES;

 3. there is another package (which one?) that provide 'flutter', an
    executable that is in charge of starting flutter apps on the target.
    It looks like flutter-pi is such a package, but there might be
    others.

So, if I understood everything (far from granted!), the sequence is
about to look like this:

    flutter app source code
        |
        v
    flutter-sdk-bin to compile
        |
        v
    Dart code
        |
        v
    Target in /usr/share/flutter/app-name

    flutter-pi or other
        |
        v
    Target in /usr/bin/flutter

Then at runtime on the target:

    $ /usr/bin/flutter app-name

So, there are a lot more details to sort out, but it looks like the full
stack is about this shape. More or less... Maybe less than more... Who
knows?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
