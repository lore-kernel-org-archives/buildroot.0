From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Thu, 24 Sep 2009 13:52:18 +0200
Subject: [Buildroot] Buildroot build fails is executed from Makefile
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69B015D9@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB69B015D9@MAIL-UA.ccs.local>
Message-ID: <330EC2471BF24E48B513AF1A6975EB69B01611@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems that the problem isn't Makefile related. I get same results if
I from the shell try to execute make -C buildroot.

Teemu Keskinarkaus

________________________________________
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Teemu Keskinarkaus
Sent: 24. syyskuuta 2009 12:52
To: buildroot at busybox.net
Subject: [Buildroot] Buildroot build fails is executed from Makefile

I have main Makefile that's idea is to build the whole system. With the
old buildroot it worked just fine, but with the latest stable buildroot
it seems to be failing in kernel build.

Here is some of the debug printout I got out from make

Must remake target `modules_install'.
Successfully remade target file `modules_install'.
make[2]: Leaving directory
`/opt/buildroot/project_build_arm/project/linux-2.6.27.34'
WARNING: Can't read module GNU: No such file or directory
WARNING: Can't read module Make: No such file or directory
WARNING: Can't read module 3.81: No such file or directory
WARNING: Can't read module Copyright: No such file or directory
WARNING: Can't read module (C): No such file or directory
WARNING: Can't read module 2006: No such file or directory
WARNING: Can't read module Free: No such file or directory
WARNING: Can't read module Software: No such file or directory
WARNING: Can't read module Foundation,: No such file or directory

It seems that for some reason it tries to do something with the text
that is being printed out somewhere else. I'm not 100% sure if this is
buildroot problem or actually a kernel problem. 

The buildroot make is called from other makefile either:

$(MAKE) -C buildroot

or

make -C buildroot

or

cd buildroot ; \
make

but none of those worked and resulted the same error.

Teemu Keskinarkaus
