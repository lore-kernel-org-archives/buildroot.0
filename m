From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Apr 2013 11:47:47 -0300
Subject: [Buildroot] [PATCH 2/2] binutils: move patches to new model
In-Reply-To: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366642067-26447-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On commit 5538e4766201aa0c1c23721cfc99cbbde595964b the versioned package
patches changed the directory structure but the packages weren't fixed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/{binutils-2.20.1 => 2.20.1}/110-arm-eabi-conf.patch      | 0
 package/binutils/{binutils-2.20.1 => 2.20.1}/120-sh-conf.patch            | 0
 .../binutils/{binutils-2.20.1 => 2.20.1}/300-001_ld_makefile_patch.patch  | 0
 .../{binutils-2.20.1 => 2.20.1}/300-012_check_ldrunpath_length.patch      | 0
 package/binutils/{binutils-2.20.1 => 2.20.1}/400-arm_link_speed.patch     | 0
 package/binutils/{binutils-2.20.1 => 2.20.1}/500-sysroot.patch            | 0
 package/binutils/{binutils-2.21.1 => 2.21.1}/110-arm-eabi-conf.patch      | 0
 package/binutils/{binutils-2.21.1 => 2.21.1}/120-sh-conf.patch            | 0
 .../binutils/{binutils-2.21.1 => 2.21.1}/300-001_ld_makefile_patch.patch  | 0
 .../{binutils-2.21.1 => 2.21.1}/300-012_check_ldrunpath_length.patch      | 0
 package/binutils/{binutils-2.21.1 => 2.21.1}/500-sysroot.patch            | 0
 package/binutils/{binutils-2.21 => 2.21}/110-arm-eabi-conf.patch          | 0
 package/binutils/{binutils-2.21 => 2.21}/120-sh-conf.patch                | 0
 package/binutils/{binutils-2.21 => 2.21}/300-001_ld_makefile_patch.patch  | 0
 .../binutils/{binutils-2.21 => 2.21}/300-012_check_ldrunpath_length.patch | 0
 package/binutils/{binutils-2.21 => 2.21}/500-sysroot.patch                | 0
 package/binutils/{binutils-2.22 => 2.22}/120-sh-conf.patch                | 0
 package/binutils/{binutils-2.22 => 2.22}/300-001_ld_makefile_patch.patch  | 0
 .../binutils/{binutils-2.22 => 2.22}/300-012_check_ldrunpath_length.patch | 0
 package/binutils/{binutils-2.22 => 2.22}/500-sysroot.patch                | 0
 package/binutils/{binutils-2.22 => 2.22}/999-ppc-textrels.patch           | 0
 package/binutils/{binutils-2.23.1 => 2.23.1}/120-sh-conf.patch            | 0
 .../binutils/{binutils-2.23.1 => 2.23.1}/300-001_ld_makefile_patch.patch  | 0
 .../{binutils-2.23.1 => 2.23.1}/300-012_check_ldrunpath_length.patch      | 0
 package/binutils/{binutils-2.23.1 => 2.23.1}/500-sysroot.patch            | 0
 package/binutils/{binutils-2.23.2 => 2.23.2}/120-sh-conf.patch            | 0
 .../binutils/{binutils-2.23.2 => 2.23.2}/300-001_ld_makefile_patch.patch  | 0
 .../{binutils-2.23.2 => 2.23.2}/300-012_check_ldrunpath_length.patch      | 0
 package/binutils/{binutils-2.23.2 => 2.23.2}/500-sysroot.patch            | 0
 29 files changed, 0 insertions(+), 0 deletions(-)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/110-arm-eabi-conf.patch (100%)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/400-arm_link_speed.patch (100%)
 rename package/binutils/{binutils-2.20.1 => 2.20.1}/500-sysroot.patch (100%)
 rename package/binutils/{binutils-2.21.1 => 2.21.1}/110-arm-eabi-conf.patch (100%)
 rename package/binutils/{binutils-2.21.1 => 2.21.1}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.21.1 => 2.21.1}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.21.1 => 2.21.1}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.21.1 => 2.21.1}/500-sysroot.patch (100%)
 rename package/binutils/{binutils-2.21 => 2.21}/110-arm-eabi-conf.patch (100%)
 rename package/binutils/{binutils-2.21 => 2.21}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.21 => 2.21}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.21 => 2.21}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.21 => 2.21}/500-sysroot.patch (100%)
 rename package/binutils/{binutils-2.22 => 2.22}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.22 => 2.22}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.22 => 2.22}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.22 => 2.22}/500-sysroot.patch (100%)
 rename package/binutils/{binutils-2.22 => 2.22}/999-ppc-textrels.patch (100%)
 rename package/binutils/{binutils-2.23.1 => 2.23.1}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.23.1 => 2.23.1}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.23.1 => 2.23.1}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.23.1 => 2.23.1}/500-sysroot.patch (100%)
 rename package/binutils/{binutils-2.23.2 => 2.23.2}/120-sh-conf.patch (100%)
 rename package/binutils/{binutils-2.23.2 => 2.23.2}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{binutils-2.23.2 => 2.23.2}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{binutils-2.23.2 => 2.23.2}/500-sysroot.patch (100%)

