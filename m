From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:02:25 +0100
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
 uClibc toolchains (finally)
In-Reply-To: <20170316222718.11290-1-romain.naour@gmail.com>
References: <20170316222718.11290-1-romain.naour@gmail.com>
Message-ID: <20170318140225.254bba4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 23:27:18 +0100, Romain Naour wrote:
> The previous fix [1] reinroduced the issue fixed by [2].
> So keep gl_cv_func_gettimeofday_clobber=no in GDB_CONF_ENV
> and GDB_MAKE_ENV.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ec6/ec60d436bd34a4f37b664e4124d7f0c96e90a1be
> 
> [1] faf38b78aee613a732f96d5022a2894efd024a25
> [2] 560334bb2a46a77081a3944d092df7732dfca432
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> I think I forgot to reenable gdbserver with full debugger while testing
> patch [1], sorry for that :-(
> ---
>  package/gdb/gdb.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
