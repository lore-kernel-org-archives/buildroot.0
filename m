From: Alex Parkinson <okalex@gmail.com>
Date: Wed, 30 Apr 2008 01:57:17 -0400
Subject: [Buildroot] AT91SAM9260DFC - Skeleton not copied properly
Message-ID: <A0B31F1E-0816-4AF8-A2A2-DEB2544E2825@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to get a root filesystem built properly using Buildroot  
rev. 21876, but the target_skeleton directory doesn't seem to be  
copied properly into the working root directory.  The project makes  
without any critical errors, but when I examine the root filesystem,  
there's quite a bit missing.  For instance, the only directories in  
root are bin, dev, etc, home, lib, sbin, tmp, and usr, plus the  
linuxrc link.  Similarly, the few directories that do exist aren't  
full populated.  The etc directory only has the files br-version,  
hostname, issue, ld.so.cache, and the network directory.  I examined  
the target_skeleton directories (target/generic and target/device/ 
Atmel/root), and they seem to be fully in tact, so it seems that the  
skeleton isn't being copied into the build directory properly.  Does  
anyone have an idea what could be causing this?  I've tried to figure  
out where the skeleton is copied over (is it the $(BUILD_DIR)/.root  
target in the base Makefile?), but that didn't really get me  
anywhere.  I'm not sure what else I can do to debug this.  Any and  
all help is greatly appreciated.

Cheers,
Alex
