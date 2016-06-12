From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:15 +0200
Subject: [Buildroot] [PATCH 10/24] package/perl: use dummy hostname
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <40f340fc6443b43a4e53445083a5591fda009f7b.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hostname does not look like it serves any useful purpose, except
maybe to set set perladmin email.

Which is undoubtfully useless on the target.

A followup commit will make the hostname depend on the default skeleton,
so it won't always be available. We can not rely on it to be set.

Use a dummy hostname.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/perl/perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 11b10ff..29af7a4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -54,7 +54,7 @@ PERL_CONF_OPTS = \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
 	-Dmydomain="" \
-	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
+	-Dmyhostname="noname" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
 	-Dosname=linux \
 	-Dosvers=$(LINUX_VERSION) \
-- 
2.7.4
