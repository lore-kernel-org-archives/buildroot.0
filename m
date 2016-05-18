From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 May 2016 10:13:03 -0300
Subject: [Buildroot] [PATCH 1/3] midori: add missing
 BR2_TOOLCHAIN_USES_GLIBC dependency
In-Reply-To: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <573C6A5F.5010906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/05/16 18:39, Thomas Petazzoni wrote:

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

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
