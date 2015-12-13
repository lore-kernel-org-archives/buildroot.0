From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Dec 2015 14:03:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: new package
In-Reply-To: <ve20kcx3eu.ln2@ID-313208.user.individual.net>
References: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
 <20151213113342.GF2318@tarshish>
 <ve20kcx3eu.ln2@ID-313208.user.individual.net>
Message-ID: <20151213120353.GG2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Dec 13, 2015 at 12:47:11PM +0100, Bernd Kuhls wrote:
> Am Sun, 13 Dec 2015 13:33:42 +0200 schrieb Baruch Siach:
> > On Sun, Dec 13, 2015 at 11:58:16AM +0100, Bernd Kuhls wrote:
> >> +define LIBHDHOMERUN_INSTALL_STAGING_CMDS +	$(INSTALL) -D -m 0755
> >> $(@D)/libhdhomerun.so \ +		$(STAGING_DIR)/usr/lib/
> libhdhomerun.so +
> >> $(INSTALL) -D -m 0644 $(@D)/*.h \ +		$(STAGING_DIR)/usr/
> include/
> >> +endef +
> >> +define LIBHDHOMERUN_INSTALL_TARGET_CMDS +	$(INSTALL) -D -m 0755
> >> $(@D)/hdhomerun_config \
> >> +		$(TARGET_DIR)/usr/bin/hdhomerun_config
> > 
> > Are you sure this is not for staging?
> 
> yes, because it is not a script but a binary compiled for the target:
> 
> $ file /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/
> hdhomerun_config
> /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/hdhomerun_config: 
> ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
> interpreter /lib/ld64-uClibc.so.0, not stripped

This most likely matches your host. Is that your target as well?

> I am not sure whether the file is really needed on the target or not but it 
> is definitely not suited for staging.

Agreed. But is this file really intended for target use? Most library *_config 
files are only useful during build. What is the purpose of hdhomerun_config?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
