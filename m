From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Jan 2017 03:59:16 +0000
Subject: [Buildroot] [Bug 9596] KODI: --enable-lirc needs "HAVE_LIRC"
 compiler definition to use the lirc subsystem
In-Reply-To: <bug-9596-163@https.bugs.busybox.net/>
References: <bug-9596-163@https.bugs.busybox.net/>
Message-ID: <bug-9596-163-yYNKmwddDt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9596

--- Comment #1 from lipkegu at gmail.com ---
Solution:

ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY)
--cflags --libs egl` -DHAVE_LIRC"
KODI_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags
--libs egl` -DHAVE_LIRC"
KODI_CONF_OPTS += --enable-lirc
else
KODI_CONF_OPTS += --disable-lirc
endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
