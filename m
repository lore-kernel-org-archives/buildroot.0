From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 23 Feb 2015 14:03:13 +0100
Subject: [Buildroot] [PATCH] gettext: add dependency on host-libxml2 for
	host-gettext.
In-Reply-To: <20150220222933.5B92D817C4@busybox.osuosl.org>
References: <20150220222933.5B92D817C4@busybox.osuosl.org>
Message-ID: <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Otherwise, the locally-installed libxml2 will be used, which may
depend on a locally-installed liblzma which may create conflict
if host-liblzma is compiled.

Fixes https://bugs.busybox.net/show_bug.cgi?id=7886

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
[nicolas: added extended commit message]
Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
Ignacy is unavailable this week, but he commited this change to our
local tree before leaving.

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index c2419c1..a554517 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -12,7 +12,7 @@ GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
+HOST_GETTEXT_DEPENDENCIES = host-libxml2 # we don't want the libiconv dependency
 
 GETTEXT_CONF_OPTS += \
 	--disable-libasprintf \
-- 
2.1.4
