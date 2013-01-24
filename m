From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Jan 2013 09:26:52 +0100
Subject: [Buildroot] [git commit] polkit: show comment when wchar isn't
	enabled
Message-ID: <20130124082701.4BAB89A4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6271f9099749744545eda66a31eb5c80e6278e52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Arnout.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/polkit/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index da5f985..b47022a 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -9,3 +9,6 @@ config BR2_PACKAGE_POLKIT
 	  processes to speak to privileged processes.
 
 	  http://www.freedesktop.org/wiki/Software/polkit
+
+comment "polkit requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
