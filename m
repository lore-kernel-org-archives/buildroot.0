From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:48:57 +0100
Subject: [Buildroot] [git commit] package/strongswan: add tools option
	deprecation notice
Message-ID: <20150106204902.64232807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0120d9f36226584ce5c1edba03b6c2a6403920b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now a split option with pki and scep, with some other tools being
deprecated upstream so select both when tools was selected to get as
close as possible.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index de2c0ba..69608c7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,16 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_STRONGSWAN_TOOLS
+	bool "strongswan option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_STRONGSWAN_PKI
+	select BR2_PACKAGE_STRONGSWAN_SCEP
+	help
+	  The tools option has been removed upstream and the different tools
+	  have been split between the pki and scep options, with others
+	  deprecated.
+
 config BR2_PACKAGE_XBMC_ADDON_XVDR
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
