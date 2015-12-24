From: Rodrigo Rebello <rprebello@gmail.com>
Date: Wed, 23 Dec 2015 22:33:01 -0200
Subject: [Buildroot] [PATCH v4 1/3] chocolate-doom: new package
In-Reply-To: <20151223233453.0e71a3b6@free-electrons.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
 <20151223233453.0e71a3b6@free-electrons.com>
Message-ID: <CABLs7GUV97Ck5V6_vgmsCJfgxgvgZkkrvKvLeV8RX3RZK9+6Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2015-12-23 20:34 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +# SDL_mixer uses symbols from SDL, but ends up after it on the link
>> +# cmdline. Fix it by forcing the SDL libs at the very end.
>> +CHOCOLATE_DOOM_CONF_ENV = LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
>> +endif
>
> It would be great if this was fixed properly in the chocolate-doom
> build system. An obvious suggestion is to use pkg-config, which handles
> static linking scenarios a lot better.
>

Agreed. I have considered exactly that when I was working on the
patch, but I have decided to leave it for later since a patch for
SDL_mixer is also necessary (SDL_mixer.pc is missing a 'Libs.private'
section with libraries necessary for static linking). I've just had a
look at it and the solution is actually quite simple, so I'll work on
it and propose a patch. That will also be useful to fix a recent ltris
autobuild failure related to static linking as well.

Regards,
Rodrigo

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
