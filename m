Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66CEC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 11:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CDD81839;
	Mon, 23 Jan 2023 11:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02CDD81839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRIE7IAjAuc8; Mon, 23 Jan 2023 11:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383AB8174D;
	Mon, 23 Jan 2023 11:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383AB8174D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71931BF319
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 11:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6084093D
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 11:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6084093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCHEokv7O4Ap for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 11:58:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFAB840942
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFAB840942
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 11:58:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A35372B3;
 Mon, 23 Jan 2023 12:58:32 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <0c911dfb-083b-f5f0-c165-a665fc92006f@theobroma-systems.com>
References: <20230119143408.1911081-1-dse@thaumatec.com>
 <0c911dfb-083b-f5f0-c165-a665fc92006f@theobroma-systems.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Daniel Semkowicz <dse@thaumatec.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, buildroot@buildroot.org
Date: Mon, 23 Jan 2023 11:58:30 +0000
Message-ID: <167447511035.42371.11532947092483800306@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1674475112;
 bh=dDkXCDPBLx5NUoUOZFvKkdxowQ2Nfsm05djvsOFuJak=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VgUwmz2bIKseRKZTrrEeC5Prd902RBSTMFnxl1uCjVi40iFAuofjbtDD8APVAyklv
 SPRNOKhKcrs00z9UIPQuEui11bfvnnontGredt1WKmnJTbswEk2D1V/UqWPXB8WMp6
 8Q9UAg7kPyciAa3BbNTuJLv4PCmL64bczXO7Trro=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=VgUwmz2b
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
Cc: marcus.folkesson@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Quentin Schulz via buildroot (2023-01-23 10:57:16)
> Hi Daniel,
> 
> On 1/19/23 15:34, Daniel Semkowicz wrote:
> > Libcamera recently started to version the software, so use the
> > version tag instead of raw commit hash.
> > 
> > Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > ---
> >   package/libcamera/libcamera.hash | 2 +-
> >   package/libcamera/libcamera.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> > index 68c9c1f005..033e318910 100644
> > --- a/package/libcamera/libcamera.hash
> > +++ b/package/libcamera/libcamera.hash
> > @@ -1,4 +1,4 @@
> > -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
> > +sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
> >   
> >   # license files
> >   sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index 9c03d3a3b3..8979a43aca 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -5,7 +5,7 @@
> >   ################################################################################
> >   
> >   LIBCAMERA_SITE = https://urldefense.com/v3/__https://git.linuxtv.org/libcamera.git__;!!OOPJP91ZZw!gtcDP1maf3PoJO88myqzbBZyOhNYHg7g4jGwno19jy5tFEHRgUuyBqm2zECw5wQOF6S4k8pRivumP5qJXTknCnAEvbE$
> > -LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
> > +LIBCAMERA_VERSION = v0.0.3
> 
> I would actually advocate against using git tags, they are not 
> guaranteed to be stable over time (one can remove or move a tag), as 
> opposed to a git hash which is guaranteed to be.
> 
> Can you use the commit hash please?

Tags seem more convenient to me! - If you're not going to use the tag
points, why am I bothering to make tagged releases? I could go back to
just saying 'always use master as the latest release' if SHA1's are the
release point.

While, yes - tags can be deleted. I expect that any signed-by-me tag (or
any other future libcamera release maintainer) is the correct tag for
that release point. I would not expect to delete any tag once pushed to
a public host.


> @Kieran: do you have manually generated tarballs for versions somewhere 
> so we could use this instead of a git repo?

Do other projects honestly create manually generated tarballs?

As in ... does the maintainer create a .tgz and scp it somewhere or some
such? 

I would expect this can all be handled by git... - in particular, IMO -
the signed tags I push are what I expect to be possible to validate and
verify. Is it that the core issue here is that cgit isn't providing a
tarball?  (while Github does?)

--
Kieran

> I also saw that Markus (now in Cc) proposed another patch this morning 
> using GitHub archives, c.f. 
> https://lore.kernel.org/buildroot/20230123083508.3041367-1-marcus.folkesson@gmail.com/.
> 
> Maybe you can work something out together or we can take Markus's 
> version? Up to the maintainers.
> 
> Cheers,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
