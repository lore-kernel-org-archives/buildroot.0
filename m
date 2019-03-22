From: Nylon Chen <nylon7@andestech.com>
Date: Fri, 22 Mar 2019 16:45:11 +0800
Subject: [Buildroot] [PATCH v3 3/3] upport/config-fragments/autobuild:
 test the Andes nds32 toolchain
In-Reply-To: <20190321111210.GA2660@scaer>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-4-nylon7@andestech.com>
 <20190314224250.GD6876@scaer> <20190321025103.GC12833@app09>
 <20190321085120.4fb043b5@windsurf> <20190321111210.GA2660@scaer>
Message-ID: <20190322084511.GB28644@app09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All,

On Thu, Mar 21, 2019 at 12:12:10PM +0100, Yann E. MORIN wrote:
> Nylon, Thomas, All,
> 
> On 2019-03-21 08:51 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 21 Mar 2019 10:51:03 +0800
> > Nylon Chen <nylon7@andestech.com> wrote:
> > 
> > > > > diff --git a/support/config-fragments/autobuild/br-andes-nds32.config b/support/config-fragments/autobuild/br-andes-nds32.config
> > > > > new file mode 100644
> > > > > index 0000000000..cd093a20f9
> > > > > --- /dev/null
> > > > > +++ b/support/config-fragments/autobuild/br-andes-nds32.config
> > > > > @@ -0,0 +1,9 @@
> > > > > +BR2_nds32=y
> > > > > +BR2_TOOLCHAIN_EXTERNAL=y
> > > > > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > > > > +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > > > > +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"  
> > > I think I misunderstood the meaning of Thomas Petazzo.
> > > 
> > > I thought that as long as the pre-build remote toolcahin is given.(So I used our own pre-build remote toolchain)
> > > 
> > > It may take a few more days, we will contribute glibc back to upstream, and then we can compile it internally using buildroot.
> > 
> > It is perfectly fine to use a pre-built toolchain, I think what Yann
> > explained is that since the source code of gcc/binutils/glibc/linux is
> > available, it makes sense to *also* support building the toolchain with
> > Buildroot.
> 
> Exactly, yes.
> 
> But that can come later, in a followup series.
> 
> Regards,
> Yann E. MORIN.
>
In order to get rid of rework.

I prefer to send glibc to upstream and then come to this patch.
> > Also, it is not mandatory for the glibc support to be in upstream
> > glibc. We support architectures for which the gcc, binutils or libc
> > support is not yet fully upstreamed. For example, for RISC-V 32-bit,
> > we're using a non-upstream glibc.
> > 
> > Best regards,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
