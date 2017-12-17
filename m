From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 17 Dec 2017 19:17:37 +0100
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
In-Reply-To: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171217181737.GA8780@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-17 18:57:59, Eric Le Bihan wrote:
> This series adds support for the Rust programming language by adding the
> following packages:
>
>  - rustc: a virtual package for the Rust compiler.
>  - rust-bin: provides a pre-built version of rustc.
>  - cargo-bin: provides a pre-built version of Rust package manager.
>  - rust: builds rustc from source.
>  - cargo: builds Rust package manager from source.
>  - rust-cargo: a virtual package for the Rust package manager.
>
> Only the host variants are provided.
>
> The rustc and rust-cargo virtual packages are inspired by the mysql one.
>
> v7 -> v8:
>
>  - replace cargo-bootstrap by cargo-bin
>  - drop rust-bootstrap and use rust-bin instead
>  - rust-bin and rust versions are the same
>  - cargo-bin and cargo versions are the same
>  - bump cargo to 0.23.0
>  - bump rust to 1.22.1
>  - add rust-cargo virtual package

One patch of this series adds a package to build rust from source. It
contains a patch to remove *.orig files from usptream tarball and patch
some checksum files which list these files (used by Cargo).

Unfortunately, one of these checksum files has a line which exceeds 998
characters, which does not make git-send-email happy. I sent the patch
series using --no-validate, but this may not make all mail clients (or
mailman) happy too!

Should I resent as attachment instead?

Regards,

--
ELB
