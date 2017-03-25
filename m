From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Mar 2017 15:34:56 +0100
Subject: [Buildroot] Problem when $(PKG)_SOURCE does not contain
	$(PKG)_VERSION
Message-ID: <20170325143456.GA2470@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

I will soon post a new patch series to add support for the Rust programming
language (version 1.16.0).

One of the patches adds a package named host-cargo-bootstrap, which
fetches a binary version of Cargo, the build tool for Rust.

The package Makefile looks like this:

```
CARGO_BOOTSTRAP_VERSION = 6e0c18cccc8b0c06fba8a8d76486f81a792fb420
CARGO_BOOTSTRAP_SITE = https://s3.amazonaws.com/rust-lang-ci/cargo-builds/$(CARGO_BOOTSTRAP_VERSION)
CARGO_BOOTSTRAP_SOURCE = cargo-nightly-$(HOSTARCH)-unknown-linux-gnu.tar.gz
```

As you can see, $(CARGO_BOOTSTRAP_SOURCE) does not refer to
$(CARGO_BOOTSTRAP_VERSION), only $(CARGO_BOOTSTRAP_SITE) does.

In my build environment, I already had a previous version of
cargo-nightly-$(HOSTARCH)-unknown-linux-gnu.tar.gz in my dl directory,
so when I bumped the version, Buildroot did not download the new
version.

Is there a way to fix this problem, by renaming the tarball in a
post-download hook or using a hash verification trick?

Best regards,

--
ELB
