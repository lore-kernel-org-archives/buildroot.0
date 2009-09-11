From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2009 09:14:15 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local>
Message-ID: <20090911091415.19422fbb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Teemu,

Le Fri, 11 Sep 2009 08:48:25 +0200,
"Teemu Keskinarkaus" <Teemu.Keskinarkaus@cc-systems.com> a ?crit :

> Now when I configure external toolchain in use and execute make -
> command I get result 'Incorret selection of the C library'. Toolchain
> is EABI and uses glibc. I have tried both uClibc and glibc - settings
> from the buildroot setup, but still get the same error.  (Of course
> that's valid for uClibc). 

Which external toolchain are you using ?

What does the following command returns ?

 LANG=C $(TARGET_CC) -v 

If you see a --with-sysroot thing in the result, could you look in this
directory, and then in /lib/ to see if there is any ld-linux.* file ?

> With older buildroot there were no such problems and I was able to
> start using external toolchain with little troubles. (Although later
> on I ran in to some other problems and that's why I upgraded the
> buildroot).

We added more checks to make sure that the configuration of Buildroot
matches the configuration of the external toolchains. But there's such
a variety of external toolchains that these checks might need some
fixes.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
