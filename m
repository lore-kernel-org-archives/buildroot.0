From: Elizabeth Oldham <beth@the-hug.org>
Date: Wed, 17 Oct 2007 22:11:57 +0100
Subject: [Buildroot] How to build gcc with -m24k option
In-Reply-To: <760119.69994.qm@web7914.mail.in.yahoo.com>
References: <760119.69994.qm@web7914.mail.in.yahoo.com>
Message-ID: <47167A9D.5050008@the-hug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sathesh babu wrote:

> td/.tmp_mtd_blkdevs.o drivers/mtd/mtd_blkdevs.c
> mips-linux-ld: final link failed: Bad value

Thought I recognised this, it's been on the linux-mips.org mailing list. 
Here is a response to that OP:

-------- Original Message --------
Subject: Re: Linux-2.6.18.8 compilation errors with GCC-4.2.1 and 
binutils-2.17 on MIPS
Date: Wed, 17 Oct 2007 09:21:43 -0700
From: David Daney <ddaney@avtrex.com>
To: veerasena reddy <veerasena_b@yahoo.co.in>
CC: linux-kernel.org <linux-kernel@vger.kernel.org>,        linux-mips 
<linux-mips@linux-mips.org>
References: <304090.76321.qm@web8411.mail.in.yahoo.com>

veerasena reddy wrote:
 > Hi,
 >
 > I tried to compile Linux-2.6.18.8 for MIPS24KE
 > processor using cross-compiler built from gcc-4.2.1,
 > binutils-2.17 and uClibc-0.9.27. But, the compilation
 > failed with below error message ("mips-linux-ld: final
 > link failed: Bad value"):
 > ================================

The likely cause is:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=33755

As indicated in the PR, Richard has a patch that he is testing.  I would
think that by the time gcc-4.2.3 is released that it would be fixed.

I would recommend using a non-4.2.x version of gcc until the problem is
fixed.

David Daney

>   Can you pls tell what could be the reason.

I guess 4.2.1 is broken :)
Beth
