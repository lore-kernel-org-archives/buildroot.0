From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 20:10:04 +0200
Subject: [Buildroot] Problems with 'iw'
In-Reply-To: <BECCD53EFF877A4F8D909C37120A85375303DD68@CHEWBACCA.connectBlue.local>
References: <BECCD53EFF877A4F8D909C37120A85375303DD68@CHEWBACCA.connectBlue.local>
Message-ID: <20130916201004.4fb7e9ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonas Ludvigsson,

On Mon, 16 Sep 2013 12:07:35 +0000, Jonas Ludvigsson wrote:

> I'm trying to enable the wlan module on a TI AM335x EVM Board and have successfully been able to add drivers and firmware for wl1271.
> But when I'm trying start a scan using 'iw' I get 'Segmentation fault'. In fact all 'iw' always returns segmentation fault.
> 
> I added support for 'iw' in Buildroot (2013.08) which is configured to use its internal toolchain (uClibc 0.9.33.x),
> kernel version (3.2.42) and Busybox (1.21.x).
> 
> What could be the problem?

Hum, many things. Your best starting point is probably to do:

# ulimit -c unlimited
# iw

and then take the generated 'core' file, bring it into your cross gdb
on your development machine, and look at the backtrace to see where the
crash is happening.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
