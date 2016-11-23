From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 13:24:14 +0100
Subject: [Buildroot] [PATCH v3 00/18] Reproducible builds
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <20161123132414.30eade0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 12:08:00 +0100, J?r?me Pouiller wrote:
> This series try to continue work initiated by Gilles Chanteperdrix:
>   http://lists.busybox.net/pipermail/buildroot/2016-April/thread.html#160064
>   http://lists.busybox.net/pipermail/buildroot/2016-June/thread.html#163905
> 
> I dropped some patchs from original series because either:
>   - I handled things differently (timestamps in images, support SOURCE_DATE_EPOCH
>     in gcc, ...)
>   - I didn't had time to test them them (sysroot, cpio, cdrkit, iso9660,...)
>   - They doesn't seems necessary anymore (libtool, libgcrypt, libgpg-error, ...)
> 
> This version focuses on timestamps. It provide good enough results as soon as
> OUTDIR and TOPDIR are the same. Indeed build path appear in plenty of files.
> Only patch called "remove full path from .pyc" try to solve this issue. Another
> big step could be done by removing rpaths from ELF generated with libtool.
> 
> Other thing known to break reproducibility:
>   - use of lzop (it unconditionally include timestamps in result)
>   - /!\ since we build our own toolchain and toolchain include BR2_FULL_VERSION,
>     ccache is incompatible with reproducible
> 
> Since this feature is experimental I did not (yet) reported these
> incompatibilities in menuconfig.

What are the changes between v2 and v3? There is no changelog, either
in the cover letter nor in the patches themselves. It would be useful
to have a changelog.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
