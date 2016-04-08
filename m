From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 8 Apr 2016 22:45:41 +0200
Subject: [Buildroot] Adding support for the Rust programming language
Message-ID: <20160408224541.79e1ba4d@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

I've posted a series of articles about using the Rust programming
language in a Buildroot environment [1].

Rust [2] is a modern, compiled, programming language, oriented towards
safety, memory control and concurrency. Its performances are comparable
to C++.

Rust's features make it a good candidate for writing programs for
embedded systems.

This series will hopefully lead to some patches for properly supporting
Rust in Buildroot.

As explained in one article [3], the Rust compiler is based on LLVM
[4]. When configuring the build, the targeted architecture is given by
its GNU triplet (e.g. "arm-buildroot-linux-gnueabihf"). By default, the
compiler is built with support for x86, ARM and MIPS support
(unfortunately, there is no option to narrow the selection). Then the
Rust standard library is cross-compiled for the configured architecture.

Support for the target is achieved by providing two files:

- the target configuration file: a Makefile fragment where, among
  others, the name of of the cross-compiler is given.
- the target specification file: a JSON file describing the
  architecture (CPU type, OS, etc).

So, in the future patch series that will properly add support for Rust
in Buildroot:

1. Would it be acceptable to provide a script to generate these files
from the Buildroot configuration file?

2. Would Python be a suitable language for this script? It is better
suited for playing with complex structures and JSON than pure shell.

Comments welcomed.

[1] http://www.elebihan.com/categories/rust.html
[2] https://rust-lang.org/
[3] http://www.elebihan.com/posts/using-rust-with-buildroot-full-build.html
[4] https://llvm.org/

Best regards,
--
ELB
