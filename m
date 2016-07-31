From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Jul 2016 21:56:47 +0300
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <20160731185647.GL3620@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 30, 2016 at 11:23:22PM +0200, Thomas Petazzoni wrote: 
> >      powerpc |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/252a04855f0e92efb2770d887d9ce6cb63bc6461/
> >       xtensa |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/2e8f7052cb3f4ca6a7ebcf506ea5a6cf04ffc736/
> 
> btrfs.c:68:8: error: redefinition of 'struct btrfs_ioctl_defrag_range_args'
>  struct btrfs_ioctl_defrag_range_args {
> 
> Baruch, you are the last one who bumped strace, could you have a look?

A missing comma in configure.ac breaks the build when using kernel v4.7+ 
headers. A bump to version 4.13 (http://patchwork.ozlabs.org/patch/654388/) 
fixes this issue.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