diff --git a/package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch b/package/binutils/2.20.1/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
rename to package/binutils/2.20.1/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.20.1/120-sh-conf.patch b/package/binutils/2.20.1/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/120-sh-conf.patch
rename to package/binutils/2.20.1/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch b/package/binutils/2.20.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch
rename to package/binutils/2.20.1/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.20.1/400-arm_link_speed.patch b/package/binutils/2.20.1/400-arm_link_speed.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/400-arm_link_speed.patch
rename to package/binutils/2.20.1/400-arm_link_speed.patch
diff --git a/package/binutils/binutils-2.20.1/500-sysroot.patch b/package/binutils/2.20.1/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.20.1/500-sysroot.patch
rename to package/binutils/2.20.1/500-sysroot.patch
diff --git a/package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch b/package/binutils/2.21.1/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/110-arm-eabi-conf.patch
rename to package/binutils/2.21.1/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.21.1/120-sh-conf.patch b/package/binutils/2.21.1/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/120-sh-conf.patch
rename to package/binutils/2.21.1/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch b/package/binutils/2.21.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/300-001_ld_makefile_patch.patch
rename to package/binutils/2.21.1/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.21.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.21.1/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.21.1/500-sysroot.patch b/package/binutils/2.21.1/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.21.1/500-sysroot.patch
rename to package/binutils/2.21.1/500-sysroot.patch
diff --git a/package/binutils/binutils-2.21/110-arm-eabi-conf.patch b/package/binutils/2.21/110-arm-eabi-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21/110-arm-eabi-conf.patch
rename to package/binutils/2.21/110-arm-eabi-conf.patch
diff --git a/package/binutils/binutils-2.21/120-sh-conf.patch b/package/binutils/2.21/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.21/120-sh-conf.patch
rename to package/binutils/2.21/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch b/package/binutils/2.21/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch
rename to package/binutils/2.21/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch b/package/binutils/2.21/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.21/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.21/500-sysroot.patch b/package/binutils/2.21/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.21/500-sysroot.patch
rename to package/binutils/2.21/500-sysroot.patch
diff --git a/package/binutils/binutils-2.22/120-sh-conf.patch b/package/binutils/2.22/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.22/120-sh-conf.patch
rename to package/binutils/2.22/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch b/package/binutils/2.22/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.22/300-001_ld_makefile_patch.patch
rename to package/binutils/2.22/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch b/package/binutils/2.22/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.22/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.22/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.22/500-sysroot.patch b/package/binutils/2.22/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.22/500-sysroot.patch
rename to package/binutils/2.22/500-sysroot.patch
diff --git a/package/binutils/binutils-2.22/999-ppc-textrels.patch b/package/binutils/2.22/999-ppc-textrels.patch
similarity index 100%
rename from package/binutils/binutils-2.22/999-ppc-textrels.patch
rename to package/binutils/2.22/999-ppc-textrels.patch
diff --git a/package/binutils/binutils-2.23.1/120-sh-conf.patch b/package/binutils/2.23.1/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.23.1/120-sh-conf.patch
rename to package/binutils/2.23.1/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.23.1/300-001_ld_makefile_patch.patch b/package/binutils/2.23.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.23.1/300-001_ld_makefile_patch.patch
rename to package/binutils/2.23.1/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.23.1/300-012_check_ldrunpath_length.patch b/package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.23.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.23.1/500-sysroot.patch b/package/binutils/2.23.1/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.23.1/500-sysroot.patch
rename to package/binutils/2.23.1/500-sysroot.patch
diff --git a/package/binutils/binutils-2.23.2/120-sh-conf.patch b/package/binutils/2.23.2/120-sh-conf.patch
similarity index 100%
rename from package/binutils/binutils-2.23.2/120-sh-conf.patch
rename to package/binutils/2.23.2/120-sh-conf.patch
diff --git a/package/binutils/binutils-2.23.2/300-001_ld_makefile_patch.patch b/package/binutils/2.23.2/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/binutils-2.23.2/300-001_ld_makefile_patch.patch
rename to package/binutils/2.23.2/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch b/package/binutils/2.23.2/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/binutils-2.23.2/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.23.2/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/binutils-2.23.2/500-sysroot.patch b/package/binutils/2.23.2/500-sysroot.patch
similarity index 100%
rename from package/binutils/binutils-2.23.2/500-sysroot.patch
rename to package/binutils/2.23.2/500-sysroot.patch
-- 
1.8.1.5
