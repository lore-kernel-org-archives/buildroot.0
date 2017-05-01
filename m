From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 May 2017 18:09:02 +0300
Subject: [Buildroot] [PATCH 1/4] bluez5_utils: allow install of
 deprecated tools
In-Reply-To: <20170501165750.1b6c9459@free-electrons.com>
References: <cover.1493643541.git.baruch@tkos.co.il>
 <a98f6fda9cded4f8416b2a6f2249e85be944eca4.1493643541.git.baruch@tkos.co.il>
 <20170501165750.1b6c9459@free-electrons.com>
Message-ID: <20170501150902.hcftaslekdgexeek@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 01, 2017 at 04:57:50PM +0200, Thomas Petazzoni wrote:
> On Mon,  1 May 2017 15:59:41 +0300, Baruch Siach wrote:
> 
> > -ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
> > +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED),y)
> >  define BLUEZ5_UTILS_INSTALL_GATTTOOL
> >  	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
> >  endef
> >  BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
> > +BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
> 
> So the --enable-deprecated option only enables the build of gatttool ?

No. It enables all deprecated tools. But for all other tools bluez does the 
installation as well. Only gatttool needs manual installation like before.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
