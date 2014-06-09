From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 12:05:27 +0200
Subject: [Buildroot] [git commit] ruby: add gdbm support
Message-ID: <20140609100656.7919A9CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=687e185890f997c76f84cda826313c6158652bdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 69006c1..4ecf49d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -30,6 +30,9 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_GDBM),y)
+	RUBY_DEPENDENCIES += gdbm
+endif
 ifeq ($(BR2_PACKAGE_LIBYAML),y)
 	RUBY_DEPENDENCIES += libyaml
 endif
