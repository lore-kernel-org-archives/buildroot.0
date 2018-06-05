From: Florian La Roche <F.LaRoche@pilz.de>
Date: Tue, 5 Jun 2018 15:47:45 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: PAGER without blank and unset at
 end of for loop
Message-ID: <20180605134745.24435-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PAGER environment variable is including a blank character at the
end. Remove this.
A for loop has been unsetting the variable inside the loop, this is only
needed once at the end of the loop.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 system/skeleton/etc/profile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 3a97427fdf..1255d23ff4 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -8,7 +8,7 @@ if [ "$PS1" ]; then
 	fi
 fi
 
-export PAGER='/bin/more '
+export PAGER='/bin/more'
 export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
@@ -16,5 +16,5 @@ for i in /etc/profile.d/*.sh ; do
 	if [ -r "$i" ]; then
 		. $i
 	fi
-	unset i
 done
+unset i
-- 
2.17.0

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
