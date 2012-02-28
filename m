From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 28 Feb 2012 17:47:40 +0100
Subject: [Buildroot] ltrace hangings
Message-ID: <4F4D052C.3030608@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm having a hard time here using ltrace with buildroot or crosstool-ng.

Basically, with a crosstool-NG 1.13.4, with the sample
arm-unknown-linux-gnueabi (so uclibc 0.9.30.2), I get :
__uClibc_main(52956, 2, 0xbec42db4, 47280, 521292
and it hangs.

Same thing with a toolchain built by buildroot and with uclibc 0.9.32.

Finally, I tried still with buildroot, but using the latest codebench
glibc toolchain, I get:

# ltrace cat /proc/self/cmdline
__libc_start_main(53812, 2, 0xbefeedb4, 518624, 518824

Is it a wild guess to think that ltrace 0.5.3 is buggy, or am I doing
something wrong ?

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
