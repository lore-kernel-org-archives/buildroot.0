From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Tue, 15 Jul 2008 10:20:39 +1200
Subject: [Buildroot] alsa unknown ioctl
In-Reply-To: <487B0F51.7090702@promwad.com>
References: <408540dd0807132122y2c49881dy964c9caf9732622f@mail.gmail.com>
	<487B0F51.7090702@promwad.com>
Message-ID: <408540dd0807141520m5f4886f8tcde913bba1232afe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thanks for pointing this out for me, the interesting thing now is that
i had to *disable* the -mabi=aapcs-linux option and everything started
working.
Maybe there is a way we can detect that the kernel has been built with
this option, blindly assuming that it's needed for arm doesn't seem to
be working.

~Matt

On Mon, Jul 14, 2008 at 8:33 PM, Ivan Kuten <ivan.kuten@promwad.com> wrote:
> Hello,
>
>> ALSA sound/core/control.c:1224: unknown ioctl = 0xc2c85512
>>
>> alsamixer: function snd_mixer_load failed: Inappropriate ioctl for device.
>
>
> Try to check this previous buildroot thread:
> http://busybox.net/lists/buildroot/2007-November/006326.html
>
>
> BR,
> Ivan
>
>
