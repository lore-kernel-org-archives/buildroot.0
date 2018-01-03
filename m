From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:50:57 +0100
Subject: [Buildroot] ffmpeg issue with MIPS
In-Reply-To: <CAMbDF3KbAxppKmMVLWduL6B1RSLPriuErWcVTOt2wx-=+TE7GQ@mail.gmail.com>
References: <CAMbDF3KbAxppKmMVLWduL6B1RSLPriuErWcVTOt2wx-=+TE7GQ@mail.gmail.com>
Message-ID: <20180103225057.79846679@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Jan 2018 22:43:40 +0100, Johannes Schmitz wrote:
> Short summary of a MIPS (ci20) related bug:
> 
> In
> "package/ffmpeg/ffmpeg.mk"
> the decision is made to build ffmpeg with or without mipsfpu support:
> 
> ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
> FFMPEG_CONF_OPTS += --disable-mipsfpu
> else
> FFMPEG_CONF_OPTS += --enable-mipsfpu
> endif
> endif # MIPS
> 
> This apparently goes wrong in a ci20 build.
> Result:
> squeezelite can not be executed.
> See:
> https://pastebin.com/nsseiAdV
> Error is at the end
> trying file=/usr/lib/libavcodec.so.57  -> needs FR1 mode

I guess this has been discussed on IRC, but the discussion has been
very long, and I didn't follow all of it. So here are some basic
questions:

 - What is your Buildroot configuration ?

 - What is the exact MIPS processor you're running this on ?

 - Does it work when --disable-mipsfpu is passed, or when
   --enable-mipsfpu is passed ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
