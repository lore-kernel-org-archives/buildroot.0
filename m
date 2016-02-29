From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:47:08 +0100
Subject: [Buildroot] [git commit] package/systemd: add
	--enable/disable-libcurl
Message-ID: <20160302202759.6CBBA7F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1661d6678187e92e4ce13d6de03ba24ae0cbba1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index afa598b..ace385a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -58,6 +58,7 @@ config BR2_PACKAGE_SYSTEMD
 	  - acl package will add support for multi-seat.
 	  - xz and/or l4 packages will add compression support in
 	    journal and coredump.
+	  - libcurl package will add support for systemd-journal-upload.
 	  - libgcrypt package will add support for journal sealing and
 	    DNSSEC verification in resolved.
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 91da61b..0681561 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -108,6 +108,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+SYSTEMD_DEPENDENCIES += libcurl
+SYSTEMD_CONF_OPTS += --enable-libcurl
+else
+SYSTEMD_CONF_OPTS += --disable-libcurl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
