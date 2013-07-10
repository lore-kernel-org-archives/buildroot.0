From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 07:37:06 +0200
Subject: [Buildroot] [git commit] mongrel2: needs threads
Message-ID: <20130710054847.B71669A64A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=575dac6922e9a20153a4f3526929618271b226c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mongrel2 uses zeromq that needs threads

Fixes: http://autobuild.buildroot.org/results/93d/93da58453e1ca0cc491170976cfbdeb8bee5c648

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/mongrel2/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index ca7e609..435d97e 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MONGREL2
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_LARGEFILE # zeromq -> util-linux
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
 	# {get,make,swap}context functions present in
