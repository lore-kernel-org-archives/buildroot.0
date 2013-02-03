From: yann.morin.1998 at free.fr <yann.morin.1998@free.fr>
Date: Sun, 03 Feb 2013 13:53:31 +0100
Subject: [Buildroot] [PATCH] gdb: build gdbserver with TARGET_MAKE_ENV
In-Reply-To: <1359894622-4783-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359894622-4783-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1359896011.510e5dcbc1a23@imp.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Quoting Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> This commit fixes the exact same problem than
> 21a0c11a90f9ff19c78a5f32e0a2e9064fd28054, but for the gdbserver
> build. The problem is that when you use the Crosstool-NG toolchain
> backend, gawk gets built as a dependency of Crosstool-NG. So the gdb
> configure scripts detects it, and assumes it is in the PATH (because
> the gdb configure step gets run with TARGET_MAKE_ENV).
>
> But then, the build fails, because it tries to run gawk, but gawk
> isn't in the PATH, because we forget to use this TARGET_MAKE_ENV
> variable when building gdbserver.
>
> Fixes
>
http://autobuild.buildroot.org/results/d0173de533b5e2fffed2eff7327a502ed2d787cd/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.
