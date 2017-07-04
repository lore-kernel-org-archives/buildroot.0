From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:45 +0200
Subject: [Buildroot] [PATCH 005/100] uclibc: enable libintl stubs
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-6-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid having to bring libintl from gettext whenever you
want to build a program that needs it, uClibc-ng now provides a stub
implementation of the gettext functions in uClibc-ng itself. This
brings uClibc-ng in the same situation as musl.

This will fix a lot of build failures related to static linking with
libintl, and generally is a first step to simplify our gettext
handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index f0a876f..5beb2bd 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -23,6 +23,7 @@ UCLIBC_HAS_RESOLVER_SUPPORT=y
 UCLIBC_HAS_LIBRESOLV_STUB=y
 UCLIBC_HAS_LIBNSL_STUB=y
 UCLIBC_HAS_CTYPE_CHECKED=y
+UCLIBC_HAS_LIBINTL=y
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 UCLIBC_HAS_STDIO_GETC_MACRO=y
-- 
2.9.4
