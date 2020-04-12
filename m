From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add openssl support
Message-ID: <20200412133307.AAFF78E773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9cc35d8fce1ecbdbcbbba3dc4621b5ceb9ede6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7d0789f493..14490106aa 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -165,6 +165,13 @@ else
 SYSTEMD_CONF_OPTS += -Dp11kit=false
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYSTEMD_DEPENDENCIES += openssl
+SYSTEMD_CONF_OPTS += -Dopenssl=true
+else
+SYSTEMD_CONF_OPTS += -Dopenssl=false
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
 SYSTEMD_CONF_OPTS += -Dpcre2=true
