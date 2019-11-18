From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 09:11:44 +0100
Subject: [Buildroot] [PATCH] toolchain-external: Introduce gdb_copy
 option
In-Reply-To: <20191118080047.22036-1-Evgeniy.Didin@synopsys.com>
References: <20191118080047.22036-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20191118091144.1407b93b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Nov 2019 11:00:47 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> Some prebuilt toolchains provide full gdb debugger for a target as
> well as gdbserver. Lets add separate option for gdb the same way as
> it was done for gdbserver. With this change there will be no need
> to build gdb package, this will reduce build time.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

Thanks for your contribution and proposal. However, I'm wondering if
this really works properly in the general case. Indeed, gdb is often
linked against additional libraries: ncurses, expat, python, zlib,
lzma, etc.

Here you are only copying the gdb binary itself, but not the libraries
it might depend on. But even if you were copying those libraries, they
would potentially conflict with the ones built by Buildroot.

So I'm not sure if there's really a good way to re-use a gdb built by
an external toolchain.

In your specific case, is the gdb binary statically linked ? Or at
least statically linked against all libraries except the C library ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
