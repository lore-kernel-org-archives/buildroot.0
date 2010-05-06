From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 22:56:49 +0200
Subject: [Buildroot] Mplayer -
	libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d):
	more undefined references to `__assert_fail' follow
In-Reply-To: <x2x76d09b281004301143w5b198666udda8c2292eb64242@mail.gmail.com>
	(Bart Otten's message of "Fri, 30 Apr 2010 20:43:03 +0200")
References: <x2x76d09b281004301143w5b198666udda8c2292eb64242@mail.gmail.com>
Message-ID: <87y6fw92b2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bart" == Bart Otten <bartotten@gmail.com> writes:

 Bart> How can i solve this error ?
 Bart> ass_render.c:(.text+0x1b07): undefined reference to `__assert_fail'
 Bart> libass/libass.a(ass_render.o): In function `ass_render_frame':
 Bart> ass_render.c:(.text+0x3862): undefined reference to `__assert_fail'
 Bart> libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d): more undefined
 Bart> references to `__assert_fail' follow
 Bart> collect2: ld returned 1 exit status
 Bart> make[1]: *** [mplayer] Error 1
 Bart> make[1]: Leaving directory `/home/Bart/buildroot-2010.02/output/build/
 Bart> MPlayer-1.0rc2'
 Bart> make: *** [/home/Bart/buildroot-2010.02/output/build/MPlayer-1.0rc2/mplayer]

__assert_fail is a glibc symbol, so it must be trying to link to
something on your host. Could you post your buildroot .config and your
mplayer configure.log ?

-- 
Bye, Peter Korsgaard
