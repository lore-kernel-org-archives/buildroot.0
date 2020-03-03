From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:39:09 +0100
Subject: [Buildroot] [git commit] package/patch: annotate CVE-2019-13638
Message-ID: <20200303212705.BAB508F226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77d2c77d2946e0c92df3ef73df851ebd1b5b8b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU patch through 2.7.6 is vulnerable to OS shell command injection that
can be exploited by opening a crafted patch file that contains an ed
style diff payload with shell metacharacters. The ed editor does not
need to be present on the vulnerable system. This is different from
CVE-2018-1000156.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
