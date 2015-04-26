From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Apr 2015 12:41:57 +0300
Subject: [Buildroot] [PATCH 1/2] package/ccache: bump to version 3.2.1
In-Reply-To: <CABbD_XA_G2=LG8c3zJzbUU=jj0QjkbbnHNTq76n94Ujt6ZukOQ@mail.gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <20150426092755.GJ2258@tarshish>
 <CABbD_XA_G2=LG8c3zJzbUU=jj0QjkbbnHNTq76n94Ujt6ZukOQ@mail.gmail.com>
Message-ID: <20150426094157.GK2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi K?roly,

On Sun, Apr 26, 2015 at 11:38:52AM +0200, K?roly Kasza wrote:
> > > -     sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
> > > -     sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
> > > +     sed -i 's,conf->compiler_check =
> > x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
> > > +     sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
> > 
> > You are doing non trivial changes here and above. Please explain in a
> > commit log what you are doing, and why this is needed as part of the 
> > version bump.
> 
> As you probably see, those lines do the exact same as before, just the
> structure of the ccache sources changed with the major version bump. I'll
> wait for some comments on the second patch regarding the introduction of a
> wrapper script and resend with a more informative git log.

Thanks. When doing so please comment also on the _HOOKS change.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
