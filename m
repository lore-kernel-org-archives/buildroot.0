From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:34:10 +0200
Subject: [Buildroot] [PATCH 05/12] Improve TARGETS handling for
	bootloaders and kernel
In-Reply-To: <de300cb9cb615b39176323e4851945d208cfc2be.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:49 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <de300cb9cb615b39176323e4851945d208cfc2be.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r55wlih9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As the kernel and bootloaders do not use the normal BR2_PACKAGE_*
 Thomas> Kconfig options, their target name was not automatically added to the
 Thomas> global TARGETS variable. Each bootloader .mk and the linux.mk had to
 Thomas> add their own target manually to TARGETS, and the package
 Thomas> infrastructure was making tests on non-existing Kconfig variables.

 Thomas> This commit improves the package infrastructure so that it looks at
 Thomas> BR2_PACKAGE_<pkg> for packages, BR2_BOOT_<pkg> for bootloaders and at
 Thomas> the special BR2_LINUX_KERNEL for the linux package.

You forgot to adjust the commit message now that you kept bootloaders as
BR2_TARGET_<pkg>.

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
