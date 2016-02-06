From: Jan Heylen <heyleke@gmail.com>
Date: Sat,  6 Feb 2016 09:57:27 +0100
Subject: [Buildroot] [PATCH v2] bind: fix intermittent build issues with
	high BR2_JLEVEL
Message-ID: <1454749047-23035-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build sometimes breaks with:

libtool: link: `unix/os.lo' is not a valid libtool object
make[3]: *** [rndc-confgen] Error 1
make[3]: *** Waiting for unfinished jobs....
make[4]: Leaving directory `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'

So disable parallel builds.

[Jan Heylen: This patch was removed with commit c36b5d89c5616f7ca0a7295cbb5c231606beb71e
by Gustavo Zacarias <gustavo@zacarias.com.ar> but the problem still occurs,
so disabling parallel builds again]

Fixes:
http://autobuild.buildroot.org/results/220/2201f04170ea8ef0961e907efce07c041a57c229/

Signed-off-by: Jan Heylen <heyleke@gmail.com>

---
Changes v1 --> v2:
  - Added comment
  - Added Fixes link
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9d8d16c..c1db1dd 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -6,6 +6,7 @@
 
 BIND_VERSION = 9.10.3-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = ISC
-- 
2.5.0
