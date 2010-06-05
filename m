From: Odd Arild Olsen <oao@oao.no>
Date: Sat, 5 Jun 2010 12:31:39 +0200
Subject: [Buildroot] Kernel local version
Message-ID: <201006051231.39578.oao@oao.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I set the kernel local version (CONFIG_LOCALVERSION) to a string XYZ the 
module build process creates an output/target/lib/modules/2.6.32.9XYZ 
directory as expected. 

However, just after running DEPMOD for this directory and removing some 
directories the build process then tries to create this file: 
output/target/lib/modules/2.6.32.9/modules.dep.temp

Somehow the local version string was left out here. I guess this is a known 
problem but my searches did not give me any clues.

oao
