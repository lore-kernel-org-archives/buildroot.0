From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 4 May 2014 15:23:42 +0200
Subject: [Buildroot] [PATCH 8/8] xbmc: Fix TexturePacker compile
In-Reply-To: <tjqh3bxm9f.ln2@ID-313208.user.individual.net>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
 <1398968277-9044-9-git-send-email-bernd.kuhls@t-online.de>
 <CAGduivyfTiuETZKFUuk5CXzVePeDi7jSx_PUMgjtg1YFWsGFRA@mail.gmail.com>
 <tjqh3bxm9f.ln2@ID-313208.user.individual.net>
Message-ID: <CAGduivx_Me4wkw6AwBPy24gY1zLTKupFNoiukMAP6NjKhL1-5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, all,

On Sun, May 4, 2014 at 3:06 PM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
> Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote in
> news:CAGduivyfTiuETZKFUuk5CXzVePeDi7jSx_PUMgjtg1YFWsGFRA at mail.gmail.com:
>
>> What was your issue exactly ?
>
> Hi,
>
> my patch fixes the compilation of TexturePacker for xbmc frodo/gotham.
>
> use_texturepacker_native=yes
>
> is needed because we abviously need a native-compiled binary, but the xbmc
> build system does enable this variable only for darwin, android and
> raspberry-pi targets.
>
> USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>
> is also needed because
> USE_TEXTUREPACKER_NATIVE_ROOT="$TEXTUREPACKER_NATIVE_ROOT"
> is only executed for raspberry-pi by xbmc/configure and only
> USE_TEXTUREPACKER_NATIVE_ROOT is used by tools/TexturePacker/Makefile.in.
>
> To sum up, building for raspberry-pi and other archs works out-of-the-box,
> compiling for an Intel target, for example, fails:
>
> In file included from SDL_anigif.cpp:23:0:
> SDL_anigif.h:24:21: fatal error: SDL/SDL.h: No such file or directory
> compilation terminated.
> XBMCTex.cpp:34:21: fatal error: SDL/SDL.h: No such file or directory
>
Thank you for the explanation, I only uses XBMC on an RPi, this
explaining that :).
A shorter version of this could be part of your commit log ? I think
this  would be nice.
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
