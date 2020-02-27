From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 09:39:36 -0300
Subject: [Buildroot] [PATCH 2/4] package/pkg-utils.mk: add KCONFIG_GET_OPT
 macro
In-Reply-To: <20200227123938.13412-1-unixmania@gmail.com>
References: <20200227123938.13412-1-unixmania@gmail.com>
Message-ID: <20200227123938.13412-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Given a config name and a file, returns the config value if it is set;
otherwise returns an empty string.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d324934dba..c8d74520e9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -16,6 +16,10 @@ define KCONFIG_ENABLE_OPT # (option, file)
 	echo '$(1)=y' >> $(2)
 endef
 
+define KCONFIG_GET_OPT # (option, file)
+$(shell $(SED_QUIET) '/^\<$(1)\>=/h;$${x;s/$(1)=//p;}' $(2))
+endef
+
 define KCONFIG_SET_OPT # (option, value, file)
 	$(SED) "/\\<$(1)\\>/d" $(3)
 	echo '$(1)=$(2)' >> $(3)
-- 
2.18.2
