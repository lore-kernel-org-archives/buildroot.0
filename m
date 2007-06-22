From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 22 Jun 2007 19:50:05 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target: device
	device/mips
In-Reply-To: <f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
References: <20070622084710.5B20648010@busybox.net>
	<f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
Message-ID: <20070622175005.GA2799@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 06:40:02PM +0200, Julien Letessier wrote:
>Bug: This breaks building the linux kernel for other devices, which
>use zImage or bzImage.
>
>Why: LINUX26_BINLOC is always defined in target/device/mips/Makefile.in
>Therefore it its definition in target/linux26.mk is never used

right, sorry. r18896 wraps this file in a mips/mipel check.
>
>Fix: For now, remove target/device/mips/Makefile.in, which is not
>protected by a board-support menuconfig option.

should be fixed.
Thanks!
