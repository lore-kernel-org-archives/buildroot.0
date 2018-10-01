From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 23:51:55 +0200
Subject: [Buildroot] [PATCH] package/gcc: glibc >= 2.27 needs gcc >= 5
 on aarch64
In-Reply-To: <20180915155413.17663-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 15 Sep 2018 17:54:13 +0200")
References: <20180915155413.17663-1-romain.naour@gmail.com>
Message-ID: <871s991gjo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > With the following defconfig:
 > BR2_aarch64=y
 > BR2_BINUTILS_VERSION_2_28_X=y
 > BR2_GCC_VERSION_4_9_X=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y

 > The build fail with this error:
 > In file included from ../sysdeps/ieee754/flt-32/math_config.h:23:0,
 >                  from ../sysdeps/ieee754/flt-32/e_expf.c:29:
 > ../sysdeps/aarch64/fpu/math_private.h: In function 'roundtoint':
 > ../sysdeps/aarch64/fpu/math_private.h:311:3: error: implicit declaration of function 'vrndn_f64' [-Werror=implicit-function-declaration]
 >    return vget_lane_f64 (vrndn_f64 (vld1_f64 (&x)), 0);
 >    ^
 > cc1: all warnings being treated as errors

 > vrndn_f64 function has been introduced in glibc code since version 2.27 [1].
 > So we can't build a glibc based toolchain with gcc 4.9 anymore.

 > Add a new dependency in the toolchain infra to avoid selecting
 > glibc toolchain using gcc 4.9.

 > [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=72aa623345ada1276ed89dbc00fdff9639cb8eaf

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed to 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
