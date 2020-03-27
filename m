From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 15:23:31 +0100
Subject: [Buildroot] [PATCH] package/oprofile: Fix build with
 binutils_2.34
In-Reply-To: <20200327121752.32344-1-Evgeniy.Didin@synopsys.com>
References: <20200327121752.32344-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200327152331.547ae47b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Mar 2020 15:17:52 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> After updating ARC toolchain to arc-2019.09 version oprofile_1.3.0
> builds started to fail. These failures were caused by binutils 
> upstream commit fd3619828e94a ("bfd_section_* macros") which was 
> added in binutils-arc. This commit removed some macros that were
> used in oprofile_1.3.0. 
> 
> With this commit we introduce fix for oprofile wich enables builds
> with binutils_2.34 and older versions.
> 
> Fixes:
> http://autobuild.buildroot.org/results/999/9995b7a18fcc38a02dd1dd3af462a14528a2174d//
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: William Cohen <wcohen@redhat.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

I have already submitted a few days ago:

  http://patchwork.ozlabs.org/patch/1261162/

to fix the same issue. I think your patch is missing the additional of
OPROFILE_AUTORECONF = YES.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
