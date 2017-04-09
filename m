From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Apr 2017 16:38:29 +0200
Subject: [Buildroot] [PATCH v4 02/39] package/libdvdread: add
	Kodi-specific patches
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
 <20170323172900.25458-3-bernd.kuhls@t-online.de>
 <20170406223831.648c10df@free-electrons.com>
Message-ID: <XnsA752A94946B5AID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20170406223831.648c10df at free-electrons.com:

> On Thu, 23 Mar 2017 18:28:23 +0100, Bernd Kuhls wrote:
> 
>> +# enable Kodi-specific code
>> +ifeq ($(BR2_PACKAGE_KODI),y)
>> +LIBDVDREAD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_XBMC"
>> +endif
> 
> This really feels clunky (ditto in patch 03/39). Why does the Kodi
> related code needs to be conditional?
> 
> What if libdvdread is used in the same system for Kodi and for
> something else?

Hi Thomas,

we have two choices: Let Kodi compile its patched versions of libdvd* and 
link it statically to kodi.bin or link dynamically to the patched system 
libraries provided in my current patch series.

Other packages which use libdvd* are: mpv, dvdauthor, mplayer and gst1-
plugins-ugly. My C knowledge is insufficient to judge whether the Kodi 
patches are having a negative impact on these packages, therefore I guarded
-D_XBMC in the .mk files.

Upstream was already notified of the Kodi patches:
https://code.videolan.org/videolan/libdvdcss/issues/2
https://code.videolan.org/videolan/libdvdnav/issues/1
https://code.videolan.org/videolan/libdvdread/issues/1

Here you will find a forum thread about the libdvd* patches:
http://forum.kodi.tv/showthread.php?tid=294976

Regards, Bernd
