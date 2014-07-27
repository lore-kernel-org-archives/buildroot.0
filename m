From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 17:44:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: gettextize to match the
	new gettext version
Message-ID: <1406475877-9817-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gettext macros in the package are from a gettext version older than
the one we have in Buildroot, so autoreconf fails.

Run gettextize prior to running autoreconf, like we do in wget.

Fixes:
http://autobuild.buildroot.net/results/8dd/8dd6651ce99c0b81497fd285909b2b614009e273/
http://autobuild.buildroot.net/results/0bb/0bbfddda94ac7f75f74a54157c27de5b4fb3e559/
http://autobuild.buildroot.net/results/92b/92bcb493619ce4508bc4571cbfc3d5c3bdf49ff4/
http://autobuild.buildroot.net/results/768/768efd71745c72cec159edaa92e266167629ec5d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Small note: I could not reproduce the problem here having gettext-base
0.18.1.1-9 installed on my compile host, but according to the discussion
about FOO__GETTEXTIZE = YES this patch should fix autobuild errors.

 package/fetchmail/fetchmail.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index e910019..7154ea4 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -11,6 +11,7 @@ FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FET
 FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_AUTORECONF = YES
+FETCHMAIL_GETTEXTIZE = YES
 
 FETCHMAIL_CONF_ENV += LIBS="-lz"
 
-- 
1.7.10.4
