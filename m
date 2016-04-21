From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 21:28:01 +0200
Subject: [Buildroot] [PATCH] uboot build and deploy added to juno board
In-Reply-To: <5719016A.1020303@synopsys.com>
References: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
 <20160420220228.59d5e54f@free-electrons.com>
 <5718AC9A.4060801@synopsys.com>
 <20160421132639.16cd8714@free-electrons.com>
 <5719016A.1020303@synopsys.com>
Message-ID: <20160421212801.1401f107@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 17:35:54 +0100, Joao Pinto wrote:

> I developed the atfirmware config and I am having problems in the Makefile.
> How does the buildroot structure git clones / untar / etc.? I suppose there is a
> common spot to do these stuff right?

Look at how the barebox build is done, boot/barebox/barebox.mk.

> 
> Send in attchment tarball of the new package.

Well, your .mk file has no chance to work, you're not even calling any
Buildroot package infrastructure, your build commands are not inside a
variable, etc.

> I am thinking of adding it to Bootloaders. What do you think?

Yes, it should obviously go in the Bootloaders menu.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
