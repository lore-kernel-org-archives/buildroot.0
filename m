From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Feb 2018 09:56:10 +0100
Subject: [Buildroot] [PATCH v10 01/10] rustc: new virtual package
In-Reply-To: <20180209084906.GB6503@itchy>
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-2-eric.le.bihan.dev@free.fr>
 <20180208235221.1227a749@windsurf.lan>
 <20180209084906.GB6503@itchy>
Message-ID: <20180209095610.5f4fa6a5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Feb 2018 09:49:06 +0100, Eric Le Bihan wrote:

> > check-package is not happy with RUST_TARGET_NAME and RUST_HOST_NAME
> > because they don't have a RUSTC_ prefix, even though they are defined
> > in rustc.mk:
> >
> > ./package/rustc/rustc.mk:10: possible typo: RUST_TARGET_NAME -> *RUSTC*
> > ./package/rustc/rustc.mk:18: possible typo: RUST_HOST_NAME -> *RUSTC*
> >
> > Would renaming them to RUSTC_TARGET_NAME and RUSTC_HOST_NAME make
> > sense ? Or do we need to keep RUST_TARGET_NAME/RUST_HOST_NAME and add
> > an exception in check-package ?  
> 
> I do not see any problems using RUSTC_{HOST,TARGET}_NAME: it still caries
> the same information as RUST_{HOST,TARGET}_NAME.

Question is: are these host and target names "Rust" related, or "Rust
compiler" related. If they are Rust related, the current RUST_ prefix
makes more sense. If they are specific to the Rust compiler, then
RUSTC_ would make more sense. If it isn't clear, then we can use RUSTC_
to avoid the problem :-)

If you are happy with RUSTC_, could you submit a patch against "master"
that does the renaming ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
