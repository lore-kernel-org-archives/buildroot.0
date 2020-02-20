From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 22:58:03 +0100
Subject: [Buildroot] [git commit] Config.in: ensure BR2_SSP_STRONG can only
 be selected if supported
Message-ID: <20200220215137.F06138E687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=058dc9aa0bff837ddeb1d2fc4276bc9260e0b5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit ensures that BR2_SSP_STRONG cannot be chosen if the
toolchain doesn't support strong SSP.

Fixes:

  http://autobuild.buildroot.net/results/cba93a681d10692c4e4c5584e4c962bd18a608d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
