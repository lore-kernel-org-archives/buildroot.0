From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 03:01:16 +0100
Subject: [Buildroot] [PATCH 3/3] Config.in: ensure BR2_SSP_STRONG can only
 be selected if supported
In-Reply-To: <20200220020117.695236-1-thomas.petazzoni@bootlin.com>
References: <20200220020117.695236-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200220020117.695236-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit ensures that BR2_SSP_STRONG cannot be chosen if the
toolchain doesn't support strong SSP.

Fixes:

  http://autobuild.buildroot.net/results/cba93a681d10692c4e4c5584e4c962bd18a608d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in b/Config.in
index 5a4239bc9a..2913d39ec8 100644
--- a/Config.in
+++ b/Config.in
@@ -758,6 +758,7 @@ config BR2_SSP_REGULAR
 
 config BR2_SSP_STRONG
 	bool "-fstack-protector-strong"
+	depends on BR2_TOOLCHAIN_HAS_SSP_STRONG
 	help
 	  Like -fstack-protector but includes additional functions to be
 	  protected - those that have local array definitions, or have
-- 
2.24.1
