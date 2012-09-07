From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 7 Sep 2012 17:40:01 +0530
Subject: [Buildroot] Beaglebone build broken ?
Message-ID: <5049E419.2050408@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using the tip of buildroot, to build for beaglebone (using
beaglebone_defconfig) and running into a couple of issues:

1. The hard FPU settings cause uClibc build to break (intermixing of
soft and hard) and an equivalent of below needs to be made to top level
config file.

-BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-fpu=vfpv3 --with-float=hard"
+BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=soft"
-# BR2_SOFT_FLOAT is not set
+BR2_SOFT_FLOAT=y

If this is a must, can this be committed to buildroot itself. I can't
propose a patch myself because I'm not sure why it must or must-not be
built with software float.

2. Next, it's failing when trying to get the custom kernel.

Cloning into bare repository
linux-linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91...
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
--2012-09-07 12:54:37-- 
http://sources.buildroot.net//linux-linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2012-09-07 12:54:38 ERROR 404: Not Found.

A few months back I could successfully build bone image so obviously
this kernel issue was not present then.


Thanks,
Vineet
