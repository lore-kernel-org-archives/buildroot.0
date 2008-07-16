From: Chris Sharman <chris@powercomgroup.com>
Date: Thu, 17 Jul 2008 08:43:28 +1000
Subject: [Buildroot] illegal instruction on AT91
Message-ID: <1216248208.20615.11.camel@csharman-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have been using an older svn of buildroot for around 6 months with an
AT91SAM9260 based custom board.

I am now trying to bring everything up to the latest svn.

I can build a rootfs and kernel no problem, everything boots fine. Then
some apps throw an Illegal Instruction and crash. Namely curl and
sometimes sqlite.

I have NWFPE enabled in the kernel. I've tried rebuilding everything (by
doing rm *build* in buildroot). I've tried selecting generic_arm instead
of arm926t, I've tried using gcc 4.1.2 which is the same version as I
used on my old buildroot revision and also gcc 4.2.4. I tried booting an
older kernel (from a working system) and I got the same results every
time. I'm using kernel 2.6.25 with at91 patches.

I tried comparing the uclibc config from my old buildroot (using 0.9.29
in both) there were only two differences, SUSV3 macros and USE_BX. I
enabled these the same as my old buildroot and I still get the illegal
instruction with curl.

does anyone have any suggestions?


Regards
Chris

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080717/33346dc9/attachment.htm 
