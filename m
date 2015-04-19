From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:39:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssl: bin/openssl depends on
 dynamic linking
In-Reply-To: <1428851196-16360-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428851196-16360-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419113916.0e99b1eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Apr 2015 17:06:36 +0200, Bernd Kuhls wrote:
> Fixes
> /home/br/br3/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.8.4/../../../../i586-buildroot-linux-uclibc/bin/ld: cannot find -ldl
> 
> using this defconfig
> 
> BR2_STATIC_LIBS=y
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_OPENSSL_BIN=y
> 
> Quoting PROBLEMS:
> "We don't have framework to associate -ldl with no-dso, therefore the only
> way is to edit Makefile right after ./config no-dso and remove -ldl from
> EX_LIBS line."
> 
> To not make the build procedure more complicated disable static building of
> bin/openssl.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openssl/Config.in |    1 +
>  1 file changed, 1 insertion(+)

Applied after adding the kconfig comment you forgot to add to indicate
the dynamic library dependency, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
