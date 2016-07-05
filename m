From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:45:04 +0200
Subject: [Buildroot] [git commit] package/perl: use dummy hostname
Message-ID: <20160705134512.02ADB7FD0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af9bb14f3cc0ec70241b74eec4e317778fdd5307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hostname does not look like it serves any useful purpose, except
maybe to set set perladmin email.

Which is undoubtfully useless on the target.

A followup commit will make the hostname depend on the default skeleton,
so it won't always be available. We can not rely on it to be set.

Besides, even today it is not guaranteed to be set; a user may well
leave it empty.

Use a dummy hostname.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f96b638..38f30ab 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -55,7 +55,7 @@ PERL_CONF_OPTS = \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
 	-Dmydomain="" \
-	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
+	-Dmyhostname="noname" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
 	-Dosname=linux \
 	-Dosvers=$(LINUX_VERSION) \
