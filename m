From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 11:03:56 +0200
Subject: [Buildroot] [Patch v4 1/3] rust-bootstrap: new package
In-Reply-To: <1491555244.1058.1.camel@embedded.rocks>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
 <1491548614.26127.3.camel@embedded.rocks>
 <20170407102613.7a8c96b3@free-electrons.com>
 <1491555244.1058.1.camel@embedded.rocks>
Message-ID: <20170407110356.108f4c78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Apr 2017 10:54:04 +0200, J?rg Krause wrote:

> > > Is there any necessity to limit the bootstrap compiler to those host
> > > archs only?  
> > 
> > The bootstrap compiler is provided as a binary only thing,
> > pre-compiled. So it works only on the architectures it was compiled
> > for. At least, that's why I remember from previous series on this topic.  
> 
> But, if I am running Buildroot on a PowerPC it should be able to fetch
> and run the binary for PowerPC, right?

If there's no prebuilt Rust compiler for PowerPC, then no, it will
simply not be possible.

We have already lots of things in Buildroot that depend on x86 or
x86-64. Check all packages/options that use BR2_HOSTARCH.

So, it's fine for Rust to also require a x86/x86-64 machine, as long as
the proper BR2_HOSTARCH dependency is present in the Config.in.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
