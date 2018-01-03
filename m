From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Wed, 3 Jan 2018 22:43:40 +0100
Subject: [Buildroot] ffmpeg issue with MIPS
Message-ID: <CAMbDF3KbAxppKmMVLWduL6B1RSLPriuErWcVTOt2wx-=+TE7GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Short summary of a MIPS (ci20) related bug:

In
"package/ffmpeg/ffmpeg.mk"
the decision is made to build ffmpeg with or without mipsfpu support:

ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
FFMPEG_CONF_OPTS += --disable-mipsfpu
else
FFMPEG_CONF_OPTS += --enable-mipsfpu
endif
endif # MIPS

This apparently goes wrong in a ci20 build.
Result:
squeezelite can not be executed.
See:
https://pastebin.com/nsseiAdV
Error is at the end
trying file=/usr/lib/libavcodec.so.57  -> needs FR1 mode

Regards
Johannes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180103/9ed8947d/attachment.html>
