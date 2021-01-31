From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 14:38:13 +0100
Subject: [Buildroot] [PATCH v2 1/7] package/pkg-utils.mk: introduce "name"
 field in show-info output
In-Reply-To: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210131133819.1818537-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The keys of the JSON dict returned by "make show-info" is the package
name, including the "host-" prefix for host packages.

However, it is sometimes useful to get the actual name of the package,
without the "host-" prefix, so we add a "name" property that holds the
"raw name" of the package.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 11090cb628..d94041de24 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -96,6 +96,7 @@ endef
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
+		"name": "$($(1)_RAWNAME)",
 		"type": "$($(1)_TYPE)",
 		$(if $(filter rootfs,$($(1)_TYPE)), \
 			$(call _json-info-fs,$(1)), \
-- 
2.29.2
