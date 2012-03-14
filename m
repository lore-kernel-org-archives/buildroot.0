From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2012 23:08:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/libxml2: fix breakage due to
	unordered patches
Message-ID: <1331762901-25245-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on the locale, the patches may get sorted in different order
because they are not numbered. Also, even with the C locale (LC_ALL=C),
the second patch that gets applied is error-xpath.patch, but it depends
on other xpath patches to be applied first.

Rename the patches so they are numbered and they get applied in order.
Even then, some patches apply with offsets.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ....8-000-allocation-error-copying-entities.patch} |    0
 ....patch => libxml2-2.7.8-010-xpath-memory.patch} |    0
 ...patch => libxml2-2.7.8-020-xpath-freeing.patch} |    0
 ...atch => libxml2-2.7.8-021-xpath-freeing2.patch} |    0
 ... libxml2-2.7.8-030-reallocation-failures.patch} |    0
 ...tch => libxml2-2.7.8-040-hardening-xpath.patch} |    0
 ...h.patch => libxml2-2.7.8-050-error-xpath.patch} |    0
 ... => libxml2-2.7.8-060-hash-randomization.patch} |    0
 8 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2-2.7.8-allocation-error-copying-entities.patch b/package/libxml2/libxml2-2.7.8-000-allocation-error-copying-entities.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-allocation-error-copying-entities.patch
rename to package/libxml2/libxml2-2.7.8-000-allocation-error-copying-entities.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-memory.patch b/package/libxml2/libxml2-2.7.8-010-xpath-memory.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-memory.patch
rename to package/libxml2/libxml2-2.7.8-010-xpath-memory.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-freeing.patch b/package/libxml2/libxml2-2.7.8-020-xpath-freeing.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-freeing.patch
rename to package/libxml2/libxml2-2.7.8-020-xpath-freeing.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-freeing2.patch b/package/libxml2/libxml2-2.7.8-021-xpath-freeing2.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-freeing2.patch
rename to package/libxml2/libxml2-2.7.8-021-xpath-freeing2.patch
diff --git a/package/libxml2/libxml2-2.7.8-reallocation-failures.patch b/package/libxml2/libxml2-2.7.8-030-reallocation-failures.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-reallocation-failures.patch
rename to package/libxml2/libxml2-2.7.8-030-reallocation-failures.patch
diff --git a/package/libxml2/libxml2-2.7.8-hardening-xpath.patch b/package/libxml2/libxml2-2.7.8-040-hardening-xpath.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-hardening-xpath.patch
rename to package/libxml2/libxml2-2.7.8-040-hardening-xpath.patch
diff --git a/package/libxml2/libxml2-2.7.8-error-xpath.patch b/package/libxml2/libxml2-2.7.8-050-error-xpath.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-error-xpath.patch
rename to package/libxml2/libxml2-2.7.8-050-error-xpath.patch
diff --git a/package/libxml2/libxml2-2.7.8-hash-randomization.patch b/package/libxml2/libxml2-2.7.8-060-hash-randomization.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-hash-randomization.patch
rename to package/libxml2/libxml2-2.7.8-060-hash-randomization.patch
-- 
1.7.2.5
