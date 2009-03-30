From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 20:58:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
	external-toolchain gcc uClibc
In-Reply-To: <20090330175842.1960fed2@surf> (Thomas Petazzoni's message of
	"Mon\, 30 Mar 2009 17\:58\:42 +0200")
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf>
Message-ID: <87prfyald1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Now, the current approach is certainly nice from a maitenance POV as
 >> there's only one set of options so they are always in sync, but I
 >> agree that it isn't that userfriendly.

 Thomas> The best option would be to compute automatically these
 Thomas> configuration options when using an external toolchain. But I
 Thomas> don't see how this can be done with how the kconfig system
 Thomas> works.

Not without running some kind of configure script to append Kconfig
settins when you're using an external toolchain. I don't quite know
how to integrate this nicely though.

 Thomas> Does something like :

 Thomas> config BR2_ENABLE_LOCALE bool "Enable locale" if
 Thomas> BR2_TOOLCHAIN_BUILDROOT bool "Is locale enabled in your
 Thomas> toolchain ?" if BR2_TOOLCHAIN_EXTERNAL

 Thomas> works ?

Unfortunately not - That's the problem.

-- 
Bye, Peter Korsgaard
