From: Jonas <qiaohuang178@gmail.com>
Date: Thu, 24 Aug 2017 03:42:05 -0700 (MST)
Subject: [Buildroot] pulseaudio isn't work on buildroot-2017.02.5
Message-ID: <1503571325385-173857.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm useing RPi and buildroot-2017.02.5.tar.gz.
linux is work but pulseaudio is not work.

The following is my config:

System configuration  --->
/dev management (Dynamic using devtmpfs + mdev)  --->
Dynamic using devtmpfs + mdev

Toolchain  --->
Enable WCHAR support 

Target packages  --->
Audio and video applications  ---> 
pulseaudio

Target packages  --->
Audio and video applications  ---> 
alsa-utils


The following is error message:

#
# modprobe snd_bcm2835
#
# ls /dev/snd/
controlC0  pcmC0D0p   pcmC0D1p   timer
#
# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: ALSA [bcm2835 ALSA], device 0: bcm2835 ALSA [bcm2835 ALSA]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
card 0: ALSA [bcm2835 ALSA], device 1: bcm2835 ALSA [bcm2835 IEC958/HDMI]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
#
#
# pulseaudio --verbose
W: [pulseaudio] main.c: This program is not intended to be run as root
(unless --system is specified).
I: [pulseaudio] core-util.c: Successfully gained nice level -11.
I: [pulseaudio] main.c: This is PulseAudio 9.0
I: [pulseaudio] main.c: Page size is 4096 bytes
I: [pulseaudio] main.c: Machine ID is buildroot.
I: [pulseaudio] main.c: Using runtime directory
/root/.config/pulse/buildroot-runtime.
I: [pulseaudio] main.c: Using state directory /root/.config/pulse.
I: [pulseaudio] main.c: Using modules directory /usr/lib/pulse-9.0/modules.
I: [pulseaudio] main.c: Running in system mode: no
I: [pulseaudio] main.c: System supports high resolution timers
I: [pulseaudio] cpu-arm.c: CPU flags: V6 V7 VFP EDSP NEON VFPV3
I: [pulseaudio] svolume_arm.c: Initialising ARM optimized volume functions.
I: [pulseaudio] sconv_neon.c: Initialising ARM NEON optimized conversions.
I: [pulseaudio] mix_neon.c: Initialising ARM NEON optimized mixing
functions.
I: [pulseaudio] remap_neon.c: Initialising ARM NEON optimized remappers.
I: [pulseaudio] module-device-restore.c: Successfully opened database file
'/root/.config/pulse/buildroot-device-volumes'.
I: [pulseaudio] module.c: Loaded "module-device-restore" (index: #0;
argument: "").
I: [pulseaudio] module-stream-restore.c: Successfully opened database file
'/root/.config/pulse/buildroot-stream-volumes'.
I: [pulseaudio] module.c: Loaded "module-stream-restore" (index: #1;
argument: "").
I: [pulseaudio] module-card-restore.c: Successfully opened database file
'/root/.config/pulse/buildroot-card-database'.
I: [pulseaudio] module.c: Loaded "module-card-restore" (index: #2; argument:
"").
I: [pulseaudio] module.c: Loaded "module-augment-properties" (index: #3;
argument: "").
I: [pulseaudio] module.c: Loaded "module-switch-on-port-available" (index:
#4; argument: "").
W: [pulseaudio] module.c: module-detect is deprecated: Please use
module-udev-detect instead of module-detect!
I: [pulseaudio] (alsa-lib)conf.c: Unknown parameters 0
I: [pulseaudio] (alsa-lib)pcm.c: Unknown PCM front:0
I: [pulseaudio] alsa-util.c: Error opening PCM device front:0: Invalid
argument
I: [pulseaudio] alsa-util.c: Cannot disable ALSA period wakeups
I: [pulseaudio] alsa-util.c: ALSA period wakeups were not disabled
I: [pulseaudio] alsa-sink.c: Successfully opened device hw:0.
I: [pulseaudio] alsa-sink.c: Selected mapping 'Analog Stereo'
(analog-stereo).
I: [pulseaudio] alsa-sink.c: Successfully enabled mmap() mode.
I: [pulseaudio] alsa-sink.c: Successfully enabled timer-based scheduling
mode.
I: [pulseaudio] alsa-util.c: Successfully attached to mixer 'hw:0'

# 
# pulseaudio --verbose --system
W: [pulseaudio] main.c: Running in system mode, but --disallow-exit not set.
W: [pulseaudio] main.c: Running in system mode, but
--disallow-module-loading not set.
N: [pulseaudio] main.c: Running in system mode, forcibly disabling SHM mode.
N: [pulseaudio] main.c: Running in system mode, forcibly disabling exit idle
time.
I: [pulseaudio] core-util.c: Successfully gained nice level -11.
E: [pulseaudio] main.c: Failed to find user 'pulse'.
#

I don't know how to solve this issue
how to let pulseaudio process work.

Thanks,
Jonas.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/pulseaudio-isn-t-work-on-buildroot-2017-02-5-tp173857.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
