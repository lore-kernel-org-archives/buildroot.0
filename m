From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:40:34 +0200
Subject: [Buildroot] [git commit] package/c-icap: add optional support for
	openssl
Message-ID: <20170601202854.721A0807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c8cc5dadd7f587e22b9de02ffc1b0ad8679ae29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional OpenSSL was added with version 0.5.1:
https://sourceforge.net/p/c-icap/news/2017/03/the-c-icap-051-is-released-/
https://sourceforge.net/p/c-icap/code/1253/#diff-5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 82b2574..e57ecd0 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -54,6 +54,13 @@ else
 C_ICAP_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+C_ICAP_CONF_OPTS += --with-openssl
+C_ICAP_DEPENDENCIES += openssl
+else
+C_ICAP_CONF_OPTS += --without-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 C_ICAP_CONF_OPTS += --with-pcre
 C_ICAP_DEPENDENCIES += pcre
