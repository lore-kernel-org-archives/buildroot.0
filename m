From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:41:00 +1300
Subject: [Buildroot] [git commit] janus-gateway: add dependency of streaming
	plugin on headers >= 3.9
Message-ID: <20170128084142.225AA81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82b7be6d3e83d080739e8ae85fa474582f0168b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/89005444f3dee9002881b5449cd137a32a286e27/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 125adf8..5c7b633 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_JANUS_SIP_GATEWAY
 
 config  BR2_PACKAGE_JANUS_STREAMING
 	bool "streaming"
+	# SO_REUSEPORT
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+
+comment "streaming plugin needs a toolchain w/ headers >= 3.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
 config BR2_PACKAGE_JANUS_TEXT_ROOM
 	bool "text room"
