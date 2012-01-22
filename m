From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Jan 2012 14:49:07 +0100
Subject: [Buildroot] [PATCH 1/2] syslinux: bump to version 4.04
In-Reply-To: <20120122033848.GB2568@tarshish>
References: <1327181975-31060-1-git-send-email-arnout@mind.be>
 <20120122033848.GB2568@tarshish>
Message-ID: <201201221449.08760.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 22 January 2012 04:38:48 Baruch Siach wrote:
> Hi Arnout,
> 
> On Sat, Jan 21, 2012 at 10:39:34PM +0100, Arnout Vandecappelle (Essensium/Mind) wrote:
> > From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> > -SYSLINUX_VERSION = 3.85
> > +SYSLINUX_VERSION = 4.04
> 
> Version 4.05 is present in 
> http://www.kernel.org/pub/linux/utils/boot/syslinux/4.xx/.

 Sorry, too much work.  The isohybrid installer requires uuid.h in 4.05.
The current syslinux mk file builds everything, not just the pxelinux.bin
and isolinux.bin that we really want, so you would need to depend on
util-linux's libuuid.  However, syslinux is compiled with HOST_CC instead
of TARGET_CC, so you don't get access to libuuid...  It's all kind of
messy and difficult to understand, and probably requires patching
syslinux's Makefile to support proper cross-compiling to start with.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
