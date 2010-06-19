From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jun 2010 13:34:46 +0200
Subject: [Buildroot] uImage could not be built before and after big
 bootloader patch
In-Reply-To: <4C1BE51D.5040406@gmx.net>
References: <4C1BE51D.5040406@gmx.net>
Message-ID: <20100619133446.2123896f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Jun 2010 23:29:01 +0200
Ossy <ossy1980@gmx.net> wrote:

> I am still not able to make a U-Boot image (uImage) of the linux kernel 
> if I use "Same version as kernel headers". U-Boot is built before trying 
> to make the uImage, but it still gives the following error:
> 
> ...
> "mkimage" command not found - U-Boot images will not be built
> ...
> 
> Am I forced to install U-Boot (meaning mkimage) on the host?
> This is not neccessary if using "Advanced configuration".

Is this a regression of the bootloaders-cleanup branch ? As far as I
can see the non-Advanced configuration for the kernel never handled the
dependency on host mkimage. So I think it wasn't working before, and it
still isn't working.

I have another branch, linux-cleanup, that reworks all the code that
builds the kernel, so I'm really interested in improving the existing
code (of course, if it's a regression, I'll fix it).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
