From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sun, 26 Apr 2015 11:38:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/ccache: bump to version 3.2.1
In-Reply-To: <20150426092755.GJ2258@tarshish>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <20150426092755.GJ2258@tarshish>
Message-ID: <CABbD_XA_G2=LG8c3zJzbUU=jj0QjkbbnHNTq76n94Ujt6ZukOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

> -HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
> > +HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
>


> > -     sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
> > -     sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
> > +     sed -i 's,conf->compiler_check =
> x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
> > +     sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
>
>

> You are doing non trivial changes here and above. Please explain in a
> commit
> log what you are doing, and why this is needed as part of the version bump.
>

As you probably see, those lines do the exact same as before, just the
structure of the ccache sources changed with the major version bump. I'll
wait for some comments on the second patch regarding the introduction of a
wrapper script and resend with a more informative git log.

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150426/6a315ca3/attachment.html>
