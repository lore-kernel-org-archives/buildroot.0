From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 10:57:41 +0100
Subject: [Buildroot] [PATCH next 2/2] systemd: bump version to 230
In-Reply-To: <1463997461-16181-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1463997461-16181-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1463997461-16181-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We pass "--with-default-dnssec=no" to "configure" as it might create
incompatibilities with a few DNS servers and networks.

Announcement URL:

  https://lists.freedesktop.org/archives/systemd-devel/2016-May/036583.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 7295986..141eadf 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 b51b0a48d1beb388d95bd6a98d62be05490335d4bb388aefecdcb576e91e0741  systemd-229.tar.gz
+sha256 46b07568142adcd017c62e6230d39eb10d219ed3b2f13ffc12d9a3a6b1c840cd  systemd-230.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8a6aa44..b525397 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 229
+SYSTEMD_VERSION = 230
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
@@ -36,6 +36,7 @@ SYSTEMD_CONF_OPTS += \
 	--disable-gnuefi \
 	--disable-ldconfig \
 	--disable-tests \
+	--with-default-dnssec=no \
 	--without-python
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
-- 
2.7.3
