From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 08 Aug 2015 14:46:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/libepoxy: fix OpenGL /
 EGL dependencies
References: <1438973409-7174-1-git-send-email-bernd.kuhls@t-online.de>
 <20150808105957.3abc07b4@free-electrons.com>
Message-ID: <d9ah9cxomg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 08 Aug 2015 10:59:57 +0200 schrieb Thomas Petazzoni:

>> +# needed for rpi-userland +LIBEPOXY_CFLAGS +=
>> `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
> 
> This is no-op: the package infrastructure doesn't understand

oops, I did not notice because I tested the patch together with
the version bump to 1.3.1 where configure.ac uses pkgconf to
find the egl headers.

> <pkg>_CFLAGS. So is it really needed? If yes, then you need:
> 
> LIBEPOXY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(LIBEPOXY_CFLAGS)"
> 
> Could you rework the patch accordingly? I could fix it myself, but I'd
> like to know whether those CFLAGS are actually needed (I believe they
> are since rpi-userland has headers in non-standard locations).

The patch is needed indeed for epoxy v1.2 so I reworked the patch:
http://patchwork.ozlabs.org/patch/505313/

and removed the lines again in the bump to 1.3.1 ;)
http://patchwork.ozlabs.org/patch/505312/

Regards, Bernd
