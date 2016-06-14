From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:05:09 +0200
Subject: [Buildroot] [PATCH 2/5] readline: fix installed libraries permission
In-Reply-To: <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614150412.GF3060@hermes.click-hack.org>
 <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465916712-29684-2-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid strip failing to strip the library.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/readline/0009-avoid-strip-perm-issue.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/readline/0009-avoid-strip-perm-issue.patch

diff --git a/package/readline/0009-avoid-strip-perm-issue.patch b/package/readline/0009-avoid-strip-perm-issue.patch
new file mode 100644
index 0000000..8415ca2
--- /dev/null
+++ b/package/readline/0009-avoid-strip-perm-issue.patch
@@ -0,0 +1,11 @@
+--- readline-6.3/support/shlib-install~	2012-07-10 21:58:08.000000000 +0200
++++ readline-6.3/support/shlib-install	2016-02-27 01:19:09.878310797 +0100
+@@ -73,7 +73,7 @@ fi
+ case "$host_os" in
+ hpux*|darwin*|macosx*|linux*|solaris2*)
+ 	if [ -z "$uninstall" ]; then
+-		chmod 555 ${INSTALLDIR}/${LIBNAME}
++		chmod 755 ${INSTALLDIR}/${LIBNAME}
+ 	fi ;;
+ cygwin*|mingw*)
+ 	IMPLIBNAME=`echo ${LIBNAME} \
-- 
2.8.2
