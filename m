From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 08:39:05 +0100
Subject: [Buildroot] Problem compiling busybox with libpam
In-Reply-To: <AANLkTin4zfThtsb=2TobEPZWupSJAPmw1Xde2=OMiPER@mail.gmail.com>
References: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
	<AANLkTin4zfThtsb=2TobEPZWupSJAPmw1Xde2=OMiPER@mail.gmail.com>
Message-ID: <20110126083905.0b0dab48@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Spider,

On Wed, 26 Jan 2011 00:09:13 -0200
Spider <spiderwebmail@gmail.com> wrote:

> I was using buildroot to compile busybox and got the following error
> when I add libpam using "make busybox-menuconfig". ?(The output is
> below).
> How can I get libpam to compile without this errors? If I "make clean"
> and remake everything from scratch will it work? (I wil try this
> tomorrow because of the time to compile and fear of configuration files changes)
> 
> I searched for a similar problem but didnt find anything on
> documentation. Do I need to manually supply security/pam_appl.h and
> security/pam_misc.h? Where to find them?

It looks like Busybox PAM support depends on the PAM library, for which
we don't have a package yet.

So you would need to :

 * Create a Buildroot package for
   ftp://ftp.kernel.org/pub/linux/libs/pam/library/Linux-PAM-1.1.3.tar.bz2

 * Create a sub-option in the Busybox Buildroot package to
   enable/disable PAM support. This option should select the PAM
   library package created at the previous step.

 * In package/busybox/busybox.mk, if PAM support is enabled, then tweak
   the Busybox configuration file, and add the dependencies on the PAM
   library.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
