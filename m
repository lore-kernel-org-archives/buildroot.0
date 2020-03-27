From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:20:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/llvm: specify
 LLVM_ENABLE_BINDINGS=OFF
In-Reply-To: <20200316200106.3709163-1-joseph.kogut@gmail.com> (Joseph Kogut's
 message of "Mon, 16 Mar 2020 13:01:05 -0700")
References: <20200316200106.3709163-1-joseph.kogut@gmail.com>
Message-ID: <87369tfnio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph Kogut <joseph.kogut@gmail.com> writes:

 > LLVM builds bindings for other languages such as Go and OCaml when the
 > appropriate dependencies can be found. We currently don't support
 > building these bindings in Buildroot, as they're currently unused by any
 > package.

 > Building these bindings was originally disabled by overriding the
 > dependencies with values indicating that they were not found.

 > Newer versions of LLVM no longer disable the OCaml bindings when overriding
 > OCAMLFIND. Consequently, the build process attempts to install the bindings
 > to the default location on the host of /usr/lib/ocaml/llvm, causing a
 > permissions error and build failure.

 > Additionally, LLVM has since added the variable LLVM_ENABLE_BINDINGS to
 > control whether bindings are enabled, so we override that to disable the
 > bindings.

 > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Committed to 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
