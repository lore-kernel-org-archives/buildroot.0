From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:08 +0200
Subject: [Buildroot] [PATCH 028/100] fetchmail: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-29-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies on
gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/fetchmail.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 164b2f8..37bbeab 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -24,12 +24,8 @@ FETCHMAIL_CONF_OPTS = \
 
 FETCHMAIL_DEPENDENCIES = \
 	ca-certificates \
-	openssl
-
-# libintl is an optional dependency
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-FETCHMAIL_DEPENDENCIES += gettext
-endif
+	openssl \
+	$(TARGET_NLS_DEPENDENCIES)
 
 # fetchmailconf.py script is not (yet) python3-compliant.
 # Prevent the pyc-compilation with python-3 from failing by removing this
-- 
2.9.4
