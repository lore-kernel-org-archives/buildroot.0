From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 6 Feb 2008 00:39:36 -0800 (PST)
Subject: [Buildroot] [PATCH] libxml2 build fails due to incurrect folder
 mention
Message-ID: <15306305.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,I am trying to build libxml2 for arm926ejs toolchain with buildroot
snapshot of 050208 and i get below mentioned error. 

I have copied teh patch to fix this.


cp -af
/home/guru/project/original/bldrt/buildroot/build_arm/libxml2-2.6.29/include/libxml
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include/libxml2
touch -c
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include/libxml2
cp -af
/home/guru/project/original/bldrt/buildroot/build_arm/libxml2-2.6.29/usr/include/libxml2
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/usr/include/libxml2
cp: cannot stat
`/home/guru/project/original/bldrt/buildroot/build_arm/libxml2-2.6.29/usr/include/libxml2':
No such file or directory
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/usr/include/libxml2]
Error 1
root at guru_vlinux:/home/guru/project/original/bldrt/buildroot#

Patch
------

--- libxml2_mk.orig     2008-02-05 03:15:24.000000000 -0500
+++ libxml2.mk  2008-02-06 20:10:48.000000000 -0500
@@ -70,7 +70,7 @@ $(STAGING_DIR)/usr/include/libxml2: $(TA
        touch -c $@
 
 $(TARGET_DIR)/usr/include/libxml2: libxml2-headers
-       cp -af $(LIBXML2_DIR)/usr/include/libxml2
$(TARGET_DIR)/usr/include/libxml2
+       cp -af $(STAGING_DIR)/usr/include/libxml2
$(TARGET_DIR)/usr/include/libxml2
        touch -c $@
 
 $(TARGET_DIR)/usr/include/libxml: libxml2-headers


Regards
Gururaja


-- 
View this message in context: http://www.nabble.com/-PATCH--libxml2-build-fails-due-to-incurrect-folder-mention-tp15306305p15306305.html
Sent from the BuildRoot mailing list archive at Nabble.com.
