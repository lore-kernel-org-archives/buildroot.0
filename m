From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 9 Dec 2014 17:57:28 +0200
Subject: [Buildroot] [PATCH 1/1] screen: add support for 256 colors
In-Reply-To: <54871795.2010403@imgtec.com>
References: <1418138819-19772-1-git-send-email-tbultel@free.fr>
 <54871795.2010403@imgtec.com>
Message-ID: <20141209155728.GL2440@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente, Thierry,

On Tue, Dec 09, 2014 at 03:39:01PM +0000, Vicente Olivert Riera wrote:
> On 12/09/2014 03:26 PM, Thierry Bultel wrote:
> 
> >  define SCREEN_INSTALL_SCREENRC
> > -	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
> > +	if [ ! -f $(TARGET_DIR)/etc/screenrc ]; then \
> > +		$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc; \
> > +	fi
> >  endef
> >  
> >  SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
> 
> This part is not related with adding support for 256 colors, so, why
> don't you send a separate patch for it? Or at least, state in your
> commit message you are fixing a little issue with the 'screenrc' file
> installation. But I would say that a separate patch would be better.

I don't think the change in this separate patch is desired. We have just 
recently (commit 963bbf266bfebc [screen: install configuration file 
unconditionally]) switched to unconditional install of the config file.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
