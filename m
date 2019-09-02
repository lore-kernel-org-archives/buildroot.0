From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:35:41 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: allow VC4 driver on all ARM
 platforms
In-Reply-To: <20190819124601.21549-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 19 Aug 2019 14:46:00 +0200")
References: <20190819124601.21549-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y2z61zjm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 3e5926555b59b50210bb7814d176b384f9d554ab ("package/{mesa3d,
 > mesa3d-headers}: bump version to 17.1.2"), the dependency of VC4 on
 > BR2_arm was changed to BR2_ARM_CPU_HAS_NEON, which the reasoning that
 > upstream commit
 > https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=4d30024238efa829cabc72c1601beeee18c3dbf2
 > made NEON mandatory. However, this commit (including its commit log)
 > clearly shows that there is compile-time detection on whether you're
 > using ARMv6 or ARMv7, and simply says there is no runtime detection
 > for that (which usually isn't very important in the context of
 > Buildroot). So, the VC4 driver can be used on ARMv6
 > RaspberryPis. Therefore, this commit reverts to the BR2_arm
 > dependency.

 > Note: while there are some ARMv7 without NEONs, all ARMv7 RaspberryPi
 > platforms do have NEON, so the compile-time checks done in the VC4
 > driver are good enough.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12126

 > Cc: Sahaj Sarup <sahajsarup@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
