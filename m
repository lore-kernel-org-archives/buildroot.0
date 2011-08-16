From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 16 Aug 2011 12:27:27 +0200
Subject: [Buildroot] [PATCH] package: add Fluxbox 1.3.1 window manager
In-Reply-To: <20110815162321.268fd413@gmail.com>
References: <20110803192301.4d5c4462@gmail.com>	<4E49213F.2040401@visionsystems.de>
 <20110815162321.268fd413@gmail.com>
Message-ID: <4E4A460F.8060501@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.08.2011 16:23, schrieb Frederic Bassaler:
> Le Mon, 15 Aug 2011 15:38:07 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> I've tried the patch and after installing xdm I can start the window
>> manager. What is basic buildroot configuration to get keboard and
>> mouse working?
>>
>> Yegor 
>
> I use X.Org (not TinyX), with the following drivers for input :
>
> xf86-input-evdev
> xf86-input-keyboard
> xf86-input-mouse
> xf86-input-synaptics (optional, if you have a touchpad)
>
> I guess you might need udev support too.

Thanks. That worked. But I had to compile explicit mice support into kernel. Under Debian it was sufficient to have /dev/input/eventX devices and corresponding links in /dev/input/by-path.

Yegor
