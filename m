From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 14:10:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: change download
	url to github
In-Reply-To: <87efueg91o.fsf@dell.be.48ers.dk>
References: <20170618074538.1237-1-bernd.kuhls@t-online.de>
 <877f09glcd.fsf@dell.be.48ers.dk>
 <20170619152921.6a37a345@windsurf.lan>
 <87efueg91o.fsf@dell.be.48ers.dk>
Message-ID: <20170620141021.5ecdcd3e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 14:04:03 +0200, Peter Korsgaard wrote:

>  >> >  IMAGEMAGICK_VERSION = 7.0.5-10
>  >> > -IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
>  >> > -IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
>  >> > +IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
>  >> > +IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive    
>  >> 
>  >> That SOURCE name is a bit annoying. Is it a big issue that upstream
>  >> (re)moves the downloads after some time when we transparently fall back
>  >> to getting it from sources.buildroot.org?  
> 
>  > I indeed hadn't seen the stupid name for the tarball. On my side, I
>  > find it a bit annoying that we have to rely on sources.b.o to make
>  > things work, so having upstream location that are working on the long
>  > run is much better when possible. But I agree that the tarball name is
>  > really silly here, and the risk of conflict with other packages is real.  
> 
> That is exactly my concern. So what do we do? Leave it like this so
> s.b.o isn't needed or revert to get back a sane tarball name?
> 
> There's pro/cons to both, but I think I would prefer to revert.

Perhaps we could revert *and* talk to the upstream developers and ask
them to keep the tarballs at the same place, instead of (re)moving
them ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
