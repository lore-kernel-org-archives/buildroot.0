From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jul 2016 18:17:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/fs-uae: new package
References: <1465404120-27923-1-git-send-email-bernd.kuhls@t-online.de>
 <20160717143724.GG3614@free.fr>
Message-ID: <flns5dx21u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sun, 17 Jul 2016 16:37:24 +0200 schrieb Yann E. MORIN:

> Are those tools only used during compilation and not at runtime?

partly, the tools itself are only used during compilation but they
contain .o files which are also part of the target version of
libuae.so. As an example have a look at src/readcpu.cpp, it is part
of libuae_a_SOURCES and needed by gen/gencomp and gen/gencpu.

> Please, depends before selects.

Ok.

>> +	  http://fs-uae.net
> 
> Out of curiosity, what would be the purpose for having an Amiga
> emulator?

http://openelec.tv/forum/128-addons/76825-addon-fs-uae-amiga-emulator

;)

>> +FS_UAE_POST_CONFIGURE_HOOKS = FS_UAE_MAKE_HOST_TOOLS
> 
> This should be a PRE_BUILD hook.

Ok.

> If the Makefile rules are correct (hehe!), then once they are built,
> they won't be rebuilt, so will correctly be host tools, not target
> tools.

Besides the object files needed both a target and host versions there
are numerous time stamps in use in the Makefile so I would propose to
stick to my patch ;)

Regards, Bernd
