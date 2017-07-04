From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:40 +0200
Subject: [Buildroot] [git commit] libglib2: disable compiler warnings
Message-ID: <20170704170700.6316E81E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2800ac57cde2cd71df295d33441faae1b30dd3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, libglib enables some fairly aggressive warnings, treated
as errors. In particular, the -Wformat=2 warning triggers a warning
due to the return value of the ngettext() macro from uClibc libintl
stub not being understood as being potentially a format string.

So, before we enable the stub libintl in uClibc, we disable such
warnings. A bug will be reported to upstream uClibc to get the actual
bug fixed, but disabling compiler warnings treated as errors is anyway
a good thing in the context of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d6b18dd..577dcec 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -113,7 +113,8 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 	host-zlib
 
 LIBGLIB2_CONF_OPTS = \
-	--with-pcre=system
+	--with-pcre=system \
+	--disable-compile-warnings
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
