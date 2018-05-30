From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 30 May 2018 14:52:34 -0700
Subject: [Buildroot] Buildroot host-clang error
Message-ID: <CAMWSM7hj7MYpm3V6=wD8X4hJcKpE1+cwQh9cCX7Yv=018s-Zzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

I'm working on a package for Buildroot that requires Clang to compile,
and I'm running into an issue.

Upon invoking the built compiler, even without options, I get:

: CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
LLVM ERROR: inconsistency in registered CommandLine options

This is using the current master branch, including LLVM and Clang 5.0.2.

By experimenting, I found that disabling the shared libLLVM
(-DLLVM_LINK_LLVM_DYLIB=OFF), the compiler works again.

Is this a known issue? Do you have any suggestions?

Thanks,
Joe
