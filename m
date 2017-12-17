From: daggs <daggs@gmx.com>
Date: Sun, 17 Dec 2017 14:31:10 +0100
Subject: [Buildroot] tvheadend doesn't list existing DVB adapter
Message-ID: <trinity-147f354a-6383-4635-b92c-9f49f94ac11c-1513517470581@3c-app-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've built a buildroot based image updated for today with uclubc-ng as libc.
when I boot the image on my rpi2 and access tvheadend;'s webgui, I don't see any adapter.
there is one one the system, see:
# ls -ahl /dev/dvb/adapter0
total 0
drwxr-xr-x    2 root     root         120 Jan  1 02:07 .
drwxr-xr-x    3 root     root          60 Jan  1 02:07 ..
crw-rw----    1 root     root      212,   4 Jan  1 02:07 demux0
crw-rw----    1 root     root      212,   5 Jan  1 02:07 dvr0
crw-rw----    1 root     root      212,   3 Jan  1 02:07 frontend0
crw-rw----    1 root     root      212,   7 Jan  1 02:07 net0

# dmesg | grep dvb
[    4.260040] dvb-usb: found a 'Mygica T230 DVB-T/T2/C' in warm state.
[    4.536234] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
[    4.764017] dvb-usb: schedule remote query interval to 100 msecs.
[    4.779651] dvb-usb: Mygica T230 DVB-T/T2/C successfully initialized and connected.
[    4.791951] usbcore: registered new interface driver dvb_usb_cxusb
[  371.678141] dvb-usb: Mygica T230 DVB-T/T2/C successfully deinitialized and disconnected.
[  429.928693] dvb-usb: found a 'Mygica T230 DVB-T/T2/C' in warm state.
[  430.206205] dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
[  430.354862] dvb-usb: schedule remote query interval to 100 msecs.
[  430.374636] dvb-usb: Mygica T230 DVB-T/T2/C successfully initialized and connected.
[  460.684654] si2168 3-0064: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
[  461.474921] si2157 4-0060: downloading firmware from file 'dvb-tuner-si2158-a20-01.fw'

w_scan works, see:
# w_scan 
w_scan 
w_scan version 20170107 (compiled for DVB API 5.10)
WARNING: could not guess your country. Falling back to 'DE'
guessing country 'DE', use -c <country> to override
using settings for GERMANY
DVB aerial
DVB-T Europe
scan type TERRESTRIAL, channellist 4
output format vdr-2.0
WARNING: could not guess your codepage. Falling back to 'UTF-8'
output charset 'UTF-8', use -C <charset> to override
Info: using DVB adapter auto detection.
        /dev/dvb/adapter0/frontend0 -> TERRESTRIAL "Silicon Labs Si2168": very good :-))

Using TERRESTRIAL frontend (adapter /dev/dvb/adapter0/frontend0)
-_-_-_-_ Getting frontend capabilities-_-_-_-_ 
Using DVB API 5.10
frontend 'Silicon Labs Si2168' supports
DVB-T2
INVERSION_AUTO
QAM_AUTO
TRANSMISSION_MODE_AUTO
GUARD_INTERVAL_AUTO
HIERARCHY_AUTO
FEC_AUTO
BANDWIDTH_AUTO not supported, trying 6/7/8 MHz.
FREQ (42.00MHz ... 870.00MHz)
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ 
Scanning DVB-T...
Scanning 8MHz frequencies...
474000: (time: 00:02.329) 
482000: (time: 00:04.379)

any ideas? is it possible that tvheadend only works with glibc? (it segfaults with musl)

Thanks,

Dagg.
