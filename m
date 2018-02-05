From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 11:29:13 +0100
Subject: [Buildroot] [PATCH v10 09/10] docs/manual: document cargo-based
 packages
In-Reply-To: <20180204180749.29942-10-eric.le.bihan.dev@free.fr> (Eric Le
 Bihan's message of "Sun, 4 Feb 2018 19:07:48 +0100")
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-10-eric.le.bihan.dev@free.fr>
Message-ID: <877errwwzq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > Add instructions for adding a package which uses Cargo as build system.
 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > ---
 >  docs/manual/adding-packages-cargo.txt | 110 ++++++++++++++++++++++++++++++++++
 >  docs/manual/adding-packages.txt       |   2 +
 >  2 files changed, 112 insertions(+)
 >  create mode 100644 docs/manual/adding-packages-cargo.txt

 > diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
 > new file mode 100644
 > index 0000000000..8de7c97cb9
 > --- /dev/null
 > +++ b/docs/manual/adding-packages-cargo.txt
 > @@ -0,0 +1,110 @@
 > +// -*- mode:doc; -*-
 > +// vim: set syntax=asciidoc:
 > +
 > +=== Integration of Cargo-based packages
 > +
 > +Cargo is the package manager for the Rust programming language. It allows the
 > +user to build programs or libraries written in Rust, but it also downloads and
 > +manages their dependencies, to ensure repeatable builds. Cargo packages are
 > +called "crates".
 > +
 > +[[cargo-package-tutorial]]
 > +
 > +==== Cargo-based package's +Config.in+ file
 > +
 > +The +Config.in+ file of Cargo-based package 'foo' should contain:
 > +
 > +---------------------------
 > +01: config BR2_PACKAGE_FOO
 > +02: 	bool "foo"
 > +03: 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 > +04: 	select BR2_PACKAGE_HOST_CARGO
 > +05:   help
 > +06:     This is a comment that explains what foo is.

The indentation here is wrong. It should be <tab>help and
<tab><space><space>This is a comment..

-- 
Bye, Peter Korsgaard
