From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Oct 2011 13:31:05 +0200
Subject: [Buildroot] [PATCH] dejavu-fonts: add new package
In-Reply-To: <1318069406-21518-1-git-send-email-schwarzkopf@sensortherm.de>
References: <1318069406-21518-1-git-send-email-schwarzkopf@sensortherm.de>
Message-ID: <20111008133105.1eaa314a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Klaus,

Thanks for this package!

Le Sat,  8 Oct 2011 12:23:26 +0200,
Klaus Schwarzkopf <schwarzkopf@sensortherm.de> a ?crit :

> +config BR2_PACKAGE_DEJAVU_FONTS
> +	bool "dejavu fonts"
> +	help
> +		The DejaVu fonts are a font family 
> +		based on the Vera Fonts.
> +
> +	  	http://dejavu-fonts.org/wiki/Main_Page

Indentation for the help text is one tab + two spaces.

> +DEJAVU_FONTS_VERSION:=2.33
> +DEJAVU_FONTS_SOURCE:=dejavu-fonts-ttf-$(DEJAVU_FONTS_VERSION).tar.bz2
> +DEJAVU_FONTS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/dejavu/dejavu/$(DEJAVU_FONTS_VERSION)/

Please use '=' instead of ':='

> +$(eval $(call GENTARGETS,package,dejavu-fonts))

This should be:

$(eval $(call GENTARGETS))

in the latest Git version of Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
