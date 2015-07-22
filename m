From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:00:12 +0200
Subject: [Buildroot] build libstdc++.so.6
In-Reply-To: <1437584173498-106871.post@n4.nabble.com>
References: <1436634230228-105322.post@n4.nabble.com>
 <20150712002830.018e4bc0@free-electrons.com>
 <1437584173498-106871.post@n4.nabble.com>
Message-ID: <20150722220012.01206096@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jul 2015 09:56:13 -0700 (PDT), glscantlen wrote:

> I have no good reason for using that version of their toolchain.
> I did find an earlier version of eglibc binary that contained stdc++.
> sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
> But I have not tried that ver. yet.
> 
> My biggest  concern is having to rebuild any toolchain after a
> ' make clean' in Buildroot. I am sure there are other methods to
> over come a toolchain rebuild, I just have not found one I like.

Just use the Linaro 14.09 toolchain that is pre-defined in Buildroot.
Buildroot will automatically download it, extract it and set it up for
you. I.e nothing to do or worry about.

> I am currently using a hack, copy from an Ubuntu build for arm.
> And I only need the shared stdc++ for libmali.so which was
> also a copy from the same Ubuntu build. I would prefer to build
> libmali.so using the provided static stdc++ BUT! libmali source
> contains proprietary code provided thru ARM commercial licence
> and I have not yet resolved THAT issue. See this site:
> 
> http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers/

Which HW platform are you working with? We already have some packages
for the Mali GPU drivers for some platforms. And we could add more.

Basically, it seems to me that you are trying to hack very complicated
things while there are much simpler and better solutions that exist and
that you don't know about.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
