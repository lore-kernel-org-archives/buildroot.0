From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Mar 2019 08:51:20 +0100
Subject: [Buildroot] [PATCH v3 3/3] upport/config-fragments/autobuild:
 test the Andes nds32 toolchain
In-Reply-To: <20190321025103.GC12833@app09>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-4-nylon7@andestech.com>
 <20190314224250.GD6876@scaer> <20190321025103.GC12833@app09>
Message-ID: <20190321085120.4fb043b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nylon,

On Thu, 21 Mar 2019 10:51:03 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> > > diff --git a/support/config-fragments/autobuild/br-andes-nds32.config b/support/config-fragments/autobuild/br-andes-nds32.config
> > > new file mode 100644
> > > index 0000000000..cd093a20f9
> > > --- /dev/null
> > > +++ b/support/config-fragments/autobuild/br-andes-nds32.config
> > > @@ -0,0 +1,9 @@
> > > +BR2_nds32=y
> > > +BR2_TOOLCHAIN_EXTERNAL=y
> > > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > > +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > > +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"  
> I think I misunderstood the meaning of Thomas Petazzo.
> 
> I thought that as long as the pre-build remote toolcahin is given.(So I used our own pre-build remote toolchain)
> 
> It may take a few more days, we will contribute glibc back to upstream, and then we can compile it internally using buildroot.

It is perfectly fine to use a pre-built toolchain, I think what Yann
explained is that since the source code of gcc/binutils/glibc/linux is
available, it makes sense to *also* support building the toolchain with
Buildroot.

Also, it is not mandatory for the glibc support to be in upstream
glibc. We support architectures for which the gcc, binutils or libc
support is not yet fully upstreamed. For example, for RISC-V 32-bit,
we're using a non-upstream glibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
