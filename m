From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:33:17 +0200
Subject: [Buildroot] [PATCH 12/18] package/mplayer: add optional
 rtmpdump support
In-Reply-To: <20150408212503.GG4197@free.fr>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-13-git-send-email-bernd.kuhls@t-online.de>
 <20150408212503.GG4197@free.fr>
Message-ID: <20150408233317.6eb8263c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 8 Apr 2015 23:25:03 +0200, Yann E. MORIN wrote:

> Instead of passin extra libs, just let ./configure detect it all by
> itself:
> 
>     # ./configure will auto-detet librtmp if present, and will use
>     # appropriate CFLAGS/LDFLAGS/LIBS (otherwise, it fails to do so
>     # if told explicitly to use librtmp with --enable-librtmp
>     ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
>     MPLAYER_DEPENDENCIES += rtmpdump
>     else
>     MPLAYER_CONF_OPTS += --disable-librtmp
>     endif

Done when applying:

+# We intentionally don't pass --enable-librtmp to let autodetection
+# find which library to link with.
+ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+MPLAYER_DEPENDENCIES += rtmpdump
+else
+MPLAYER_CONF_OPTS += --disable-librtmp
+endif

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
