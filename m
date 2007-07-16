From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 16 Jul 2007 11:03:00 +0200
Subject: [Buildroot] error building toolchain with gettext /libintl
In-Reply-To: <C03A3C267DDF184EA523BBAB577BF924C22CF4@blrexsr1.slti.sanyo.co.in>
References: <C03A3C267DDF184EA523BBAB577BF924C22CF4@blrexsr1.slti.sanyo.co.in>
Message-ID: <1184576580.18357.4.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-16 klockan 09:02 +0530 skrev Gururaja Hebbar K R:
>  Hi all,
> 
> I am trying to build a ARM toolchain in buildroot for the 1st time with
> below mentioned config. Everything goes fine till gettext building. when
> make gettext-target is executed it halts with error saying
> 
> cp -dpf
> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
> sr/lib/libgettext*.so* \

I have noted this as well, and the problem is that 

"staging_dir/usr/lib/libgettext*.so* " was never created.

Instead "staging_dir/usr/lib/libgettext*.a" was created.

This problem has been around for a long time.


I have yet to figure out how to make the ARM gcc build the 
shared library instead of the static library

Is it possible to supply "--with-shared" or something 
when configuring?


Best Regards,
Ulf Samuelsson
