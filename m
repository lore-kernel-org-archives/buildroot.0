From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:08:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Adjust libnsl detection
 to include musl
In-Reply-To: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150630230815.7782d645@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Apr 2015 16:21:46 +0200, Bernd Kuhls wrote:
> Only (e)glibc provides libnsl, uclibc provides only a stub
> 
> Fixes compilation using this defconfig
> 
>     BR2_arm=y
>     BR2_cortex_a7=y
>     BR2_STATIC_LIBS=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_PACKAGE_OPENSSL=y
>     BR2_PACKAGE_EXIM=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied after rebasing on master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
