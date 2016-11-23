From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Nov 2016 14:39:11 +0000
Subject: [Buildroot] [PATCH next 3/6] moarvm: enable optional support for
	libffi
In-Reply-To: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
Message-ID: <20161123143914.3969-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/moarvm/moarvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 80bd19c..d091174 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -25,6 +25,11 @@ MOARVM_CONF_OPTS = \
 	--has-libtommath \
 	--has-libatomic
 
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+MOARVM_CONF_OPTS += --has-libffi
+MOARVM_DEPENDENCIES += libffi
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 MOARVM_CONF_OPTS += --big-endian
 endif
-- 
2.10.1
