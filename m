From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 30 Oct 2015 21:12:18 +0100
Subject: [Buildroot] Qt5 and touchscreen calibration
In-Reply-To: <5633A776.90600@mind.be>
References: <5633A11C.6070706@yahoo.fr>
	<5633A776.90600@mind.be>
Message-ID: <20151030211218.6c801173@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David, Arnout,

On Fri, 30 Oct 2015 18:23:02 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 30-10-15 17:55, David Picard wrote:
> > Hello,
> > 
> > 
> > I got my touchscreen working perfectly with ts_test. Many thanks to Peter
> > Seiderer !
> > 
> > But the thing is that my Qt5 app does not grab the touchscreen properly : x and
> > y axis are switched. I did enable the tslib option under Qt5 in menuconfig. Is

The following 

	$ QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS='rotate=270' /usr/lib/qt/examples/touch/fingerpaint/fingerpaint -platform 
linuxfb:fb=/dev/fb1

worked for me to get x/y right, see [1] for Qt5 parameters.

Regards,
Peter

[1] http://doc.qt.io/qt-5/embedded-linux.html

> > there some magic command line option to pass to the application ? I tried this :
> > 
> > $ myapp -platform linuxfb:fb=/dev/fb1 -plugin tslib
> > ts_open() failed (No such file or directory)
> 
>  Did you export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event0 (but
> replace with the correct device of course)?
> 
>  Or hang on, for tslib it's TSLIB_TSDEVICE that you have to set.
> 
> 
>  Regards,
>  Arnout
> 
> > 
> >>>> the app shows up, but TS still messed up.
> > 
> > My config :
> > - Raspberry Pi B+ and Adafruit 2.8" PiTFT w/ cap touch.
> > - Buildroot 2015.08.1
> > - Qt5 w/ tslib support enabled (BR2_PACKAGE_QT5BASE_TSLIB=y).
> > 
> > 
> > Regards,
> > David.
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> 
