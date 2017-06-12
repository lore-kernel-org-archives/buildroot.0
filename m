From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 12 Jun 2017 22:38:17 +0530
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <20170612041512.9374-1-bernd.kuhls@t-online.de>
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
Message-ID: <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 12, 2017 at 9:45 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> README was renamed to README.md
> https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34

make <pkg>-legal-info should have caught that after version bump as a
part of testing. But it looks like we don't do that usually. In past,
we have seen such failures after version bump.

To avoid such failures, we can add hash of license file in <pkg>.hash
and checking that after source is downloaded. If license file changes,
it will be noticed while build test after version bump.

Potentially, it will also help in keeping license string of packages
up-to-date if it gets changed. What do you think ?

Regards,
Rahul

>
> Fixes
> http://autobuild.buildroot.net/results/02b/02b897a843b995bf5bf3f993f48689870a551dd5/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mcelog/mcelog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
> index 695261302..d12fc44f7 100644
> --- a/package/mcelog/mcelog.mk
> +++ b/package/mcelog/mcelog.mk
> @@ -8,7 +8,7 @@ MCELOG_VERSION = v152
>  MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
>  MCELOG_SITE_METHOD = git
>  MCELOG_LICENSE = GPL-2.0
> -MCELOG_LICENSE_FILES = README
> +MCELOG_LICENSE_FILES = README.md
>
>  define MCELOG_BUILD_CMDS
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
