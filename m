From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Aug 2016 23:14:18 +0200
Subject: [Buildroot] [PATCH] blktrace: re-enable on uClibc
In-Reply-To: <1471963200-18857-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 23 Aug 2016 16:40:00 +0200")
References: <1471963200-18857-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r39fi3x1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > With a small patch, blktrace can work on uClibc: we simply need to link
 > with librt to use the posix_spawn*() functions.

> @@ -10,7 +8,3 @@ config BR2_PACKAGE_BLKTRACE
 >  	  up to user space.
 
 >  	  http://git.kernel.dk/?p=blktrace.git;a=summary
 > -
 > -comment "blktrace needs a glibc or musl toolchain"
 > -	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 > -	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)

I see you created this against master and not next. I know it is a small
patch, but it is still a feature addition. Is there any reason this
should go in 2016.08?

-- 
Bye, Peter Korsgaard
