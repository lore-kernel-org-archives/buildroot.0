From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Mar 2020 20:47:03 +0100
Subject: [Buildroot] [PATCH 5/5] package/patch: annotate CVE-2019-13638
In-Reply-To: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
References: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303194703.242362-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU patch through 2.7.6 is vulnerable to OS shell command injection that
can be exploited by opening a crafted patch file that contains an ed
style diff payload with shell metacharacters. The ed editor does not
need to be present on the vulnerable system. This is different from
CVE-2018-1000156.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/patch/patch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index ae9b838a62..b7f5bac05a 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -17,7 +17,7 @@ PATCH_IGNORE_CVES += CVE-2018-6951
 PATCH_IGNORE_CVES += CVE-2018-1000156
 
 # 0004-Invoke-ed-directly-instead-of-using-the-shell.patch
-PATCH_IGNORE_CVES += CVE-2018-20969
+PATCH_IGNORE_CVES += CVE-2018-20969 CVE-2019-13638
 
 # 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
 PATCH_IGNORE_CVES += CVE-2019-13636
-- 
2.25.0
