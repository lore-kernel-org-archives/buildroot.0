From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 16:55:47 +0100
Subject: [Buildroot] [git commit] python-jinja2: needs markupsafe at runtime
Message-ID: <20141201104835.A6B6A7FFFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afae45bb8340926b3043c05fe6395ebdc839b82f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise import fails:

ImportError: No module named markupsafe

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index 1d9131a..a1900e9 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JINJA2
 	bool "python-jinja2"
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  Jinja2 is a template engine written in pure Python. It
 	  provides a Django inspired non-XML syntax but supports
