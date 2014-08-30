From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 09:30:45 +0200
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <1409380559.92739.YahooMailNeo@web141703.mail.bf1.yahoo.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
 <20140820141013.24de59df@free-electrons.com>
 <1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
 <20140821150337.3bc770ae@free-electrons.com>
 <1408871597.42022.YahooMailNeo@web141705.mail.bf1.yahoo.com>
 <1409380559.92739.YahooMailNeo@web141703.mail.bf1.yahoo.com>
Message-ID: <20140830093045.3026a12b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear lee choon gay,

On Fri, 29 Aug 2014 23:35:59 -0700, lee choon gay wrote:

> I use single partition for this, sda1.
> Seems like the device driver is not ready yet to detect sda1.
> You have any workaround for this?

Indeed.

Please pass "rootwait" in your kernel parameters. It tells the kernel
to wait until the root device appears: USB devices are detected
asynchronously, and sometimes the kernel may try to mount the root
filesystem before the USB devices have been detected.

If that still doesn't work, it means that your kernel configuration is
wrong and lacks some device drivers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
