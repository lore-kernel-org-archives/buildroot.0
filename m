From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] fetchmail: use the new gettext logic
Message-ID: <20170704233514.C7A48802A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39ec557f2db992bea439c24ddabf64ee549d4274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
