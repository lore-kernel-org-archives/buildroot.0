From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:25:27 +0200
Subject: [Buildroot] [PATCHv2 10/14] toolchain: refactor Stack Smashing
	Protection support
In-Reply-To: <1378138000-12739-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:36 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob7tixq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit refactors how Stack Smashing Protection support is handled
 Thomas> in Buildroot:

 Thomas>  *) It turns the BR2_TOOLCHAIN_BUILDROOT_USE_SSP option into an option
 Thomas>     that only enables the SSP support in uClibc, when using the internal
 Thomas>     toolchain backend.

 Thomas>  *) It adds an hidden BR2_TOOLCHAIN_HAS_SSP option that gets enabled
 Thomas>     when the toolchain has SSP support. Here we have the usual dance:
 Thomas>     glibc/eglibc in internal/external backend always select this
 Thomas>     option, in the case of uClibc/internal, it gets selected when
 Thomas>     BR2_TOOLCHAIN_BUILDROOT_USE_SSP is enabled, in the case of
 Thomas>     uClibc/external, there is a new configuration option that the user
 Thomas>     must select (or not) depending on whether the toolchain has SSP
 Thomas>     support.

 Thomas>  *) It adds a new options BR2_ENABLE_SSP in the "Build options" menu,
 Thomas>     to enable the usage of SSP support, by adding
 Thomas>     -fstack-protector-all to the CFLAGS.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
