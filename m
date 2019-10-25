From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 23:46:46 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/ruby: security
 bump to version 2.4.9
Message-ID: <20191025214025.B39CD881FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b6cb7ccaf00f386d38abcf27ad4cf6212d8fa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

(Bundled jquery)
- CVE-2012-6708: jQuery before 1.9.0 is vulnerable to Cross-site Scripting
  (XSS) attacks.  The jQuery(strInput) function does not differentiate
  selectors from HTML in a reliable fashion.  In vulnerable versions, jQuery
  determined whether the input was HTML by looking for the '<' character
  anywhere in the string, giving attackers more flexibility when attempting
  to construct a malicious payload.  In fixed versions, jQuery only deems
  the input to be HTML if it explicitly starts with the '<' character,
  limiting exploitability only to attackers who can control the beginning of
  a string, which is far less common.

- CVE-2015-9251: jQuery before 3.0.0 is vulnerable to Cross-site Scripting
  (XSS) attacks when a cross-domain Ajax request is performed without the
  dataType option, causing text/javascript responses to be executed.

https://www.ruby-lang.org/en/news/2019/08/28/multiple-jquery-vulnerabilities-in-rdoc/

- CVE-2019-16255: A code injection vulnerability of Shell#[] and Shell#test

https://www.ruby-lang.org/en/news/2019/10/01/code-injection-shell-test-cve-2019-16255/

- CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)

https://www.ruby-lang.org/en/news/2019/10/01/http-response-splitting-in-webrick-cve-2019-16254/

- CVE-2019-15845: A NUL injection vulnerability of File.fnmatch and File.fnmatch?

https://www.ruby-lang.org/en/news/2019/10/01/nul-injection-file-fnmatch-cve-2019-15845/

- CVE-2019-16201: Regular Expression Denial of Service vulnerability of
  WEBrick's Digest access authentication

https://www.ruby-lang.org/en/news/2019/10/01/webrick-regexp-digestauth-dos-cve-2019-16201/

2.4.9 fixes a packaging bug in 2.4.8:

https://www.ruby-lang.org/en/news/2019/10/02/ruby-2-4-9-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dc487302b6ea68695ffbdb456fa95648dcb813e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index fa9eddc279..d0aac63872 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2019/04/01/ruby-2-4-6-released/
-sha256 25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c  ruby-2.4.6.tar.xz
+# https://www.ruby-lang.org/en/news/2019/10/02/ruby-2-4-9-released/
+sha256 0c4e000253ef7187feeb940a01a1c7594f28d63aa16f978e892a0e2864f58614  ruby-2.4.9.tar.xz
 # License files, Locally calculated
 sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 10424020a9..c3d021c381 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
