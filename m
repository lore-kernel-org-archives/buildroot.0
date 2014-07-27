From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 18:21:05 +0200
Subject: [Buildroot] [git commit] package/fetchmail: gettextize to match the
	new gettext version
Message-ID: <20140727162113.0C8CF9D296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e921567efbb7faeb3bf20a7e636e0dc360bf84a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gettext macros in the package are from a gettext version older than
the one we have in Buildroot, so autoreconf fails.

Run gettextize prior to running autoreconf, like we do in wget.

Fixes:
http://autobuild.buildroot.net/results/8dd/8dd6651ce99c0b81497fd285909b2b614009e273/
http://autobuild.buildroot.net/results/0bb/0bbfddda94ac7f75f74a54157c27de5b4fb3e559/
http://autobuild.buildroot.net/results/92b/92bcb493619ce4508bc4571cbfc3d5c3bdf49ff4/
http://autobuild.buildroot.net/results/768/768efd71745c72cec159edaa92e266167629ec5d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/fetchmail.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
