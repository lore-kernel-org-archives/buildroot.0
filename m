From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Sep 2012 14:58:41 +0200
Subject: [Buildroot] [Bug 5480] New: Choose default kernel configuration
 depending on the current architecture selected.
In-Reply-To: <bug-5480-163@https.bugs.busybox.net/>
References: <bug-5480-163@https.bugs.busybox.net/>
Message-ID: <50435801.7050406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  [Replying to the list, because that's where we review patches]

On 08/30/12 13:28, bugzilla at busybox.net wrote:
>    I've found out that after initial configuration, including enabling of linux
> kernel compilation, the default kernel config is not set and almost all make
> targets fail with:
>
> "linux/linux.mk:304: *** No kernel defconfig name specified, check your
> BR2_LINUX_KERNEL_DEFCONFIG setting."
>
>    One possible solution would have been tweaking the build system to avoid that
> message or at least, be able to run the linux-menuconfig target. I didn't find
> an easy way to do this and therefore I chose another option which is setting
> kernel default configs depending on target architecture.
>
>    Find the patch attached, regards,
>

  Maybe a better option is to default to using the arch-dependent 'defconfig'
target in the kernel itself.  It doesn't exist for microblaze but it's more
maintainable for the other archs at least.

  Especially our x86 users will be happy with this change, I think.

  Patch follows.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
