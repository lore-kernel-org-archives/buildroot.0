From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Fri, 21 Aug 2015 08:56:55 -0700
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <CA+BsyQ5fZ=0krEW1ctCCV5R5Jaswe90_v6TYir0kGoEHK=FdHA@mail.gmail.com>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
 <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD968D@svr-wa-exch1.atg.lc>
 <CA+BsyQ5fZ=0krEW1ctCCV5R5Jaswe90_v6TYir0kGoEHK=FdHA@mail.gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD96A4@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

I did not touch the inittab files in my buildroot-2015.05. There are five files in the folder as:

tclee at Latitude-E6400:~/Downloads/aug10mon15/buildroot-2015.05$ find . -name inittab|xargs ls -lrt
-rw-rw-r-- 1 tclee tclee 3067 Mar 22 20:06 ./output/build/busybox-1.23.2/examples/inittab
-rw-rw-r-- 1 tclee tclee  100 Mar 22 20:06 ./output/build/busybox-1.23.2/examples/bootfloppy/etc/inittab
-rw-rw-r-- 1 tclee tclee 1053 May 31 14:15 ./system/skeleton/etc/inittab
-rw-rw-r-- 1 tclee tclee  747 May 31 14:15 ./package/sysvinit/inittab
-rw-rw-r-- 1 tclee tclee 1056 Aug 20 15:49 ./output/target/etc/inittab

My booting process must use the last inittab  which was built yesterday. Following are the TTY settings in my current .config file:

tclee at Latitude-E6400:~/Downloads/aug10mon15/buildroot-2015.05$ egrep -n TTY .config
286:BR2_TARGET_GENERIC_GETTY=y
291:BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
292:# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
293:# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
294:# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
295:# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
296:# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
297:BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
298:BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
299:BR2_TARGET_GENERIC_GETTY_TERM="vt100"
300:BR2_TARGET_GENERIC_GETTY_OPTIONS="n81"

My U-Boot console string is " ttyS0,115200". I doubt whether the settings on Line 299 and Line 300 are improper.

Tommy




-----Original Message-----
From: Brendan Heading [mailto:brendanheading at gmail.com]
Sent: Thursday, August 20, 2015 5:12 PM
To: Lee, Tommy
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] bootm - "Starting kernel"

> FYI, I unplugged the Ethernet cable and did the steps again. This time
> the same ?tty: bad speedgetty? message is still repeated.

Nothing to do with ethernet - it sounds like it's trying to start getty but there's an issue with the speeds. The error message comes from loginutils/getty.c inside busybox.

Did you mess around with /etc/inittab, or did you leave it at the defaults ?

Brendan

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
