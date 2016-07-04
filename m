From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:48:53 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add bfin support
In-Reply-To: <20160704110849.28f815fc@free-electrons.com>
References: <20160603040531.GA31560@waldemar-brodkorb.de>
 <20160704110849.28f815fc@free-electrons.com>
Message-ID: <20160704174853.59af47cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 11:08:49 +0200, Thomas Petazzoni wrote:

> BTW, uClibc-ng has linuxthreads support for Blackfin, but this patch
> series does not enable it. I tried to enable it, but it fails to build.
> 
> Do you plan on enabling thread support on Blackfin at some point ?
> 
> If we have good enough Blackfin support in the internal toolchain
> backend, this would ultimately allow us to get rid of the old Analog
> Devices external toolchains for Blackfin (they use gcc 4.3, a
> prehistoric version of uClibc, etc.), so getting rid of them would
> really be nice.

Also, the default Blackfin core in Buildroot is bf609, and there's no
support for it in the upstream gcc, which causes a build failure when
building uClibc-ng because -mcpu=bf609 is not valid.

It looks like we will need to:

 1/ Change the default Blackfin core to something that the internal
    toolchain backend support

 2/ Make the internal toolchain backend only available if the selected
    Blackfin core is supported

Could you work on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
