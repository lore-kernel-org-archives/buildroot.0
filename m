From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 16:45:04 +0100
Subject: [Buildroot] Buildroot fail to build when configure for dev
 managment: dynamically with udev
In-Reply-To: <50A6559A.3050300@gmail.com>
References: <50A65094.7080202@ronetix.at> <50A6539F.8040507@gmail.com>
 <50A65565.9050001@ronetix.at> <50A6559A.3050300@gmail.com>
Message-ID: <20121116164504.6270393b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 16 Nov 2012 16:02:50 +0100, Zoltan Gyarmati wrote:

> > Thanks for the fast response but when I configure Buildroot to use 
> > external toolchain the Kernel headers option dissapear. Any other advice?
> 
> yes, in this case it comes from the toolchain itself, sou you have to 
> check it in the toolchain.

If Martin is using the external toolchain backend, then he cannot check
anything related to the kernel headers version in the menuconfig.
External toolchains are pre-built toolchains, so Buildroot just uses
them as-is, you have no way of changing the Buildroot version.

Martin: your external toolchain is using too old kernel headers to
build udev. So your options are:

 *) Use a more recent external toolchain that will have more recent
    kernel headers.

 *) Add a patch to udev that defines BTN_TRIGGER_HAPPY to the correct
    value when it is not already defined by kernel headers.

BTW, which external toolchain are you using?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
