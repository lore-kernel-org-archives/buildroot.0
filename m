From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jun 2010 17:12:05 +0200
Subject: [Buildroot] uImage could not be built before and after big
 bootloader patch
In-Reply-To: <4C1CC857.50309@gmx.net>
References: <4C1BE51D.5040406@gmx.net> <20100619133446.2123896f@surf>
	<4C1CC857.50309@gmx.net>
Message-ID: <20100619171205.606fb887@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the list in Cc for Buildroot-related discussions. Thanks!

On Sat, 19 Jun 2010 15:38:31 +0200
Ossy <ossy1980@gmx.net> wrote:

> It's true. The Non-Advanced configuration never handled the dependency 
> on mkimage, so it did not funtion before. I thought, the last big 
> bootloader patch would fix this dependency.

No. However, the linux-cleanup patch removes the non-advanced/advanced
configuration schemes for building the Linux kernel to only keep one.

> I made a new test with Advanced configuration (the one which worked for 
> uImage before). I deleted U-Boot and linux-kernel in output-build to be 
> sure. Now even the Advanced configuration throws this error:
> ...
> "mkimage" command not found - U-Boot images will not be built
> ...

Do you have mkimage in output-build/host/usr/bin ? Can you try by
removing completely output-build ?

> I'm pretty sure, that Advanced configuration worked before.
> Do you need my configuration?

Yes, I would need to reproduce the issue. So please reproduce the issue
from a clean build, even if it involves doing :

 *) A build from scratch
 *) Removing some stuff
 *) Restarting the build

I haven't tested the mkimage dependency today, but I've implemented it
recently, and as far as I know, Peter tested it before merging the
bootloaders-cleanup branch, so I'm quite sure that it works in the
default case (i.e, build from scratch).

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
