From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 16:46:04 +0200
Subject: [Buildroot] [git commit] package/empty: Respect LDFLAGS,
	fix link order
Message-ID: <20140816144621.70EA19D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3ab60a1ee008273fb895c8a656247d7535d0a0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/50f/50fedb54cf005d1177d85c5a34fd10a1c354ba5b/
http://autobuild.buildroot.net/results/9fc/9fce0825772e99de3c6808b729641147385413aa/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/empty/empty-0001-respect-LDFLAGS.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/empty/empty-0001-respect-LDFLAGS.patch b/package/empty/empty-0001-respect-LDFLAGS.patch
new file mode 100644
index 0000000..b98af07
--- /dev/null
+++ b/package/empty/empty-0001-respect-LDFLAGS.patch
@@ -0,0 +1,22 @@
+downloaded from
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-misc/empty/files/empty-respect-LDFLAGS.patch?view=markup
+
+Reported on the Gentoo bug tracker
+https://bugs.gentoo.org/show_bug.cgi?id=429664
+
+and reported upstream
+https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- empty-0.6.18b/Makefile
++++ empty-0.6.18b/Makefile
+@@ -16,7 +16,7 @@
+ PREFIX = /usr/local
+ 
+ all:
+-	${CC} ${CFLAGS} -Wall ${LIBS} -o empty empty.c
++	${CC} ${CFLAGS} ${LDFLAGS} empty.c ${LIBS} -o empty
+ 
+ FreeBSD:	all
+ NetBSD:		all
