From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 3 Mar 2014 12:31:45 +0100 (CET)
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303090219.65a08cc7@skate>
Message-ID: <495852511.10469178.1393846305700.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All

| 
| > microblaze |                     gpm-1.20.7 | NOK |
| > http://autobuild.buildroot.net/results/e99afadca6de92aad8563006fc7219aa32d77a88/
| 
| Strange:
| 
| /home/test/test/2/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc
| libgpm.so.2 \
| 	 -L/home/test/test/2/output/build/gpm-1.20.7/src  -o
| 	 lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo
| 	 lib/report-lib.lo tools.lo  -lc
| microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file
| or directory
| 
| Spenser ?

It's because __ELF__ is not defined in microblaze toolchain :
checking whether system is ELF... no

If elf format is not enabled then gpm is build statically.
You may have noticed that qpm static build is disabled in gpm.mk because it's broken.

I can try to fix gpm's static build.

Best regards,
Romain
