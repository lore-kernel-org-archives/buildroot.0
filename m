From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 May 2014 10:44:21 -0300
Subject: [Buildroot] [PATCH 2/3] ruby: add gdbm support
In-Reply-To: <1400593462-9247-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400593462-9247-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400593462-9247-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 1185323..86d0089 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -29,6 +29,9 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_GDBM),y)
+	RUBY_DEPENDENCIES += gdbm
+endif
 ifeq ($(BR2_PACKAGE_LIBYAML),y)
 	RUBY_DEPENDENCIES += libyaml
 endif
-- 
1.8.5.5
