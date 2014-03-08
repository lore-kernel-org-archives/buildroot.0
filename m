From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 09:42:11 +0100
Subject: [Buildroot] [PATCH] defconfigs: add the _AT_LEAST_X_Y headers
 options
In-Reply-To: <1394234706-10155-1-git-send-email-yann.morin.1998@free.fr>
References: <1394234706-10155-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140308094211.3473be41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  8 Mar 2014 00:25:06 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Since commit 2a5cf5e (check kernel headers version), we also need to
> specify the series of the custom kernel headers version.
> 
> The defconfigs file that define such a custom kernel headers version
> now fail to build.
> 
> Add the required _AT_LEAST_X_Y options to those config files. Done with
> this (convoluted but very fast, uch faster ythan manual editing!) rule:
> 
>     for f in $( git grep -l BR2_DEFAULT_KERNEL_VERSION=\"3 ); do
>         grep -E '^BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_' "${f}" >/dev/null && continue
>         sed -r -e '/^(BR2_DEFAULT_KERNEL_VERSION="3\.([[:digit:]]+).*")$/s//\1\nBR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_\2=y/' "${f}"
>     done
> 
> Only kernels >= 3.0 need those options in the defconfig, since the
> default for 2.6.x kernels is correct (selects _AT_LEAST_2_6), and
> the default is not saved in a defconfig.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
