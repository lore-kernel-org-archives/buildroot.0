From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:47:17 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix check-package
 warnings
Message-ID: <20190602201238.3B8298EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6295b1ddbabe6a59e6e52203467525b6dce1319
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following warnings:

Config.in.legacy:153: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
Config.in.legacy:154: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
Config.in.legacy:155: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
Config.in.legacy:156: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

which were introduced in commit
55c642287819a062d52e7f290c76ada778772fba ("arch/csky: remove
BR2_CSKY_DSP option")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f299181447..c13399acda 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -150,10 +150,10 @@ config BR2_CSKY_DSP
 	bool "C-SKY DSP support removed"
 	select BR2_LEGACY
 	help
-	 C-SKY DSP instruction support for ck810 / ck807 was removed,
-	 as it was no longer supported in C-SKY gcc. Perhaps the VDSP
-	 instructions should be used instead, using the BR2_CSKY_VDSP
-	 option.
+	  C-SKY DSP instruction support for ck810 / ck807 was removed,
+	  as it was no longer supported in C-SKY gcc. Perhaps the VDSP
+	  instructions should be used instead, using the BR2_CSKY_VDSP
+	  option.
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor moved to gst1-plugins-base"
