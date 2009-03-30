From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2009 17:58:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
 external-toolchain gcc uClibc
In-Reply-To: <87ab73azsj.fsf@macbook.be.48ers.dk>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
Message-ID: <20090330175842.1960fed2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Mar 2009 15:46:52 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> The change was done by Daniel Laird back in January (r25170), and was
> afaik because the options for external toolchains weren't in sync with
> the ones for internal toolchains (WCHAR or LIBSTDCPP or something like
> that missing), which meant that the packages depending on those
> toolchain options couldn't be selected in kconfig.

Ok, got it.

> Now, the current approach is certainly nice from a maitenance POV as
> there's only one set of options so they are always in sync, but I
> agree that it isn't that userfriendly.

The best option would be to compute automatically these configuration
options when using an external toolchain. But I don't see how this can
be done with how the kconfig system works.

Does something like :

config BR2_ENABLE_LOCALE
	bool "Enable locale" if BR2_TOOLCHAIN_BUILDROOT
	bool "Is locale enabled in your toolchain ?" if BR2_TOOLCHAIN_EXTERNAL

works ?

Thomasa
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
