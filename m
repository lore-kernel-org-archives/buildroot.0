From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:57:33 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] ruby: security bump to
 version 2.4.4
Message-ID: <20180824084951.7FE6E8E60F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=392148e28fbe21a31f9a87144176084b09cc2266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2017-17405: Command injection vulnerability in Net::FTP (2.4.3):
https://www.ruby-lang.org/en/news/2017/12/14/net-ftp-command-injection-cve-2017-17405/

CVE-2017-17742: HTTP response splitting in WEBrick (2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/

CVE-2018-6914: Unintentional file and directory creation with directory
traversal in tempfile and tmpdir (2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/

CVE-2018-8777: DoS by large request in WEBrick (2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/

CVE-2018-8778: Buffer under-read in String#unpack (2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/

CVE-2018-8779: Unintentional socket creation by poisoned NUL byte in
UNIXServer and UNIXSocket (2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/

CVE-2018-8780: Unintentional directory traversal by poisoned NUL byte in Dir
(2.4.4):
https://www.ruby-lang.org/en/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/

Multiple vulnerabilities in RubyGems (2.4.4):
https://www.ruby-lang.org/en/news/2018/02/17/multiple-vulnerabilities-in-rubygems/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 46cfed78b10a8e17d3d2c35e38b8fb5bf80dd282)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index d066186d56..dd4cfc202b 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# From https://www.ruby-lang.org/en/news/2017/09/14/ruby-2-4-2-released/
-sha256 748a8980d30141bd1a4124e11745bb105b436fb1890826e0d2b9ea31af27f735  ruby-2.4.2.tar.xz
+# From https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-4-4-released/
+sha256 1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0  ruby-2.4.4.tar.xz
 # License files, Locally calculated
 sha256 5cda9584acd5e1096276a375085b7e659fa67a072fd69ec2c3931e54f7f563bb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4bf1a14cee..93c3170cf6 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
