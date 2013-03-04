From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Mar 2013 10:41:09 +0200
Subject: [Buildroot] [PATCHv2] Added package HPLIP for printing to HP
 printers
In-Reply-To: <1362346010-7174-1-git-send-email-olivier.schonken@gmail.com>
References: <20130303190745.0f89b2e4@skate>
 <1362346010-7174-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130304084108.GB10626@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier,

On Sun, Mar 03, 2013 at 11:26:50PM +0200, Olivier Schonken wrote:
> HPLIP (Hewlett-Packard Linux Imaging & Printing) is an HP-developed solution
> for printing, scanning, and faxing with HP inkjet and laser based printers
> in Linux.
> 
> The --includedir=$(STAGING_DIR)/usr/include is unfortunately necessary even 
> with the modified Makefile.am for a succesful build.
> 
> Created a menu for cups related components to be kept close together.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

[...]

> +config BR2_PACKAGE_HPLIP
> +	bool "hplip"
> +	select BR2_PACKAGE_LIBUSB

Also select BR2_PACKAGE_CUPS, since it is listed as dependency below. Remember 
to also depend on dbus' dependencies.

[...]

> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +	HPLIP_CONF_OPT += --enable-dbus-build 

Add 'HPLIP_DEPENDENCIES += dbus', and make sure you do not override this 
assignment below.

> +else
> +	HPLIP_CONF_OPT += --disable-dbus-build 
> +endif
> +   
> +HPLIP_DEPENDENCIES = cups libusb

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
