Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB21C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2C84162E;
	Thu,  6 Jan 2022 15:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtfE4Nhplzfm; Thu,  6 Jan 2022 15:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47316408CB;
	Thu,  6 Jan 2022 15:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1AFA1BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED6F83294
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOrFK7wE808t for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:27:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 488A18328E
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=4yK68QRA3XNqKJ/ANGFlu6trM7tz5rkOFHpzqzWVxl8=; b=eZoW3
 3lv8lqYPOk7hUlJz7HhdbGS4H8y8xet//8upEYyf1AdG1Bxhbs/NlNx6QZONTNnAl45OX/7InpL0H
 V2O+G7h2pmfzcNqKvEm4DtYjrkyj9RZ9dxlTbiGgzPBbO8tyn1w5Bvwtqnid7vMw5zPUIfm7hc2rp
 sr0SQo85Msi4UhyYjDriv1YqxzACfWGecfLGlwxVtC+Mm853JUxyUIx83tdaMZKNNR3I0eZUJRPD1
 vJ3wvhO5lg02ruxREsktFs7/qQDzEFlBhyDkQ9fMywhCueJi4Zeph0CKjSpIkSJxpxDTbUthGU1ll
 Sj42tFEMenqiD3O2/Qqz3zlVMgAZg==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1n5UIx-00077W-JI; Thu, 06 Jan 2022 15:03:51 +0000
Date: Thu, 6 Jan 2022 15:03:50 +0000
From: John Keeping <john@metanate.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YdcE1oBg+tvkNeXs@donbot>
References: <20200121203337.30856-1-vfazio@xes-inc.com>
 <d28ff21d-c2bf-f489-2d09-9f01936f1337@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d28ff21d-c2bf-f489-2d09-9f01936f1337@mind.be>
X-Authenticated: YES
Subject: Re: [Buildroot] [PATCH 1/1] download/git: support Git LFS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@xes-inc.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Thu, Jan 06, 2022 at 11:35:21AM +0100, Arnout Vandecappelle wrote:
>  I finally applied this to master, with a few minor changes.

Thanks for merging this!

> On 21/01/2020 21:33, Vincent Fazio wrote:
> > From: John Keeping <john@metanate.com>
> > 
> > Git Large File Storage replaces large files with text pointers in the
> > Git repository while storing the contents on a remote server.  If a
> > repository is using this extension, then git-lfs must be used to
> > checkout the large files before the source archive is generated.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > [vfazio:
> >    - add git-lfs to DL_TOOLS_DEPENDENCIES
> >    - fixup for 5a0d6813948fea2cdb88a2e35984520eec856dec
> >      ("infra/pkg-download: make the DOWNLOAD macro fully parameterised")
> > ]
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> 
> [snip]
> 
> > +# If there are large files then fetch them.
> > +if [ ${large_file} -eq 1 ]; then
> > +    _git lfs install
> 
>  AFAICS an lfs install is not needed. IMHO it's pretty bad to do that
> because it updates ~/.gitconfig, which Buildroot shouldn't do. We could do
> lfs install --local, but even that is not needed. The lfs install just makes
> sure that lfs is done automatically whenever you do commit or pull or
> something like that, but in Buildroot we always do it explicitly so the
> smudge filter isn't needed.

I had a local update with --local.  Unfortunately it seems that install
is necessary as when testing the committed version (having removed the
filter config from ~/.gitconfig) I get:

	Cannot checkout LFS objects, Git LFS is not installed.

I'll send a patch to do `git lfs install --local` here.

> > +    _git lfs fetch
> > +    _git lfs checkout
> 
>  As already mentioned by Yann, this doesn't work when combined with
> submodules. The solution is pretty trivial:
> 
>     # If there are also submodules, recurse into them,
>     if [ ${recurse} -eq 1 ]; then
>         _git submodule foreach --recursive ${GIT} lfs fetch
>         _git submodule foreach --recursive ${GIT} lfs checkout
>     fi
> 
>  I haven't actually tested this though.

I have a test repo with LFS submodules and I can confirm this works
(modulo the install concern above).

>  Vincent (or anybody), it would be nice to have a runtime test for this
> feature. support/testing/tests/download/br2-external/git-refs/package/git-submodule-{enabled,disabled}
> can be a good source of inspiration. Only I'm not sure if it's possible to
> set up an LFS repository that is purely file-based.

Yes, I think you're right that LFS requires HTTPS.  It's possible to
combine that with any Git protocol, but the LFS transfer is always
HTTPS, so any runtime tests would require a temporary server.


John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
