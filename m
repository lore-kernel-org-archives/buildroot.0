From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 00:45:24 +0100
Subject: [Buildroot] [PATCH] package/avahi: bump to version 0.8
In-Reply-To: <20200218094600.31221-1-joerg.krause@embedded.rocks>
References: <20200218094600.31221-1-joerg.krause@embedded.rocks>
Message-ID: <20200219004524.72f8b623@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 10:45:59 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> This bump also includes:
>  * Drop upstream security patch which is included in the new version
>  * Unconditionally disable support for Qt5 [1] (same as Qt3 and Qt4)
>  * Switch from host-inttool to host-gettext [2]

Is host-gettext always needed? Normally it's only needed when
--enable-nls is passed, and this is already taken care of by
$(TARGET_NLS_DEPENDENCIES), which contains host-gettext when
BR2_ENABLE_SYSTEM_NLS=y.

Could you double check this ?

Also, another question is: Avahi really still has some code to support
Qt3, and the corresponding --enable-qt3 option ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
