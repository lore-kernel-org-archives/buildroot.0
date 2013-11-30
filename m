From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 09:06:04 +0100
Subject: [Buildroot] [git commit] dbus-python: select pyexpat dependency
Message-ID: <20131130080744.8AEBA9BE79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe796fee83b735a101ef2c3801b3c765b1c3f633
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dbus-python requires xml.parsers.expat, which is provided by the pyexpat
module. This patch enables the pyexpat module as a dependency when dbus-python
is selected.

[Peter: fixup whitespace]
Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-python/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index f7b6d94..a38d277 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_DBUS_PYTHON
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
+	# pyexpat: runtime dependency only
+	select BR2_PACKAGE_PYTHON_PYEXPAT
 	help
 	  Python bindings for D-Bus
 
