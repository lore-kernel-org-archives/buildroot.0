From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 1 Mar 2016 08:10:20 -0300
Subject: [Buildroot] [PATCH 1/2] sdl_mixer: add patch to fix
 SDL_mixer.pc for static linking
In-Reply-To: <20160301091924.29fe2fe1@free-electrons.com>
References: <1456810926-9822-1-git-send-email-rprebello@gmail.com>
 <20160301091924.29fe2fe1@free-electrons.com>
Message-ID: <CABLs7GWQFXyfaWcqkXTzVwiTuqSTM+BYTxoC2ZgcvqpzeAGfWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2016-03-01 5:19 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
>> +# We're patching configure.in, but SDL_mixer is not compatible with our
>> +# autoreconf mechanism, so we have to do it manually instead of setting
>> +# SDL_MIXER_AUTORECONF = YES
>> +define SDL_MIXER_RUN_AUTOGEN
>> +     cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
>> +endef
>> +SDL_MIXER_PRE_CONFIGURE_HOOKS += SDL_MIXER_RUN_AUTOGEN
>> +
>
> If you do this, then you need to manually add host-autoconf
> host-automake and host-libtool to SDL_MIXER_DEPENDENCIES. It is
> normally done automatically by <pkg>_AUTORECONF = YES, but since you're
> not using it, you must do it manually.
>

Right. I'll add the missing dependencies and respin this patch.

Regards,
Rodrigo
