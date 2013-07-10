From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 9 Jul 2013 19:38:08 -0700
Subject: [Buildroot] [PATCH] mongrel2: needs threads
Message-ID: <CAKcgs2y2BdqScXnRPcr1vLusRAu-tjKU04X7kuxEYD5ofe_BaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mongrel2 uses zeromq that needs threads

Fixes:
http://autobuild.buildroot.org/results/93d/93da58453e1ca0cc491170976cfbdeb8bee5c648

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/mongrel2/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index ca7e609..435d97e 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MONGREL2
  select BR2_PACKAGE_ZEROMQ
  depends on BR2_INSTALL_LIBSTDCPP # zeromq
  depends on BR2_INET_IPV6 # zeromq
+ depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
  depends on BR2_LARGEFILE # zeromq -> util-linux
  depends on BR2_USE_WCHAR # zeromq -> util-linux
  # {get,make,swap}context functions present in
-- 
1.7.10.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130709/69b1dcbd/attachment.html>
