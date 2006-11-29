From: Claudio Leonel <cls@elaxys.com.br>
Date: Wed, 29 Nov 2006 14:52:46 -0200
Subject: [Buildroot] [Fwd: Re: [Fwd: Re:  SDL_image,
 SDL_ttf & Co (libpng12.So bug)]]
In-Reply-To: <456DB752.1030402@elaxys.com.br>
References: <456DB752.1030402@elaxys.com.br>
Message-ID: <456DBADE.6000001@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I think so.
To be sure, I recompiled again from scratch and it compiled OK.
I have attached my current makefiles for SDL and SDL_image.
On the other hand, SDL and SDL_ttf are already working in
the target, but SDL_image is not. My test application in
the target freezes in graphic mode when I try to render
the image. I am still investigating the problem.

Regards,


> I have tried your "trick" for SDL_image compilation and even if I put the
> LDFLAGS you advised I always have the same link error (/usr/lib/libpng12.so pb)
> 
> Are you sure it was the only thing you changed ?
> 
> Thanks,
> Julien
> 
> Quoting Claudio Leonel <cls@elaxys.com.br>:
> 
>>>> I was using buildroot version 20061111 and managed to
>>>> compile SDL_image including the following flags (LDFLAGS) for the
>>>> linker.
>>>>
>>>> $(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
>>>> 	$(MAKE) LDFLAGS=$(STAGING_DIR)/lib/libpng12.so -C $(SDL_IMAGE_DIR)
>>>> 	touch $(SDL_IMAGE_DIR)/.compiled
>>>>
>>>
> 

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: sdl_image.mk
Url: http://busybox.net/lists/buildroot/attachments/20061129/57dd1c57/attachment.pot 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: sdl.mk
Url: http://busybox.net/lists/buildroot/attachments/20061129/57dd1c57/attachment.asc 
