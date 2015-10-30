From: David Picard <davepiq@yahoo.fr>
Date: Fri, 30 Oct 2015 13:17:33 +0100
Subject: [Buildroot] /dev management ?
Message-ID: <56335FDD.9060109@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to get the ft6x06 touchscreen driver to work. When I load 
the driver, /dev/input/mouse0 is created, but no /dev/input/event*. Same 
thing when I hook up a USB mouse. With both devices, I can "cat 
/dev/input/mouse0 | hexdump" and see events when I move the mouse / 
touch the screen.

evtest and ts_test won't work, complaining that /dev/input/mouse0 is not 
a Linux input event device. My Qt5 app doesn't grab the touchscreen events.

My config :
- Raspberry Pi B+ and Adafruit 2.8" PiTFT w/ cap touch. I got the 
display part working OK.
- Buildroot 2015.08.1
- default /dev management method, i.e. "Dynamic using devtmpfs only".
- rootnfs (root file system on my laptop)


Thanks in advance for your help,
David.

------
Platform :
