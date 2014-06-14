From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 10:16:06 +0200
Subject: [Buildroot] [PATCH] dialog: bump to version 1.2-20140219
In-Reply-To: <1402668939-1372-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402668939-1372-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140614101606.63faccd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 13 Jun 2014 11:15:39 -0300, Gustavo Zacarias wrote:
> Add a homepage.
> Ditch custom install target commands, they're not needed.

Apparently, this update is causing some build issues, see
http://autobuild.buildroot.org/results/411/411f6171e972eab4486143dedbfd078136886ab0/build-end.log.
There are paths to the host library used when linking a target
application:

/scratch/peko/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o dialog dialog.o -L. -ldialog -Wl,-rpath,/scratch/peko/host/usr/lib   -L/scratch/peko/host/usr/lib -Wl,-rpath,/scratch/peko/host/usr/lib -Wl,-rpath,/scratch/peko/host/lib -lncurses -lm -lncurses 

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
