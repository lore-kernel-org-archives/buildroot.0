From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 14 Jan 2016 14:55:56 +0300
Subject: [Buildroot] [PATCH 2/2] Disabling TPM tools for ARC
In-Reply-To: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
References: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1452772556-18734-3-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TPM tools selects trousers package which is not available for ARC.
So this package should be disabled for ARC too.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index dd59aaa..77e43fd 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TPM_TOOLS
 	select BR2_PACKAGE_TROUSERS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on !BR2_arc # trousers
 	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
 	depends on !BR2_STATIC_LIBS # trousers
 	help
-- 
2.5.0
