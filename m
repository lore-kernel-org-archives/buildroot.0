From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 19 Jan 2009 20:17:40 +0100
Subject: [Buildroot] Trouble with kernel patch in buildroot
In-Reply-To: <gl1ded$mtc$1@ger.gmane.org>
References: <gl1ded$mtc$1@ger.gmane.org>
Message-ID: <1232392661.4539.6.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-19 klockan 10:23 +0200 skrev Darius:
> Hi All,
> 
> I want to configure buildroot for my needs. I specified advanced kernel configuration, kernel version (tarbal name) 2.6.28 and patch name patch-2.6.29-rc1.bz2.
> But buildroot does not try to download and apply this patch. Why? Kernel tarbal is downloaded and extracted well, but buildroot tries to configure kernel config without patch applied.
> I specified patch site http://www.kernel.org/pub/linux/kernel/v2.6/testing/ in menuconfig.
> 
> Darius A.

When you want to use your own patch, you are responsible for 
making it available in DL_DIR.

They way to do what you want is to specify


-----------------
kernel type (linux (Advanced configuration))  --->
Linux Kernel Version (Linux 2.6.28)  --->
Patches  --->
kernel binary format (XXXX9
Destinations ....

------------------
In "Patches" you do:


[*] Add kernel.org patch
[ ] Use only the latest patch version
    Add a kernel.org patch to the Linux kernel (Add an `-rc#' patch)
--->
(1) -rc patch level
[ ] Add ARCH specific patch  --->
()  Additional patch to apply (from $(DL_DIR))



BR
Ulf Samuelsson




> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
