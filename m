From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 17:01:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/libfastjson: fix build without
 threads
In-Reply-To: <1468141811-25366-1-git-send-email-yann.morin.1998@free.fr>
References: <1468141811-25366-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160715170155.7e9e64c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 11:10:10 +0200, Yann E. MORIN wrote:
> libfastjsn is supposed to use the __sync_*4 atomic intrinsics, but alas
> it is not using them because their ./configure decides they are not
> available: it uses AC_TRY_RUN to check for them, and the default is to
> decide they are not available, because of cross-compilation.
> 
> Besides, one of the source files was not including the generated
> config.h, so even after fixing ./configure there was still a build
> error.
> 
> The first patch is a backport from upstream to fix the missing
> inclusion.
> 
> The second patch is switching AC_TRY_RUN over to AC_LINK_IFELSE, as the
> only thing we're interested in is to check for the presence of the
> atomic intrisics, and linking is enough for that.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/192/1923d0b570adba494f83747a9610ea6ec35f5223/
>     http://autobuild.buildroot.org/results/23a/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/
>     and many others...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../libfastjson/0001-fix-missing-config.h.patch    | 29 ++++++++
>  .../0002-m4-fix-detection-of-atomics.patch         | 87 ++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 package/libfastjson/0001-fix-missing-config.h.patch
>  create mode 100644 package/libfastjson/0002-m4-fix-detection-of-atomics.patch

Both applied, thanks! I fixed some minor typos here and here along the
way.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
