From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Mar 2010 13:16:06 +0100
Subject: [Buildroot] How to compile oprofile when using an external
 binary toolchain
In-Reply-To: <570395.74949.qm@web24805.mail.ird.yahoo.com>
References: <570395.74949.qm@web24805.mail.ird.yahoo.com>
Message-ID: <20100317131606.07afc268@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Mar 2010 05:07:32 -0800 (PST)
Gianluca <funeral_party80@yahoo.it> wrote:

> I'm trying to compile oprofile for a mipsel platform but I'm using an
> external binary toolchain and so when it tries to compile binutils it
> can't download the right binutils package because the version is not
> specified in .config. I've tried to hack that by forcing the
> compilation of binutils 2.19.1 and it worked...but when I went
> finally to the last oprofile linking process I got some very strange
> linker errors like these:
> 
> non-dynamic relocations refer to dynamic symbol strcpy
> 
> and
> 
> failed to set dynamic section sizes: Bad value

I don't know about these, I would need to reproduce the problem.

> Is there a "standard" way of compiling oprofile when using the
> external toolchain? Thank you.

Peter, what do you think about this ?

For the moment, binutils for the target is compiled in
toolchain/binutils/binutils.mk, which isn't sourced when using an
external toolchain. Should we migrate the compilation of binutils for
the target to package/binutils (and use the Makefile.autotools.in
machinery) ? If so, how do we share the patches between
package/binutils and toolchain/binutils ? Should we still source
toolchain/binutils/binutils.mk even when an external toolchain is
selected ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
