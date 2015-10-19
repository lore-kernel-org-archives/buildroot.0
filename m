From: logos <logos.rsw@gmail.com>
Date: Mon, 19 Oct 2015 15:45:41 -0700 (PDT)
Subject: [Buildroot] buildroot inittab getty
Message-ID: <1445294741948-115526.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am a newbie here.
I had a question today and I tried find the answer in this forum.
Failed apparently.
So I decided to post it here.

Buildroot version that I am using is "2015.02, Released March 1st, 2015"

In buildroot menuconfig, I didn't choose "Run a getty (login prompt) after
boot",
but in my output/target/etc/inittab, I have this line,
ttyS3::respawn:/sbin/getty -L  ttyS3 57600 vt100 # GENERIC_SERIAL

system/skeleton/etc/inittab shows,
#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

1. How can this happen? Why is the line uncommented?
FYI, in my .config file I have
# BR2_TARGET_GENERIC_GETTY is not set

2. Why tty port has changed from ttyS0 to ttyS3?

3. If possible, I'd like to understand inittab file generation process.

4. Maybe this question doesn't belong here, 
    what option or parameter do I need to setup if I want to login without
typing login name and password after booting?
Currently I have to type "root" and hit enter. (no password setup for root)

Thanks for reading and appreciate any reply including directing me to right
place to ask this question.





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/buildroot-inittab-getty-tp115526.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
