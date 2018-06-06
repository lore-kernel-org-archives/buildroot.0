From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 19:43:34 +0000
Subject: [Buildroot] [Bug 11071] Building postgresql package on Debian 9.4
 x64 for armel target fails
In-Reply-To: <bug-11071-163@https.bugs.busybox.net/>
References: <bug-11071-163@https.bugs.busybox.net/>
Message-ID: <bug-11071-163-u5jMox1NnG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

--- Comment #10 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Peter Seiderer from comment #9)
..and for consistency with the other options (or buildroot style) the
else branch:

ifeq ($(BR2_PACKAGE_LIBXML2),y)
POSTGRESQL_DEPENDENCIES += libxml2
POSTGRESQL_CONF_OPTS += --with-libxml
POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
else
POSTGRESQL_CONF_OPTS += --without-libxml
endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
