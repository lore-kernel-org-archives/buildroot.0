From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Jul 2009 09:20:40 +0200
Subject: [Buildroot] [git commit] ruby: needs WCHAR support in toolchain
Message-ID: <20090713074533.1BA3F77467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea536503331aea875e84ae598b4610fbd059f167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index b7e0f83..518302a 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -3,7 +3,11 @@ comment "ruby has no inherent support for AVR32"
 
 config BR2_PACKAGE_RUBY
 	bool "ruby"
+	depends on BR2_USE_WCHAR
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
+
+comment "ruby requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.6.3.3
