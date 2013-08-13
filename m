From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 23:36:37 +0200
Subject: [Buildroot] [PATCH 2/3] cpanminus: works with arm & mips
In-Reply-To: <20130302145043.0f45c2f4@skate>
References: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
 <1362220740-17593-2-git-send-email-francois.perrad@gadz.org>
 <20130302145043.0f45c2f4@skate>
Message-ID: <20130813233637.76d8c4b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Sat, 2 Mar 2013 14:50:43 +0100, Thomas Petazzoni wrote:
> Dear Francois Perrad,
> 
> On Sat,  2 Mar 2013 11:38:59 +0100, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/cpanminus/Config.in    |   15 +++++++++++----
> >  package/cpanminus/cpanminus.mk |    2 +-
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
> > index b10d211..cf93a7e 100644
> > --- a/package/cpanminus/Config.in
> > +++ b/package/cpanminus/Config.in
> > @@ -1,9 +1,16 @@
> >  config BR2_PACKAGE_CPANMINUS
> >  	bool "cpanminus"
> > -	# Requires host-qemu, which cannot work properly due to kernel
> > -	# headers mismatch between the build environment and the
> > -	# target.
> > -	depends on BR2_BROKEN
> 
> Sorry, but I don't see where the problem mentioned in the comment here
> has been solved. Anything using host-qemu to help in cross-compilation
> cannot work: it is very likely that the kernel headers used to build
> the target toolchain are much more recent than the kernel running on
> the build machine. Since the Qemu user-mode emulation works by
> converting the target syscall into host syscall, it cannot work when
> kernel headers are more recent than the kernel version running on the
> build machine.
> 
> I don't see how this can be solved, it is a fundamental problem in the
> approach.

Since you haven't given any further comments on this since March, the
patch has been waiting in our patchwork queue.

While waiting for (hopefully) some solution, or comment from you, I'll
mark the patch as "Rejected" until we get to an agreement on how to
solve the cpanminus problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
