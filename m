From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 09:12:05 -0300
Subject: [Buildroot] [PATCH 2/3] docs/manual: add CVS support documentation
In-Reply-To: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378901526-29167-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 docs/manual/adding-packages-generic.txt | 7 +++++++
 docs/manual/prerequisite.txt            | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 67967a2..cb067bd 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -266,6 +266,13 @@ information is (assuming the package name is +libfoo+) :
      Buildroot performs a checkout which is preserved as a tarball in
      the download cache; subsequent builds use the tarball instead of
      performing another checkout.
+  ** +cvs+ for retrieving source code from a CVS repository.
+     Used by default when +LIBFOO_SITE+ begins with +cvs://+.
+     The downloaded source code is cached as with the +svn+ method.
+     Only anonymous pserver mode is supported.
+     +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
+     repository directory. The module is the package name.
+     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
   ** +git+ for retrieving source code from a Git repository.  Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
      source code is cached as with the +svn+
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 9d36402..78ce436 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -52,7 +52,7 @@ Optional packages
 +
 In the official tree, most of the package sources are retrieved
 using +wget+; a few are only available through their +git+, +mercurial+,
-or +svn+ repository.
++svn+ or +cvs+ repository.
 +
 All other source fetching methods are implemented and may be used in a
 development context (further details: refer to xref:download-infra[]).
-- 
1.8.1.5
