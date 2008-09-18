From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 18 Sep 2008 10:48:03 +0200
Subject: [Buildroot] broken build rootfs workflow
Message-ID: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

So far, I have my own configuration file (project, uclibc, busybox) to build
rootfs.

I tried this workflow and it seems broken:

make defconfig
make BOARD=myproject getconfig
make oldconfig
make UCLIBC_CONFIG_FILE=local/myproject/uclibc.config
BUSYBOX_CONFIG_FILE=local/myproject/busybox.config

1) the defconfig call is needed otherwise getconfig doesn't work on a fresh
checkout:
Makefile:227: .config.cmd: No such file or directory
make: *** No rule to make target `.config.cmd'.  Stop.

2) my configuration files (UCLIBC_CONFIG_FILE/BUSYBOX_CONFIG_FILE) aren't
passed correctly during build process:
my provided uclibc.config is completely different from the generated/used
.config.

I would like to build a project using my 3 provided configurations files in
a non-interactive mode (in a script as an example or a buildbot setup).

Anyone ?

cheers,

Fathi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080918/a9bc31f1/attachment-0001.htm 
