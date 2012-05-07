From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:23 +0200
Subject: [Buildroot] [PATCH v3 02/22] gettext: warn that legal-info is not
	implemented
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/gettext/gettext.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f3605da..1d9d84d 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -113,6 +113,9 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 		autopoint envsubst gettext.sh gettextize msg* ?gettext)
 	touch -c $@
 
+gettext-legal-info:
+	@$(call legal-warning-pkg,gettext,cannot produce any legal info)
+
 gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
-- 
1.7.5.4
