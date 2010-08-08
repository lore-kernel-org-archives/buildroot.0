From: Mitch Davis <mjd+buildroot@afork.com>
Date: Sun, 8 Aug 2010 20:39:22 +1000
Subject: [Buildroot] ALSA on the EP93XX
In-Reply-To: <AANLkTin-Qp4fxZDnnyfAeyTigZ9rDpQ2gwu2Nah7XRzM@mail.gmail.com>
References: <AANLkTin-Qp4fxZDnnyfAeyTigZ9rDpQ2gwu2Nah7XRzM@mail.gmail.com>
Message-ID: <AANLkTikVCzWKCtfhK6vXhSC7VTSj=-dcw5=bBaE_sUWB@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 8, 2010 at 7:32 PM, anthony henderson
<development@fair-games.com> wrote:
>
> I've selected from make menuconfig
> audi video libs....
> |______> alsa
> ?????????? |__> directory with ALSA /dev/snd
> ?????????????????? build PCMplugins ALL
> ?????????????????? build control plugins ALL
> ????????????????? aload
> ????????????????? mixer
> ???????????????? pcm
> ???????????????? rawmidi
> ???????????????? etc

These are the user-space ALSA components, such as libasound.  Check to
see that the kernel drivers for your hardware are being compiled.  If
your kernel has ALSA sound support, and if the drivers are loaded (if
they are compiled as kernel modules, make sure they've been loaded -
check /proc/modules), you'll have a /proc/asound/cards file, and
catting that file should show your sound hardware.

> I know my board kernel has sound as the provided rootfs will play it using
> aplay

Try running the aplay command via "strace".  This will show you the
device files and shared libraries it's using.  That may give you some
clues as to how this app is working (however poorly).

Mitch.
