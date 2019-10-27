From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 19:16:30 +0100
Subject: [Buildroot] [git commit] package/php: add config scan directory
 option
Message-ID: <20191027181101.112778A37F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1248b86267ceb545a2dd249c0067ad8cdf49636a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To support using multiple php configuration files, we pass
--with-config-file-scan-dir=/etc/php.d. This allows to put snippets of
PHP configuration files in /etc/php.d.

For php option details see link at [1].

[1] https://www.php.net/manual/en/configuration.file.php

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
[Thomas: make it unconditional]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 0213295c82..b679531238 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -16,6 +16,7 @@ PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
+	--with-config-file-scan-dir=/etc/php.d \
 	--disable-all \
 	--without-pear \
 	--with-config-file-path=/etc \
