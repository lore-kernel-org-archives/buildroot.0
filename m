From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Apr 2014 01:08:37 +0200
Subject: [Buildroot] [PATCH 1/1] jquery-mobile : new package
In-Reply-To: <20140412184515.4c578e8a@skate>
References: <1393781646-2497-1-git-send-email-sagaert.johan@skynet.be>
 <20140305202025.640405f8@skate> <20140412184515.4c578e8a@skate>
Message-ID: <2CB98F5F53CA430095F618E1B3CBB53C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

Will have a look at it, I have submitted this patch a long time ago (Oct 2013) and I saw the current version is now 1.4.2
So it might need some tweaking.

Been busy with some WinCE junk for a few days, but I won't forget to check it out and fix/upgrade. 

Regards, Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: zaterdag 12 april 2014 18:45
Aan: Thomas Petazzoni; Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] jquery-mobile : new package

Hello Sagaert,

Ping? Can you fix or answer the problem mentioned below so that your patch can be applied?

Thanks,

Thomas

On Wed, 5 Mar 2014 20:20:25 +0100, Thomas Petazzoni wrote:
> Dear Sagaert Johan,
> 
> On Sun,  2 Mar 2014 18:34:06 +0100, Sagaert Johan wrote:
> > jQuery Mobile is a HTML5-based user interface system designed to 
> > make responsive web sites and apps that are accessible on all 
> > smartphone, tablet and desktop devices.
> > 
> > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> 
> This looks good, except one thing:
> 
> > +ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
> > +define JQUERY_MOBILE_INSTALL_DEMOS
> > +	mkdir -p $(TARGET_DIR)/var/www/demos
> > +	cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos
> > +	$(INSTALL) -m 0644 -D $(@D)/demos/index.html 
> > +$(TARGET_DIR)/var/www/demo.html
> 
> Does this work? I mean the index.html file in the demos/ directory is 
> meant to stay there: it has relative paths to the subdirectories in 
> the demos/ directory. So if you move only this file from 
> /var/www/demos to /var/www I'm not sure to understand how it can work.
> 
> Thanks,
> 
> Thomas



--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
