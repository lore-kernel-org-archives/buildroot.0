Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6F7C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 23:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C90440445;
	Tue, 15 Nov 2022 23:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C90440445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIwBaLXXBA7e; Tue, 15 Nov 2022 23:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 043C640B62;
	Tue, 15 Nov 2022 23:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 043C640B62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAC11BF421
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBB3760EF2
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB3760EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itygH2LmYCf4 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8023160EDB
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8023160EDB
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFNTftH001075; Tue, 15 Nov 2022 15:52:58 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kvmg4829r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 15:52:58 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B075400B7;
 Tue, 15 Nov 2022 23:52:57 +0000 (UTC)
Received: from de02arcdev2.internal.synopsys.com
 (de02arcdev2.internal.synopsys.com [10.225.41.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id D00B3A005E;
 Tue, 15 Nov 2022 23:52:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 00:52:34 +0100
Message-Id: <20221115235235.74897-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20221115235235.74897-1-abrodkin@synopsys.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
X-Proofpoint-ORIG-GUID: Qs_7ELZIqC9vp_6WKRXBoiKeh09Ai08h
X-Proofpoint-GUID: Qs_7ELZIqC9vp_6WKRXBoiKeh09Ai08h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211150164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=pfptdkimsnps;
 bh=CXj2H/HGWZmuM4SnOjjuyxiLxDfvBlrYsjsPJSJ2iCQ=;
 b=LDq8ou51DB2KrPqPqdPtC3Jnm7GzSksTkbWl8n41A7RvQrTHejIBzRwguv9F3b1+mzmo
 2wj30KxLmH+WKjW7iieuruJl08Iii978Sts/MlbAjL+/b9h/6npS2oqoZUZ2rmr4J/i0
 CqbXRccMGYta9Iv9MSe3yI2iqQRUgF60wI4xfapRAhkJjTcj67QE+RouhyOIEGC6ylwK
 PO9CqXYfWkCsGnJ32w0YDQyiuPtytrCJzZhwyf6TEKZAzwmZ4rD3XMnF5j227Cpcsl3H
 naNn88m56k1majt0FkXBvqHJhw2AkEE7eFkVOf9IrPgC8AUezDb/feScRjv6TZqPPxxl Dg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1668556378; bh=nJrMBVN9siS6NZ2KQ1/AfNEmIcjs0K8K1DaCFzlqT8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TEOPWgrejk5k8uLDUMptMvZy3sWif9Ga/mkwzuShbmEherGVwXntee7mlPQXXko5k
 kAVaQFyuuksAeiY8WLYN642UTUhJ1wl1SVCKNThw4hqjNBiyW5EUej+LRlGYSfhhz8
 7kjJ+0PcGtLZ/+OfuPOoVQnG76C7d5wvMy4c1dJkz4cBlkp4515+5Lw9r9kln4EWNu
 KDvNfqOlEkNT++4C1Ud1c7KkzFEVOQQJI+K5X5i2m1emZb7NsSli4LHZr1GQE1pc2S
 9tNakyQODCXWr0FE+m4cDoVkYKaDqidm4onEpd+bCOTg8E0UklvoSwzuGzuvZgQ7JV
 GJTQzRiHjdcUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=LDq8ou51; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=TEOPWgre
Subject: [Buildroot] [PATCH 1/2] package/glibc: add support for ARC700
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Even though ARC700 glibc port is very close to ARCv2 port, it is formally
another ABI that requires appropriate maintenance. That includes running
extensive glibc test-suite and fixing discovered issues and regressions.
That effort was considered impractical due to ARCompact ISA reaching EOL.
Besides ARC700 processors are usually found on very resource constrained
devices that tend to use uClibc if they run Linux.

On the other hand adding ARC700 glibc support still can be useful for
development and testing purposes. This commit adds two glibc patches
that enable ARC700 support.

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/3259666747 and
the likes.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../glibc/0003-ARC-Synopsys-ARC700-support.patch   | 208 +++++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 package/glibc/0003-ARC-Synopsys-ARC700-support.patch

diff --git a/package/glibc/0003-ARC-Synopsys-ARC700-support.patch b/package/glibc/0003-ARC-Synopsys-ARC700-support.patch
new file mode 100644
index 0000000000..187824da72
--- /dev/null
+++ b/package/glibc/0003-ARC-Synopsys-ARC700-support.patch
@@ -0,0 +1,208 @@
+From f835f30c15d55db42dbbdfa33e9560844d5bf071 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
+Date: Wed, 16 Nov 2022 00:34:06 +0100
+Subject: [PATCH] ARC: Synopsys ARC700 support
+
+Synopsys ARC700 processors are not supported by glibc out of the box.
+Meanwhile ARC700 glibc port is very similar to ARCv2 port. Original
+glibc patch included both ARC700 and ARCv2:
+- https://sourceware.org/pipermail/libc-alpha/2020-March/111855.html
+
+For ARC700 specific changes see patches 5 and 8 from that series:
+- https://sourceware.org/pipermail/libc-alpha/2020-March/111851.html
+- https://sourceware.org/pipermail/libc-alpha/2020-March/111858.html
+
+However ARC700 changes have been dropped from the later revisions of
+ARCv2 glibc patch series. So they have not been added to mainline
+glibc together with ARCv2 port.
+
+This patch is based on the original ARC700 glibc work. It adds all
+the missing pieces required to make glibc work on ARC700. Besides,
+this patch adds specific loader name according to Linux target
+triplet for ARC700.
+
+Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
+---
+ config.h.in                                |  3 +++
+ sysdeps/arc/atomic-machine.h               |  4 ++++
+ sysdeps/arc/configure                      | 29 +++++++++++++++++++++++++++++
+ sysdeps/arc/configure.ac                   | 11 +++++++++++
+ sysdeps/unix/sysv/linux/arc/ldconfig.h     |  8 +++++---
+ sysdeps/unix/sysv/linux/arc/shlib-versions |  8 ++++++++
+ sysdeps/unix/sysv/linux/arc/syscall.S      |  5 +++++
+ sysdeps/unix/sysv/linux/arc/sysdep.h       |  8 ++++++++
+ 8 files changed, 73 insertions(+), 3 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index 43d32518ab..46863cc507 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -120,6 +120,9 @@
+ /* ARC big endian ABI */
+ #undef HAVE_ARC_BE
+ 
++/* ARC 700 */
++#undef HAVE_ARC700
++
+ /* C-SKY ABI version.  */
+ #undef CSKYABI
+ 
+diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
+index 3d17f78990..35992f1540 100644
+--- a/sysdeps/arc/atomic-machine.h
++++ b/sysdeps/arc/atomic-machine.h
+@@ -52,6 +52,10 @@
+   __atomic_val_bysize (__arch_compare_and_exchange_val, int,		\
+ 		       mem, new, old, __ATOMIC_ACQUIRE)
+ 
++#ifdef __ARC700__
++#define atomic_full_barrier()  ({ asm volatile ("sync":::"memory"); })
++#else
+ #define atomic_full_barrier()  ({ asm volatile ("dmb 3":::"memory"); })
++#endif
+ 
+ #endif /* _ARC_BITS_ATOMIC_H */
+diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
+index 92050f44e3..e5916c9615 100644
+--- a/sysdeps/arc/configure
++++ b/sysdeps/arc/configure
+@@ -178,3 +178,32 @@ else
+   config_vars="$config_vars
+ default-abi = arcle"
+ fi
++
++# For ARC700 ABI, generate a symbol for shlib-versions
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for arc700" >&5
++$as_echo_n "checking for arc700... " >&6; }
++if ${libc_cv_arc700+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#ifdef __ARC700__
++                      yes
++                     #endif
++
++_ACEOF
++if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
++  $EGREP "yes" >/dev/null 2>&1; then :
++  libc_cv_arc700=yes
++else
++  libc_cv_arc700=no
++fi
++rm -f conftest*
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_arc700" >&5
++$as_echo "$libc_cv_arc700" >&6; }
++if test $libc_cv_arc700 = yes; then
++  $as_echo "#define HAVE_ARC700 1" >>confdefs.h
++
++fi
+diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
+index 619da4e088..3d10fbde6b 100644
+--- a/sysdeps/arc/configure.ac
++++ b/sysdeps/arc/configure.ac
+@@ -23,3 +23,14 @@ if test $libc_cv_arc_be = yes; then
+ else
+   LIBC_CONFIG_VAR([default-abi], [arcle])
+ fi
++
++# For ARC700 ABI, generate a symbol for shlib-versions
++AC_CACHE_CHECK([for arc700],
++  [libc_cv_arc700],
++  [AC_EGREP_CPP(yes,[#ifdef __ARC700__
++                      yes
++                     #endif
++  ], libc_cv_arc700=yes, libc_cv_arc700=no)])
++if test $libc_cv_arc700 = yes; then
++  AC_DEFINE(HAVE_ARC700)
++fi
+diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h
+index f673170e59..bb1f5eb64a 100644
+--- a/sysdeps/unix/sysv/linux/arc/ldconfig.h
++++ b/sysdeps/unix/sysv/linux/arc/ldconfig.h
+@@ -18,9 +18,11 @@
+ 
+ #include <sysdeps/generic/ldconfig.h>
+ 
+-#define SYSDEP_KNOWN_INTERPRETER_NAMES 		\
+-  { "/lib/ld-linux-arc.so.2", FLAG_ELF_LIBC6 },	\
+-  { "/lib/ld-linux-arceb.so.2", FLAG_ELF_LIBC6 },
++#define SYSDEP_KNOWN_INTERPRETER_NAMES 			\
++  { "/lib/ld-linux-arc.so.2", FLAG_ELF_LIBC6 },		\
++  { "/lib/ld-linux-arceb.so.2", FLAG_ELF_LIBC6 },	\
++  { "/lib/ld-linux-arc700.so.2", FLAG_ELF_LIBC6 },	\
++  { "/lib/ld-linux-arc700eb.so.2", FLAG_ELF_LIBC6 },
+ 
+ #define SYSDEP_KNOWN_LIBRARY_NAMES 	\
+   { "libc.so.6", FLAG_ELF_LIBC6 },	\
+diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
+index 343c0a0450..ab263bf2fb 100644
+--- a/sysdeps/unix/sysv/linux/arc/shlib-versions
++++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
+@@ -1,7 +1,15 @@
+ DEFAULT                 GLIBC_2.32
+ 
++%ifdef HAVE_ARC700
++%ifdef HAVE_ARC_BE
++ld=ld-linux-arc700eb.so.2
++%else
++ld=ld-linux-arc700.so.2
++%endif
++%else
+ %ifdef HAVE_ARC_BE
+ ld=ld-linux-arceb.so.2
+ %else
+ ld=ld-linux-arc.so.2
+ %endif
++%endif
+diff --git a/sysdeps/unix/sysv/linux/arc/syscall.S b/sysdeps/unix/sysv/linux/arc/syscall.S
+index 2aa4d9d65a..63f76d00d3 100644
+--- a/sysdeps/unix/sysv/linux/arc/syscall.S
++++ b/sysdeps/unix/sysv/linux/arc/syscall.S
+@@ -24,8 +24,13 @@ ENTRY (syscall)
+ 	mov_s	r1, r2
+ 	mov_s	r2, r3
+ 	mov_s	r3, r4
++#ifdef __ARC700__
++	mov	r4, r5
++	mov	r5, r6
++#else
+ 	mov_s	r4, r5
+ 	mov_s	r5, r6
++#endif
+ 
+ 	ARC_TRAP_INSN
+ 	brhi	r0, -4096, L (call_syscall_err)
+diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
+index d0c1a78381..a65d7b09a1 100644
+--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
++++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
+@@ -128,7 +128,11 @@ L (call_syscall_err):			ASM_LINE_SEP	\
+     mov    r8, __NR_##syscall_name	ASM_LINE_SEP	\
+     ARC_TRAP_INSN			ASM_LINE_SEP
+ 
++# ifdef __ARC700__
++# define ARC_TRAP_INSN	trap0
++# else
+ # define ARC_TRAP_INSN	trap_s 0
++# endif
+ 
+ #else  /* !__ASSEMBLER__ */
+ 
+@@ -137,7 +141,11 @@ extern long int __syscall_error (long int);
+ hidden_proto (__syscall_error)
+ # endif
+ 
++# ifdef __ARC700__
++# define ARC_TRAP_INSN	"trap0		\n\t"
++# else
+ # define ARC_TRAP_INSN	"trap_s 0	\n\t"
++#endif
+ 
+ # undef INTERNAL_SYSCALL_NCS
+ # define INTERNAL_SYSCALL_NCS(number, nr_args, args...)	\
+-- 
+2.16.2
+
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
