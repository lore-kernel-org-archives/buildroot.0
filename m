From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 May 2015 20:42:54 +0200
Subject: [Buildroot] [PATCH 05/35] pkg-generic: allow full URLs for
	<pkg>_EXTRA_DOWNLOADS
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA496D2B9833ABberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:1427650429-9293-6-git-send-email-
thomas.petazzoni at free-electrons.com:

> The current logic for <pkg>_EXTRA_DOWNLOADS assumes that it is a list
> of files, all hosted at <pkg>_SITE. However, just like for
> <pkg>_PATCH, it may be useful to specify <pkg>_EXTRA_DOWNLOADS entries
> that are hosted on a different site than the package <pkg>_SITE.
> 
> This commit implements this, by re-using the same logic as the one
> used for <pkg>_PATCH.

Hi,

is there a way to download _EXTRA_FILES via wget while the main package uses 
_SITE_METHOD = git? For example:

FREESWITCH_VERSION = 359ff2ac70788594a321eac856c85011baed017d
FREESWITCH_SITE = git://freeswitch.org/stash/scm/fs/freeswitch.git

FREESWITCH_EXTRA_SITE = http://files.freeswitch.org
FREESWITCH_EXTRA_DOWNLOADS = \
        $(FREESWITCH_EXTRA_SITE)/freeswitch-sounds-music-8000-1.0.50.tar.gz

In this case _EXTRA_DOWNLOADS are not downloaded at all.

Regards, Bernd
