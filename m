From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Apr 2016 07:28:34 +0300
Subject: [Buildroot] [PATCH 2/3] c-icap: bump to version 0.4.2
In-Reply-To: <20160419211602.7bca70f5@free-electrons.com>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <3280a03616963d1b2a5bfa3120390bcd59bee470.1461089746.git.baruch@tkos.co.il>
 <20160419211602.7bca70f5@free-electrons.com>
Message-ID: <20160420042834.GG2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Apr 19, 2016 at 09:16:02PM +0200, Thomas Petazzoni wrote:
> On Tue, 19 Apr 2016 21:15:45 +0300, Baruch Siach wrote:
> 
> > +C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
> 
> These look a bit special/weird, especially ac_cv_fcntl=yes. Normally
> for functions, the cache variable is named ac_cv_func_<function>, and
> the checks don't need to pre-seed cache variable values.

configure.ac uses AC_TRY_RUN (inside AC_CACHE_CHECK) to test for 
sem_init/sem_post and fcntl. The fourth AC_TRY_RUN parameter 
(ACTION-IF-CROSS-COMPILING) of these tests gives this advice:

   [AC_MSG_ERROR([cross-compiling,
        presetting ac_cv_10031b_ipc_sem=(yes|no) will help])]
        )
   ]

   [AC_MSG_ERROR([cross-compiling,
        presetting ac_cv_fcntl=(yes|no) will help])]
        )
   ]

> Can you add a comment on top of this line that explains why those two
> values need to be passed? Or at least, it should be explained in the
> commit log (but a comment in the code is better IMO).

I'll add a comment.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
