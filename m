From: daggs <daggs@gmx.com>
Date: Sat, 15 Oct 2016 08:27:20 +0200
Subject: [Buildroot] [PATCH 1/2] X11/odroidc2-driver: New Package.
In-Reply-To: <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
References: <20161013174124.9639-1-daggs@gmx.com>,
 <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
Message-ID: <trinity-bfdd0cd1-6066-4ebc-b82e-d255078fccac-1476512840803@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Arnout,
>  Hi Dagg,
> 
>  You subject line should be:
> 
> xdriver_xf86-video-odroidc2: new package
>
noted, thanks.
 
>  I have a generic remark about this package and I'm not sure how to solve it.
> This is actually the source that comes from ARM:
> 
> http://malideveloper.arm.com/downloads/drivers/DX910/r7p0-00rel0/DX910-SW-99003-r7p0-00rel0.tgz
> 
> which has been lightly patched in unfathomable ways. The igloo community has a
> similar patches driver. There are probably others as well.
> 
>  The github repo is really a mess (well, the ARM tarball as well but slightly
> less so). It is full of build artefacts, like the .deps directory... It has just
> two commits. The changes w.r.t. the ARM tarball are not a separate commit.
> 
>  But I don't know what the options are here. We can have duplicates of this
> package for each board that hacks it in a different way. Or we could have a
> single xdriver_xf86-video-mali package based on the ARM tarball, but then a
> different patch would probably have to be applied to it depending on the board.
> Either by somehow detecting the board in the .mk file, or by putting the patch
> in the global patch dir of the odroid boards.
imho this idea has aome problems.
maintaining a patchset for each driver is a lot of work, each time someone commits a patch to the repo, the maintainer needs to know of that, extract the patch and add it to the patchset.
lets assume there is a repo with 1000 commits, there can be 1000 patches in that are in the buildroot tree, there is a possibility to banch it to 1 patch but it will be a huge file that us needed to be maintained.
imho to fix this, under the assumption that all drivers derive from the same file, there is a need to add support for buildroot that extract all the commits of a repo minus the the initial commit which must be the original drive and apply them to the original source.
with these repos (as messy as there are), the maintainer takes care of it.

> Oh, and there is no upstream we
> can send this to (or do we expect ARM to be responsive to patches? Note that the
> bugurl they specify in the package is freedesktop...).
> 
there is, I'm in contact with the maintainer of the c2 repos, I've submitted patches which were merged to other repos before.
according to him, we can semd patches via mail, github merge request and by sending him the patches via the odroid forums.

>  All of that sounds a bit too complicated, so let's keep this package for the
> time being. I'd only like two major changes (+ comments below):
> 
> - rename the package to xdriver_xf86-video-mali-odroidc2
> 
> - in the help text refer to the real upstream, e.g.
> http://malideveloper.arm.com/resources/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers/
> and explained that this is a hacked version of it.
> 
> 
will update and resend.
thanks for the feedback.

Dagg.
