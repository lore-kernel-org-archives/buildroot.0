From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Dec 2016 20:02:14 +0100
Subject: [Buildroot] [PATCH 2/3] docs/manual: document FOO_PERMISSIONS_FILE
In-Reply-To: <cover.1482346921.git.yann.morin.1998@free.fr>
References: <cover.1482346921.git.yann.morin.1998@free.fr>
Message-ID: <6906e19e50be61b35e82bf8eb5460a24ab074715.1482346921.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
changes v1 -> v2;
  - fix grammar and semantics
---
 docs/manual/adding-packages-generic.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 0e111e1..b0b4bf2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -385,7 +385,13 @@ information is (assuming the package name is +libfoo+) :
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
