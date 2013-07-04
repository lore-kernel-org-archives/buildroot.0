From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 11:11:45 +0200
Subject: [Buildroot] [PATCH 22/23] eglibc: enable support in the
	Buildroot toolchain backend
In-Reply-To: <1372620553-11416-23-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:12 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-23-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ncan0z2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Using the newly introduced 'eglibc' package, this commit enables the
 Thomas> option of building a toolchain using the eglibc C library in the
 Thomas> Buildroot toolchain backend.

 Thomas> In details, this commit:

 Thomas>  * Creates a choice to select uClibc or eglibc in the Buildroot
 Thomas>    toolchain backend (in toolchain/toolchain-buildroot/Config.in), and
 Thomas>    removes the fact that the Buildroot toolchain backend forcefully
 Thomas>    enables uClibc (toolchain/Config.in).

 Thomas>  * Creates a BUILDROOT_UCLIBC variables, which points to the package
 Thomas>    implementing the C library (i.e either 'uclibc' or 'eglibc').

 Thomas>  * Modifies the gcc-final and gcc-intermediate makefiles to use the
 Thomas>    BUILDROOT_UCLIBC variable instead of hardcoding the use of uclibc.

The variable is called BUILDROOT_LIBC.

Committed with the description adjusted, thanks.

-- 
Bye, Peter Korsgaard
