From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:13:12 +0100
Subject: [Buildroot] [git commit] sofia-sip: needs threads
Message-ID: <20150106201321.8FFA580797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aceb7113416fb5072533515b8a9df2973b292756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1e8/1e8c466b7a65b8e70f3318ab1a5bad79468f5efd

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sofia-sip/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
index 9e42ff7..24e2148 100644
--- a/package/sofia-sip/Config.in
+++ b/package/sofia-sip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SOFIA_SIP
 	bool "sofia-sip"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Sofia-SIP is an open-source SIP User-Agent library,
 	  compliant with the IETF RFC3261 specification (see the
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SOFIA_SIP
 	  real-time and person-to-person communication services.
 
 	  http://sofia-sip.sourceforge.net/
+
+comment "sofia-sip needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
