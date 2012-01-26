From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:28 +0100
Subject: [Buildroot] [PATCH 2/6] bluez_utils: remove redundant selection of
	expat
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <1327621292-13580-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

expat/libxml2 is selected by dbus.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez_utils/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index ea6b44c..3517407 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  bluez utils
-- 
1.7.8.3
