From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 30 Mar 2018 12:58:07 -0500
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target
 variant
In-Reply-To: <20180329113346.10367-9-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-9-valentin.korenblit@smile.fr>
Message-ID: <CANQCQpbzkmrLdpxAwCNmtdiDOgCKfK7+siN6y4bAzdEVwJb_Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valentin,

On Thu, Mar 29, 2018 at 6:33 AM, Valentin Korenblit
<valentin.korenblit@smile.fr> wrote:
> This patch provides Clang for the target, tools and libraries.
>
> In this package we have to deal with the same kind of problem we encountered
> when building mesa3d with llvm support: llvm-config (host-version) had to be
> copied to STAGING_DIR/usr/bin. In this case, we need llvm-tblgen from host
> to be installed in STAGING_DIR/usr/bin for cross-compiling clang.
>
> We need libclang for the target because it is used by all OpenCL implementations.
> In this series, Clover is provided.
>


I'm building a basic x86 system  (I can work on reproducing this
failure in a generic QEMU build if you need that).  My build just
enabled a host and target versions of llvm and clang (no sub options).

2018-03-30T12:39:37 /bin/sh: clang-tblgen: command not found
2018-03-30T12:39:37 make[4]: *** [lib/Headers/arm_neon.h.tmp] Error 127
2018-03-30T12:39:37 make[4]: *** Waiting for unfinished jobs....
2018-03-30T12:39:37 make[3]: ***
[lib/Headers/CMakeFiles/clang-headers.dir/all] Error 2
2018-03-30T12:39:37 make[2]: *** [all] Error 2
2018-03-30T12:39:37 make[1]: ***
[/accts/mlweber1//target_build/qemu_x86_defconfig/build/clang-5.0.1/.stamp_built]
Error 2
2018-03-30T12:39:37 make: *** [_all] Error 2
