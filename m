From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 11 Nov 2013 11:14:51 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <201311111114.51686.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 09 November 2013 20:15:43 Thomas Petazzoni wrote:
> >       i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/
> >        arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/37613281f21895716ceaf64654e175148d7f543c/
> >       i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/
> 
> For
> http://autobuild.buildroot.net/results/37613281f21895716ceaf64654e175148d7f543c/build-end.log,
> Samuel has already sent a patch
> (http://patchwork.ozlabs.org/patch/289999/). The other two ones:
> 
>   http://autobuild.buildroot.net/results/555278227680e90737e6dbe0a6dcc035507150aa/build-end.log
>   (sqlite problem)

Needs posix_fallocate() which is not available in the test toolchain.

>   http://autobuild.buildroot.net/results/bbe7d79da059fdf67fb29880b8539ca2320ba86d/build-end.log
>   (inlining problem)

It seems this is fixed in GCC 4.7.3 [1].

> are not fixed. Fatih, would you mind having a look?
> 

Is there a method to solve such cases with custom external toolchains?

[1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=54988
