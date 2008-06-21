From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 21 Jun 2008 14:51:01 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <6a2e33620806201313h2ceb6b6yfebe620f4ef3c2d@mail.gmail.com>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
	<87r6as2c0o.fsf@macbook.be.48ers.dk>
	<200806202050.32567.fboudra@gmail.com>
	<6a2e33620806201313h2ceb6b6yfebe620f4ef3c2d@mail.gmail.com>
Message-ID: <20080621125101.GA10734@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2008 at 10:13:39PM +0200, Fathi Boudra wrote:
>using --disable-decimal-float workaround the issue.

exactly. I've added a knob behind the scenes that takes care of it. I'll
commit it sometimes next week.
>
>uclibc fails to build later:
>
>  CC libc/sysdeps/linux/common/chdir.os
>In file included from ./include/sys/param.h:22,
>                 from libc/sysdeps/linux/common/chdir.c:13:
>./include/limits.h:124:26: error: limits.h: No such file or directory

I'm not sure why you see this (works for me). Please show me your 
$ egrep -v "(^#|^$)" .config
from buildroot
