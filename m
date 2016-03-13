From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 13 Mar 2016 06:06:31 +0300
Subject: [Buildroot] [PATCH] slang: make install-static do install-pkgconfig
Message-ID: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mc's configure can't find S-Lang because static S-Lang build doesn't
install pkgconfig file into staging. Adding install-pkgconfig to
install-static dependencies fixes that.

Fixes:
  http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
index ee306a1..b0f8779 100644
--- a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
+++ b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
@@ -39,7 +39,8 @@ diff -rup a/autoconf/Makefile.in b/autoconf/Makefile.in
  	cd slsh; $(MAKE) all
 @@ -73,10 +76,11 @@ clean:
  	cd demo; $(MAKE) clean
- install-static:
+-install-static:
++install-static: install-pkgconfig
  	cd src; $(MAKE) install-static
 +	cd slsh; $(MAKE) install-static
  install-pkgconfig: slang.pc
-- 
2.1.4
