From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 01:14:45 +0300
Subject: [Buildroot] [PATCH 1/2] glibc: Move patches to version-specific
	folder
In-Reply-To: <20170914221446.13647-1-abrodkin@synopsys.com>
References: <20170914221446.13647-1-abrodkin@synopsys.com>
Message-ID: <20170914221446.13647-2-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removal of other glibc versions was nice but now when
we're about to introduce ARC port of glibc which is based
on newer glibc sources (pretty much today's master branch)
these allways applied patches are getting in the way.

Thus we re-introduce a bit of complication until ARC port
becomes a part of upstream glibc release.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/glibc/{ => 2.25}/0001-sh-Fix-building-with-gcc5-6.patch           | 0
 .../0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch       | 0
 .../0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch          | 0
 .../{ => 2.25}/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch | 0
 package/glibc/{ => 2.25}/0005-fix-binutils-2-29-build.patch               | 0
 .../0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch   | 0
 package/glibc/{ => 2.25}/0006-sh4-trap.patch                              | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename package/glibc/{ => 2.25}/0001-sh-Fix-building-with-gcc5-6.patch (100%)
 rename package/glibc/{ => 2.25}/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch (100%)
 rename package/glibc/{ => 2.25}/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch (100%)
 rename package/glibc/{ => 2.25}/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch (100%)
 rename package/glibc/{ => 2.25}/0005-fix-binutils-2-29-build.patch (100%)
 rename package/glibc/{ => 2.25}/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch (100%)
 rename package/glibc/{ => 2.25}/0006-sh4-trap.patch (100%)

diff --git a/package/glibc/0001-sh-Fix-building-with-gcc5-6.patch b/package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch
similarity index 100%
rename from package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
rename to package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch
diff --git a/package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch b/package/glibc/2.25/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
similarity index 100%
rename from package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
rename to package/glibc/2.25/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
diff --git a/package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch b/package/glibc/2.25/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
similarity index 100%
rename from package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
rename to package/glibc/2.25/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
diff --git a/package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch b/package/glibc/2.25/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
similarity index 100%
rename from package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
rename to package/glibc/2.25/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
diff --git a/package/glibc/0005-fix-binutils-2-29-build.patch b/package/glibc/2.25/0005-fix-binutils-2-29-build.patch
similarity index 100%
rename from package/glibc/0005-fix-binutils-2-29-build.patch
rename to package/glibc/2.25/0005-fix-binutils-2-29-build.patch
diff --git a/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch b/package/glibc/2.25/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
similarity index 100%
rename from package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
rename to package/glibc/2.25/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
diff --git a/package/glibc/0006-sh4-trap.patch b/package/glibc/2.25/0006-sh4-trap.patch
similarity index 100%
rename from package/glibc/0006-sh4-trap.patch
rename to package/glibc/2.25/0006-sh4-trap.patch
-- 
2.11.0
