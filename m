From: Alexandre Schnegg <alexandre.schnegg@gmail.com>
Date: Wed, 27 Nov 2013 18:55:28 +0100
Subject: [Buildroot] Freescale specific kernel header to compile imx-lib
In-Reply-To: <20131127173911.3f97da37@skate>
References: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>
 <20131127173911.3f97da37@skate>
Message-ID: <003f01ceeb99$dc7c9980$9575cc80$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your response.

I can give you some more details.

When I only select the package "imx-lib", compilation is ok. But when I also
select the package "gst-fsl-plugins", I have this issue:

checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking vpu_lib.h usability... no
checking vpu_lib.h presence... no
checking for vpu_lib.h... no
configure: error: lib_vpu is required, consider installing imx-lib
make[1]: ***
[/home/schnegg/Documents/armadeus/buildroot/output/build/libfslvpuwrap-1.0.1
7/.stamp_configured] Error 1
make[1]: Leaving directory `/home/schnegg/Documents/armadeus/buildroot'
make: *** [all] Error 2
schnegg at ubuntu:~/Documents/armadeus$ make menuconfig
make[1]: Entering directory `/home/schnegg/Documents/armadeus/buildroot

It's seems the "imx-lib" isn't built. 

Do you have an idea what's wrong ?

Regards
Alexandre Schnegg

-----Message d'origine-----
De?: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Envoy??: mercredi 27 novembre 2013 17:39
??: Alexandre Schnegg
Cc?: buildroot at busybox.net
Objet?: Re: [Buildroot] Freescale specific kernel header to compile imx-lib

Dear Alexandre Schnegg,

On Wed, 27 Nov 2013 17:24:12 +0100, Alexandre Schnegg wrote:

>  My question is : can I get this header on my cross-compile machine 
> running Ubuntu 13.04 or am I forced to use a Freescale BSP and do a 
> native compilation ?

You simply need to tell Buildroot to build a Linux kernel that is Freescale
specific, and therefore contains these headers. The imx-lib package will
look directly into the kernel sources for those i.MX specific headers.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
