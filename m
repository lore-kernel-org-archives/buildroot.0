From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 09:45:50 +0100
Subject: [Buildroot] [PATCH v9 2/3] board: vyasa: Add qst5 configuration
In-Reply-To: <1517313835-21973-2-git-send-email-jagan@amarulasolutions.com>
 (Jagan Teki's message of "Tue, 30 Jan 2018 13:03:54 +0100")
References: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
 <1517313835-21973-2-git-send-email-jagan@amarulasolutions.com>
Message-ID: <87po5itsjl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jagan" == Jagan Teki <jagannadh.teki@gmail.com> writes:

Hi,

 > This configuration build qt5 along with MALI T76X
 > for vyasa rk3288 board.

 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

 > @@ -29,3 +29,22 @@ You can write this image directly to an SD card device (i.e. /dev/xxx):
 >    $ sudo sync
 
 >  Finally, you can insert the SD card to the Vyasa RK3288 board, close J4 and boot it.
 > +
 > +Testing graphics on Vysa RK3288
 > +===============================
 > +
 > +Built Mali T76X, Qt5 and demo application:

s/Built/Build/

> +
 > +   $ make amarula_vyasa_rk3288_qt5_defconfig
 > +   $ make
 > +
 > +Test procedure:
 > +- insert require modules
 > +# modprobe -a rockchipdrm
 > +# modprobe -a governor_simpleondemand
 > +
 > +- build kernel mali driver as module and insert

So this defconfig isn't usable out of the box? That isn't really nice :/

How about adding a t76x-mali kernel driver package, similar to
E.G. sunxi-mali-driver-mainline:

https://patchwork.ozlabs.org/patch/841314/

-- 
Bye, Peter Korsgaard
