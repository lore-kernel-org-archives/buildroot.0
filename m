From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 23 Jul 2019 15:56:57 +0300
Subject: [Buildroot] [PATCH v2 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
Message-ID: <20190723125657.27702-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

provide info if the package will be installed to staging/target
destinations. Might be useful for analyzing the packages which
installed only for target/staging.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

v2:
    1) use oneliner 'if' to dump install_{staging,target} properties

 package/pkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..1dcf2805cb 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -94,6 +94,8 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	"install-target": $(if $($(1)_INSTALL_TARGET),true,false),
+	"install-staging": $(if $($(1)_INSTALL_STAGING),true,false),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.17.1
