From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Apr 2013 09:25:04 +0200
Subject: [Buildroot] [PATCH v5 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <516ED09E.2030608@mind.be>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-6-git-send-email-sonic.adi@gmail.com>
 <20130416232925.759eb9df@skate>
 <CAJxxZ0PoEysfHc23PHfqkVktvoGiQoDBNd+-z3PTOL40=Zfwhg@mail.gmail.com>
 <20130417100512.5433f4c6@skate>
 <CAJxxZ0NHZM75Nctd6fy-9K8t1jf1hdKiTXn+0aR9E2qB=R+LVA@mail.gmail.com>
 <20130417105615.7af600cd@skate>
 <CAJxxZ0MFoAf1YrKfbjUt5BW8Pd=uX1NxTN9EgYvfHiM-g1uZgA@mail.gmail.com>
 <516ED09E.2030608@mind.be>
Message-ID: <20130418092504.0ae932f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 17 Apr 2013 18:41:02 +0200, Arnout Vandecappelle wrote:

> > Yes, I do reuse the function copy_toolchain_lib_root() in the code to
> > install shared FDPIC libraries when FLAT format is selected. But, rest
> > part of the library installation code depends on current
> > TOOLCHAIN_EXTERNAL_CC, which is different from the FDPIC one in this
> > case. And the following sysroot to staging installation code depends on
> > macro SYSROOT_DIR, ARCH_SYSROOT_DIR, ARCH_SUBDIR, ARCH_LIB_DIR and
> > SUPPORT_LIB_DIR, which are based on current TOOLCHAIN_EXTERNAL_CC as well.
> >
> > I feel the individual FDPIC installation code for FLAT format is a simple
> > and clear solution.
> 
>   And anyway it can be refactored away later (e.g. when moving the 
> ext-toolchain stuff to a script or to functions).

Yes, I agree. Let's keep Sonic code as is for now, and as we get a
better understanding of the potential similarities with the existing
code, we can refactor if it makes sense.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
