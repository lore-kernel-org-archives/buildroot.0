From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 07 Apr 2017 10:54:04 +0200
Subject: [Buildroot] [Patch v4 1/3] rust-bootstrap: new package
In-Reply-To: <20170407102613.7a8c96b3@free-electrons.com>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
 <1491548614.26127.3.camel@embedded.rocks>
 <20170407102613.7a8c96b3@free-electrons.com>
Message-ID: <1491555244.1058.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2017-04-07 at 10:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 07 Apr 2017 09:03:34 +0200, J?rg Krause wrote:
> > On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> > > This new package fetches a binary snapshot of the Rust compiler,
> > > suitable for the host, in order to bootstrap the Rust compiler.
> > > 
> > > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > > ---
> > > ?DEVELOPERS?????????????????????????????????|??1 +
> > > ?package/rust-bootstrap/rust-bootstrap.hash |??5 ++++
> > > ?package/rust-bootstrap/rust-bootstrap.mk???| 37
> > > ++++++++++++++++++++++++++++++
> > > ?3 files changed, 43 insertions(+)
> 
> It would be nice if you could fix your e-mail client to not rewrap the
> text you are replying to :)

Naughty mail client. Told him not do such bad things anymore :-)

> > > +ifeq ($(HOSTARCH),x86_64)
> > > +RUST_BOOTSTRAP_ARCH = x86_64
> > > +else ifeq ($(HOSTARCH),x86)
> > > +RUST_BOOTSTRAP_ARCH = i686
> > > +endif  
> > 
> > Is there any necessity to limit the bootstrap compiler to those host
> > archs only?
> 
> The bootstrap compiler is provided as a binary only thing,
> pre-compiled. So it works only on the architectures it was compiled
> for. At least, that's why I remember from previous series on this topic.

But, if I am running Buildroot on a PowerPC it should be able to fetch
and run the binary for PowerPC, right?

> > > +RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_LABEL).tar.gz
> > > +RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
> > > +RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > > +RUST_BOOTSTRAP_LIBSTD_SOURCE= rust-std-
> > > $(RUST_BOOTSTRAP_LABEL).tar.gz
> > > +RUST_BOOTSTRAP_LIBSTD_ROOT = rust-std-$(RUST_BOOTSTRAP_LABEL)/rust-
> > > std-$(RUST_BOOTSTRAP_TRIPLE)  
> > 
> > Why not make a seperate package?
> 
> It apparently needs to be extracted within the bootstrap compiler tree,
> i.e in $(@D)/rustc, I guess that's why. But Eric can give more details
> here.

Maybe the path to the rust libraries could be added to LD_LIBRARY_PATH?

J?rg
