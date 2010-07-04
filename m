From: Mitch Davis <mjd+buildroot@afork.com>
Date: Mon, 5 Jul 2010 09:20:33 +1000
Subject: [Buildroot] qt ,buidroot and media files
In-Reply-To: <AANLkTinNNmqYMviBg7Jtj12hGnuH_eGpqiDqv8VvvNHP@mail.gmail.com>
References: <AANLkTilZ88rTjESzVeJHJewxPYakrHPsOzJc78DO9Qgj@mail.gmail.com> 
	<AANLkTik1U67fkAFZnj5OKS3fQHpNnPEX3h6oVsg7J0WS@mail.gmail.com> 
	<AANLkTilq2k_5SDbUBdN6j7Jodd6I74_1JE5sqLTF1KGE@mail.gmail.com> 
	<AANLkTinNNmqYMviBg7Jtj12hGnuH_eGpqiDqv8VvvNHP@mail.gmail.com>
Message-ID: <AANLkTilsUx57lVxDKbQMU7XFnan92vR7F5zA1L1fummJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 5, 2010 at 9:00 AM, Mahmoud Mamdouh
<mamdouh.al.shamy@gmail.com> wrote:
>
>> /proc/asound/card0
>> has inside it
>>
>> id         oss_mixer  pcm0c      pcm0p

That means you have support for the ALSA core, but...

>> /proc/asound/cards
>> ?is a file which is empty

... it seems that the code to support your particular sound hardware
isn't loaded.

Is your kernel support for sound compiled into the kernel, or compiled
as kernel modules?  What hardware option did you pick when you
configured the kernel?  What sound hardware do you have, and why do
you think it matches what you chose in your kernel config?

Mitch.
