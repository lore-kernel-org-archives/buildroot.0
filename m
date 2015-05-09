From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 09 May 2015 22:50:56 +0200
Subject: [Buildroot] [RFC 1/1] package/asterisk: new package
References: <1430068623-2118-1-git-send-email-bernd.kuhls@t-online.de>
 <1430068623-2118-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA495E86E78457berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1430068623-2118-2-git-send-email-bernd.kuhls at t-online.de:

>  package/asterisk/asterisk-addon-mp3-r201.patch  | 4076 
+++++++++++++++++++++++

Hi,

instead of this monster patch I am now using this code in asterisk.mk:

ASTERISK_ADDON_MP3_VERSION = r201
ASTERISK_ADDON_MP3_SITE = http://dev.alpinelinux.org/~tteras
ASTERISK_ADDON_MP3_SOURCE = asterisk-addon-mp3-$(ASTERISK_ADDON_MP3
_VERSION).patch.gz
ASTERISK_EXTRA_DOWNLOADS = $(ASTERISK_ADDON_MP3_SITE)/$(ASTERISK_ADDON_MP3
_SOURCE)
define ASTERISK_ADDON_MP3_PATCH
        $(APPLY_PATCHES) $(@D) $(DL_DIR) $(ASTERISK_ADDON_MP3_SOURCE)
endef
ASTERISK_POST_PATCH_HOOKS += ASTERISK_ADDON_MP3_PATCH

Regards, Bernd
