From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] p7zip: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132038.A6160819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=047547d3a6c6e9c9afa68f1d6f4a2455eb9c5388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/p7zip/p7zip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 4bac859..15d5138 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -14,7 +14,7 @@ P7ZIP_LICENSE_FILES = DOC/License.txt
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
 # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
 define P7ZIP_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		-C $(@D) 7zr
