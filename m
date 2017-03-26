From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:43:42 +0200
Subject: [Buildroot] [PATCH 3/4] docs/manual: document FOO_PERMISSIONS_FILE
In-Reply-To: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1490564623-26806-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a08283c..23b07fa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -386,7 +386,13 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_PERMISSIONS+ lists the changes of permissions to be done at
   the end of the build process. The syntax is once again the makedevs one.
   You can find some documentation for this syntax in the xref:makedev-syntax[].
-  This variable is optional.
+  This variable is optional; its value must be known when the .mk file
+  is parsed.
+
+* +LIBFOO_PERMISSIONS_FILE+, like +LIBFOO_PERMISSIONS+ but points to a
+  file that contains the list of permissions. Unlike +LIBFOO_PERMISSIONS+,
+  its content need not be known when the .mk file is parsed, so it can be
+  generated. This variable is optional, and you should seldom need it.
 
 * +LIBFOO_USERS+ lists the users to create for this package, if it installs
   a program you want to run as a specific user (e.g. as a daemon, or as a
-- 
2.7.4
