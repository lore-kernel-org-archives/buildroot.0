From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:20:26 +0200
Subject: [Buildroot] [PATCH 1/3] midori: add missing
 BR2_TOOLCHAIN_USES_GLIBC dependency
In-Reply-To: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160524172026.58eed807@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 23:39:57 +0200, Thomas Petazzoni wrote:
> midori selects webkitgtk, and webkitgtk needs a glibc toolchain, but
> midori did not propagate this dependency, causing the following kconfig
> warning:
> 
> warning: (BR2_PACKAGE_MIDORI) selects BR2_PACKAGE_WEBKITGTK which has unmet direct dependencies (BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_USES_GLIBC && BR2_PACKAGE_LIBGTK3 && BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS)
> 
> Interestingly, the Config.in comment of the midori package already
> mentionned the (e)glibc dependency, but the BR2_TOOLCHAIN_USES_GLIBC
> dependency was not expressed (either on the comment or on the main
> package option itself).
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/midori/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
