From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:32:38 +0100
Subject: [Buildroot] [PATCH v5 04/19] reproducible: enable fakedate
In-Reply-To: <1482241596-31688-5-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-5-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMLjMt=09Wd0L7CZ82qqbyVVDis78G31wOvMb8xNzEkG2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Enable fakedate for whole build process.
>
> This work was sponsored by `BA Robotic Systems'.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>
> Notes:
>     v3:
>       - Build host-fakedate before toolchain (Thomas)
>
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index b80b9e1..ad7fde5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -254,6 +254,7 @@ export LC_ALL = C
>  export GZIP = -n
>  BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
>  export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
> +DEPENDENCIES_HOST_PREREQ += host-fakedate
>  endif
>
>  # To put more focus on warnings, be less verbose as default
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
