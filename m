From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2015 23:49:56 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual/br2-external: use proper .Note
	sections
In-Reply-To: <cover.1432504112.git.yann.morin.1998@free.fr>
References: <cover.1432504112.git.yann.morin.1998@free.fr>
Message-ID: <fab2dd23c2efd2f8eb0586dcb0c71d54c3a5caf4.1432504112.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-outside-br.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 99a942c..9ad177d 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -25,7 +25,8 @@ there is no need to pass +BR2_EXTERNAL+ at every +make+ invocation. It
 can however be changed at any time by passing a new value, and can be
 removed by passing an empty value.
 
-*Note:* the +BR2_EXTERNAL+ path can be either an absolute or a relative path,
+.Note
+The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 but if it's passed as a relative path, it is important to note that it
 is interpreted relative to the main Buildroot source directory, *not*
 to the Buildroot output directory.
@@ -75,7 +76,10 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
    logic. Buildroot automatically includes +$(BR2_EXTERNAL)/Config.in+ to
    make it appear in the top-level configuration menu, and includes
    +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
-   Providing those two files is mandatory, but they can be empty.
++
+.Note
+Providing +Config.in+ and +external.mk+ is mandatory, but they can be
+   empty.
 +
 The main usage of this is to store package recipes. The recommended
    way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
-- 
1.9.1
