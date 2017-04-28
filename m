From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Date: Fri, 28 Apr 2017 11:35:21 +0200
Subject: [Buildroot] [PATCH 2/2] Add DEPENDENCIES_HOST_PREREQ to the list of
	packages
In-Reply-To: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
References: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
Message-ID: <1493372121-32177-2-git-send-email-alfredo.alvarez_fernandez@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That way packages included in that list like ccache will also be
regarded as a normal packages for targets like external-deps,
show-targets or legal-info

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 919d589..f041567 100644
--- a/Makefile
+++ b/Makefile
@@ -484,6 +484,8 @@ include package/Makefile.in
 -include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
+PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
+
 include toolchain/*.mk
 include toolchain/*/*.mk
 
-- 
2.7.4
