Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7477CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1707F842A1;
	Sat,  9 Apr 2022 16:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_zaDHEqEo_g; Sat,  9 Apr 2022 16:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F07E48422D;
	Sat,  9 Apr 2022 16:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A043F1BF59C
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C34540320
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 16:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFaHXzjU0z9X for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 16:09:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F90840124
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 16:09:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:10c3:7744:3dd:93e7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AFF0419F593;
 Sat,  9 Apr 2022 18:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649520567;
 bh=RzyKC/CR5TXXco3tLw1En1VxEfmYSjZoPtjCfKF3rqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=om69YId6dTi7oIbOS4tj0dISDjfzotf31Cj8EBqmVdXZOSwDLZyLwAJUdAT9R8RYj
 Metp81w6f7bu7hdrI43kjWnJzDNbl2A3wYtUejnanL8ar3YtHWeli7P/KfCKbGEH7q
 4fO/eRd90xUBbJwU1wMjKhCaaXz6WR1YilDQ0HvOpsORGdNGOv4JIR4ssVBa6hs+pr
 DwZbf83fAMz/gKkP1fmpGFO8nbqu7tvegxbHEMs7l1IKbuRBEJ9fVnkYukn2/G5YTZ
 S1B8FpgsihGtitn4yKHwNqOO1n2ZQI4JEDiNLhTOor8m65/R5jMDI7UZbZAdl10dkk
 9wk9S9dT82M8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Apr 2022 18:09:21 +0200
Date: Sat, 9 Apr 2022 18:09:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220409160921.GA3547512@scaer>
References: <20220331132230.227424-1-br015@umbiko.net>
 <eb0cfc91-7c2b-875f-9e2d-a8e8a0a8291f@mind.be>
 <9d97e0d4e0d90badb3339638aa7e453d@umbiko.net>
 <185b80c4-9083-c5f9-a555-f28183160b11@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <185b80c4-9083-c5f9-a555-f28183160b11@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] User-visible Config.in feature sub-options [was:
 Re: [PATCH 1/1] package/mpd: explicitly disable features to avoid collision
 with host packages]
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Andreas, All,

On 2022-04-09 17:41 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/2022 15:22, Andreas Ziegler wrote:
> >Outline of the proposed next version of this change:
> >[I did not want to make so many changes, but you are right, it makes sense.]
> >Separate logic from implementation: Remove feature dependencies from
> >mpd.mk and put selection logic into Config.in exclusively.
>  As you can see from the description above: this is making things quite
> complicated. And one of the tenets of Buildroot is to keep things simple.
[--SNIP--]
>  We don't have a consistent policy for this case, but I believe the policy
> should be:
> 
> - Add Config.in options only for features that are important, meaningful for
> the user (e.g. codec support).
> 
> - Add Config.in options only for features that have a size impact (usually
> due to the dependencies they pull in).
> 
> - In the .mk file, don't use the Config.in options but instead use automatic
> dependencies only.

That would be very confusign from a user perspective: they would not
enable a feature of a package, yet the package would have that feature
enabled if th3e depedency is enabled.

Besides the technical surprise, this could also lead to licensing issues
if the combination of the two packages require special handling (e.g.
because the library license propagates top the package).

So, the settings from Config.in must be abode by.

> That way, the .mk file is kept simple (no problematic cases like the
> libupnp/expat interaction in this patch). The Config.in is a bit
> complicated, but it doesn't explode.
> 
>  Bottom line: I think it's actually the reverse that needs to be done.

Err. I don;'t understand what you meant here... :-(

> >In the makefile, a feature is responsible only to select or deselect its
> >configure option and, if this feature relies on a library, add a
> >dependency on this.
> 
>  So I think the .mk file should simply contain things like:
> 
> ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
> MPD_DEPENDENCIES += libvorbis
> MPD_CONF_OPTS += -Dvorbis=enabled -Dvorbisenc=enabled
> else
> MPD_CONF_OPTS += -Dvorbis=disabled -Dvorbisenc=disabled
> endif
> 
> and BR2_PACKAGE_MPD_VORBIS only has an indirect effect, by selecting
> BR2_PACKAGE_LIBVORBIS.

I highly disagree; the conditional should be on the package setting, not
the dependency.

> >Duplicated selection logic in mpd.mk will be eliminated. A build
> >dependency will only be added if it is present in the mpd configuration,
> >and not be inherited accidentally from concurrent packages.
>  So this is exactly the reverse of what I'd want. I think it makes the .mk
> file harder to maintain for no practical gain.

Yet, the proposal by Andreas is I believe the correct way to handle the
situation.

> >This impacts the following features: expat, id3tag, yajl. id3tag already
> >is half implemented, but not used consistently (has an option entry in
> >Config.in, but does not select this, but handles dependencies
> >individually). expat and yajl would be created as hidden options without
> >visibility (no user interaction necessary).
>  Yes, that would indeed be an alternative to keep the .mk file simpler. I
> take it you mean to add a blind option BR2_PACKAGE_MPD_EXPAT that gets
> selected by the other MPD options that rely on expat. This indeed simplifies
> things, but it is still a bit more complicated than what I propose.

But more correct.

> >Separate vorbis decoder and encoder options; currently the decoder feature
> >BR2_PACKAGE_MPD_VORBIS enables both ogg/vorbis decoding and ogg/vorbis
> >encoding, which is probably not intended.
>  I don't see a reason why you would want only one or the other. It has
> virtually no impact on size.

Indeed here, vorbis support should just enable both the encoder/decoder.

The only reason that we might want to be able to chose, is if enabling
one or the other have different requirements: extra size requirements,
extra dependencies, legal issues in your jurisdiction, etc...

>  In summary, I think we have the following three options for packages where
> we decide we want user-visible sub-options.
> 
> - 1-to-1 mapping with the package configure options. Interaction between the
> options is expressed with select/depends in Config.in. The .mk file simply
> maps the Config.in options. If it's really not relevant for the user, a
> Config.in option can be made blind. This is what Andreas proposes.

I am OK with that.

> - Only automatic dependencies in the .mk file, except in cases where it has
> an important size or behaviour impact. Add Config.in options only in case it
> is relevant. This is what I propose.

I am OK with the principle, but this does not look like what you
proposed above, as the build-dependencies would be on the dependency
being enabled, not the package option (e.g. BR2_PACKAGE_MPD_VORBIS vs.
BR2_PACKAGE_LIBVORBIS as you showed above).

> - Add Config.in options for important features. Express interdependencies
> between package configure options in the .mk file. This is the current
> situation for mpd.

I don;t see a difference here: "Add Config.in options only in case it is
relevant" and "Add Config.in options for important features" are exactly
the same in mny eyes...

>  So let's see what the other maintainers think. If you (or the other
> maintainers) don't agree, we can compromise and go back to the original
> patch (with just the npupnp/expat situation resolved).

So, I'll summariser my position:

  - add Config.in options when it makes sense:
    - important size delta
    - legal issues
    those options select the appropriate packages

  - in the .mk:
      - add conditional blocks based on those options, add build
        dependencies as appropriate;
      - add conditoinal dependencies on package for automatic
        dependencies

>  Ideally I'd like the maintainers (and anybody else, really) to come to a
> decision here and eventually formalize it in the manual. Because it's not
> the first time this discussion crops up.

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
