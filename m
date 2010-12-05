From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Dec 2010 13:19:52 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101205115745.0e86c054@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf>
Message-ID: <20101205131952.50400c59@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Sun, 5 Dec 2010 11:57:45 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Another (unrelated) question: when using the Blackfin toolchains, I
> found out that the linker needs zlib installed on the host, but it
> isn't the case with the other toolchains I have. What feature of ld
> requires zlib ?

Yet another question regarding non-MMU support and support for static
builds in Buildroot. Obviously, not all packages support non-MMU
architectures and/or static build, so it'd be good to not allow the
users to select those packages. So the packages known to work for
non-MMU and/or static build should be clearly identified.

So, what about adding:

	depends on BR2_USE_MMU
	depends on !BR2_PREFER_STATIC_LIB

on all packages, except those that have been validated to work in those
two conditions ?

Of course, it means adding those two depends on lines to a lot of
packages, but I don't see a way of doing the opposite with the kconfig
language.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
