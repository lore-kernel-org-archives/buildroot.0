From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 08 Feb 2013 08:43:51 -0300
Subject: [Buildroot] [PATCH] Add Gnublin board support
In-Reply-To: <1360323072-29592-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1360323072-29592-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <5114E4F7.7000405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/08/2013 08:31 AM, Zoltan Gyarmati wrote:

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="v3.7-gnublin-2"

Can you add these lines too?

+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.7"

These are to lock down on kernel headers.
It's not a problem at the moment since the default buildroot version is
3.7.x, but this will change in the future when 3.8, 3.9, so on are
released and it's bad building a toolchain with newer headers than the
running kernel (eventual breakage).
Thanks!
