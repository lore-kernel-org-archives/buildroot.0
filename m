From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Dec 2009 23:29:21 +0100
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <e14e708720ddfeae76da70a20047b110.squirrel@webmail.sonic.net>
	(joyful@sonic.net's message of "Wed, 23 Dec 2009 14:15:09 -0800")
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
	<62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
	<87fx73xxrk.fsf@macbook.be.48ers.dk>
	<e14e708720ddfeae76da70a20047b110.squirrel@webmail.sonic.net>
Message-ID: <877hsdwchq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "joyful" == joyful  <joyful@sonic.net> writes:

 joyful> Hi Peter,
 joyful> Thanks. Attached please see the .config file.  I don't really care
 joyful> about using busybox, but the make defconfig would not give me chance
 joyful> to say no. Then I just hit enter for the default values.

 joyful> I tried hard to get it working, but it just keeps giving me errors.

 joyful> Thanks and Happy Holidays.

You have:

BR2_KERNEL_LINUX=y
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_KCONFIG=""
BR2_PACKAGE_LINUX_FORMAT=""

E.G. build a Linux kernel with "" as the .config, which ofcourse won't
work.

Either specify the .config you want to use or disable the Linux kernel
build.

-- 
Bye, Peter Korsgaard
