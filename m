From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:48:35 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_one_plus: fix kernel
 headers option
In-Reply-To: <20190213211053.19755-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 13 Feb 2019 22:10:53 +0100")
References: <20190213211053.19755-1-thomas.petazzoni@bootlin.com>
Message-ID: <87va1mgkpo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Contrary to what the comment in the defconfig says, the
 > orangepi_one_plus_defconfig was not using the "same as kernel" option
 > for kernel headers, but really selecting explicitly Linux 4.18
 > headers, independently from the kernel version.

 > Except that in the mean time, BR2_KERNEL_HEADERS_4_18 has been
 > removed, causing a build failure due to the legacy checking:

 > Makefile.legacy:9: *** "You have legacy configuration in your .config! Please check your configuration.".  Stop.

 > This commit fixes that by using the proper
 > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18 option.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295166

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
