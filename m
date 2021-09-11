Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071BBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:23:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DFD61153
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45DFD61153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B7B403EB;
	Sat, 11 Sep 2021 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fU7cVO852FFk; Sat, 11 Sep 2021 13:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496C3403EE;
	Sat, 11 Sep 2021 13:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E54D71BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4BF581D5F
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4eNagGYmVWR for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:23:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69A6E82A53
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:23:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60C7288F54; Sat, 11 Sep 2021 13:21:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 15:19:27 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6d01aeec1db056a98af199ecf72875820b504ab1
X-Git-Newrev: 307613451a87b3b68575febeaae04ba76d9464a8
X-Patchwork-Hint: ignore
Message-Id: <20210911132130.60C7288F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/c-ares:
 regenerate 0001-Provide-ares_nameser-h-as-a-public-interface.patch without
 renames
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=307613451a87b3b68575febeaae04ba76d9464a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
http://autobuild.buildroot.net/results/4d48694dd5c19ddfc2bdc9639bf26c3182678639/

Git-style patches with renames are not supported byt apply-patches.sh on
stable, so regenerate the patch with --no-renames.  The header file has
changed post-1.17.2, so rebase the patch on the release to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...vide-ares_nameser-h-as-a-public-interface.patch | 1049 +++++++++++++++++++-
 1 file changed, 997 insertions(+), 52 deletions(-)

