From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:31:36 +0200
Subject: [Buildroot] [PATCH] package/google-breakpad: use PRE_CONFIGURE
	hooks to copy linux_syscall_support.h
In-Reply-To: <20170529201329.13455-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 29 May 2017 22:13:29 +0200")
References: <20170529201329.13455-1-romain.naour@gmail.com>
Message-ID: <87vaofixtj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported by Bernd [1], using POST_EXTRACT to copy
 > linux_syscall_support.h break the legal-info target when
 > google-breakpad package is selected.

 > Step to reproduce:

 > Create a foo defconfig with google-breakpad package:
 > $ make foo_defconfig

 > Call legal-info
 > $ make legal-info

 > /usr/bin/install: cannot stat '/home/bernd/buildroot/buildroot/output/
 > host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/
 > linux_syscall_support.h': No such file or directory

 > Use PRE_CONFIGURE hooks instead since there are not used by legal-info.

 > [1] http://lists.busybox.net/pipermail/buildroot/2017-May/192844.html

 > Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
