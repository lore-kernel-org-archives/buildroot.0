From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2011 19:19:04 +0200
Subject: [Buildroot] [Bug] alsamixer: can't load library 'libform.so.5'
In-Reply-To: <20110803182433.3dda34b1@gmail.com>
References: <20110803182433.3dda34b1@gmail.com>
Message-ID: <20110803191904.353a8230@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 3 Aug 2011 18:24:33 +0200,
Frederic Bassaler <frederic.bassaler@gmail.com> a ?crit :

> Hi, noticed this little bug right now :
> 
> alsamixer (from alsa-utils) complains that there's a missing library
> on the generated system : 'libform.so.5', which is normally part of
> ncurses.
> 
> the lib is generated in output/build/ncurses-5.7/lib/, but is
> apparently not copied in output/target/usr/lib

Hum, this is strange, because :

config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
        bool "alsamixer"
        select BR2_PACKAGE_NCURSES
        select BR2_PACKAGE_NCURSES_TARGET_PANEL
        select BR2_PACKAGE_NCURSES_TARGET_FORM
        select BR2_PACKAGE_NCURSES_TARGET_MENU

So the libform library from ncurses should get installed.

Could you post your .config ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
