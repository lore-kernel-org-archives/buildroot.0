From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 10:26:13 +0200
Subject: [Buildroot] [Patch v4 1/3] rust-bootstrap: new package
In-Reply-To: <1491548614.26127.3.camel@embedded.rocks>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
 <1491548614.26127.3.camel@embedded.rocks>
Message-ID: <20170407102613.7a8c96b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Apr 2017 09:03:34 +0200, J?rg Krause wrote:
> On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> > This new package fetches a binary snapshot of the Rust compiler,
> > suitable for the host, in order to bootstrap the Rust compiler.
> > 
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> > ?DEVELOPERS?????????????????????????????????|??1 +
> > ?package/rust-bootstrap/rust-bootstrap.hash |??5 ++++
> > ?package/rust-bootstrap/rust-bootstrap.mk???| 37
> > ++++++++++++++++++++++++++++++
> > ?3 files changed, 43 insertions(+)

It would be nice if you could fix your e-mail client to not rewrap the
text you are replying to :)

> > +ifeq ($(HOSTARCH),x86_64)
> > +RUST_BOOTSTRAP_ARCH = x86_64
> > +else ifeq ($(HOSTARCH),x86)
> > +RUST_BOOTSTRAP_ARCH = i686
> > +endif  
> 
> Is there any necessity to limit the bootstrap compiler to those host
> archs only?

The bootstrap compiler is provided as a binary only thing,
pre-compiled. So it works only on the architectures it was compiled
for. At least, that's why I remember from previous series on this topic.

> > +RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_LABEL).tar.gz
> > +RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
> > +RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > +RUST_BOOTSTRAP_LIBSTD_SOURCE= rust-std-
> > $(RUST_BOOTSTRAP_LABEL).tar.gz
> > +RUST_BOOTSTRAP_LIBSTD_ROOT = rust-std-$(RUST_BOOTSTRAP_LABEL)/rust-
> > std-$(RUST_BOOTSTRAP_TRIPLE)  
> 
> Why not make a seperate package?

It apparently needs to be extracted within the bootstrap compiler tree,
i.e in $(@D)/rustc, I guess that's why. But Eric can give more details
here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
