Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBDCC05027
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 13:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B88A60D91;
	Thu, 26 Jan 2023 13:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B88A60D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbSlYAr5bbpP; Thu, 26 Jan 2023 13:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6821960BCD;
	Thu, 26 Jan 2023 13:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6821960BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68C211BF48D
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 13:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4248960BB4
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 13:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4248960BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bAv3AbAEONQ for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 13:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A920A60B70
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A920A60B70
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 13:34:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bk15so5024245ejb.9
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 05:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJTL9yUDZgKw7qnG3gjslVikGrVZ5q7inWUzsNWugok=;
 b=5ibemLNe3Z6m2BW1xKUHMNmSFqKMtZTngx7bV2LABbLXtkNetJTO4Ymgwe5lBIsoVf
 dqBjVxvvViDYDwHRRlPfpVwzYyB4Al8V4mUPdepMW0K6/hZ3Bi+lAfz1p7L7VJsqJJqq
 BMPiey4W0mAYlTS1UEqp34egvprB+1uG8aXCOqeg8giioquHJc70Yc1B4i9NbAPJXjEp
 2jsKmguF1+msUmwzL0MMWp8XiJG3ReSePwZPN0URzcLNXotDM3zaHoX/XxRNDAWifJel
 o6jO5muD+vMQMFlMVxfXY2lRj+JCWhXQ44aVtBtjSeOjrjBFCiYirGdZtxM74LQ5qscv
 ttZg==
X-Gm-Message-State: AFqh2kraJduIR2K0LGEN/qYp1EzfUDgyYt3JnX3V7vhGzoH7Mnn9uSKn
 IWXNKhpWtTAtNlAnL8ok47oeuFeG9t6mED0iRF6NbKT47LSpmrFteVlQyg==
X-Google-Smtp-Source: AMrXdXsE1CgU98RACZeAceLih6552s+/ZerY8HGJNZTujqqzzj/+m+aPYJTT1UQcpDFSsJCOpV2tpACPmYjlgiix9Z0=
X-Received: by 2002:a17:906:dc07:b0:84d:46ca:2f4e with SMTP id
 yy7-20020a170906dc0700b0084d46ca2f4emr4639352ejb.303.1674740086803; Thu, 26
 Jan 2023 05:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20230119143408.1911081-1-dse@thaumatec.com>
 <0c911dfb-083b-f5f0-c165-a665fc92006f@theobroma-systems.com>
 <167447511035.42371.11532947092483800306@Monstersaurus>
 <4f8c8871-d5cb-ccba-4e15-693f9c9f0a50@theobroma-systems.com>
 <167455753865.42371.11276435396637417985@Monstersaurus>
In-Reply-To: <167455753865.42371.11276435396637417985@Monstersaurus>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Thu, 26 Jan 2023 14:34:35 +0100
Message-ID: <CAHgnY3nAe2pF92SH42tCeywS581h=FRkpROLDGcJ7k6VuugAdw@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RJTL9yUDZgKw7qnG3gjslVikGrVZ5q7inWUzsNWugok=;
 b=NWY/urT5BYGzqJMjfptf0ni4bgsgEWLmE5Y56aeIzt/bOBjlpNZxHMdJR3G5F1kMC2
 yu4kUe94ww9iv1qwovKvV+QdoQjIA0NcaX6brt1jANTSlmRK+NklbWOEpYL9NoOjFjJy
 RRHTBF6+WO7ycJG7UTxTMzHRWAyCBarQ1MxO7xFnUvQ3gAkVePciOypww0hwIjZqIFYx
 2GHSQRLBtUx1IrdZ9kLiXxCQxfLffNGqdCAtYfJRrrJ4Oxwt42ERIoSvOSWuplXTs8C2
 oSZbMN26GWYsnWmcQa+i1AbfsIvSRkE4OccRhMS9ncGjEKEqMLMRXzmKcTfjVPlk1cdy
 EXDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20210112.gappssmtp.com
 header.i=@thaumatec-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NWY/urT5
