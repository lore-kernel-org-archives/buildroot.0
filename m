From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 30 Jul 2019 12:36:00 +0200
Subject: [Buildroot] [PATCH] package/qt5: change upstream location
Message-ID: <22558_1564482970_5D401D9A_22558_273_1_a7cd5c93-0be9-438c-b5b5-7c5a2dc7a274@OPEXCNORM3C.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Upstream pushes their delivery archives in to places:
    https://download.qt.io/official_releases/
    https://download.qt.io/archive/

After a while, only the latter remains, whith the former being pruned
actively to contain only officially supported versions.

Switch to using the archive location, as it has everything, even the
latest versions.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 88ba1958dd..c8c07a9881 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -13,7 +13,7 @@ QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SOURCE_TARBALL_PREFIX = opensource-src
 endif
-QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
