From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 9 Jul 2013 00:57:58 +0300
Subject: [Buildroot] Error while building libevas,
	SFD_NONBLOCK undeclared
In-Reply-To: <CAF3SDA77hPn0TiYNajKZNTBGWAobSuFKEyWcvRZmmrNhyjRPkA@mail.gmail.com>
References: <CAF3SDA77hPn0TiYNajKZNTBGWAobSuFKEyWcvRZmmrNhyjRPkA@mail.gmail.com>
Message-ID: <20130708215758.GL5098@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

On Mon, Jul 08, 2013 at 06:01:26PM +0000, Daniel. wrote:
> I'm receiving this error while trying to build with buildroot.
> 
> make[5]: Entering directory
> `/home/hilst/buildroot/buildroot-2013.05/output/build/libevas-1.7.4/src/bin'
> CC evas_cserve2_main_loop_linux.o
> evas_cserve2_main_loop_linux.c: In function '_signalfd_setup':
> evas_cserve2_main_loop_linux.c:156: error: 'SFD_NONBLOCK' undeclared (first
> use in this function)
> evas_cserve2_main_loop_linux.c:156: error: (Each undeclared identifier is
> reported only once
> evas_cserve2_main_loop_linux.c:156: error: for each function it appears in.)
> evas_cserve2_main_loop_linux.c:156: error: 'SFD_CLOEXEC' undeclared (first
> use in this fu
> 
> My .config can be found here: https://gist.github.com/gkos/5950964
> 
> Any help is appreciated,
> 
> I'm on archilinux using Sourcery CodeBench toolchain..

The signalfd(2) man page says that these flags (SFD_NONBLOCK and SFD_CLOEXEC) 
are only defined since kernel version 2.6.27. It seems that your toolchain 
uses an older kernel. Which version of the Sourcery CodeBench do you use?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
