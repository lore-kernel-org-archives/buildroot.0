From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 21:37:36 +0100
Subject: [Buildroot] [git commit] haserl: needs fork()
Message-ID: <20130223204022.16D0C9AC96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf77df51bd958e850abfb8eea44587c72327726
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/e265d061e1956522dad4566827ed4171160dfecc

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 7710fa1..36bfca7 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HASERL
 	bool "haserl"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Haserl is a small cgi wrapper that enables shell scripts to be
 	  embedded into html documents. It is intended for environments