Subject: Re: [Buildroot] [PATCH] package/libcamera: Bump to version 0.0.3
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 marcus.folkesson@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jan 24, 2023 at 11:52 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Quentin Schulz via buildroot (2023-01-23 13:25:52)
> > Hi Kieran,
> >
> > On 1/23/23 12:58, Kieran Bingham wrote:
> > > Quoting Quentin Schulz via buildroot (2023-01-23 10:57:16)
> > >> Hi Daniel,
> > >>
> > >> On 1/19/23 15:34, Daniel Semkowicz wrote:
> > >>> Libcamera recently started to version the software, so use the
> > >>> version tag instead of raw commit hash.
> > >>>
> > >>> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > >>> ---
> > >>>    package/libcamera/libcamera.hash | 2 +-
> > >>>    package/libcamera/libcamera.mk   | 2 +-
> > >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> > >>> index 68c9c1f005..033e318910 100644
> > >>> --- a/package/libcamera/libcamera.hash
> > >>> +++ b/package/libcamera/libcamera.hash
> > >>> @@ -1,4 +1,4 @@
> > >>> -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
> > >>> +sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
> > >>>
> > >>>    # license files
> > >>>    sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> > >>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > >>> index 9c03d3a3b3..8979a43aca 100644
> > >>> --- a/package/libcamera/libcamera.mk
> > >>> +++ b/package/libcamera/libcamera.mk
> > >>> @@ -5,7 +5,7 @@
> > >>>    ################################################################################
> > >>>
> > >>>    LIBCAMERA_SITE = https://urldefense.com/v3/__https://git.linuxtv.org/libcamera.git__;!!OOPJP91ZZw!gtcDP1maf3PoJO88myqzbBZyOhNYHg7g4jGwno19jy5tFEHRgUuyBqm2zECw5wQOF6S4k8pRivumP5qJXTknCnAEvbE$
> > >>> -LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
> > >>> +LIBCAMERA_VERSION = v0.0.3
> > >>
> > >> I would actually advocate against using git tags, they are not
> > >> guaranteed to be stable over time (one can remove or move a tag), as
> > >> opposed to a git hash which is guaranteed to be.
> > >>
> > >> Can you use the commit hash please?
> > >
> > > Tags seem more convenient to me! - If you're not going to use the tag
> > > points, why am I bothering to make tagged releases? I could go back to
> > > just saying 'always use master as the latest release' if SHA1's are the
> > > release point.
> > >
> >
> > git tags aren't necessarily related to software releases, they just
> > happen to be. You could very well have releases without git tags though
> > that makes it quite difficult to know when a new release is out or to
> > know which commit exactly is a "release".
>
> Indeed, they're convenient, and at least 'signed' to verify too.
>
> > Just FYI, git tags are not allowed in Yocto officially maintained
> > layers. This has something to do with Yocto enforcing tag re-fetching,
> > thus requiring network access, breaking the ability to build offline.
>
> Ah I wasn't aware of that. I'm not sure I've seen much traffic from
> Yocto packaging libcamera recently though. Not through my inbox anyway.
>
>
> > > While, yes - tags can be deleted. I expect that any signed-by-me tag (or
> > > any other future libcamera release maintainer) is the correct tag for
> > > that release point. I would not expect to delete any tag once pushed to
> > > a public host.
> > >
> >
> > Expectations vs reality. People do all kinds of weird stuff. I was not
> > specifically talking about tag deletion but tag being moved. git hashes
> > aren't spared the deletion issue either (e.g. force-push to the git
> > branch). Considering I've seen this happen before, it's not an
> > hypothesis (that was a proprietary downstream project though). While I
> > appreciate with your experience with upstream projects you would know
> > that moving tags is really a bad idea, I was merely just pointing out a
> > pitfall of using git tags for builds that most people would like
> > reproducible.
>
> I understand. I'd happily state that for libcamera, we expect a
> (release) tag to be constant and immutable.
>
>
> > >> @Kieran: do you have manually generated tarballs for versions somewhere
> > >> so we could use this instead of a git repo?
> > >
> > > Do other projects honestly create manually generated tarballs?
> > >
> >
> > I was just asking if there was one already available. I was not
> > requesting one :)
>
> It's a recurring question though.
>
> So it turns out cgit /can/ provide these, but we must have it disabled.
> It might be feasible to enable it - but these will be unsigned.
>
> > > As in ... does the maintainer create a .tgz and scp it somewhere or some
> > > such?
> > >
> > > I would expect this can all be handled by git... - in particular, IMO -
> > > the signed tags I push are what I expect to be possible to validate and
> > > verify. Is it that the core issue here is that cgit isn't providing a
> > > tarball?  (while Github does?)
> > >
> >
> > Buildroot validates the sources it gets anyways with the hash. So moving
> > the tag will break the builds on systems where the repo is not already
> > in cache in BR2_DL_DIR.
>
> Yes, I would expect the existing validation to prevent it going
> unnoticed, so I don't think I see any specific issues, (other than the
> below...)
>
> I expect that it's the responsibility of whomever does the update to
> validate that the release is correctly signed?
>
> > Yocto has a strict requirement on automatically generated tarballs,
> > GitHub being one the tools generating them. Try to contribute a package
> > using GitHub archives/releases and I can guarantee you one of the first
> > comments you'll receive is that they don't want it, use git hashes
> > instead. Now, I see that Buildroot does not have the same restriction
> > since the github function is used to fetch releases. c.f. `git grep -A1
> > -B1 "_SITE.*github" | grep "tar\.` for a list of impacted packages, and
> > https://git.busybox.net/buildroot/tree/package/pkg-download.mk#n63 for
> > the implementation.
> >
> > AFAIR, it has to do with tarballs sometimes being recreated in the
> > future and, depending on the tool being used by GitHub or whatever, the
> > checksum changes (e.g. tarball creation date somewhere in the headers,
> > tarball tool version number in there, you name it, ...), breaking old
> > trees/projects.
>
> I can see how 'automagically' generating tarballs like this could be an
> issue. Changing the compression ratio or other internal parameters
> perhaps would then create a checksum failure.
>
> That would be caught by buildroot of course, and would require
> re-autheniticating / validating that the source is from the correctly
> signed release.
>
>
> > The issue in Buildroot is that the tag won't be re-fetched (while
> > re-fetching is enforced in Yocto for example), so you might have two PCs
> > building different git hashes because someone moved the tag upstream in
> > -between builds, c.f. the docs:
> > """
> >       due to local caching, Buildroot will not re-fetch the repository,
> > so people who expect to be able to follow the remote repository would be
> > quite surprised and disappointed;
> >      because two builds can never be perfectly simultaneous, and because
> > the remote repository may get new commits on the branch anytime, two
> > users, using the same Buildroot tree and building the same
> > configuration, may get different source, thus rendering the build non
> > reproducible, and people would be quite surprised and disappointed.
> > """
> >
> > The first mail was just out-of-habit with what usually happens when
> > reviewing recipe patches on the Yocto ML. I understand that Buildroot
> > works differently and git tags may be enough for you/Buildroot maintainers.
>
> At the moment, I plan to provide signed-git-tags. It's up to the
> distributions and builders from there ;-)
>
> As long as things can be mostly automated, I don't mind doing extra
> steps, but they need some justification, so that I'm not doing manual
> processing to support debian/fedora/buildroot/yocto/arch/everyone else
> separately.
>
> --
> Kieran

Hi,

I looked through other buildroot packages that use git as the fetching
method and it looks it is common to use git tags if available.

I understand it is usually better to limit the number of assumptions
in the system to lower the risk of error, but it also usually comes with
lowered comfort. As this practice is already widely used in the
buildroot, I would go for more convenience and prefer to use tag instead
of the commit hash in this case.

Best regards
Daniel Semkowicz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