diff --git a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
index c3ae3daa8d..f8fc0be254 100644
--- a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
+++ b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
@@ -1,4 +1,4 @@
-From 7712fcd17847998cf1ee3071284ec50c5b3c1978 Mon Sep 17 00:00:00 2001
+From 883b0dd33f62ea64f4cc826e3a8285bfe1929a7f Mon Sep 17 00:00:00 2001
 From: Felix Yan <felixonmars@archlinux.org>
 Date: Wed, 18 Aug 2021 01:32:44 +0800
 Subject: [PATCH] Provide ares_nameser.h as a public interface (#417)
@@ -11,20 +11,24 @@ Fix By: Felix Yan (@felixonmars)
 [Retrieved from:
 https://github.com/c-ares/c-ares/commit/7712fcd17847998cf1ee3071284ec50c5b3c1978]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Rebased on 1.17.2 and regenerated with --no-renames for stable]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- CMakeLists.txt                      |  6 ++++++
- configure.ac                        | 14 ++++++++++++++
- include/CMakeLists.txt              |  2 +-
- include/Makefile.am                 |  2 +-
- include/ares_build.h.cmake          |  2 ++
- include/ares_build.h.in             |  3 +++
- {src/lib => include}/ares_nameser.h | 10 ++++++----
- src/lib/Makefile.inc                |  1 -
- 8 files changed, 33 insertions(+), 7 deletions(-)
- rename {src/lib => include}/ares_nameser.h (98%)
+ CMakeLists.txt             |   6 +
+ configure.ac               |  14 ++
+ include/CMakeLists.txt     |   2 +-
+ include/Makefile.am        |   2 +-
+ include/ares_build.h.cmake |   2 +
+ include/ares_build.h.in    |   3 +
+ include/ares_nameser.h     | 484 +++++++++++++++++++++++++++++++++++++
+ src/lib/Makefile.inc       |   1 -
+ src/lib/ares_nameser.h     | 482 ------------------------------------
+ 9 files changed, 511 insertions(+), 485 deletions(-)
+ create mode 100644 include/ares_nameser.h
+ delete mode 100644 src/lib/ares_nameser.h
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3f42d145..28f8e01a 100644
+index 3f42d14..28f8e01 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -557,6 +557,12 @@ ENDIF()
@@ -41,7 +45,7 @@ index 3f42d145..28f8e01a 100644
  # Record toplevel CMakeLists.txt path
  set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
 diff --git a/configure.ac b/configure.ac
-index c21b8ff3..1ba8a8ec 100644
+index c21b8ff..1ba8a8e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -547,6 +547,20 @@ dnl *Sigh* these are needed in order for net/if.h to get properly detected.
@@ -66,7 +70,7 @@ index c21b8ff3..1ba8a8ec 100644
  AC_C_CONST
  AC_TYPE_SIZE_T
 diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
-index 439e7bb2..3321956d 100644
+index 439e7bb..3321956 100644
 --- a/include/CMakeLists.txt
 +++ b/include/CMakeLists.txt
 @@ -3,6 +3,6 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
@@ -78,7 +82,7 @@ index 439e7bb2..3321956d 100644
  	INSTALL (FILES ${CARES_HEADERS} COMPONENT Devel DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
  ENDIF ()
 diff --git a/include/Makefile.am b/include/Makefile.am
-index 125a686a..d208bece 100644
+index 125a686..d208bec 100644
 --- a/include/Makefile.am
 +++ b/include/Makefile.am
 @@ -2,6 +2,6 @@ AUTOMAKE_OPTIONS = foreign nostdinc 1.9.6
@@ -90,7 +94,7 @@ index 125a686a..d208bece 100644
  
  EXTRA_DIST = ares_build.h.cmake ares_build.h.in ares_build.h.dist CMakeLists.txt
 diff --git a/include/ares_build.h.cmake b/include/ares_build.h.cmake
-index ac32d47f..e847f17e 100644
+index ac32d47..e847f17 100644
 --- a/include/ares_build.h.cmake
 +++ b/include/ares_build.h.cmake
 @@ -13,6 +13,8 @@
@@ -103,7 +107,7 @@ index ac32d47f..e847f17e 100644
  #ifdef CARES_HAVE_SYS_TYPES_H
  #  include <sys/types.h>
 diff --git a/include/ares_build.h.in b/include/ares_build.h.in
-index 24e3a989..20fd28a0 100644
+index 24e3a98..20fd28a 100644
 --- a/include/ares_build.h.in
 +++ b/include/ares_build.h.in
 @@ -55,6 +55,9 @@
@@ -116,51 +120,501 @@ index 24e3a989..20fd28a0 100644
  /* ================================================================ */
  /*  EXTERNAL INTERFACE SETTINGS FOR CONFIGURE CAPABLE SYSTEMS ONLY  */
  /* ================================================================ */
-diff --git a/src/lib/ares_nameser.h b/include/ares_nameser.h
-similarity index 98%
-rename from src/lib/ares_nameser.h
-rename to include/ares_nameser.h
-index 65aebcc1..18a9e5ac 100644
---- a/src/lib/ares_nameser.h
+diff --git a/include/ares_nameser.h b/include/ares_nameser.h
+new file mode 100644
+index 0000000..ca40c38
+--- /dev/null
 +++ b/include/ares_nameser.h
-@@ -2,10 +2,12 @@
- #ifndef ARES_NAMESER_H
- #define ARES_NAMESER_H
- 
--#ifdef HAVE_ARPA_NAMESER_H
+@@ -0,0 +1,484 @@
++
++#ifndef ARES_NAMESER_H
++#define ARES_NAMESER_H
++
 +#include "ares_build.h"
 +
 +#ifdef CARES_HAVE_ARPA_NAMESER_H
- #  include <arpa/nameser.h>
- #endif
--#ifdef HAVE_ARPA_NAMESER_COMPAT_H
++#  include <arpa/nameser.h>
++#endif
 +#ifdef CARES_HAVE_ARPA_NAMESER_COMPAT_H
- #  include <arpa/nameser_compat.h>
- #endif
- 
-@@ -68,7 +70,7 @@
-  * provide them
-  * ============================================================================
-  */
--#ifndef HAVE_ARPA_NAMESER_H
++#  include <arpa/nameser_compat.h>
++#endif
++
++/* ============================================================================
++ * arpa/nameser.h may or may not provide ALL of the below defines, so check
++ * each one individually and set if not
++ * ============================================================================
++ */
++
++#ifndef NS_PACKETSZ
++#  define NS_PACKETSZ     512   /* maximum packet size */
++#endif
++
++#ifndef NS_MAXDNAME
++#  define NS_MAXDNAME     256   /* maximum domain name */
++#endif
++
++#ifndef NS_MAXCDNAME
++#  define NS_MAXCDNAME    255   /* maximum compressed domain name */
++#endif
++
++#ifndef NS_MAXLABEL
++#  define NS_MAXLABEL     63
++#endif
++
++#ifndef NS_HFIXEDSZ
++#  define NS_HFIXEDSZ     12    /* #/bytes of fixed data in header */
++#endif
++
++#ifndef NS_QFIXEDSZ
++#  define NS_QFIXEDSZ     4     /* #/bytes of fixed data in query */
++#endif
++
++#ifndef NS_RRFIXEDSZ
++#  define NS_RRFIXEDSZ    10    /* #/bytes of fixed data in r record */
++#endif
++
++#ifndef NS_INT16SZ
++#  define NS_INT16SZ      2
++#endif
++
++#ifndef NS_INADDRSZ
++#  define NS_INADDRSZ     4
++#endif
++
++#ifndef NS_IN6ADDRSZ
++#  define NS_IN6ADDRSZ    16
++#endif
++
++#ifndef NS_CMPRSFLGS
++#  define NS_CMPRSFLGS    0xc0  /* Flag bits indicating name compression. */
++#endif
++
++#ifndef NS_DEFAULTPORT
++#  define NS_DEFAULTPORT  53    /* For both TCP and UDP. */
++#endif
++
++/* ============================================================================
++ * arpa/nameser.h should provide these enumerations always, so if not found,
++ * provide them
++ * ============================================================================
++ */
 +#ifndef CARES_HAVE_ARPA_NAMESER_H
- 
- typedef enum __ns_class {
-     ns_c_invalid = 0,       /* Cookie. */
-@@ -173,7 +175,7 @@ typedef enum __ns_rcode {
-     ns_r_badtime = 18
- } ns_rcode;
- 
--#endif /* HAVE_ARPA_NAMESER_H */
++
++typedef enum __ns_class {
++    ns_c_invalid = 0,       /* Cookie. */
++    ns_c_in = 1,            /* Internet. */
++    ns_c_2 = 2,             /* unallocated/unsupported. */
++    ns_c_chaos = 3,         /* MIT Chaos-net. */
++    ns_c_hs = 4,            /* MIT Hesiod. */
++    /* Query class values which do not appear in resource records */
++    ns_c_none = 254,        /* for prereq. sections in update requests */
++    ns_c_any = 255,         /* Wildcard match. */
++    ns_c_max = 65536
++} ns_class;
++
++typedef enum __ns_type {
++    ns_t_invalid = 0,       /* Cookie. */
++    ns_t_a = 1,             /* Host address. */
++    ns_t_ns = 2,            /* Authoritative server. */
++    ns_t_md = 3,            /* Mail destination. */
++    ns_t_mf = 4,            /* Mail forwarder. */
++    ns_t_cname = 5,         /* Canonical name. */
++    ns_t_soa = 6,           /* Start of authority zone. */
++    ns_t_mb = 7,            /* Mailbox domain name. */
++    ns_t_mg = 8,            /* Mail group member. */
++    ns_t_mr = 9,            /* Mail rename name. */
++    ns_t_null = 10,         /* Null resource record. */
++    ns_t_wks = 11,          /* Well known service. */
++    ns_t_ptr = 12,          /* Domain name pointer. */
++    ns_t_hinfo = 13,        /* Host information. */
++    ns_t_minfo = 14,        /* Mailbox information. */
++    ns_t_mx = 15,           /* Mail routing information. */
++    ns_t_txt = 16,          /* Text strings. */
++    ns_t_rp = 17,           /* Responsible person. */
++    ns_t_afsdb = 18,        /* AFS cell database. */
++    ns_t_x25 = 19,          /* X_25 calling address. */
++    ns_t_isdn = 20,         /* ISDN calling address. */
++    ns_t_rt = 21,           /* Router. */
++    ns_t_nsap = 22,         /* NSAP address. */
++    ns_t_nsap_ptr = 23,     /* Reverse NSAP lookup (deprecated). */
++    ns_t_sig = 24,          /* Security signature. */
++    ns_t_key = 25,          /* Security key. */
++    ns_t_px = 26,           /* X.400 mail mapping. */
++    ns_t_gpos = 27,         /* Geographical position (withdrawn). */
++    ns_t_aaaa = 28,         /* Ip6 Address. */
++    ns_t_loc = 29,          /* Location Information. */
++    ns_t_nxt = 30,          /* Next domain (security). */
++    ns_t_eid = 31,          /* Endpoint identifier. */
++    ns_t_nimloc = 32,       /* Nimrod Locator. */
++    ns_t_srv = 33,          /* Server Selection. */
++    ns_t_atma = 34,         /* ATM Address */
++    ns_t_naptr = 35,        /* Naming Authority PoinTeR */
++    ns_t_kx = 36,           /* Key Exchange */
++    ns_t_cert = 37,         /* Certification record */
++    ns_t_a6 = 38,           /* IPv6 address (deprecates AAAA) */
++    ns_t_dname = 39,        /* Non-terminal DNAME (for IPv6) */
++    ns_t_sink = 40,         /* Kitchen sink (experimentatl) */
++    ns_t_opt = 41,          /* EDNS0 option (meta-RR) */
++    ns_t_apl = 42,          /* Address prefix list (RFC3123) */
++    ns_t_ds = 43,           /* Delegation Signer (RFC4034) */
++    ns_t_sshfp = 44,        /* SSH Key Fingerprint (RFC4255) */
++    ns_t_rrsig = 46,        /* Resource Record Signature (RFC4034) */
++    ns_t_nsec = 47,         /* Next Secure (RFC4034) */
++    ns_t_dnskey = 48,       /* DNS Public Key (RFC4034) */
++    ns_t_tkey = 249,        /* Transaction key */
++    ns_t_tsig = 250,        /* Transaction signature. */
++    ns_t_ixfr = 251,        /* Incremental zone transfer. */
++    ns_t_axfr = 252,        /* Transfer zone of authority. */
++    ns_t_mailb = 253,       /* Transfer mailbox records. */
++    ns_t_maila = 254,       /* Transfer mail agent records. */
++    ns_t_any = 255,         /* Wildcard match. */
++    ns_t_zxfr = 256,        /* BIND-specific, nonstandard. */
++    ns_t_caa = 257,         /* Certification Authority Authorization. */
++    ns_t_max = 65536
++} ns_type;
++
++typedef enum __ns_opcode {
++    ns_o_query = 0,         /* Standard query. */
++    ns_o_iquery = 1,        /* Inverse query (deprecated/unsupported). */
++    ns_o_status = 2,        /* Name server status query (unsupported). */
++                                /* Opcode 3 is undefined/reserved. */
++    ns_o_notify = 4,        /* Zone change notification. */
++    ns_o_update = 5,        /* Zone update message. */
++    ns_o_max = 6
++} ns_opcode;
++
++typedef enum __ns_rcode {
++    ns_r_noerror = 0,       /* No error occurred. */
++    ns_r_formerr = 1,       /* Format error. */
++    ns_r_servfail = 2,      /* Server failure. */
++    ns_r_nxdomain = 3,      /* Name error. */
++    ns_r_notimpl = 4,       /* Unimplemented. */
++    ns_r_refused = 5,       /* Operation refused. */
++    /* these are for BIND_UPDATE */
++    ns_r_yxdomain = 6,      /* Name exists */
++    ns_r_yxrrset = 7,       /* RRset exists */
++    ns_r_nxrrset = 8,       /* RRset does not exist */
++    ns_r_notauth = 9,       /* Not authoritative for zone */
++    ns_r_notzone = 10,      /* Zone of record different from zone section */
++    ns_r_max = 11,
++    /* The following are TSIG extended errors */
++    ns_r_badsig = 16,
++    ns_r_badkey = 17,
++    ns_r_badtime = 18
++} ns_rcode;
++
 +#endif /* CARES_HAVE_ARPA_NAMESER_H */
- 
- 
- /* ============================================================================
++
++
++/* ============================================================================
++ * arpa/nameser_compat.h typically sets these.  However on some systems
++ * arpa/nameser.h does, but may not set all of them.  Lets conditionally
++ * define each
++ * ============================================================================
++ */
++
++#ifndef PACKETSZ
++#  define PACKETSZ         NS_PACKETSZ
++#endif
++
++#ifndef MAXDNAME
++#  define MAXDNAME         NS_MAXDNAME
++#endif
++
++#ifndef MAXCDNAME
++#  define MAXCDNAME        NS_MAXCDNAME
++#endif
++
++#ifndef MAXLABEL
++#  define MAXLABEL         NS_MAXLABEL
++#endif
++
++#ifndef HFIXEDSZ
++#  define HFIXEDSZ         NS_HFIXEDSZ
++#endif
++
++#ifndef QFIXEDSZ
++#  define QFIXEDSZ         NS_QFIXEDSZ
++#endif
++
++#ifndef RRFIXEDSZ
++#  define RRFIXEDSZ        NS_RRFIXEDSZ
++#endif
++
++#ifndef INDIR_MASK
++#  define INDIR_MASK       NS_CMPRSFLGS
++#endif
++
++#ifndef NAMESERVER_PORT
++#  define NAMESERVER_PORT  NS_DEFAULTPORT
++#endif
++
++
++/* opcodes */
++#ifndef O_QUERY
++#  define O_QUERY 0  /* ns_o_query */
++#endif
++#ifndef O_IQUERY
++#  define O_IQUERY 1 /* ns_o_iquery */
++#endif
++#ifndef O_STATUS
++#  define O_STATUS 2 /* ns_o_status */
++#endif
++#ifndef O_NOTIFY
++#  define O_NOTIFY 4 /* ns_o_notify */
++#endif
++#ifndef O_UPDATE
++#  define O_UPDATE 5 /* ns_o_update */
++#endif
++
++
++/* response codes */
++#ifndef SERVFAIL
++#  define SERVFAIL        ns_r_servfail
++#endif
++#ifndef NOTIMP
++#  define NOTIMP          ns_r_notimpl
++#endif
++#ifndef REFUSED
++#  define REFUSED         ns_r_refused
++#endif
++#if defined(_WIN32) && !defined(HAVE_ARPA_NAMESER_COMPAT_H) && defined(NOERROR)
++#  undef NOERROR /* it seems this is already defined in winerror.h */
++#endif
++#ifndef NOERROR
++#  define NOERROR         ns_r_noerror
++#endif
++#ifndef FORMERR
++#  define FORMERR         ns_r_formerr
++#endif
++#ifndef NXDOMAIN
++#  define NXDOMAIN        ns_r_nxdomain
++#endif
++/* Non-standard response codes, use numeric values */
++#ifndef YXDOMAIN
++#  define YXDOMAIN        6 /* ns_r_yxdomain */
++#endif
++#ifndef YXRRSET
++#  define YXRRSET         7 /* ns_r_yxrrset */
++#endif
++#ifndef NXRRSET
++#  define NXRRSET         8 /* ns_r_nxrrset */
++#endif
++#ifndef NOTAUTH
++#  define NOTAUTH         9 /* ns_r_notauth */
++#endif
++#ifndef NOTZONE
++#  define NOTZONE         10 /* ns_r_notzone */
++#endif
++#ifndef TSIG_BADSIG
++#  define TSIG_BADSIG     16 /* ns_r_badsig */
++#endif
++#ifndef TSIG_BADKEY
++#  define TSIG_BADKEY     17 /* ns_r_badkey */
++#endif
++#ifndef TSIG_BADTIME
++#  define TSIG_BADTIME    18 /* ns_r_badtime */
++#endif
++
++
++/* classes */
++#ifndef C_IN
++#  define C_IN            1 /* ns_c_in */
++#endif
++#ifndef C_CHAOS
++#  define C_CHAOS         3 /* ns_c_chaos */
++#endif
++#ifndef C_HS
++#  define C_HS            4 /* ns_c_hs */
++#endif
++#ifndef C_NONE
++#  define C_NONE          254 /* ns_c_none */
++#endif
++#ifndef C_ANY
++#  define C_ANY           255 /*  ns_c_any */
++#endif
++
++
++/* types */
++#ifndef T_A
++#  define T_A             1   /* ns_t_a */
++#endif
++#ifndef T_NS
++#  define T_NS            2   /* ns_t_ns */
++#endif
++#ifndef T_MD
++#  define T_MD            3   /* ns_t_md */
++#endif
++#ifndef T_MF
++#  define T_MF            4   /* ns_t_mf */
++#endif
++#ifndef T_CNAME
++#  define T_CNAME         5   /* ns_t_cname */
++#endif
++#ifndef T_SOA
++#  define T_SOA           6   /* ns_t_soa */
++#endif
++#ifndef T_MB
++#  define T_MB            7   /* ns_t_mb */
++#endif
++#ifndef T_MG
++#  define T_MG            8   /* ns_t_mg */
++#endif
++#ifndef T_MR
++#  define T_MR            9   /* ns_t_mr */
++#endif
++#ifndef T_NULL
++#  define T_NULL          10  /* ns_t_null */
++#endif
++#ifndef T_WKS
++#  define T_WKS           11  /* ns_t_wks */
++#endif
++#ifndef T_PTR
++#  define T_PTR           12  /* ns_t_ptr */
++#endif
++#ifndef T_HINFO
++#  define T_HINFO         13  /* ns_t_hinfo */
++#endif
++#ifndef T_MINFO
++#  define T_MINFO         14  /* ns_t_minfo */
++#endif
++#ifndef T_MX
++#  define T_MX            15  /* ns_t_mx */
++#endif
++#ifndef T_TXT
++#  define T_TXT           16  /* ns_t_txt */
++#endif
++#ifndef T_RP
++#  define T_RP            17  /* ns_t_rp */
++#endif
++#ifndef T_AFSDB
++#  define T_AFSDB         18  /* ns_t_afsdb */
++#endif
++#ifndef T_X25
++#  define T_X25           19  /* ns_t_x25 */
++#endif
++#ifndef T_ISDN
++#  define T_ISDN          20  /* ns_t_isdn */
++#endif
++#ifndef T_RT
++#  define T_RT            21  /* ns_t_rt */
++#endif
++#ifndef T_NSAP
++#  define T_NSAP          22  /* ns_t_nsap */
++#endif
++#ifndef T_NSAP_PTR
++#  define T_NSAP_PTR      23  /* ns_t_nsap_ptr */
++#endif
++#ifndef T_SIG
++#  define T_SIG           24  /* ns_t_sig */
++#endif
++#ifndef T_KEY
++#  define T_KEY           25  /* ns_t_key */
++#endif
++#ifndef T_PX
++#  define T_PX            26  /* ns_t_px */
++#endif
++#ifndef T_GPOS
++#  define T_GPOS          27  /* ns_t_gpos */
++#endif
++#ifndef T_AAAA
++#  define T_AAAA          28  /* ns_t_aaaa */
++#endif
++#ifndef T_LOC
++#  define T_LOC           29  /* ns_t_loc */
++#endif
++#ifndef T_NXT
++#  define T_NXT           30  /* ns_t_nxt */
++#endif
++#ifndef T_EID
++#  define T_EID           31  /* ns_t_eid */
++#endif
++#ifndef T_NIMLOC
++#  define T_NIMLOC        32  /* ns_t_nimloc */
++#endif
++#ifndef T_SRV
++#  define T_SRV           33  /* ns_t_srv */
++#endif
++#ifndef T_ATMA
++#  define T_ATMA          34  /* ns_t_atma */
++#endif
++#ifndef T_NAPTR
++#  define T_NAPTR         35  /* ns_t_naptr */
++#endif
++#ifndef T_KX
++#  define T_KX            36  /* ns_t_kx */
++#endif
++#ifndef T_CERT
++#  define T_CERT          37  /* ns_t_cert */
++#endif
++#ifndef T_A6
++#  define T_A6            38  /* ns_t_a6 */
++#endif
++#ifndef T_DNAME
++#  define T_DNAME         39  /* ns_t_dname */
++#endif
++#ifndef T_SINK
++#  define T_SINK          40  /* ns_t_sink */
++#endif
++#ifndef T_OPT
++#  define T_OPT           41  /* ns_t_opt */
++#endif
++#ifndef T_APL
++#  define T_APL           42  /* ns_t_apl */
++#endif
++#ifndef T_DS
++#  define T_DS            43  /* ns_t_ds */
++#endif
++#ifndef T_SSHFP
++#  define T_SSHFP         44  /* ns_t_sshfp */
++#endif
++#ifndef T_RRSIG
++#  define T_RRSIG         46  /* ns_t_rrsig */
++#endif
++#ifndef T_NSEC
++#  define T_NSEC          47  /* ns_t_nsec */
++#endif
++#ifndef T_DNSKEY
++#  define T_DNSKEY        48  /* ns_t_dnskey */
++#endif
++#ifndef T_TKEY
++#  define T_TKEY          249 /* ns_t_tkey */
++#endif
++#ifndef T_TSIG
++#  define T_TSIG          250 /* ns_t_tsig */
++#endif
++#ifndef T_IXFR
++#  define T_IXFR          251 /* ns_t_ixfr */
++#endif
++#ifndef T_AXFR
++#  define T_AXFR          252 /* ns_t_axfr */
++#endif
++#ifndef T_MAILB
++#  define T_MAILB         253 /* ns_t_mailb */
++#endif
++#ifndef T_MAILA
++#  define T_MAILA         254 /* ns_t_maila */
++#endif
++#ifndef T_ANY
++#  define T_ANY           255 /* ns_t_any */
++#endif
++#ifndef T_ZXFR
++#  define T_ZXFR          256 /* ns_t_zxfr */
++#endif
++#ifndef T_CAA
++#  define T_CAA           257 /* ns_t_caa */
++#endif
++#ifndef T_MAX
++#  define T_MAX         65536 /* ns_t_max */
++#endif
++
++
++#endif /* ARES_NAMESER_H */
 diff --git a/src/lib/Makefile.inc b/src/lib/Makefile.inc
-index 7426c3de..47bc8cdd 100644
+index 51be62c..a1af4a9 100644
 --- a/src/lib/Makefile.inc
 +++ b/src/lib/Makefile.inc
-@@ -73,7 +73,6 @@ HHEADERS = ares_android.h                        \
+@@ -72,7 +72,6 @@ HHEADERS = ares_android.h                        \
    ares_strsplit.h			\
    ares_writev.h				\
    bitncmp.h				\
@@ -168,3 +622,494 @@ index 7426c3de..47bc8cdd 100644
    ares_setup.h				\
    setup_once.h
  
+diff --git a/src/lib/ares_nameser.h b/src/lib/ares_nameser.h
+deleted file mode 100644
+index 5270e5a..0000000
+--- a/src/lib/ares_nameser.h
++++ /dev/null
+@@ -1,482 +0,0 @@
+-
+-#ifndef ARES_NAMESER_H
+-#define ARES_NAMESER_H
+-
+-#ifdef HAVE_ARPA_NAMESER_H
+-#  include <arpa/nameser.h>
+-#endif
+-#ifdef HAVE_ARPA_NAMESER_COMPAT_H
+-#  include <arpa/nameser_compat.h>
+-#endif
+-
+-/* ============================================================================
+- * arpa/nameser.h may or may not provide ALL of the below defines, so check
+- * each one individually and set if not
+- * ============================================================================
+- */
+-
+-#ifndef NS_PACKETSZ
+-#  define NS_PACKETSZ     512   /* maximum packet size */
+-#endif
+-
+-#ifndef NS_MAXDNAME
+-#  define NS_MAXDNAME     256   /* maximum domain name */
+-#endif
+-
+-#ifndef NS_MAXCDNAME
+-#  define NS_MAXCDNAME    255   /* maximum compressed domain name */
+-#endif
+-
+-#ifndef NS_MAXLABEL
+-#  define NS_MAXLABEL     63
+-#endif
+-
+-#ifndef NS_HFIXEDSZ
+-#  define NS_HFIXEDSZ     12    /* #/bytes of fixed data in header */
+-#endif
+-
+-#ifndef NS_QFIXEDSZ
+-#  define NS_QFIXEDSZ     4     /* #/bytes of fixed data in query */
+-#endif
+-
+-#ifndef NS_RRFIXEDSZ
+-#  define NS_RRFIXEDSZ    10    /* #/bytes of fixed data in r record */
+-#endif
+-
+-#ifndef NS_INT16SZ
+-#  define NS_INT16SZ      2
+-#endif
+-
+-#ifndef NS_INADDRSZ
+-#  define NS_INADDRSZ     4
+-#endif
+-
+-#ifndef NS_IN6ADDRSZ
+-#  define NS_IN6ADDRSZ    16
+-#endif
+-
+-#ifndef NS_CMPRSFLGS
+-#  define NS_CMPRSFLGS    0xc0  /* Flag bits indicating name compression. */
+-#endif
+-
+-#ifndef NS_DEFAULTPORT
+-#  define NS_DEFAULTPORT  53    /* For both TCP and UDP. */
+-#endif
+-
+-/* ============================================================================
+- * arpa/nameser.h should provide these enumerations always, so if not found,
+- * provide them
+- * ============================================================================
+- */
+-#ifndef HAVE_ARPA_NAMESER_H
+-
+-typedef enum __ns_class {
+-    ns_c_invalid = 0,       /* Cookie. */
+-    ns_c_in = 1,            /* Internet. */
+-    ns_c_2 = 2,             /* unallocated/unsupported. */
+-    ns_c_chaos = 3,         /* MIT Chaos-net. */
+-    ns_c_hs = 4,            /* MIT Hesiod. */
+-    /* Query class values which do not appear in resource records */
+-    ns_c_none = 254,        /* for prereq. sections in update requests */
+-    ns_c_any = 255,         /* Wildcard match. */
+-    ns_c_max = 65536
+-} ns_class;
+-
+-typedef enum __ns_type {
+-    ns_t_invalid = 0,       /* Cookie. */
+-    ns_t_a = 1,             /* Host address. */
+-    ns_t_ns = 2,            /* Authoritative server. */
+-    ns_t_md = 3,            /* Mail destination. */
+-    ns_t_mf = 4,            /* Mail forwarder. */
+-    ns_t_cname = 5,         /* Canonical name. */
+-    ns_t_soa = 6,           /* Start of authority zone. */
+-    ns_t_mb = 7,            /* Mailbox domain name. */
+-    ns_t_mg = 8,            /* Mail group member. */
+-    ns_t_mr = 9,            /* Mail rename name. */
+-    ns_t_null = 10,         /* Null resource record. */
+-    ns_t_wks = 11,          /* Well known service. */
+-    ns_t_ptr = 12,          /* Domain name pointer. */
+-    ns_t_hinfo = 13,        /* Host information. */
+-    ns_t_minfo = 14,        /* Mailbox information. */
+-    ns_t_mx = 15,           /* Mail routing information. */
+-    ns_t_txt = 16,          /* Text strings. */
+-    ns_t_rp = 17,           /* Responsible person. */
+-    ns_t_afsdb = 18,        /* AFS cell database. */
+-    ns_t_x25 = 19,          /* X_25 calling address. */
+-    ns_t_isdn = 20,         /* ISDN calling address. */
+-    ns_t_rt = 21,           /* Router. */
+-    ns_t_nsap = 22,         /* NSAP address. */
+-    ns_t_nsap_ptr = 23,     /* Reverse NSAP lookup (deprecated). */
+-    ns_t_sig = 24,          /* Security signature. */
+-    ns_t_key = 25,          /* Security key. */
+-    ns_t_px = 26,           /* X.400 mail mapping. */
+-    ns_t_gpos = 27,         /* Geographical position (withdrawn). */
+-    ns_t_aaaa = 28,         /* Ip6 Address. */
+-    ns_t_loc = 29,          /* Location Information. */
+-    ns_t_nxt = 30,          /* Next domain (security). */
+-    ns_t_eid = 31,          /* Endpoint identifier. */
+-    ns_t_nimloc = 32,       /* Nimrod Locator. */
+-    ns_t_srv = 33,          /* Server Selection. */
+-    ns_t_atma = 34,         /* ATM Address */
+-    ns_t_naptr = 35,        /* Naming Authority PoinTeR */
+-    ns_t_kx = 36,           /* Key Exchange */
+-    ns_t_cert = 37,         /* Certification record */
+-    ns_t_a6 = 38,           /* IPv6 address (deprecates AAAA) */
+-    ns_t_dname = 39,        /* Non-terminal DNAME (for IPv6) */
+-    ns_t_sink = 40,         /* Kitchen sink (experimentatl) */
+-    ns_t_opt = 41,          /* EDNS0 option (meta-RR) */
+-    ns_t_apl = 42,          /* Address prefix list (RFC3123) */
+-    ns_t_ds = 43,           /* Delegation Signer (RFC4034) */
+-    ns_t_sshfp = 44,        /* SSH Key Fingerprint (RFC4255) */
+-    ns_t_rrsig = 46,        /* Resource Record Signature (RFC4034) */
+-    ns_t_nsec = 47,         /* Next Secure (RFC4034) */
+-    ns_t_dnskey = 48,       /* DNS Public Key (RFC4034) */
+-    ns_t_tkey = 249,        /* Transaction key */
+-    ns_t_tsig = 250,        /* Transaction signature. */
+-    ns_t_ixfr = 251,        /* Incremental zone transfer. */
+-    ns_t_axfr = 252,        /* Transfer zone of authority. */
+-    ns_t_mailb = 253,       /* Transfer mailbox records. */
+-    ns_t_maila = 254,       /* Transfer mail agent records. */
+-    ns_t_any = 255,         /* Wildcard match. */
+-    ns_t_zxfr = 256,        /* BIND-specific, nonstandard. */
+-    ns_t_caa = 257,         /* Certification Authority Authorization. */
+-    ns_t_max = 65536
+-} ns_type;
+-
+-typedef enum __ns_opcode {
+-    ns_o_query = 0,         /* Standard query. */
+-    ns_o_iquery = 1,        /* Inverse query (deprecated/unsupported). */
+-    ns_o_status = 2,        /* Name server status query (unsupported). */
+-                                /* Opcode 3 is undefined/reserved. */
+-    ns_o_notify = 4,        /* Zone change notification. */
+-    ns_o_update = 5,        /* Zone update message. */
+-    ns_o_max = 6
+-} ns_opcode;
+-
+-typedef enum __ns_rcode {
+-    ns_r_noerror = 0,       /* No error occurred. */
+-    ns_r_formerr = 1,       /* Format error. */
+-    ns_r_servfail = 2,      /* Server failure. */
+-    ns_r_nxdomain = 3,      /* Name error. */
+-    ns_r_notimpl = 4,       /* Unimplemented. */
+-    ns_r_refused = 5,       /* Operation refused. */
+-    /* these are for BIND_UPDATE */
+-    ns_r_yxdomain = 6,      /* Name exists */
+-    ns_r_yxrrset = 7,       /* RRset exists */
+-    ns_r_nxrrset = 8,       /* RRset does not exist */
+-    ns_r_notauth = 9,       /* Not authoritative for zone */
+-    ns_r_notzone = 10,      /* Zone of record different from zone section */
+-    ns_r_max = 11,
+-    /* The following are TSIG extended errors */
+-    ns_r_badsig = 16,
+-    ns_r_badkey = 17,
+-    ns_r_badtime = 18
+-} ns_rcode;
+-
+-#endif /* HAVE_ARPA_NAMESER_H */
+-
+-
+-/* ============================================================================
+- * arpa/nameser_compat.h typically sets these.  However on some systems
+- * arpa/nameser.h does, but may not set all of them.  Lets conditionally
+- * define each
+- * ============================================================================
+- */
+-
+-#ifndef PACKETSZ
+-#  define PACKETSZ         NS_PACKETSZ
+-#endif
+-
+-#ifndef MAXDNAME
+-#  define MAXDNAME         NS_MAXDNAME
+-#endif
+-
+-#ifndef MAXCDNAME
+-#  define MAXCDNAME        NS_MAXCDNAME
+-#endif
+-
+-#ifndef MAXLABEL
+-#  define MAXLABEL         NS_MAXLABEL
+-#endif
+-
+-#ifndef HFIXEDSZ
+-#  define HFIXEDSZ         NS_HFIXEDSZ
+-#endif
+-
+-#ifndef QFIXEDSZ
+-#  define QFIXEDSZ         NS_QFIXEDSZ
+-#endif
+-
+-#ifndef RRFIXEDSZ
+-#  define RRFIXEDSZ        NS_RRFIXEDSZ
+-#endif
+-
+-#ifndef INDIR_MASK
+-#  define INDIR_MASK       NS_CMPRSFLGS
+-#endif
+-
+-#ifndef NAMESERVER_PORT
+-#  define NAMESERVER_PORT  NS_DEFAULTPORT
+-#endif
+-
+-
+-/* opcodes */
+-#ifndef O_QUERY
+-#  define O_QUERY 0  /* ns_o_query */
+-#endif
+-#ifndef O_IQUERY
+-#  define O_IQUERY 1 /* ns_o_iquery */
+-#endif
+-#ifndef O_STATUS
+-#  define O_STATUS 2 /* ns_o_status */
+-#endif
+-#ifndef O_NOTIFY
+-#  define O_NOTIFY 4 /* ns_o_notify */
+-#endif
+-#ifndef O_UPDATE
+-#  define O_UPDATE 5 /* ns_o_update */
+-#endif
+-
+-
+-/* response codes */
+-#ifndef SERVFAIL
+-#  define SERVFAIL        ns_r_servfail
+-#endif
+-#ifndef NOTIMP
+-#  define NOTIMP          ns_r_notimpl
+-#endif
+-#ifndef REFUSED
+-#  define REFUSED         ns_r_refused
+-#endif
+-#if defined(_WIN32) && !defined(HAVE_ARPA_NAMESER_COMPAT_H) && defined(NOERROR)
+-#  undef NOERROR /* it seems this is already defined in winerror.h */
+-#endif
+-#ifndef NOERROR
+-#  define NOERROR         ns_r_noerror
+-#endif
+-#ifndef FORMERR
+-#  define FORMERR         ns_r_formerr
+-#endif
+-#ifndef NXDOMAIN
+-#  define NXDOMAIN        ns_r_nxdomain
+-#endif
+-/* Non-standard response codes, use numeric values */
+-#ifndef YXDOMAIN
+-#  define YXDOMAIN        6 /* ns_r_yxdomain */
+-#endif
+-#ifndef YXRRSET
+-#  define YXRRSET         7 /* ns_r_yxrrset */
+-#endif
+-#ifndef NXRRSET
+-#  define NXRRSET         8 /* ns_r_nxrrset */
+-#endif
+-#ifndef NOTAUTH
+-#  define NOTAUTH         9 /* ns_r_notauth */
+-#endif
+-#ifndef NOTZONE
+-#  define NOTZONE         10 /* ns_r_notzone */
+-#endif
+-#ifndef TSIG_BADSIG
+-#  define TSIG_BADSIG     16 /* ns_r_badsig */
+-#endif
+-#ifndef TSIG_BADKEY
+-#  define TSIG_BADKEY     17 /* ns_r_badkey */
+-#endif
+-#ifndef TSIG_BADTIME
+-#  define TSIG_BADTIME    18 /* ns_r_badtime */
+-#endif
+-
+-
+-/* classes */
+-#ifndef C_IN
+-#  define C_IN            1 /* ns_c_in */
+-#endif
+-#ifndef C_CHAOS
+-#  define C_CHAOS         3 /* ns_c_chaos */
+-#endif
+-#ifndef C_HS
+-#  define C_HS            4 /* ns_c_hs */
+-#endif
+-#ifndef C_NONE
+-#  define C_NONE          254 /* ns_c_none */
+-#endif
+-#ifndef C_ANY
+-#  define C_ANY           255 /*  ns_c_any */
+-#endif
+-
+-
+-/* types */
+-#ifndef T_A
+-#  define T_A             1   /* ns_t_a */
+-#endif
+-#ifndef T_NS
+-#  define T_NS            2   /* ns_t_ns */
+-#endif
+-#ifndef T_MD
+-#  define T_MD            3   /* ns_t_md */
+-#endif
+-#ifndef T_MF
+-#  define T_MF            4   /* ns_t_mf */
+-#endif
+-#ifndef T_CNAME
+-#  define T_CNAME         5   /* ns_t_cname */
+-#endif
+-#ifndef T_SOA
+-#  define T_SOA           6   /* ns_t_soa */
+-#endif
+-#ifndef T_MB
+-#  define T_MB            7   /* ns_t_mb */
+-#endif
+-#ifndef T_MG
+-#  define T_MG            8   /* ns_t_mg */
+-#endif
+-#ifndef T_MR
+-#  define T_MR            9   /* ns_t_mr */
+-#endif
+-#ifndef T_NULL
+-#  define T_NULL          10  /* ns_t_null */
+-#endif
+-#ifndef T_WKS
+-#  define T_WKS           11  /* ns_t_wks */
+-#endif
+-#ifndef T_PTR
+-#  define T_PTR           12  /* ns_t_ptr */
+-#endif
+-#ifndef T_HINFO
+-#  define T_HINFO         13  /* ns_t_hinfo */
+-#endif
+-#ifndef T_MINFO
+-#  define T_MINFO         14  /* ns_t_minfo */
+-#endif
+-#ifndef T_MX
+-#  define T_MX            15  /* ns_t_mx */
+-#endif
+-#ifndef T_TXT
+-#  define T_TXT           16  /* ns_t_txt */
+-#endif
+-#ifndef T_RP
+-#  define T_RP            17  /* ns_t_rp */
+-#endif
+-#ifndef T_AFSDB
+-#  define T_AFSDB         18  /* ns_t_afsdb */
+-#endif
+-#ifndef T_X25
+-#  define T_X25           19  /* ns_t_x25 */
+-#endif
+-#ifndef T_ISDN
+-#  define T_ISDN          20  /* ns_t_isdn */
+-#endif
+-#ifndef T_RT
+-#  define T_RT            21  /* ns_t_rt */
+-#endif
+-#ifndef T_NSAP
+-#  define T_NSAP          22  /* ns_t_nsap */
+-#endif
+-#ifndef T_NSAP_PTR
+-#  define T_NSAP_PTR      23  /* ns_t_nsap_ptr */
+-#endif
+-#ifndef T_SIG
+-#  define T_SIG           24  /* ns_t_sig */
+-#endif
+-#ifndef T_KEY
+-#  define T_KEY           25  /* ns_t_key */
+-#endif
+-#ifndef T_PX
+-#  define T_PX            26  /* ns_t_px */
+-#endif
+-#ifndef T_GPOS
+-#  define T_GPOS          27  /* ns_t_gpos */
+-#endif
+-#ifndef T_AAAA
+-#  define T_AAAA          28  /* ns_t_aaaa */
+-#endif
+-#ifndef T_LOC
+-#  define T_LOC           29  /* ns_t_loc */
+-#endif
+-#ifndef T_NXT
+-#  define T_NXT           30  /* ns_t_nxt */
+-#endif
+-#ifndef T_EID
+-#  define T_EID           31  /* ns_t_eid */
+-#endif
+-#ifndef T_NIMLOC
+-#  define T_NIMLOC        32  /* ns_t_nimloc */
+-#endif
+-#ifndef T_SRV
+-#  define T_SRV           33  /* ns_t_srv */
+-#endif
+-#ifndef T_ATMA
+-#  define T_ATMA          34  /* ns_t_atma */
+-#endif
+-#ifndef T_NAPTR
+-#  define T_NAPTR         35  /* ns_t_naptr */
+-#endif
+-#ifndef T_KX
+-#  define T_KX            36  /* ns_t_kx */
+-#endif
+-#ifndef T_CERT
+-#  define T_CERT          37  /* ns_t_cert */
+-#endif
+-#ifndef T_A6
+-#  define T_A6            38  /* ns_t_a6 */
+-#endif
+-#ifndef T_DNAME
+-#  define T_DNAME         39  /* ns_t_dname */
+-#endif
+-#ifndef T_SINK
+-#  define T_SINK          40  /* ns_t_sink */
+-#endif
+-#ifndef T_OPT
+-#  define T_OPT           41  /* ns_t_opt */
+-#endif
+-#ifndef T_APL
+-#  define T_APL           42  /* ns_t_apl */
+-#endif
+-#ifndef T_DS
+-#  define T_DS            43  /* ns_t_ds */
+-#endif
+-#ifndef T_SSHFP
+-#  define T_SSHFP         44  /* ns_t_sshfp */
+-#endif
+-#ifndef T_RRSIG
+-#  define T_RRSIG         46  /* ns_t_rrsig */
+-#endif
+-#ifndef T_NSEC
+-#  define T_NSEC          47  /* ns_t_nsec */
+-#endif
+-#ifndef T_DNSKEY
+-#  define T_DNSKEY        48  /* ns_t_dnskey */
+-#endif
+-#ifndef T_TKEY
+-#  define T_TKEY          249 /* ns_t_tkey */
+-#endif
+-#ifndef T_TSIG
+-#  define T_TSIG          250 /* ns_t_tsig */
+-#endif
+-#ifndef T_IXFR
+-#  define T_IXFR          251 /* ns_t_ixfr */
+-#endif
+-#ifndef T_AXFR
+-#  define T_AXFR          252 /* ns_t_axfr */
+-#endif
+-#ifndef T_MAILB
+-#  define T_MAILB         253 /* ns_t_mailb */
+-#endif
+-#ifndef T_MAILA
+-#  define T_MAILA         254 /* ns_t_maila */
+-#endif
+-#ifndef T_ANY
+-#  define T_ANY           255 /* ns_t_any */
+-#endif
+-#ifndef T_ZXFR
+-#  define T_ZXFR          256 /* ns_t_zxfr */
+-#endif
+-#ifndef T_CAA
+-#  define T_CAA           257 /* ns_t_caa */
+-#endif
+-#ifndef T_MAX
+-#  define T_MAX         65536 /* ns_t_max */
+-#endif
+-
+-
+-#endif /* ARES_NAMESER_H */
+-- 
+2.20.1
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
