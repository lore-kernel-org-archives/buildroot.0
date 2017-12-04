From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Dec 2017 22:49:39 +0000
Subject: [Buildroot] [Bug 10541] New: QT5 package leaves out aarch64 in
 BR2_PACKAGE_QT5_JSCORE_AVAILABLE
Message-ID: <bug-10541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10541

            Bug ID: 10541
           Summary: QT5 package leaves out aarch64 in
                    BR2_PACKAGE_QT5_JSCORE_AVAILABLE
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jd.conley at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have been successfully building a QT5 application for aarch64 using the
Linaro toolchain, including QT5Declarative, which uses JSCore.

But I had to modify the qt5 package Config.in file.

Is this just an oversight or am I missing something and JSCore has some major
issues on aarch64? Looking at your git repo, architecture support for JSCore
appears to have not been updated for four years.

--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
        bool
        default y
        # Javascript engine is only available on certain architectures
-       depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+       depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel ||
BR2_aarch64
        # ARM needs BLX, so v5t+
        depends on !BR2_ARM_CPU_ARMV4

-- 
You are receiving this mail because:
You are on the CC list for the bug.
