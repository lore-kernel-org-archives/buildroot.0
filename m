From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Sep 2019 17:31:46 +0000
Subject: [Buildroot] [Bug 12191] New: cmake BUILDDIR
Message-ID: <bug-12191-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12191

            Bug ID: 12191
           Summary: cmake BUILDDIR
           Product: buildroot
           Version: 2019.02.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: harshavardhan.bokil at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am building a cmake package that strictly does not allow in source build,
output/build/$(PKG_NAME)-$(PKG_VERSION)/buildroot-build is rejected. Suggest
this change which solves the problem

--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -66,9 +66,9 @@


 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
-$(2)_BUILDDIR                  = $$($(2)_SRCDIR)
-else
-$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
+$(2)_BUILDDIR                  ?= $$($(2)_SRCDIR)
+else
+$(2)_BUILDDIR                  ?= $$($(2)_SRCDIR)/buildroot-build
 endif

 #

-- 
You are receiving this mail because:
You are on the CC list for the bug.
