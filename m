Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63CCAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 06:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAC0410A8;
	Sat, 20 Sep 2025 06:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5h5X12wjACe; Sat, 20 Sep 2025 06:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2002641096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2002641096;
	Sat, 20 Sep 2025 06:08:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43602D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 06:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 325DD83E4C
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 06:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZvPnbajufxb for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 06:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7C8883E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C8883E48
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7C8883E48
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 06:08:01 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D579F31E06AD; Sat, 20 Sep 2025 08:07:56 +0200 (CEST)
Date: Sat, 20 Sep 2025 08:07:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aM5EvEkrOXv30D78@waldemar-brodkorb.de>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
 <20250909120822.1069595-2-thomas.petazzoni@bootlin.com>
 <14e1befe002ce593820b4bc1dd63d04e@free.fr>
 <20250915080605.579fa2e0@windsurf>
 <aM2kFrdPdzNWbXhj@waldemar-brodkorb.de>
 <20250919210040.6f247422@windsurf>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UHmy7PYBx/bcK3Ex"
Content-Disposition: inline
In-Reply-To: <20250919210040.6f247422@windsurf>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758348476; bh=sF66LBbuDC1saxfdrKU0KzhMDIbkWASVdLmVt2b/aVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FjjofsllmiWIEV1GJ18gKrIJASMiZBX0OYVgYPqyCP41AW2fFVB54NtkaHXLDbosQ
 oKWNsHsMFKA57tWQpBDCwl6pHLhEgj+rVg4LusyJaBp/6EJJEZ+8aXNmtcrDr84P36
 VL1iy+ULqXV3rpGHS9tl0t29V6oNfYje0dJISQIr1lfcLeNHqrTKaKUTzA/iGx9t3w
 oPquAxJL795Gh0pG5/cRrTjdIbajex7aX3YJbrEKdNE2dhIvdkZ0sTELjQYDDUiPxF
 1T+ujG3fnTkrSr5/EuFo4jj10zjYJ8nD6cjv98ts5pR4gCglf2OPxzCEDUf89nVdFH
 tzwSbNrdjCyMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Fjjofsll
Subject: Re: [Buildroot] [PATCH 01/11] package/libselinux: fix build issues
 caused by 3.8.1 bump
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
Cc: Julien Olivain <ju.o@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--UHmy7PYBx/bcK3Ex
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Thomas,
Thomas Petazzoni wrote,

> On Fri, 19 Sep 2025 20:42:30 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > > Dammit. I must say I don't quite grasp what they are trying to do in
> > > these matchpathcon.c checks.
> > > 
> > > It seems like:
> > > 
> > > #if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
> > > /* alias defined in the public header but we undefine it here */
> > > #undef matchpathcon_filespec_add
> > > 
> > > /* ABI backwards-compatible shim for non-LFS 32-bit systems */
> > > 
> > > static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
> > > static_assert(sizeof(unsigned long) == sizeof(uint32_t), "inode size mismatch");
> > > static_assert(sizeof(ino_t) == sizeof(ino64_t), "inode size mismatch");
> > > static_assert(sizeof(ino64_t) == sizeof(uint64_t), "inode size mismatch");
> > > 
> > > is for 32-bit systems? And here you are building for x86-64, but it
> > > gets detected as a 32-bit system, or something like that. Is it due to
> > > the fact that we always build with _FILE_OFFSET_BITS=64 even on 64-bit
> > > systems, where I guess it doesn't make sense because off_t is anyway
> > > going to always be 64-bit.  
> > 
> > So would the right fix to enable _FILE_OFFSET_BITS=64 only for
> > 32-bit systems? Or do you think something in uClibc-ng is wrong?
> 
> Defining FILE_OFFSET_BITS=64 all the time works fine with everything
> but uClibc-ng, so I'm tempted to think that something else is wrong in
> uClibc-ng, but I'm not 100% sure.

__INO_T_MATCHES_INO64_T is a internal macro in glibc.
As uClibc-ng tries to be compatible to glibc we can add this macro.

What do you think about following patch, attached to this email?

best regards
 Waldemar

--UHmy7PYBx/bcK3Ex
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-Add-glibc-internal-macros-for-64-Bit-architectures.patch"

From a3d56d059df62b4ad6eb5ddb9edd1bb59609397a Mon Sep 17 00:00:00 2001
From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 20 Sep 2025 07:58:14 +0200
Subject: [PATCH] Add glibc internal macros for 64 Bit architectures

To satisfy detection of LFS support add these glibc internal macros.
Fixes f.e. libselinux compile.

Reported-By: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 libc/sysdeps/linux/common/bits/typesizes.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/libc/sysdeps/linux/common/bits/typesizes.h b/libc/sysdeps/linux/common/bits/typesizes.h
index dcb2c3b0a..074758701 100644
--- a/libc/sysdeps/linux/common/bits/typesizes.h
+++ b/libc/sysdeps/linux/common/bits/typesizes.h
@@ -73,5 +73,15 @@
 /* Number of descriptors that can fit in an `fd_set'.  */
 #define	__FD_SETSIZE		1024
 
+#if __WORDSIZE == 64
+/* Tell the code that off_t and off64_t are actually the same type
+   for all ABI purposes, even if possibly expressed as different base types
+   for C type-checking purposes.  */
+# define __OFF_T_MATCHES_OFF64_T	1
+
+/* Same for ino_t and ino64_t.  */
+# define __INO_T_MATCHES_INO64_T	1
+
+#endif
 
 #endif /* bits/typesizes.h */
-- 
2.47.3


--UHmy7PYBx/bcK3Ex
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--UHmy7PYBx/bcK3Ex--
