From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Jan 2017 22:55:34 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-26
In-Reply-To: <20170127073003.CA12320D83@mail.free-electrons.com>
References: <20170127073003.CA12320D83@mail.free-electrons.com>
Message-ID: <20170127215534.GC3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-01-27 08:30 +0100, Thomas Petazzoni spake thusly:
> Build statistics for 2017-01-26
>      powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cd832e0808a35bab657a56537ade4b24e31b7879
>      aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9bdc920f5c7d1361626555dbbda15b2bc43a0e46
>       mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a0bad7f8131559f4d83e1aa0a2d754727b698363
>         mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4fd095530324c711ddb8e24bf290877c669e0fb9
>      powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/82409bd399860f6ee2594867fb732ad0097076d2
>      powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3f16bf52179a982441b46fc72e6a2617e607d9f3
>     mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1f3ea15c7e676bf0b4c2d674c5dd2cb1d953508b

So... Those are due to a stupdity in both the sdl2 install procedure and
the sdl2_ttf configure:

  - sdl2 will always install all its headers, even those for features
    that are disabled, like SDL_opengl.h et al.;

  - sdl_ttf will try to compile (not link) a program that includes
    SDL_opengl.h and concludes that GL support is enabled;

  - sdl2_ttf will then build and try to link with -lGL.

Bummer. 

Cc-ing Guillaume and Peter. Any idea? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
