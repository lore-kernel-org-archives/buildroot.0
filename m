From: Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>
Date: Fri, 19 Sep 2008 09:15:22 +0100
Subject: [Buildroot] broken build rootfs workflow
In-Reply-To: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
References: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
Message-ID: <B44D4D5BF344094DABB900C4E0F6E35301A1A1DEB3@srv02.nortechonline.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll second that this is a problem.

My automated build script does very similar to yours, but then I copy the 3 .config files from the 'local' directory into the correct folders and call make a final time.

Simon

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Fathi Boudra
Sent: 18 September 2008 09:48
To: Buildroot Mailinglist,
Subject: [Buildroot] broken build rootfs workflow

Hi,

So far, I have my own configuration file (project, uclibc, busybox) to build rootfs.

I tried this workflow and it seems broken:

make defconfig
make BOARD=myproject getconfig
make oldconfig
make UCLIBC_CONFIG_FILE=local/myproject/uclibc.config BUSYBOX_CONFIG_FILE=local/myproject/busybox.config

1) the defconfig call is needed otherwise getconfig doesn't work on a fresh checkout:
Makefile:227: .config.cmd: No such file or directory
make: *** No rule to make target `.config.cmd'.  Stop.

2) my configuration files (UCLIBC_CONFIG_FILE/BUSYBOX_CONFIG_FILE) aren't passed correctly during build process:
my provided uclibc.config is completely different from the generated/used .config.

I would like to build a project using my 3 provided configurations files in a non-interactive mode (in a script as an example or a buildbot setup).

Anyone ?

cheers,

Fathi
