From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 28 Feb 2012 13:38:59 +0100
Subject: [Buildroot] build of e2fsprogs fails (2012.02-rc3)
In-Reply-To: <3d41058a0f241311e2b0fe5c2e3c9d1c@zacarias.com.ar>
References: <1330427777.2274.27.camel@sven>
 <3d41058a0f241311e2b0fe5c2e3c9d1c@zacarias.com.ar>
Message-ID: <1330432739.2274.31.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2012-02-28 at 09:11 -0300, Gustavo Zacarias wrote:

> > the build of e2fsprogs fails with 2012.02-rc3:
> >
> > 	CC e4defrag.c
> > e4defrag.c:28:17: fatal error: ftw.h: No such file or directory
> > compilation terminated.
> 
> What about your uclibc config?
> If you're using a custom uclibc config basically "you're on your own" 
> if packages break.
> Like on bug #4736 you reported.
> Packages are tested to work on buildroot's-shipped default uclibc 
> configurations.
> At least that's my take.

Well, this probably used to be a default uclibc configuration three
years ago. Since then we have updated buildroot several times and
obviously our ubclibc configuration diverged. What would be the best way
to go back to the default uclibc configuration?

Nevertheless, you should consider the patch I've sent as the
BR2_PACKAGE_E2FSPROGS_E4DEFRAG option is currently not correctly
handled.


Regards,
Sven
