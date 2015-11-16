From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 07:26:02 +0100
Subject: [Buildroot] headers_install.sh linux/ioport.h
In-Reply-To: <5646F4EA.6090703@schweikarts-vom-dach.de>
References: <5646F4EA.6090703@schweikarts-vom-dach.de>
Message-ID: <564976FA.5000506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-11-15 09:46, Michael Schweikart wrote:
> Hi,
> 
> i have build a buildroot image with toolchain support and can build for example
> a application with use of the ncurses library inside eclipse.
> Now I need to have the possibility to access the ISA Bus. Therefor i need the
> linux/ioport.h header file of the kernel, but the include File
> is not copied into the directory "output/host/usr/i586-buildroot-linux-gnu". Why
> is this include file not copied. Is there a Kernel config option which i have to
> set correctly?

 ioport.h is a kernel header, not a userspace header, so it is not installed in
<sysroot>/usr/include/linux by linux's make headers_install.

 If you would have this header file, I doubt you'd be able to do much with it
anyway from userspace since the functions defined in it are not exported and the
macro definitions are as far as I know also not applicable to anything visible
in userspace.

 But perhaps you want to build a kernel module? In that case, you also have to
build the kernel using buildroot and use the kernel-module infrastructure [1].

 Regards,
 Arnout

[1] http://buildroot.org/manual.html#kernel-module-tutorial


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
