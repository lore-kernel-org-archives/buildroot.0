From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jun 2011 18:27:45 +0200
Subject: [Buildroot] GCC 4.6.x building : bootstraps and some other
 packages fail
In-Reply-To: <9E448A3C2A524B28B241DFDCA22CF9DC@JohanW7>
References: <9E448A3C2A524B28B241DFDCA22CF9DC@JohanW7>
Message-ID: <20110602182745.26ef31a6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Jun 2011 10:53:32 +0200
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> /home/johan/buildroot-2011.05/output/host/usr/bin/../lib/gcc/arm-unknown-lin
> ux-uclibcgnueabi/4.6.0/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
> section .text.startup loaded at [00200e7c,00200ea3] overlaps
> section .data loaded at [00200e7c,00200f3f]

This doesn't surprise me a lot. AT91Bootstrap is not an open community
project, so everybody keeps fixing the issues on their own without
contributing things back, and Atmel isn't really maintaining it
very actively. The upstream 1.16 version doesn't even build with EABI
toolchains, and Buildroot has a patch to fix this.

I'm afraid the build issue you had might be a problem in AT91Bootstrap
that you have to find and fix. Of course, we're interested by the patch.

Note that Atmel is working on a newer AT91Bootstrap version, available
as part of their Android4Sam initiative. This version, labeled "3" is
available at
ftp://ftp.linux4sam.org/pub/Android4SAM/9m10g45/v1.1/patches/bootstrap30.tar.gz.
I haven't tried it for now, but it uses kconfig for the configuration,
so it's probably a bit better than the 1.16 that is packaged in
Buildroot currently.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
