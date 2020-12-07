From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 7 Dec 2020 20:00:46 +0100
Subject: [Buildroot] [PATCH/next v1] package/mfgtools: bump version to
 uuu_1.4.43
In-Reply-To: <X8pQj5rEBlPRBVu3@p1g2>
References: <20201201203102.29535-1-ps.report@gmx.net> <X8pQj5rEBlPRBVu3@p1g2>
Message-ID: <20201207200046.0c9fbbdd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary, J?rg,

On Fri, 4 Dec 2020 16:06:55 +0100, Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Hi Peter,
> 
> First, sorry for the delay, it's been a crazy week.
> 
> On Tue, Dec 01, 2020 at 09:31:02PM +0100, Peter Seiderer wrote:
> > - remove dependency on BR2_arm
> > - update Config.in.host help text (mention NXP, mention uuu)
> > - change upstream URL to https://github.com/NXPmicro/mfgtools (as
> >   https://github.com/codeauroraforum/mfgtools redirects to it)
> > - remove legacy patch 0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
> > - remove legacy readme.txt
> > - update licence and LICENSE hash
> > - remove legacy README.txt license hash
> > - use upload tar.gz archive
> > - add new dependencies: host-pkgconf host-bzip2 host-libzip
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - @Gary Bisson: as it seems a complete rewrite of the tool
> >     (compared to the old mfgtoolcli) and you provided an
> >     fix for the old one lately: does it make sense to update/overwrite
> >     the mfgtools package or should I provide the uuu tool as a
> >     new package (any naming suggestions)?  
> 
> Yes actually there's been a lot of discussion about that one already:
> - First I did a patch similar as yours that was rejected not to remove
>   the legacy mfgtools package [1]. The naming suggested was "imx-uuu"
> - Then Jorg did offer some patches to add "imx-uuu" [2]
>   -> not sure why this one is marked as superseded?
>   -> all I remember is that the second patch of that series wasn't  
>   accepted as we agreed in [1] that mfgtools should stay as legacy as
>   long as it builds basically.

Sorry for missing the previous patches/discussion (and inventing the
the same/similar patch set again ;-))...

Package name imx-uuu seems reasonable (despite the name of the git
repository)...

> 
> So adding Jorg to this thread to figure out which is the best imx-uuu
> package. My only remark on Jorg package is that the Kconfig comment
> talks about UTP whereas UTP was for mfgtools (first of its name) whereas
> UUU only uses SDP to load binaries into RAM and then fastboot to flash.

Will try to re-spin a new patch set based on yours/J?rg work...

Regards,
Peter


> 
> Regards,
> Gary
> 
> [1] http://patchwork.ozlabs.org/project/buildroot/patch/20190608105337.19879-1-bisson.gary at gmail.com/
> [2] http://patchwork.ozlabs.org/project/buildroot/patch/20200109191020.1282319-1-joerg.krause at embedded.rocks/
