From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 12:05:08 +0200
Subject: [Buildroot] [git commit] ruby: add psych/libyaml support
Message-ID: <20140609100656.6D6569CF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a69a830c7cc79e016893a504b6e51d538364c8eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 65a59f5..69006c1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -30,6 +30,9 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_LIBYAML),y)
+	RUBY_DEPENDENCIES += libyaml
+endif
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	RUBY_DEPENDENCIES += ncurses
 endif
