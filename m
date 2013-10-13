From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 13 Oct 2013 19:05:03 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <36BC54E98DCB453CA22ADF10A4AF6F94@JohanW7>
References: <525AAE63.3060601@gmail.com> <20131013145124.GA16563@free.fr>
 <525AB5F9.8090907@gmail.com> <36BC54E98DCB453CA22ADF10A4AF6F94@JohanW7>
Message-ID: <525AD2BF.3000906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/10/2013 18:53, Sagaert Johan ha scritto:
> Just a caution:
> It's best to do a clean in a MYKMOD_CONFIGURE_CMDS section.
> I stumbled into this: the install path was not correct if the module had been build before.
> (In my case it was already build from within eclipse while developing.)


Hi,
I added the following section:

define SENSORAY2253_CONFIGURE_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) clean
endef

with no chance.
I tried also to remove the build/sensoray2253 directory and call:

make sensoray2253-reconfigure
make sensoray2253-rebuild

I cannot fine the ko file even in the build directory (I assume it is 
copied to the install dir rather than moved). Anyway I would expect a 
compiler error if the binary file is not created.

Mark
