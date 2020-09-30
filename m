From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 23:02:20 +0200
Subject: [Buildroot] [PATCH] package/gcc: help libbacktrace detection of
 sync builtins
In-Reply-To: <20200925090451.1407258-1-romain.naour@gmail.com>
References: <20200925090451.1407258-1-romain.naour@gmail.com>
Message-ID: <20200930230220.7c8ebf9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 11:04:51 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> The logic in libbacktrace/configure.ac to detect if __sync builtins
> are available assumes they are as soon as target_subdir is not
> empty, i.e when cross-compiling. However, some platforms do not have
> __sync builtins, so help the configure script a bit.
> 
> "libbacktrace_cv_sys_sync=no" is lost when it is added to
> HOST_GCC_COMMON_CONF_ENV because the environment is not exported
> when executing the libbacktrace configure script.
> 
> Use target_configargs to force "libbacktrace_cv_sys_sync=no" when
> executiong the libbacktrace configure script.
> 
> Fixes:
> https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359681
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [Romain: use target_configargs="libbacktrace_cv_sys_sync=no"]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/gcc.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
