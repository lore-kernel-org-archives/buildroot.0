From: Woody Wu <narkewoody@gmail.com>
Date: Sat, 27 Jul 2013 16:05:47 +0800
Subject: [Buildroot] DirectFB failed
Message-ID: <20130727080547.GA11545@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I built DiectFB and its examples in buildroot. None of these example can
run. They all reported runtime error something like:

(!) DirectFB/FBDev: No supported modes found in /etc/fb.modes and
current mode not supported!
(!) DirectFB/FBDev: Current mode's pixelformat: rgba 8/16, 8/8, 8/0, 0/0
(32bit).

I guess these error happened because I don't have correct DirectFB
configuration on my target - probably the /etc/directfbrc or
/etc/fb.modes files. Does anyone know what should these files contain on
my system?

Some environment information:
1. I have only one frame buffer device: /dev/fb0, which is a 800x480 LCD
screen.

2. run 'fbset' without any argument prints:

    mode "800x480-535209"
        # D: 250000.000 MHz, H: 283125.708 kHz, V: 535209.278 Hz
        geometry 800 480 800 480 32
        timings 4 19 37 10 26 27 13
        rgba 8/16,8/8,8/0,0/0
    endmode

    I don't what above mode info means, and even wondering where the
    'fbset' get the information. (by probing my actual fb device?)

Hope someone can help and thinks in advance!

-- 
I can't go back to yesterday - because I was a different person then
