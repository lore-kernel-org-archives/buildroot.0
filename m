From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 8 May 2016 18:09:40 +0200
Subject: [Buildroot] Pulseaudio does not detect ofono and bluez5
In-Reply-To: <572F38E0.3040004@gmail.com>
References: <572F38E0.3040004@gmail.com>
Message-ID: <572F64C4.2000605@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Found. libsbc was missing.
I guess should automatically selected when pulseaudio is enabled.

Marco

--

Il 08/05/2016 15:02, Marco Trapanese ha scritto:
>
> Compiling pulseaudio with bluez5 and ofono should lead to their support.
> Instead the configure process doesn't detect them as you can see in 
> the Makefile:
>
>> HAVE_ALSA = 1
>> HAVE_AVAHI = 0
>> HAVE_BLUEZ = 0
>> HAVE_BLUEZ_4 = 0
>> HAVE_BLUEZ_5 = 0
>> HAVE_BLUEZ_5_NATIVE_HEADSET = 0
>> HAVE_BLUEZ_5_OFONO_HEADSET = 0
>
> I tried to rebuild pulseaudio after the whole image is generated (i.e. 
> if it was compiled before ofono and bluez5) but with no chance.
>
> Then, I save the output of the rebuilding (attached to this email):
>
>> Enable D-Bus:                  yes
>>       Enable BlueZ 4:              no
>>       Enable BlueZ 5:              no
>>         Enable ofono headsets:     no
>>         Enable native headsets:    no
>
>
> I also see this warning:
>
>> configure: WARNING: unrecognized options: --disable-gtk-doc, 
>> --disable-gtk-doc-html, --disable-doc, --disable-docs, 
>> --disable-documentation, --with-xmlto, --with-fop, --enable-libudev
>
> I also attach the .config file. Please be aware about the changes I 
> made to compile bluez5. Version: Buildroot 
> 2016.05-git-01212-gabfaf47-dirty.
>
> Marco
>
>
