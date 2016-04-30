From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:16 +0200
Subject: [Buildroot] [PATCH 20/34] reproducibility/iproute2: do not rely on
	host directories
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-20-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to find whether iptables/xtables are installed on target
---
 .../0003-avoid-checking-host-directories.patch        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/iproute2/0003-avoid-checking-host-directories.patch

diff --git a/package/iproute2/0003-avoid-checking-host-directories.patch b/package/iproute2/0003-avoid-checking-host-directories.patch
new file mode 100644
index 0000000..ee82e8e
--- /dev/null
+++ b/package/iproute2/0003-avoid-checking-host-directories.patch
@@ -0,0 +1,19 @@
+--- iproute2-4.3.0/configure~	2016-02-27 20:31:57.000000000 +0100
++++ iproute2-4.3.0/configure	2016-02-27 20:32:05.301478415 +0100
+@@ -184,16 +184,6 @@ check_ipt_lib_dir()
+ 		return
+ 	fi
+ 
+-	for dir in /lib /usr/lib /usr/local/lib
+-	do
+-		for file in $dir/{xtables,iptables}/lib*t_*so ; do
+-			if [ -f $file ]; then
+-				echo ${file%/*}
+-				echo "IPT_LIB_DIR:=${file%/*}" >> Config
+-				return
+-			fi
+-		done
+-	done
+ 	echo "not found!"
+ }
+ 
-- 
2.7.4
