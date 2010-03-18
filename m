From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2010 09:02:04 +0000 (UTC)
Subject: [Buildroot] [Bug 1351] host-libxslt-1.1.24 fails to build
In-Reply-To: <bug-1351-163@https.bugs.busybox.net/>
References: <bug-1351-163@https.bugs.busybox.net/>
Message-ID: <20100318090204.A0E7D77515@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1351





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-03-18 09:02:03 UTC ---
My guess is that there is a confusion with the libxml2 library installed on the
host. Could you put the full build log somewhere ?

We might need to :

 * Add a post install hook to the libxml2 package, so that
$(HOST_DIR)/usr/bin/xml2-config gets fixed just as we already fix
$(TARGET_DIR)/usr/bin/xml2-config

 * Pass the LIBXML_CONFIG_PREFIX variable to libxslt's configure script, so
that it uses $(HOST_DIR)/usr/bin/xml2-config instead of /usr/bin/xml2-config


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
