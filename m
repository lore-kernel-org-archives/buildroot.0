From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 22:50:17 +0100
Subject: [Buildroot] [git commit branch/next] python3: make it exclusive
	from python
Message-ID: <20140218220745.3DC4D9CA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eebbd2d91935c4a87a51c19c5bd9a37e1f703483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In Buildroot, we do not support installing both Python 2.x and Python
3.x on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 6580cfd..12928f6 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
+	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
