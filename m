From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 18 Oct 2016 22:47:02 +0200
Subject: [Buildroot] [Patch v3 1/2] rust-bootstrap: new package
In-Reply-To: <2a62ef7a-1d5f-546d-0287-78cb505a0ec3@mind.be>
References: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468533676-10894-2-git-send-email-eric.le.bihan.dev@free.fr>
 <2a62ef7a-1d5f-546d-0287-78cb505a0ec3@mind.be>
Message-ID: <20161018204701.GA18610@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 16-10-16 13:27:51, Arnout Vandecappelle wrote:
>
>
> On 15-07-16 00:01, Eric Le Bihan wrote:

[...]

> > +
> > +RUST_BOOTSTRAP_VERSION = 1.9.0
> > +RUST_BOOTSTRAP_DATE = 2016-05-24
> > +
> > +ifeq ($(HOSTARCH),x86_64)
> > +RUST_BOOTSTRAP_ARCH = x86_64
> > +else ifeq ($(HOSTARCH),x86)
> > +RUST_BOOTSTRAP_ARCH = i686
> > +else
> > +$(error Unsupported host architecture)
>
>  This is not good because it is evaluated even if host-rust-bootstrap is not
> selected. You need to protect it somehow, which is difficult because there is no
> user visible symbol that can ever select this package. So instead you could do a
> check in e.g. CONFIGURE_CMDS.
>
>  However, this is not needed, because this package can only be built if rust is
> built, and rust can only be built if BR2_PACKAGE_HOST_RUST_ARCH_SUPPORTS=y, and
> that one already checks for hostarch.
>
>  IOW, just drop this check.

OK.

> > +endif
> > +
> > +RUST_BOOTSTRAP_SITE = https://static.rust-lang.org/dist/$(RUST_BOOTSTRAP_DATE)
> > +
> > +RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_VERSION)-$(RUST_BOOTSTRAP_ARCH)-unknown-linux-gnu.tar.gz
> > +RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT
>
>  Can you specify which parts or under which license?

Rust is dual licensed (Apache-2.0 OR MIT). So, I'll change it to:

RUST_BOOTSTRAP_LICENSE = Dual Apache-2.0/MIT

I'll do the same for the rust package.

Thanks for the review.

Best regards,

--
ELB
