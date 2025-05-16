Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6FC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927F583279;
	Fri, 16 May 2025 14:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrZnXOgksC7S; Fri, 16 May 2025 14:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B37831D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B37831D6;
	Fri, 16 May 2025 14:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B440C185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2E8831C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw_eP3NuG9-w for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB414831D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB414831D5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:48:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC71A86C59; Fri, 16 May 2025 14:48:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b15cd1d8fee1fe9c253ffaf6a112532fe9a8f092
X-Git-Newrev: fc827edb6585d77ad8d866953af2f649c8e1e1a8
X-Patchwork-Hint: ignore
Message-Id: <20250516144840.BC71A86C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musepack: fix incompatible pointer
 types
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3457319865899174659=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3457319865899174659==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fc827edb6585d77ad8d866953af2f649c8e1e1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of GCC14, GCC no longer allows implicitly casting all pointer types
to all other pointer types.

We can fix this error, by adding the appropriate cast.
This patch is a port of a Gentoo patch.

Link: https://gitweb.gentoo.org/repo/gentoo.git/tree/media-sound/musepack-tools/files/musepack-tools-495-incompatible-pointers.patch

Fixes:

    https://autobuild.buildroot.org/results/6412fc37d533dff27f18b09c668870bebff2bec5/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/musepack/0006-incompatible-pointers.patch | 47 +++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/musepack/0006-incompatible-pointers.patch b/package/musepack/0006-incompatible-pointers.patch
new file mode 100644
index 0000000000..7fb1b8fa23
--- /dev/null
+++ b/package/musepack/0006-incompatible-pointers.patch
@@ -0,0 +1,47 @@
+Fixed incompatible pointer types
+
+This is due to GCC14 that no longer allows implicitly casting all pointer types
+to all other pointer types. Resulting in error such as :
+
+output/build/musepack-475/libmpcpsy/ans.c:291:120: error: passing argument 10 of ‘FindOptimalANS’ from incompatible pointer type [-Wincompatible-pointer-types]
+  291 | L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, m->SCF_Index_L, Transient );
+      |                                                                     ~^~~~~~~~~~~~~
+      |                                                                      |
+      |                                                                      int *
+
+Patch downloaded from Gentoo:
+https://gitweb.gentoo.org/repo/gentoo.git/tree/media-sound/musepack-tools/files/musepack-tools-495-incompatible-pointers.patch
+
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Upstream: N/A no SCM, not active anymore
+
+--- musepack-tools-495/libmpcpsy/ans.c
++++ musepack-tools-495-fixed/libmpcpsy/ans.c
+@@ -287,12 +287,12 @@
+     // for L or M, respectively
+     memset ( m->FIR_L,      0, sizeof m->FIR_L      );         // reset FIR
+     memset ( m->NS_Order_L, 0, sizeof m->NS_Order_L );         // reset Flags
+-	FindOptimalANS ( MaxBand, MSflag, ANSspec_L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, m->SCF_Index_L, Transient );
++	FindOptimalANS ( MaxBand, MSflag, ANSspec_L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, (const void*)m->SCF_Index_L, Transient );
+ 
+     // for R or S, respectively
+ 	memset ( m->FIR_R,      0, sizeof m->FIR_R      );         // reset FIR
+ 	memset ( m->NS_Order_R, 0, sizeof m->NS_Order_R );         // reset Flags
+-	FindOptimalANS ( MaxBand, MSflag, ANSspec_R, ANSspec_S, m->NS_Order_R, m->SNR_comp_R, m->FIR_R, smr.R, smr.S, m->SCF_Index_R, Transient );
++	FindOptimalANS ( MaxBand, MSflag, ANSspec_R, ANSspec_S, m->NS_Order_R, m->SNR_comp_R, m->FIR_R, smr.R, smr.S, (const void*)m->SCF_Index_R, Transient );
+ 
+     return;
+ }
+--- musepack-tools-495/mpcenc/mpcenc.h
++++ musepack-tools-495-fixed/mpcenc/mpcenc.h
+@@ -241,8 +241,8 @@
+ 
+ float  ISNR_Schaetzer                  ( const float* samples, const float comp, const int res);
+ float  ISNR_Schaetzer_Trans            ( const float* samples, const float comp, const int res);
+-void   QuantizeSubband                 ( unsigned int* qu_output, const float* input, const int res, float* errors, const int maxNsOrder );
+-void   QuantizeSubbandWithNoiseShaping ( unsigned int* qu_output, const float* input, const int res, float* errors, const float* FIR );
++void   QuantizeSubband                 ( mpc_int16_t* qu_output, const float* input, const int res, float* errors, const int maxNsOrder );
++void   QuantizeSubbandWithNoiseShaping ( mpc_int16_t* qu_output, const float* input, const int res, float* errors, const float* FIR );
+ 
+ void   NoiseInjectionComp ( void );
+ 

--===============3457319865899174659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3457319865899174659==--
