From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 14:20:40 +0100
Subject: [Buildroot] [git commit] conntrack-tools: needs mmu
Message-ID: <20130222132447.EA9B5997D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=669dcf3a624c18a9b260e890a48cc416217bbd28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/641755fbc61b47361b71161eabbf3075c7598c88/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/conntrack-tools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index ddede0e..50f2000 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
