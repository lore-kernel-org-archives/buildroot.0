From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:57:45 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version
 2.8.5
In-Reply-To: <20161011200732.29826-1-joerg.krause@embedded.rocks>
References: <20161011200732.29826-1-joerg.krause@embedded.rocks>
Message-ID: <20161012135745.353243f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Oct 2016 22:07:32 +0200, J?rg Krause wrote:

>  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
> @@ -17,7 +17,8 @@ SHAIRPORT_SYNC_AUTORECONF = YES
>  SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
>  	--with-metadata \
>  	--with-pipe \
> -	--with-stdout
> +	--with-stdout \
> +	--sysconfdir=/etc

We are already passing --sysconfdir=/etc globally to all autoconf based
packages, in package/pkg-autotools.mk, so this should not be necessary.

Do you really see things installed in /usr/local/etc ? Why isn't the
global --sysconfdir passed by pkg-autotools.mk not working ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
