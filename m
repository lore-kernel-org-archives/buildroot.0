From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2011 19:23:29 +0200
Subject: [Buildroot] [PATCH 1/1] bind: give path to OpenSSL when OpenSSL is
	enabled
In-Reply-To: <cover.1305825805.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305825805.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8c5d5d15c623d3f93c48c58bb611b0a40e986ccb.1305825805.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bind needs to be specifically told where OpenSSL is, otherwise, the
build fails with:

checking for OpenSSL library... configure: error: OpenSSL was not found in any of /usr /usr/local /usr/local/ssl /usr/pkg /usr/sfw; use --with-openssl=/path
If you don't want OpenSSL, use --without-openssl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e3341bd..2df6ae8 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -27,6 +27,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
+	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
 else
 	BIND_CONF_OPT += --with-openssl=no
 endif
-- 
1.7.1
