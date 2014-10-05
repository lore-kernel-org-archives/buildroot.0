From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:34:03 +0200
Subject: [Buildroot] [git commit] package/leafnode2: Add user 'news',
	add note about inetd to help text
Message-ID: <20141005123418.A7C53B0949@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e472306f752ed03be1bff727ee35eaeafd6aa520
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2014-October/107727.html

[Thomas: minor formatting improvements]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leafnode2/Config.in    |    6 ++++++
 package/leafnode2/leafnode2.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index 30a02c8..ec5fa80 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -7,4 +7,10 @@ config BR2_PACKAGE_LEAFNODE2
 	  server designed for small sites with just a few active
 	  newsgroups.
 
+	  Leafnode-2 needs inetd, check chapter 14 of the documentation at
+	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
+
+	  For example, you can add this line to inetd.conf:
+	  nntp    stream  tcp     nowait  news    /usr/sbin/leafnode
+
 	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 3e6bd0b..3bc1c68 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -32,4 +32,8 @@ endef
 
 LEAFNODE2_PRE_BUILD_HOOKS += LEAFNODE2_BUILD_SORTNL_TOOL
 
+define LEAFNODE2_USERS
+	news -1 news -1 * - - - Leafnode2 daemon
+endef
+
 $(eval $(autotools-package))
