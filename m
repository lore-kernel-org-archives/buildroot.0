From: Leonid <Leonid@a-k-a.net>
Date: Sat, 13 Oct 2007 22:22:12 -0700
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <47116C13.9020701@promwad.com>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>
	<47116C13.9020701@promwad.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

I need some device nodes for my proprietary driver and I have added
appropriate lines to the end of
target/device/Atmel/root/device_table.txt table I'm using:

# AKA driver
/dev/mcfp-0    c    640    0       0      254      0       0       0
-
/dev/mcfp-1    c    640    0       0      254      1       0       0
-

I see that correspondent files are indeed created in the root filesystem
tree:

[leonid at jaipur buildroot]$ ls -al root/dev/mc*
-rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-0
-rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-1

However when I load my ext2 root filesystem, I don't see these device
nodes in /dev directory. What is wrong?

Thanks,

Leonid.
