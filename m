From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:08:37 +0200
Subject: [Buildroot] [git commit] packages/rsyslog: add optional support for
 RELP
Message-ID: <20200923195925.8905381598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e78063379b630dcff818a65facf2e194422b475d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 90f21559f8..50f3328493 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -14,6 +14,12 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
 	mail omprog omruleset omstdout omuxsock \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
+
+ifeq ($(BR2_PACKAGE_LIBRELP),y)
+RSYSLOG_DEPENDENCIES += librelp
+RSYSLOG_PLUGINS += relp
+endif
+
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
