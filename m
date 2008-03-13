From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 13 Mar 2008 10:10:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20080313171042.D38B5120156@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-13 10:10:40 -0700 (Thu, 13 Mar 2008)
New Revision: 21325

Log:
make patch-kernel create lists of applied patches, very handy indeed

Modified:
   trunk/buildroot/toolchain/patch-kernel.sh


Changeset:
Modified: trunk/buildroot/toolchain/patch-kernel.sh
===================================================================
--- trunk/buildroot/toolchain/patch-kernel.sh	2008-03-13 07:38:10 UTC (rev 21324)
+++ trunk/buildroot/toolchain/patch-kernel.sh	2008-03-13 17:10:40 UTC (rev 21325)
@@ -37,6 +37,7 @@
     esac
     echo ""
     echo "Applying ${i} using ${type}: " 
+	echo ${i} | cat >> ${targetdir}/.applied_patches_list
     ${uncomp} ${patchdir}/${i} | patch -p1 -E -d ${targetdir} 
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix $i!"
