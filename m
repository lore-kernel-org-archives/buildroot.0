From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Mar 2014 11:04:14 +0100
Subject: [Buildroot] [PATCH 06/11] armadillo: new package
In-Reply-To: <1392588004-13317-7-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-7-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMM+RUEfk31FiRUOdNdCU_CcEV1rEg8HWquUc+M7KXWJmkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, Feb 16, 2014 at 10:59 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Armadillo is a C++ linear algebra library.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/armadillo/Config.in    |  9 +++++++++
>  package/armadillo/armadillo.mk | 15 +++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/armadillo/Config.in
>  create mode 100644 package/armadillo/armadillo.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d843961..5c3226e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -723,6 +723,7 @@ source "package/zyre/Config.in"
>  endmenu
>
>  menu "Other"
> +source "package/armadillo/Config.in"
>  source "package/apr/Config.in"
>  source "package/apr-util/Config.in"
>  source "package/argp-standalone/Config.in"
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> new file mode 100644
> index 0000000..bbb1142
> --- /dev/null
> +++ b/package/armadillo/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ARMADILLO
> +       bool "armadillo"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       select BR2_PACKAGE_CLAPACK
> +       help
> +         Armadillo: An Open Source C++ Linear Algebra Library for
> +         Fast Prototyping and Computationally Intensive Experiments.
> +
> +         http://arma.sourceforge.net/

I forgot the comment when the toolchain has no C++ support.
I'm just waiting for other reviews on the "scientific libraries"
series before reposting the patches.

Regards,

-- 
Samuel
