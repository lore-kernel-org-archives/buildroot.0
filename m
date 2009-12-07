From: Marc Egli <marc.egli@hsr.ch>
Date: Mon, 7 Dec 2009 21:28:13 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
Message-ID: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configuring kismet fails with the following message:
checking for linux/wireless.h... (cached) no
configure: error: Failed to find a usable linux/wireless.h header for Linux Wireless Extensions.  Either your kernel headers are missing or are incorrect.  See config.log for the exact error.  Compiling without wireless headers must be explicitly disabled
make: *** [/emb/buildroot/output/build/kismet-2009-06-R1/.stamp_configured] Error 1

in the kismetwireless forum i found the following:
The configure script is pretty much straightforward: If you don't provide a --linux-headers parameter, it adds /lib/modules/!version!/build/include to the header search path. This is SUPPOSED to be the build environment of the running kernel, and as such is SUPPOSED to have linux/foo.h

now how can i give the kernelheader path to the configure script? and wich version do i have to use? i've found about 10 files named wireless.h in buildroot

thx for your help
