From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:54:40 +0200
Subject: [Buildroot] [git commit] erlang: needs mmu
Message-ID: <20130506221622.C9A1C99C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c177b2c107a59f1f457c2dce9c5276ed7e17b98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5b3411008ddf89aef55c8dd8682b894cf9860d13/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 6dd5a39..6920db6 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
