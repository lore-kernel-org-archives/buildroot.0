From: anthony henderson <development@fair-games.com>
Date: Sun, 8 Aug 2010 10:32:21 +0100
Subject: [Buildroot] ALSA on the EP93XX
Message-ID: <AANLkTin-Qp4fxZDnnyfAeyTigZ9rDpQ2gwu2Nah7XRzM@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I hope someone can help me out with this,  I've built a rootfs for a cirrus
EP93xx.  It uses i2s audio.

I've selected from make menuconfig
audi video libs....
|______> alsa
           |__> directory with ALSA /dev/snd
                   build PCMplugins ALL
                   build control plugins ALL
                  aload
                  mixer
                 pcm
                 rawmidi
                 etc

basically all the ALSA options

I've went to test my sound by searching /dev for devices  sound etc.  They
don't exist?
I've tried to look in /proc for asound directory, it doesn't exist either
However libasound.so.2.0.0 does exist in usr/lib ?
Although there is no aplay there is a file playsound_sample  in /usr/bin  I
try to run and get numerous errors

/usr/bin #  /usr/bin # ./playsound_simple
ALSA lib confmisc.c:768:(parse_card) cannot find card '0'
ALSA lib conf.c:4154:(_snd_config_evaluate) function snd_func_card_driver
returned error: No such file or directory
ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings
ALSA lib conf.c:4154:(_snd_config_evaluate) function snd_func_concat
returned error: No such file or directory
ALSA lib confmisc.c:1251:(snd_func_refer) error evaluating name
ALSA lib conf.c:4154:(_snd_config_evaluate) function snd_func_refer returned
error: No such file or directory
ALSA lib conf.c:4633:(snd_config_expand) Evaluate error: No such file or
directory
ALSA lib pcm.c:2211:(snd_pcm_open_noupdate) Unknown PCM default
/usr/bin #





I know my board kernel has sound as the provided rootfs will play it using
aplay or my ALSA code, but very poorly it locks up the board when playing
and I can find no way round it, that's the main reason I need a new rootfs,
to try to get sound working to a normal level, there's no dmix set up
either.

Can anyone advise how I can get sound, I'm not sure why it's not in /dev or
/proc/asound?  Thanks in advance

-- 
Regards Tony
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100808/2d6cdcab/attachment.html>
