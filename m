From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 27 Jul 2012 00:30:04 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/26 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> Build less after busybox if it's enabled, since we prefer the full-blown
> version over the light one if it's enabled (and busybox would overwrite
> the link when built afterwards).
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/less/less.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/package/less/less.mk b/package/less/less.mk
> index b758e46..c0ecf20 100644
> --- a/package/less/less.mk
> +++ b/package/less/less.mk
> @@ -6,7 +6,8 @@
>
>  LESS_VERSION = 444
>  LESS_SITE = http://www.greenwoodsoftware.com/less
> -LESS_DEPENDENCIES = ncurses
> +# Build after busybox, full-blown is better
> +LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
Though I understand why you prefer this one, I somehow don't really
like it... because it's not about build dependency, but build/install
order...

At least it would be worth to document which binary works if using the
one provided by the busybox built instead of the one provided by
another package, which doesn't.
This makes echo to some other recent thread about using login from
util-linux or busybox.


Regards,

-- 
Sam
