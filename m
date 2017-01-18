From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Jan 2017 12:23:57 +0200
Subject: [Buildroot] make menuconfig problem in latest snapshot
In-Reply-To: <56f73092-ec12-e0a4-d633-bee57e834628@lamiaworks.com.au>
References: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
 <20170118175332.60e7a690@free-electrons.com>
 <56f73092-ec12-e0a4-d633-bee57e834628@lamiaworks.com.au>
Message-ID: <20170118102356.xmam5lwp7jhuufjl@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi scsijon,

On Wed, Jan 18, 2017 at 08:40:17PM +1100, scsijon wrote:
> sorry folks, i'm just starting to play with buildroot. It was just that
> there was a snapshot that I d/l and tried to run that found the problem so
> i'm not up to the stage of an actual build (running make) yet. I'm just
> working my way through the manual and docs.

Thomas asked you to revert git commit 05576fca13b12, and see if it fixes your 
problem. No need to build anything for that.

If you can't revert the git commit you can make an equivalent change by 
commenting out the line

  br2_ext="$( cd "${br2_ext}"; pwd )"

in support/scripts/br2-external.

baruch

> On 01/18/2017 05:53 PM, Thomas Petazzoni wrote:
> > On Wed, 18 Jan 2017 12:55:49 +1100, scsijon wrote:
> > > Found this error in todays snapshot
> > > --------------------------
> > > # make menuconfig
> > > support/scripts/br2-external: line 111: syntax error near unexpected
> > > token `"${br2_name}"'
> > > Makefile:197:
> > > /initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk:
> > > No such file or directory
> > > make: Failed to remake makefile
> > > `/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk'.
> > > support/scripts/br2-external: line 111: syntax error near unexpected
> > > token `"${br2_name}"'
> > > make: ***
> > > [/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/build/.br2-external.in]
> > > Error 2
> > > #
> > > ----------------------------
> > 
> > Thanks for the report! Can you try reverting commit
> > 05576fca13b129da8c7186ee2307981135d3391f ? I believe it's the one that
> > introduced the problem.
> > 
> > Yann, are you sure that the nested double quotes are OK?
> > 
> > Thanks,
> > 
> > Thomas

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
