Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10462C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A732420A2;
	Sat,  6 Jan 2024 21:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A732420A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dx7lH-5MvDiS; Sat,  6 Jan 2024 21:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A9B4209D;
	Sat,  6 Jan 2024 21:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A9B4209D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 392C41BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C65760B3B
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C65760B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7oaGwYv-Ff7 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:21:21 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD08960B3D
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD08960B3D
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 406Br4EA020012; Sat, 6 Jan 2024 13:21:18 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vf6cg156w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jan 2024 13:21:17 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDC35403B9;
 Sat,  6 Jan 2024 21:21:15 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com (unknown [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 6D3AEA0079;
 Sat,  6 Jan 2024 21:21:15 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 13:20:59 -0800
Message-Id: <20240106212059.3739123-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240106212059.3739123-1-abrodkin@synopsys.com>
References: <20240106212059.3739123-1-abrodkin@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: rsQDxuVLAbYytD-Zp8u9a-5vXdtYZ2-O
X-Proofpoint-GUID: rsQDxuVLAbYytD-Zp8u9a-5vXdtYZ2-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=950 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401060139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=pfptdkimsnps; bh=4bYJ
 KY97vs874C9Ux890aHZOoCVywhvqLeA7a3zdEvI=; b=NVMLVjr9J22LQKCiGoY/
 mPSKpplbjHqIzWpIELqay4Djk7ibTigEaHQosYrPB973I7rU1GjlN61Ciuw02Lbf
 35FonOfaF+2up4HivPKTbZ0K6/2YoqExsgVQn2lbATxA1+SkVJpzakNgFPpiYuKf
 n+OQIz6c5tb2vfSiahC0BzGRpWyf1NcaATwau6z6kgE4wv2bGA4GXZk7Jqjhlg0N
 YWZ9I+OnD+nu8iUoq4REk7AgJB+O0bODkO93wpjLXeAnhQm1kPa0wWTgudH/2jw8
 BAvm+fpqqDi0Jw+MyHVbacHyH79iBJj4qD/YuG0xvExkQ8TaFNJBmlFZ/0UDF+LJ
 cg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704576076; bh=SYeEPS6whTRvnE9+22SO4vad/O4o1Wk/6WxdSP+RpZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eHGU0yKqVO4BI0vQ7SO8xT0G04mhqs2OyQWC/H1GdR6finl3nkpl8IPQL3DmGXeDY
 pMJyf2VW7iNSgcqBmvodU8ndVzzLRnArO+yu8BQMuV2D13Enb5I0fAjpv/UEf3AaZ8
 /9MjAkXiKplbTpTZPY6KVIzaimNAAG8aGgtN2VPLnzs1o6xN5xsy4ZjCYtBHeyT9Fu
 MVrmB0MKde1WhQDszxR0P/p4Ox5PWIgdDyVcUWLMO4oPZuylgTTwKgho/S3tkjrKrk
 idwnGpvKaeSBDHdWXIvX/GlvrKXB3KXfLKeuTIeQjUDuM0Mq4l6OWuOXlx6yYqeN2u
 8Pj7fzZ+WgfFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=NVMLVjr9; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=eHGU0yKq
Subject: [Buildroot] [PATCH v2 3/3] libffi: ARCv3: Switch to upstream version
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, thomas.petazzoni@bootlin.com,
 geomatsi@gmail.com, artem.panfilov@nokia.com, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARCv3 processors support was added to the upstream libffi project
a while ago, see [1]. Both 32- (ARC HS58) and 64-bit (ARC HS68 ) versions
are supported.

Unfortunately, there was no release of libffi since October 2022 and
so our changes got stuck in their development branch. Thus, we need to
apply that change to the Buildroot separately.

[1] https://github.com/libffi/libffi/commit/c4df19c99f8d8841942e3edaadbf331d30e298c8

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Tested-By: Waldemar Brodkorb <wbx@openadk.org>
---

Changes in v2:

 - Added Waldemar's Tested-by tag

 .../0004-Update-ARC-s-libffi-port-771.patch   | 871 ++++++++++++++++++
 1 file changed, 871 insertions(+)
 create mode 100644 package/libffi/0004-Update-ARC-s-libffi-port-771.patch

diff --git a/package/libffi/0004-Update-ARC-s-libffi-port-771.patch b/package/libffi/0004-Update-ARC-s-libffi-port-771.patch
new file mode 100644
index 0000000000..a0d93b91db
--- /dev/null
+++ b/package/libffi/0004-Update-ARC-s-libffi-port-771.patch
@@ -0,0 +1,871 @@
+From 9a494f3902cb9c096c98033311c24a61b6ecb73c Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@gmail.com>
+Date: Sat, 18 Feb 2023 03:33:47 +0200
+Subject: [PATCH] Update ARC's libffi port (#771)
+
+* Add support for ARC and ARC64
+
+Add support for ARC/ARC32/ARC64
+
+* Implementation of GO Closure for ARC/ARC32/ARC64 Architectures
+
+---------
+
+Co-authored-by: Nuno Cardoso <cardoso@synopsys.com>
+Co-authored-by: Luis Silva <luiss@synopsys.com>
+---
+ src/arc/arcompact.S | 263 +++++++++++++++---------
+ src/arc/ffi.c       | 473 ++++++++++++++++++++++++++++++--------------
+ src/arc/ffitarget.h |  14 ++
+ 3 files changed, 508 insertions(+), 242 deletions(-)
+
+diff --git a/src/arc/arcompact.S b/src/arc/arcompact.S
+index 03715fd..1d7f1a1 100644
+--- a/src/arc/arcompact.S
++++ b/src/arc/arcompact.S
+@@ -33,103 +33,178 @@
+ #define ENTRY(x) .globl CNAME(x)` .type CNAME(x),%function` CNAME(x):
+ #endif
+ 
++#if __SIZEOF_POINTER__ == 8
++#define PTRS 8
++#define FLTS 8
++#define LARG ldl
++#define SARG stl
++#define ADDPTR addl
++#define MOVPTR movl_s
++#else
++#define PTRS 4
++#define FLTS 4
++#define LARG ld
++#define SARG st
++#define ADDPTR add
++#define MOVPTR mov_s
++#endif
++
++#define FRAME_LEN (8 * PTRS + 16)
++
+ .text
+ 
+-        /* R0:   ffi_prep_args */
+-        /* R1:   &ecif */
+-        /* R2:   cif->bytes */
+-        /* R3:   fig->flags */
+-        /* R4:   ecif.rvalue */
+-        /* R5:   fn */
+-ENTRY(ffi_call_ARCompact)
++ENTRY(ffi_call_asm)
++        .cfi_startproc
++
+         /* Save registers.  */
+-        st.a       fp, [sp, -4]        /* fp + 20, fp */
+-        push_s     blink               /* fp + 16, blink */
+-        st.a       r4, [sp, -4]        /* fp + 12, ecif.rvalue */
+-        push_s     r3                  /* fp +  8, fig->flags */
+-        st.a       r5, [sp, -4]        /* fp +  4, fn */
+-        push_s     r2                  /* fp +  0, cif->bytes */
+-        mov        fp, sp
+-
+-        /* Make room for all of the new args.  */
+-        sub        sp, sp, r2
+-
+-        /* Place all of the ffi_prep_args in position.  */
+-        /* ffi_prep_args(char *stack, extended_cif *ecif) */
+-        /* R1 already set.  */
+-
+-        /* And call.  */
+-        jl_s.d     [r0]
+-        mov_s      r0, sp
+-
+-        ld.ab      r12, [fp, 4]        /* cif->bytes */
+-        ld.ab      r11, [fp, 4]        /* fn */
+-
+-        /* Move first 8 parameters in registers...  */
+-        ld_s       r0, [sp]
+-        ld_s       r1, [sp, 4]
+-        ld_s       r2, [sp, 8]
+-        ld_s       r3, [sp, 12]
+-        ld         r4, [sp, 16]
+-        ld         r5, [sp, 20]
+-        ld         r6, [sp, 24]
+-        ld         r7, [sp, 28]
+-
+-        /* ...and adjust the stack.  */
+-        min        r12, r12, 32
++        .cfi_def_cfa r1, FRAME_LEN
++        SARG    fp, [r1, FRAME_LEN - 2*PTRS]
++        .cfi_offset fp, -2*PTRS
++        SARG    blink, [r1, FRAME_LEN - 1*PTRS]
++        .cfi_offset blink, -1*PTRS
++        ADDPTR  fp, r1, FRAME_LEN
++        MOVPTR  sp, r0
++        .cfi_def_cfa fp, 0
++
++        /* Load arguments.  */
++        MOVPTR  r11, r2      /* fn */
++        MOVPTR  r12, r3      /* closure */
++
++        /* Save arguments.  */
++        LARG    r0, [fp, -FRAME_LEN+0*PTRS]
++        LARG    r1, [fp, -FRAME_LEN+1*PTRS]
++        LARG    r2, [fp, -FRAME_LEN+2*PTRS]
++        LARG    r3, [fp, -FRAME_LEN+3*PTRS]
++        LARG    r4, [fp, -FRAME_LEN+4*PTRS]
++        LARG    r5, [fp, -FRAME_LEN+5*PTRS]
++        LARG    r6, [fp, -FRAME_LEN+6*PTRS]
++        LARG    r7, [fp, -FRAME_LEN+7*PTRS]
+ 
+         /* Call the function.  */
+-        jl.d       [r11]
+-        add        sp, sp, r12 
+-
+-        mov        sp, fp        
+-        pop_s      r3        /* fig->flags, return type */
+-        pop_s      r2        /* ecif.rvalue, pointer for return value */
+-
+-        /* If the return value pointer is NULL, assume no return value.  */
+-        breq.d     r2, 0, epilogue
+-        pop_s      blink
+-
+-        /* Return INT.  */
+-        brne       r3, FFI_TYPE_INT, return_double
+-        b.d        epilogue
+-        st_s       r0, [r2]        
+-
+-return_double:
+-        brne       r3, FFI_TYPE_DOUBLE, epilogue
+-        st_s       r0, [r2]        
+-        st_s       r1, [r2,4]
+-
+-epilogue:
+-        j_s.d      [blink]
+-        ld.ab      fp, [sp, 4]
+-
+-ENTRY(ffi_closure_ARCompact)
+-        st.a       r0, [sp, -32]
+-        st_s       r1, [sp, 4]
+-        st_s       r2, [sp, 8]
+-        st_s       r3, [sp, 12]
+-        st         r4, [sp, 16]
+-        st         r5, [sp, 20]
+-        st         r6, [sp, 24]
+-        st         r7, [sp, 28]
+-
+-        /* pointer to arguments */
+-        mov_s      r2, sp
+-
+-        /* return value goes here */
+-        sub        sp, sp, 8
+-        mov_s      r1, sp
+-
+-        push_s     blink
++        jl         [r11] 
++
++        /* Save return value (r0/r1)  */
++        SARG    r0, [fp, -FRAME_LEN+0*PTRS]
++        SARG    r1, [fp, -FRAME_LEN+1*PTRS]
++
++        /* Restore and return.  */
++        add     sp, fp, -FRAME_LEN
++        .cfi_def_cfa sp, FRAME_LEN
++        LARG    blink, [fp, -1*PTRS]
++        .cfi_restore blink
++        LARG    fp, [fp, -2*PTRS]
++        .cfi_restore fp
++        j_s     [blink]
++        .cfi_endproc
++        .size   ffi_call_asm, .-ffi_call_asm
++
++/*
++  ffi_closure_asm. Expects address of the passed-in ffi_closure in r8.
++  void ffi_closure_inner (ffi_cif *cif,
++		          void (*fun) (ffi_cif *, void *, void **, void *),
++		          void *user_data,
++		          size_t *stackargs, struct call_context *regargs)
++*/
++
++ENTRY(ffi_closure_asm)
++        .cfi_startproc
++
++        ADDPTR  sp, sp, -FRAME_LEN
++        .cfi_def_cfa_offset FRAME_LEN
++
++        /* Make a frame.  */
++        SARG    fp, [sp, FRAME_LEN-2*PTRS]
++        .cfi_offset fp, -2*PTRS
++        SARG    blink, [sp, FRAME_LEN-1*PTRS]
++        .cfi_offset blink, -1*PTRS
++        ADDPTR  fp, sp, FRAME_LEN
++
++        /* Save arguments.  */
++        SARG    r0, [sp, 0*PTRS]
++        SARG    r1, [sp, 1*PTRS]
++        SARG    r2, [sp, 2*PTRS]
++        SARG    r3, [sp, 3*PTRS]
++        SARG    r4, [sp, 4*PTRS]
++        SARG    r5, [sp, 5*PTRS]
++        SARG    r6, [sp, 6*PTRS]
++        SARG    r7, [sp, 7*PTRS]
++
++        /* Enter C.  */
++        LARG    r0, [r8, FFI_TRAMPOLINE_SIZE+0*PTRS]
++        LARG    r1, [r8, FFI_TRAMPOLINE_SIZE+1*PTRS]
++        LARG    r2, [r8, FFI_TRAMPOLINE_SIZE+2*PTRS]
++        ADDPTR  r3, sp, FRAME_LEN
++        MOVPTR  r4, sp
++
++        /* Call the C code.  */
++        bl      ffi_closure_inner
+         
+-        bl.d       ffi_closure_inner_ARCompact
+-        mov_s      r0, r8                /* codeloc, set by trampoline */
+-
+-        pop_s      blink
+-
+-        /* set return value to r1:r0 */
+-        pop_s      r0
+-        pop_s      r1
+-        j_s.d      [blink]
+-        add_s      sp, sp, 32
++        /* Return values.  */
++        LARG    r0, [sp, 0*PTRS]
++        LARG    r1, [sp, 1*PTRS]
++
++        /* Restore and return.  */
++        LARG    blink, [sp, FRAME_LEN-1*PTRS]
++        .cfi_restore blink
++        LARG    fp, [sp, FRAME_LEN-2*PTRS]
++        .cfi_restore fp
++        ADDPTR  sp, sp, FRAME_LEN
++        .cfi_def_cfa_offset 0
++        j_s     [blink]
++        .cfi_endproc
++        .size ffi_closure_asm, .-ffi_closure_asm
++
++/*
++  ffi_go_closure_asm.  Expects address of the passed-in ffi_go_closure in r12.
++  void ffi_closure_inner (ffi_cif *cif,
++		          void (*fun) (ffi_cif *, void *, void **, void *),
++		          void *user_data,
++		          size_t *stackargs, struct call_context *regargs)
++*/
++
++ENTRY(ffi_go_closure_asm)
++        .cfi_startproc
++
++        ADDPTR  sp, sp, -FRAME_LEN
++        .cfi_def_cfa_offset FRAME_LEN
++
++        /* make a frame */
++        SARG    fp, [sp, FRAME_LEN-2*PTRS]
++        .cfi_offset fp, -2*PTRS
++        SARG    blink, [sp, FRAME_LEN-1*PTRS]
++        .cfi_offset blink, -1*PTRS
++        ADDPTR  fp, sp, FRAME_LEN
++
++        /* save arguments */
++        SARG    r0, [sp, 0*PTRS]
++        SARG    r1, [sp, 1*PTRS]
++        SARG    r2, [sp, 2*PTRS]
++        SARG    r3, [sp, 3*PTRS]
++        SARG    r4, [sp, 4*PTRS]
++        SARG    r5, [sp, 5*PTRS]
++        SARG    r6, [sp, 6*PTRS]
++        SARG    r7, [sp, 7*PTRS]
++
++        /* enter C */
++        LARG    r0, [r12, 1*PTRS]
++        LARG    r1, [r12, 2*PTRS]
++        MOVPTR  r2, r12
++        ADDPTR  r3, sp, FRAME_LEN
++        MOVPTR  r4, sp
++
++        bl      ffi_closure_inner
++
++        /* Return values. */
++        LARG    r0, [sp, 0*PTRS]
++        LARG    r1, [sp, 1*PTRS]
++
++
++        LARG    blink, [sp, FRAME_LEN-1*PTRS]
++        .cfi_restore blink
++        LARG    fp, [sp, FRAME_LEN-2*PTRS]
++        .cfi_restore fp
++        ADDPTR  sp, sp, FRAME_LEN
++        .cfi_def_cfa_offset 0
++        j_s     [blink]
++        .cfi_endproc
++        .size ffi_go_closure_asm, .-ffi_go_closure_asm
+diff --git a/src/arc/ffi.c b/src/arc/ffi.c
+index 4d10b21..d729274 100644
+--- a/src/arc/ffi.c
++++ b/src/arc/ffi.c
+@@ -31,6 +31,34 @@
+ 
+ #include <sys/cachectl.h>
+ 
++#define NARGREG 8
++#define STKALIGN 4
++#define MAXCOPYARG (2 * sizeof(double))
++
++typedef struct call_context
++{
++  size_t r[8];
++  /* used by the assembly code to in-place construct its own stack frame */
++  char frame[16];
++} call_context;
++
++typedef struct call_builder
++{
++  call_context *aregs;
++  int used_integer;
++  //int used_float;
++  size_t *used_stack;
++  void *struct_stack;
++} call_builder;
++
++/* integer (not pointer) less than ABI XLEN */
++/* FFI_TYPE_INT does not appear to be used */
++#if defined(__ARC64_ARCH64__)
++#define IS_INT(type) ((type) >= FFI_TYPE_UINT8 && (type) <= FFI_TYPE_SINT64)
++#else
++#define IS_INT(type) ((type) >= FFI_TYPE_UINT8 && (type) <= FFI_TYPE_SINT32)
++#endif
++
+ /* for little endian ARC, the code is in fact stored as mixed endian for
+    performance reasons */
+ #if __BIG_ENDIAN__
+@@ -39,94 +67,6 @@
+ #define CODE_ENDIAN(x) ( (((uint32_t) (x)) << 16) | (((uint32_t) (x)) >> 16))
+ #endif
+ 
+-/* ffi_prep_args is called by the assembly routine once stack
+-   space has been allocated for the function's arguments.  */
+-
+-void
+-ffi_prep_args (char *stack, extended_cif * ecif)
+-{
+-  unsigned int i;
+-  void **p_argv;
+-  char *argp;
+-  ffi_type **p_arg;
+-
+-  argp = stack;
+-
+-  if (ecif->cif->rtype->type == FFI_TYPE_STRUCT)
+-    {
+-      *(void **) argp = ecif->rvalue;
+-      argp += 4;
+-    }
+-
+-  p_argv = ecif->avalue;
+-
+-  for (i = ecif->cif->nargs, p_arg = ecif->cif->arg_types;
+-       (i != 0); i--, p_arg++)
+-    {
+-      size_t z;
+-      int alignment;
+-
+-      /* align alignment to 4 */
+-      alignment = (((*p_arg)->alignment - 1) | 3) + 1;
+-
+-      /* Align if necessary.  */
+-      if ((alignment - 1) & (unsigned) argp)
+-	argp = (char *) FFI_ALIGN (argp, alignment);
+-
+-      z = (*p_arg)->size;
+-      if (z < sizeof (int))
+-	{
+-	  z = sizeof (int);
+-
+-	  switch ((*p_arg)->type)
+-	    {
+-	    case FFI_TYPE_SINT8:
+-	      *(signed int *) argp = (signed int) *(SINT8 *) (*p_argv);
+-	      break;
+-
+-	    case FFI_TYPE_UINT8:
+-	      *(unsigned int *) argp = (unsigned int) *(UINT8 *) (*p_argv);
+-	      break;
+-
+-	    case FFI_TYPE_SINT16:
+-	      *(signed int *) argp = (signed int) *(SINT16 *) (*p_argv);
+-	      break;
+-
+-	    case FFI_TYPE_UINT16:
+-	      *(unsigned int *) argp = (unsigned int) *(UINT16 *) (*p_argv);
+-	      break;
+-
+-	    case FFI_TYPE_STRUCT:
+-	      memcpy (argp, *p_argv, (*p_arg)->size);
+-	      break;
+-
+-	    default:
+-	      FFI_ASSERT (0);
+-	    }
+-	}
+-      else if (z == sizeof (int))
+-	{
+-	  *(unsigned int *) argp = (unsigned int) *(UINT32 *) (*p_argv);
+-	}
+-      else
+-	{
+-	  if ((*p_arg)->type == FFI_TYPE_STRUCT)
+-	    {
+-	      memcpy (argp, *p_argv, z);
+-	    }
+-	  else
+-	    {
+-	      /* Double or long long 64bit.  */
+-	      memcpy (argp, *p_argv, z);
+-	    }
+-	}
+-      p_argv++;
+-      argp += z;
+-    }
+-
+-  return;
+-}
+-
+ /* Perform machine dependent cif processing.  */
+ ffi_status
+ ffi_prep_cif_machdep (ffi_cif * cif)
+@@ -157,85 +97,250 @@ ffi_prep_cif_machdep (ffi_cif * cif)
+   return FFI_OK;
+ }
+ 
+-extern void ffi_call_ARCompact (void (*)(char *, extended_cif *),
+-				extended_cif *, unsigned, unsigned,
+-				unsigned *, void (*fn) (void));
+-
+-void
+-ffi_call (ffi_cif * cif, void (*fn) (void), void *rvalue, void **avalue)
+-{
+-  extended_cif ecif;
+-
+-  ecif.cif = cif;
+-  ecif.avalue = avalue;
++/* allocates a single register, float register, or XLEN-sized stack slot to a datum */
++static void marshal_atom(call_builder *cb, int type, void *data) {
++  size_t value = 0;
++  switch (type) {
++    case FFI_TYPE_UINT8: value = *(uint8_t *)data; break;
++    case FFI_TYPE_SINT8: value = *(int8_t *)data; break;
++    case FFI_TYPE_UINT16: value = *(uint16_t *)data; break;
++    case FFI_TYPE_SINT16: value = *(int16_t *)data; break;
++    /* 32-bit quantities are always sign-extended in the ABI */
++    case FFI_TYPE_UINT32: value = *(int32_t *)data; break;
++    case FFI_TYPE_SINT32: value = *(int32_t *)data; break;
++#if defined(__ARC64_ARCH64__)
++    case FFI_TYPE_UINT64: value = *(uint64_t *)data; break;
++    case FFI_TYPE_SINT64: value = *(int64_t *)data; break;
++#endif
++    case FFI_TYPE_POINTER: value = *(size_t *)data; break;
++    default: FFI_ASSERT(0); break;
++  }
++
++  if (cb->used_integer == NARGREG) {
++    *cb->used_stack++ = value;
++  } else {
++    cb->aregs->r[cb->used_integer++] = value;
++  }
++}
+ 
+-  /* If the return value is a struct and we don't have
+-     a return value address then we need to make one.  */
+-  if ((rvalue == NULL) && (cif->rtype->type == FFI_TYPE_STRUCT))
+-    {
+-      ecif.rvalue = alloca (cif->rtype->size);
++/* adds an argument to a call, or a not by reference return value */
++static void marshal(call_builder *cb, ffi_type *type, int var, void *data) {
++  size_t realign[2];
++
++#if (defined(__ARC64_ARCH64__) || defined(__ARC64_ARCH32__))
++  if (type->size > 2 * __SIZEOF_POINTER__) {
++    if (var) {
++      marshal_atom(cb, FFI_TYPE_POINTER, &data);
++    } else {
++      /* copy to stack and pass by reference */
++      data = memcpy (cb->struct_stack, data, type->size);
++      cb->struct_stack = (size_t *) FFI_ALIGN ((char *) cb->struct_stack + type->size, __SIZEOF_POINTER__);
++      marshal_atom(cb, FFI_TYPE_POINTER, &data);
+     }
+-  else
+-    ecif.rvalue = rvalue;
++  }
++#else
++  if (type->type == FFI_TYPE_STRUCT) {
++    if (var) {
++      if (type->size > 0)
++        marshal_atom(cb, FFI_TYPE_POINTER, data);
++    } else {
++      int i;
++      
++      for (i = 0; i < type->size; i += sizeof(size_t)) {
++        marshal_atom(cb, FFI_TYPE_POINTER, data);
++        data += sizeof(size_t);
++      }
++    }
++  }
++#endif
++  else if (IS_INT(type->type) || type->type == FFI_TYPE_POINTER) {
++    marshal_atom(cb, type->type, data);
++  } else {
++      memcpy(realign, data, type->size);
++      if (type->size > 0)
++        marshal_atom(cb, FFI_TYPE_POINTER, realign);
++      if (type->size > __SIZEOF_POINTER__)
++        marshal_atom(cb, FFI_TYPE_POINTER, realign + 1);
++  }
++}
+ 
+-  switch (cif->abi)
+-    {
+-    case FFI_ARCOMPACT:
+-      ffi_call_ARCompact (ffi_prep_args, &ecif, cif->bytes,
+-			  cif->flags, ecif.rvalue, fn);
+-      break;
++static void unmarshal_atom(call_builder *cb, int type, void *data) {
++  size_t value;
++
++  if (cb->used_integer == NARGREG) {
++    value = *cb->used_stack++;
++  } else {
++    value = cb->aregs->r[cb->used_integer++];
++  }
++
++  switch (type) {
++    case FFI_TYPE_UINT8: *(uint8_t *)data = value; break;
++    case FFI_TYPE_SINT8: *(uint8_t *)data = value; break;
++    case FFI_TYPE_UINT16: *(uint16_t *)data = value; break;
++    case FFI_TYPE_SINT16: *(uint16_t *)data = value; break;
++    case FFI_TYPE_UINT32: *(uint32_t *)data = value; break;
++    case FFI_TYPE_SINT32: *(uint32_t *)data = value; break;
++#if defined(__ARC64_ARCH64__)
++    case FFI_TYPE_UINT64: *(uint64_t *)data = value; break;
++    case FFI_TYPE_SINT64: *(uint64_t *)data = value; break;
++#endif
++    case FFI_TYPE_POINTER: *(size_t *)data = value; break;
++    default: FFI_ASSERT(0); break;
++  }
++}
+ 
+-    default:
+-      FFI_ASSERT (0);
+-      break;
++/* for arguments passed by reference returns the pointer, otherwise the arg is copied (up to MAXCOPYARG bytes) */
++static void *unmarshal(call_builder *cb, ffi_type *type, int var, void *data) {
++  size_t realign[2];
++  void *pointer;
++
++#if defined(__ARC64_ARCH64__)
++  if (type->size > 2 * __SIZEOF_POINTER__) {
++        /* pass by reference */
++        unmarshal_atom(cb, FFI_TYPE_POINTER, (char*)&pointer);
++        return pointer;
+     }
++#elif defined(__ARC64_ARCH32__)
++  if (type->type == FFI_TYPE_STRUCT) {
++    if (type->size > 2 * __SIZEOF_POINTER__) {
++      unmarshal_atom(cb, FFI_TYPE_POINTER, &realign[0]);
++      memcpy(data, (const void*)realign[0], type->size);
++      return data;
++    } else {
++      int i;
++      void *pdata = data;
++
++      for (i = 0; i < type->size; i += sizeof(size_t)) {
++        unmarshal_atom(cb, FFI_TYPE_POINTER, pdata);
++        pdata += sizeof(size_t);
++      }
++      return data;
++    }
++  }
++#else
++  if (type->type == FFI_TYPE_STRUCT) {
++
++      if (var) {
++        int i;
++        void *pdata = data;
++
++        for (i = 0; i < type->size; i += sizeof(size_t)) {
++          unmarshal_atom(cb, FFI_TYPE_POINTER, pdata);
++          pdata += sizeof(size_t);
++        }
++        return data;
++      } else {
++        if (type->size > 0)
++          unmarshal_atom(cb, FFI_TYPE_POINTER, &realign[0]);
++        memcpy(data, (const void*)realign[0], type->size);
++        return data;
++      }
++  }
++#endif
++  else if (IS_INT(type->type) || type->type == FFI_TYPE_POINTER) {
++    unmarshal_atom(cb, type->type, data);
++    return data;
++  } else {
++      if (type->size > 0)
++        unmarshal_atom(cb, FFI_TYPE_POINTER, realign);
++      if (type->size > __SIZEOF_POINTER__)
++        unmarshal_atom(cb, FFI_TYPE_POINTER, realign + 1);
++      memcpy(data, realign, type->size);
++      return data;
++  }
+ }
+ 
+-int
+-ffi_closure_inner_ARCompact (ffi_closure * closure, void *rvalue,
+-			     ffi_arg * args)
++static int passed_by_ref(ffi_type *type, int var) {
++  if (type->type == FFI_TYPE_STRUCT)
++	  return 1;
++  
++  return type->size > 2 * __SIZEOF_POINTER__;
++}
++
++/* Low level routine for calling functions */
++extern void ffi_call_asm (void *stack, struct call_context *regs,
++			  void (*fn) (void), void *closure) FFI_HIDDEN;
++
++static void
++ffi_call_int (ffi_cif *cif, void (*fn) (void), void *rvalue, void **avalue,
++	      void *closure)
+ {
+-  void **arg_area, **p_argv;
+-  ffi_cif *cif = closure->cif;
+-  char *argp = (char *) args;
+-  ffi_type **p_argt;
+-  int i;
++  int return_by_ref = passed_by_ref(cif->rtype, 0);
+ 
+-  arg_area = (void **) alloca (cif->nargs * sizeof (void *));
++  /* Allocate space for stack arg parameters.  */
++  size_t arg_bytes = FFI_ALIGN(2 * sizeof(size_t) * cif->nargs, STKALIGN);
++  /* Allocate space for copies of big structures.  */
++  size_t struct_bytes = FFI_ALIGN(cif->bytes, STKALIGN);
++  // size_t rval_bytes = 0;
++  // if (rvalue == NULL && cif->rtype->size > 2*__SIZEOF_POINTER__)
++  //   rval_bytes = FFI_ALIGN(cif->rtype->size, STKALIGN);
++  size_t alloc_size = arg_bytes + /*rval_bytes +*/ struct_bytes + sizeof(call_context);
++  size_t alloc_base = (size_t)alloca(alloc_size);
+ 
+-  /* handle hidden argument */
+-  if (cif->flags == FFI_TYPE_STRUCT)
+-    {
+-      rvalue = *(void **) argp;
+-      argp += 4;
+-    }
++  // if (rval_bytes)
++  //   rvalue = (void*)(alloc_base + arg_bytes);
+ 
+-  p_argv = arg_area;
++  call_builder cb;
++  cb.used_integer = 0;
++  cb.aregs = (call_context*)(alloc_base + arg_bytes /*+ rval_bytes*/ + struct_bytes);
++  cb.used_stack = (void*)alloc_base;
++  cb.struct_stack = (void *)(alloc_base + arg_bytes /*+ rval_bytes*/);
+ 
+-  for (i = 0, p_argt = cif->arg_types; i < cif->nargs;
+-       i++, p_argt++, p_argv++)
+-    {
+-      size_t z;
+-      int alignment;
++  // if (cif->rtype->type == FFI_TYPE_STRUCT)
++  //   marshal(&cb, &ffi_type_pointer, 0, &rvalue);
++
++  if (return_by_ref)
++	  marshal(&cb, &ffi_type_pointer, 0, &rvalue);
+ 
+-      /* align alignment to 4 */
+-      alignment = (((*p_argt)->alignment - 1) | 3) + 1;
++  int i;
++  for (i = 0; i < cif->nargs; i++)
++    marshal(&cb, cif->arg_types[i], 0, avalue[i]);
+ 
+-      /* Align if necessary.  */
+-      if ((alignment - 1) & (unsigned) argp)
+-	argp = (char *) FFI_ALIGN (argp, alignment);
++  ffi_call_asm ((void *) alloc_base, cb.aregs, fn, closure);
+ 
+-      z = (*p_argt)->size;
+-      *p_argv = (void *) argp;
+-      argp += z;
++  cb.used_integer = 0;
++  if (!return_by_ref && rvalue)
++    {
++	    if (IS_INT(cif->rtype->type)
++	        && cif->rtype->size < sizeof (ffi_arg))
++	    {
++        /* Integer types smaller than ffi_arg need to be extended.  */
++	    switch (cif->rtype->type) {
++	      case FFI_TYPE_SINT8:
++	      case FFI_TYPE_SINT16:
++	      case FFI_TYPE_SINT32:
++		      unmarshal_atom (&cb, (sizeof (ffi_arg) > 4
++                          ? FFI_TYPE_SINT64 : FFI_TYPE_SINT32),
++				                  rvalue);
++		      break;
++	      case FFI_TYPE_UINT8:
++	      case FFI_TYPE_UINT16:
++	      case FFI_TYPE_UINT32:
++		      unmarshal_atom (&cb, (sizeof (ffi_arg) > 4
++				                  ? FFI_TYPE_UINT64 : FFI_TYPE_UINT32),
++				                  rvalue);
++		      break;
++	      }
++	    }
++	    else
++	      unmarshal(&cb, cif->rtype, 0, rvalue);
+     }
++}
+ 
+-  (closure->fun) (cif, rvalue, arg_area, closure->user_data);
++void
++ffi_call (ffi_cif *cif, void (*fn) (void), void *rvalue, void **avalue)
++{
++  ffi_call_int(cif, fn, rvalue, avalue, NULL);
++}
+ 
+-  return cif->flags;
++void
++ffi_call_go (ffi_cif *cif, void (*fn) (void), void *rvalue,
++	     void **avalue, void *closure)
++{
++  ffi_call_int(cif, fn, rvalue, avalue, closure);
+ }
+ 
+-extern void ffi_closure_ARCompact (void);
++extern void ffi_closure_asm(void) FFI_HIDDEN;
+ 
+ ffi_status
+ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
+@@ -243,15 +348,28 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
+ 		      void *user_data, void *codeloc)
+ {
+   uint32_t *tramp = (uint32_t *) & (closure->tramp[0]);
++  size_t address_ffi_closure = (size_t) ffi_closure_asm;
+ 
+   switch (cif->abi)
+     {
++#if defined(__ARC64_ARCH64__)
++    case FFI_ARC64:
++      FFI_ASSERT (tramp == codeloc);
++      tramp[0] = CODE_ENDIAN (0x580a1fc0);	/* movl r8, pcl  */
++      tramp[1] = CODE_ENDIAN (0x5c0b1f80);	/* movhl r12, limm */
++      tramp[2] = CODE_ENDIAN ((uint32_t)(address_ffi_closure >> 32));
++      tramp[3] = CODE_ENDIAN (0x5c051f8c);	/* orl r12, r12, limm */
++      tramp[4] = CODE_ENDIAN ((uint32_t)(address_ffi_closure & 0xffffffff));
++      tramp[5] = CODE_ENDIAN (0x20200300);	/* j [r12] */
++      break;
++#else
+     case FFI_ARCOMPACT:
+       FFI_ASSERT (tramp == codeloc);
+       tramp[0] = CODE_ENDIAN (0x200a1fc0);	/* mov r8, pcl  */
+       tramp[1] = CODE_ENDIAN (0x20200f80);	/* j [long imm] */
+-      tramp[2] = CODE_ENDIAN (ffi_closure_ARCompact);
++      tramp[2] = CODE_ENDIAN (ffi_closure_asm);
+       break;
++#endif
+ 
+     default:
+       return FFI_BAD_ABI;
+@@ -264,3 +382,62 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
+ 
+   return FFI_OK;
+ }
++
++extern void ffi_go_closure_asm (void) FFI_HIDDEN;
++
++ffi_status
++ffi_prep_go_closure (ffi_go_closure *closure, ffi_cif *cif,
++		     void (*fun) (ffi_cif *, void *, void **, void *))
++{
++  if (cif->abi <= FFI_FIRST_ABI || cif->abi >= FFI_LAST_ABI)
++    return FFI_BAD_ABI;
++
++  closure->tramp = (void *) ffi_go_closure_asm;
++  closure->cif = cif;
++  closure->fun = fun;
++
++  return FFI_OK;
++}
++
++/* Called by the assembly code with aregs pointing to saved argument registers
++   and stack pointing to the stacked arguments.  Return values passed in
++   registers will be reloaded from aregs. */
++void FFI_HIDDEN
++ffi_closure_inner (ffi_cif *cif,
++		   void (*fun) (ffi_cif *, void *, void **, void *),
++		   void *user_data,
++		   size_t *stack, call_context *aregs)
++{
++    void **avalue = alloca(cif->nargs * sizeof(void*));
++    /* storage for arguments which will be copied by unmarshal().  We could
++       theoretically avoid the copies in many cases and use at most 128 bytes
++       of memory, but allocating disjoint storage for each argument is
++       simpler. */
++    char *astorage = alloca(cif->bytes);
++    char *ptr = astorage;
++    void *rvalue;
++    call_builder cb;
++    int i;
++
++    cb.aregs = aregs;
++    cb.used_integer = 0;
++    cb.used_stack = stack;
++    
++    /* handle hidden argument */
++    if (cif->flags == FFI_TYPE_STRUCT)
++      unmarshal(&cb, &ffi_type_pointer, 0, &rvalue);
++    else
++      rvalue = alloca(cif->rtype->size);
++
++    for (i = 0; i < cif->nargs; i++) {
++      avalue[i] = unmarshal(&cb, cif->arg_types[i], 1, ptr);
++      ptr += cif->arg_types[i]->size;
++    }
++
++    fun (cif, rvalue, avalue, user_data);
++
++    if (cif->rtype->type != FFI_TYPE_VOID) {
++        cb.used_integer = 0;
++        marshal(&cb, cif->rtype, 1, rvalue);
++    }
++}
+diff --git a/src/arc/ffitarget.h b/src/arc/ffitarget.h
+index bf8311b..5b36902 100644
+--- a/src/arc/ffitarget.h
++++ b/src/arc/ffitarget.h
+@@ -40,14 +40,28 @@ typedef signed long ffi_sarg;
+ typedef enum ffi_abi
+ {
+   FFI_FIRST_ABI = 0,
++#if __SIZEOF_POINTER__ == 8
++  FFI_ARC64,
++#else
+   FFI_ARCOMPACT,
++#endif
+   FFI_LAST_ABI,
++#if __SIZEOF_POINTER__ == 8
++  FFI_DEFAULT_ABI = FFI_ARC64
++#else
+   FFI_DEFAULT_ABI = FFI_ARCOMPACT
++#endif
+ } ffi_abi;
+ #endif
+ 
+ #define FFI_CLOSURES 		1
++#define FFI_GO_CLOSURES 1
++#if __SIZEOF_POINTER__ == 8
++#define FFI_TRAMPOLINE_SIZE	24
++#else
+ #define FFI_TRAMPOLINE_SIZE	12
++#endif
++
+ #define FFI_NATIVE_RAW_API 	0
+ 
+ #endif
+-- 
+2.34.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
