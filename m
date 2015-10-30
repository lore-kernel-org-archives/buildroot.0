From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 18:23:02 +0100
Subject: [Buildroot] Qt5 and touchscreen calibration
In-Reply-To: <5633A11C.6070706@yahoo.fr>
References: <5633A11C.6070706@yahoo.fr>
Message-ID: <5633A776.90600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-10-15 17:55, David Picard wrote:
> Hello,
> 
> 
> I got my touchscreen working perfectly with ts_test. Many thanks to Peter
> Seiderer !
> 
> But the thing is that my Qt5 app does not grab the touchscreen properly : x and
> y axis are switched. I did enable the tslib option under Qt5 in menuconfig. Is
> there some magic command line option to pass to the application ? I tried this :
> 
> $ myapp -platform linuxfb:fb=/dev/fb1 -plugin tslib
> ts_open() failed (No such file or directory)

 Did you export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event0 (but
replace with the correct device of course)?

 Or hang on, for tslib it's TSLIB_TSDEVICE that you have to set.


 Regards,
 Arnout

> 
>>>> the app shows up, but TS still messed up.
> 
> My config :
> - Raspberry Pi B+ and Adafruit 2.8" PiTFT w/ cap touch.
> - Buildroot 2015.08.1
> - Qt5 w/ tslib support enabled (BR2_PACKAGE_QT5BASE_TSLIB=y).
> 
> 
> Regards,
> David.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
