From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:48 +0200
Subject: [Buildroot] [git commit] uclibc: enable libintl stubs
Message-ID: <20170704170700.D1FFE800C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9318b864d35542a2ea1d7a3ad12391660854a83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to avoid having to bring libintl from gettext whenever you
want to build a program that needs it, uClibc-ng now provides a stub
implementation of the gettext functions in uClibc-ng itself. This
brings uClibc-ng in the same situation as musl.

This will fix a lot of build failures related to static linking with
libintl, and generally is a first step to simplify our gettext
handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
