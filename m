From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 17:21:29 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228172129.3dd0acdc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 16:51:38 +0100, Eric Le Bihan wrote:
> This series adds support for the Rust programming language by adding the
> following packages:
> 
>  - rustc: a virtual package for the Rust compiler.
>  - rust-bin: provides a pre-built version of rustc.
>  - cargo-bin: provides a pre-built version of Rust package manager.
>  - rust: builds rustc from source.
>  - cargo: builds Rust package manager from source.

One question: with your series, one can therefore chose whether he
wants to build its own Rust compiler and standard library ("rust"
package) or use the pre-built Rust compiler and standard library
("rustc-bin" package) ?

In other words, does this means that there are two options:

 - User chooses rustc-bin, every Rust package is built using the
   pre-built compiler, and the pre-built standard library is used.

 - User chooses rust. In this case, rust is built using rustc-bin, but
   every other Rust package will be built with the Rust compiler we
   have built from source, and will be using the Rust standard library
   we have built from source.

Is this correct ?

(I'm just trying to understand the overall series.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
