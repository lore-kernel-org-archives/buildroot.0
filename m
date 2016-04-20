From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 10:06:00 +0200
Subject: [Buildroot] [PATCH 2/3] c-icap: bump to version 0.4.2
In-Reply-To: <20160420042834.GG2476@tarshish>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <3280a03616963d1b2a5bfa3120390bcd59bee470.1461089746.git.baruch@tkos.co.il>
 <20160419211602.7bca70f5@free-electrons.com>
 <20160420042834.GG2476@tarshish>
Message-ID: <20160420100600.7addc3de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 07:28:34 +0300, Baruch Siach wrote:

> configure.ac uses AC_TRY_RUN (inside AC_CACHE_CHECK) to test for 
> sem_init/sem_post and fcntl. The fourth AC_TRY_RUN parameter 
> (ACTION-IF-CROSS-COMPILING) of these tests gives this advice:
> 
>    [AC_MSG_ERROR([cross-compiling,
>         presetting ac_cv_10031b_ipc_sem=(yes|no) will help])]
>         )
>    ]
> 
>    [AC_MSG_ERROR([cross-compiling,
>         presetting ac_cv_fcntl=(yes|no) will help])]
>         )
>    ]

OK. I don't know why those tests are using AC_TRY_RUN(), but assuming
they really need to, then yes, pre-seeding the cache variables in the
only way.

> > Can you add a comment on top of this line that explains why those two
> > values need to be passed? Or at least, it should be explained in the
> > commit log (but a comment in the code is better IMO).
> 
> I'll add a comment.

Yes, just something like:

# Pre-seed cache variables for tests done with AC_TRY_RUN that are not
# cross-compile friendly

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
