From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:18:51 +0100
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
 uClibc toolchains again
In-Reply-To: <20170311212645.11896-1-romain.naour@gmail.com>
References: <20170311212645.11896-1-romain.naour@gmail.com>
Message-ID: <20170312141851.1a85cc3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 22:26:45 +0100, Romain Naour wrote:
> The commit [1] doesn't fix this issue for all cases (it doesn't work
> when BR2_PACKAGE_GDB_DEBUGGER=y).
> So, leave the configure script alone and override
> gl_cv_func_gettimeofday_clobber from GDB_MAKE_ENV.
> 
> [1] 560334bb2a46a77081a3944d092df7732dfca432
> 
> Fixes:
> http://autobuild.buildroot.net/results/719/719a441421030b79c0aa1bbfb707130f3ac87338
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Note:
> AlpineLinux doesn't build gdbserver "gdb server does not compile with musl"
> http://git.alpinelinux.org/cgit/aports/tree/main/gdb/APKBUILD
> ---
>  package/gdb/gdb.mk | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

I've slightly tweaked the comment in the code, and applied to master,
thanks!

Peter, I think we want this commit for the LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
