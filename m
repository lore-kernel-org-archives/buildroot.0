From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Dec 2009 17:02:31 +0000 (UTC)
Subject: [Buildroot] Failure building default config for ARM integrator
Message-ID: <hgb3r7$88l$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build the default config for the ARM integrator
target.  [It's the same architecture as my board, and it's
supported by Qemu, so it's a useful testbed.] It fails when it
tries to build U-Boot.  I don't really care about building
U-Boot, so I could just deselect it.

However, if it's considered a bug when a "defconfig" target
doesn't "just build", then I'll try to fix it and submit a
patch.  Is this something that needs to be fixed, or is it
normal?

 $ git clone git://git.buildroot.net/buildroot
 
 $ cd buildroot
  
 $ make integrator926_defconfig

 [...]   
 [hit <enter> to accept default answers to a bunch of config questions]
 [...]    

 $ make

 [...]   
 [hit <enter> to accept default answers to more config questions]
 [...]  
  
 make[1]: Entering directory `/home/grante/buildroot-git/buildroot/output/build/u-boot-2009.08'
 make[1]: *** No rule to make target `integrator926_config'.  Stop.
 make[1]: Leaving directory `/home/grante/buildroot-git/buildroot/output/build/u-boot-2009.08'
 make: *** [/home/grante/buildroot-git/buildroot/output/build/u-boot-2009.08/.configured] Error 2

-- 
Grant Edwards                   grante             Yow! I smell like a wet
                                  at               reducing clinic on Columbus
                               visi.com            Day!
