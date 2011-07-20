From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:13:36 +0200
Subject: [Buildroot] [PATCH 2 of 3] Allow BR2_PRIMARY_SITE and
 BR2_BACKUP_SITE to be a file:// URL
In-Reply-To: <0aa192a871d0b6d66c57.1300174027@localhost6.localdomain6>
References: <patchbomb.1300174025@localhost6.localdomain6>
 <0aa192a871d0b6d66c57.1300174027@localhost6.localdomain6>
Message-ID: <20110720071336.1958f634@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 15 Mar 2011 08:27:07 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

>  define DOWNLOAD
>  	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
> -		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
> +		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
> +			file) $(call $(DL_MODE)_FILE,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
> +			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
> +		esac ; \

Does this bring any additional feature that using the existing
BR2_DL_DIR option ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
