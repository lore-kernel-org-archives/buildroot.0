From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 27 Nov 2006 18:27:50 +0100
Subject: [Buildroot] [Fwd: Re:  SDL_image,
	SDL_ttf & Co (libpng12.So bug)]
In-Reply-To: <456AE6A3.1020409@elaxys.com.br>
References: <456AE31F.9020200@elaxys.com.br> <456AE6A3.1020409@elaxys.com.br>
Message-ID: <1164648470.456b2016bbf49@imp5-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> I was using buildroot version 20061111 and managed to
> compile SDL_image including the following flags (LDFLAGS) for the
> linker.
>
> $(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
> 	$(MAKE) LDFLAGS=$(STAGING_DIR)/lib/libpng12.so -C $(SDL_IMAGE_DIR)
> 	touch $(SDL_IMAGE_DIR)/.compiled
>

Well I investigate a little too and find that when removing "showimage" example
compilation from Makefile, then I was able to compile SDL_image. (The error on
libpng12.so is during showimage tool link.) But if think your solution is
cleaner
;-)

> I had to change the sdl.mk for SDL adding the following line
> to configure:
> 	--disable-video-directfb
>
ok ,thanks for the tip !

> I am now having problems compiling SDL_ttf ...

I had problems too :-). I suppose you have the same: missing OpenGL library.
I was able to compile SDL_ttf (2.0.8) when adding the following options to
configure:
        --disable-sdltest
	--without-x
	--disable-opengl

I attach my SDL_ttf makefile if it can help you. Let me know if it solves your
problem !

regards,
Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: sdl_ttf.mk
Type: application/octet-stream
Size: 2218 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061127/d139ca79/attachment.obj 
