From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:52:48 +0200
Subject: [Buildroot] [PATCH v2] package/gdb: fix gnulib issue with musl
 and uClibc toolchains
In-Reply-To: <1469371753-18468-1-git-send-email-romain.naour@gmail.com>
References: <1469371753-18468-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724215248.6083088a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:49:13 +0200, Romain Naour wrote:
> Starting with gdb 7.11, the bundled gnulib want to use rpl_gettimeofday
> (gettimeofday replacement) due bad guessing when cross-compiling with musl
> and uClibc toolchains. Instead of patching gnulib configure script to fix
> the test, use gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday.
> 
> Thanks to Thomas Petazzoni to suggest this patch.
> 
> Reported upstream:
> https://sourceware.org/bugzilla/show_bug.cgi?id=19798
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2: Use gl_cv_func_gettimeofday_clobber=no instead of patching gnulib.
> ---
>  package/gdb/gdb.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I've slightly improved the comment in the code and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
