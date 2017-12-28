From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 18:52:56 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20171228172129.3dd0acdc@windsurf.home>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
Message-ID: <20171228175256.GA24806@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-28 17:21:29, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 28 Dec 2017 16:51:38 +0100, Eric Le Bihan wrote:
> > This series adds support for the Rust programming language by adding the
> > following packages:
> >
> >  - rustc: a virtual package for the Rust compiler.
> >  - rust-bin: provides a pre-built version of rustc.
> >  - cargo-bin: provides a pre-built version of Rust package manager.
> >  - rust: builds rustc from source.
> >  - cargo: builds Rust package manager from source.
>
> One question: with your series, one can therefore chose whether he
> wants to build its own Rust compiler and standard library ("rust"
> package) or use the pre-built Rust compiler and standard library
> ("rustc-bin" package) ?
>
> In other words, does this means that there are two options:
>
>  - User chooses rustc-bin, every Rust package is built using the
>    pre-built compiler, and the pre-built standard library is used.
>
>  - User chooses rust. In this case, rust is built using rustc-bin, but
>    every other Rust package will be built with the Rust compiler we
>    have built from source, and will be using the Rust standard library
>    we have built from source.
>
> Is this correct ?
>
> (I'm just trying to understand the overall series.)

Yes, this is correct. The introduction of a virtual package for the Rust
compiler was suggested in the mail thread about version v4 of this
series [1], as building the compiler from source takes time and using the
available pre-built version would speed things up (as done for GCC).

[1] http://lists.busybox.net/pipermail/buildroot/2017-April/189451.html

Regards,

--
ELB
