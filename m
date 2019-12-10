From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:47 +0100
Subject: [Buildroot] [PATCH 08/12] package/gettext-tiny: add missing extract
 dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext-tiny uses suitable-extractor to manually extract a tarball, so
it should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Fixes:

  http://autobuild.buildroot.net/results/83c6d47c06334bef27791a59bdd491b1de124c49/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 6ee6269e09..403f974b9d 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -39,6 +39,7 @@ define HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
 		$(TAR) --strip-components=1 -C $(@D)/gettext-gnu $(TAR_OPTIONS) -
 endef
 HOST_GETTEXT_TINY_POST_EXTRACT_HOOKS += HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
+HOST_GETTEXT_TINY_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(GETTEXT_GNU_SOURCE))
 
 define HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 	$(foreach f,$(GETTEXT_TINY_EXTRA_GETTEXT_FILES),\
-- 
2.23.0
