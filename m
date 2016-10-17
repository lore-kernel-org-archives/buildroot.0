From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:45 -0300
Subject: [Buildroot] [PATCH 58/93] p7zip: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-59-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
