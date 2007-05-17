From: Jason Curl <jcurlmail@arcor.de>
Date: Thu, 17 May 2007 20:01:12 +0200
Subject: [Buildroot] Higher speed baudrates
Message-ID: <464C9868.3050601@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I think buildroot is the best place for this, as it appears to modify 
the kernel sources. I've compiled buildroot-20070515 and use 
uClibc-0.9.29 with kernel 2.6.20.4 as the include sources (the actual 
kernel version for my system is really kernel 2.6.21.1 but I hope that 
doesn't make a difference).

When building my software, I see that B230400 is not available and in 
termios.h it is commented out, apparently to keep in line with 
cfsetspeed.c in uClibc. I checked the file from uClibc and it apparently 
does support these baudrates and sends them to the appropriate termios 
structures to the kernel.

Is this simply an oversight, or what kind of work is cut out for me to 
add this support in uClibc?

Thanks,
Jason.
