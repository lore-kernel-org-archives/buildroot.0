From: Claudio Leonel <cls@elaxys.com.br>
Date: Mon, 27 Nov 2006 11:22:43 -0200
Subject: [Buildroot] [Fwd: Re:  SDL_image,
	SDL_ttf & Co (libpng12.So bug)]
In-Reply-To: <456AE31F.9020200@elaxys.com.br>
References: <456AE31F.9020200@elaxys.com.br>
Message-ID: <456AE6A3.1020409@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was using buildroot version 20061111 and managed to
compile SDL_image including the following flags (LDFLAGS) for the
linker.

$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
	$(MAKE) LDFLAGS=$(STAGING_DIR)/lib/libpng12.so -C $(SDL_IMAGE_DIR)
	touch $(SDL_IMAGE_DIR)/.compiled

I checked the dependencies of the generated libSDL_image.so
file and it seemed OK, but I haven't tested it yet in
the target.


But then I changed to a newer buildroot version: 20061124
and the previous modification was not enough, other linker
errors appeared, regarding the host directfb library.

I had to change the sdl.mk for SDL adding the following line
to configure:
	--disable-video-directfb

(I am not using directfb, only the framebuffer)


I am now having problems compiling SDL_ttf ...


Regards,


> Hi,
> 
> I have tried an older Buildroot version (20060217) and SDL_image is compiling
> fine. uClibc version is the same (0.9.28) than on my "non working" Buildroot
> snapshot (20060908).
> 
> Claudio, which Buildroot version are you using ?
> 
> Does somebody from buildroot team working on the very similar
> DirectFB/libpng12.so bug (ID 959) has already found something ?
> 
> regards,
> Julien
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
