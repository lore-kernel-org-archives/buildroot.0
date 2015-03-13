From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:49:28 +0100
Subject: [Buildroot] [PATCH v7 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
References: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150313224928.6e5a6e22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 13 Mar 2015 09:24:08 +0100, Gwenhael Goavec-Merou wrote:

> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index d92b209..87c51a8 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -100,6 +100,10 @@ typical packages will therefore only use a few of them.
>    necessary to set them in the package's +*.mk+ file unless you want
>    to override them:
>  
> +* +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ should be set when the package
> +  cannot be built inside the source tree but needs a separate build
> +  directory.

Did you generate the documentation to review what you did? This chunk
was added right in the middle of the documentation of <pkg>_CONF_OPTS.

> +
>  ** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
>  ** +CMAKE_INSTALL_PREFIX+;
>  ** +BUILD_SHARED_LIBS+ is driven by +BR2_STATIC_LIBS+;

I.e, this part must be right after <pkg>_CONF_OPTS.

I've fixed that and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
