From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 28 Sep 2018 15:04:35 -0500
Subject: [Buildroot] [PATCH 2/2] package/setools: HOST_ depend on
 host-python-enum
In-Reply-To: <1538165075-58848-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1538165075-58848-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1538165075-58848-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The enum34 dependency is required for python2.7 for both
the host and target builds.  This patch adds the host
dependency to match what is already in place for the target.

The host build is used by the setools package seinfo tool
offline for host based policy analysis.  The analysis is easiest
performed offline as the policy is checked for path/reachability,
which is something that occurs by taking the policy file and
using debug libraries to perform test cases.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/setools/setools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95..c152e54 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -18,6 +18,7 @@ SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 SETOOLS_DEPENDENCIES += python-enum34
+HOST_SETOOLS_DEPENDENCIES += host-python-enum34
 endif
 
 define SETOOLS_FIX_SETUP
-- 
1.9.1
