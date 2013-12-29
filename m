From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 22:24:44 +0100
Subject: [Buildroot] [PATCH 1/1] xenomai: fix build failure when
 HAVE_OPEN64 is undefined
In-Reply-To: <1388351123-16936-1-git-send-email-romain.naour@openwide.fr>
References: <1388351123-16936-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20131229212444.GN3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2013-12-29 22:05 +0100, Romain Naour spake thusly:
> fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

This is an upstream patch, so:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  ...uild-failure-when-HAVE_OPEN64-is-undefine.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
> 
> diff --git a/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch b/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
> new file mode 100644
> index 0000000..ce43676
> --- /dev/null
> +++ b/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
> @@ -0,0 +1,30 @@
> +From 71345fe15f126ae3a596af309945d0af6edfbbbb Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Sun, 29 Dec 2013 18:00:25 +0100
> +Subject: [PATCH 1/1] posix: fix build failure when HAVE_OPEN64 is undefined.
> +
> +fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>

It would be nice to say that this is an upstream patch, so it finds its
way into Buildroot quickly. ;-)

Something like:
    Upstream patch:
    http://git.xenomai.org/xenomai-2.6.git/commit/?id=71345fe15f126ae3a596af309945d0af6edfbbbb

Regards,
Yann E. MORIN.

> +---
> + src/skins/posix/rtdm.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/skins/posix/rtdm.c b/src/skins/posix/rtdm.c
> +index 5840c64..d6c87dc 100644
> +--- a/src/skins/posix/rtdm.c
> ++++ b/src/skins/posix/rtdm.c
> +@@ -107,8 +107,9 @@ int __wrap_open64(const char *path, int oflag, ...)
> + 			errno = EMFILE;
> + 			ret = -1;
> + 		}
> ++	}
> + #endif
> +-	} else {
> ++	else {
> + 		errno = -ret;
> + 		ret = -1;
> + 	}
> +-- 
> +1.8.1.4
> +
> -- 
> 1.8.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
