Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5643606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IdYFsgN8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB8C810CF;
	Sat,  7 Nov 2026 11:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTpCaKc77MzC; Sat,  7 Nov 2026 11:26:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B05F810AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050792;
	b=bkLfE9/+V/9MNA3Ew6ERkauhAWRFNj0Ic07Yza559nPEtyFgHZKgsFhRyWON27g6ihzn
	 0AFBMX61Tv2nkgHM57i7QwK1bkCROrV4Y0glpQmGuyUGMtFJy9CyvLs+J2bKoAr75zJ3/
	 VofJaHIney2Qb36mVxLCpYdFI9WfPNSiVznaJ05DecDN3TyccYOS5jGLmft2d4oN625Gj
	 Dt7A1pILKguqiv+mimwe8l1epkwWXSnLHKfnQScb9bZKY35/5PKVwJjUUSJSzmHPTRPaJ
	 PDyDilR7eB+k6nghI6kGuDurvIDfgAhSBIaXxTZn+K9IGVm+vh7oMBsGl34IZSbIyjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WuJ3fnkzqpl9VQKklJvRGcw0T2WQ0GJG2q/U3w7SkNE=;
	b=g5gGcbJq7V6NDfW4I4bJk4hvYFQOxTG9TCKBXFFliPHFmPRHVLtdokEMoxxfL7XkQXFG
	 bGbWz95a/beRkyW+TeiuS04Q2ch6fPMjTTLiylFBT+8R8yF2n4H4XD44mLE5JoZrGeD1S
	 cVp44JYjDKO3jUPo9MA1fFPSIZAoQlbDdBWIbmLtfvOCaWe5qLgoy4yy/x07VTktWdclJ
	 qgFjBs4qiM/DDPqbpOCSaQrF2/yfRv3KXfYr8RuTN39FMhqbSXcu0nzOLBoByF6Kngk77
	 VW+/MxqAXHx9I+zfRQiFUtYK5kGOa7zQzOPGCxH/lfYDNkBAXitJ7bDjmG7F1BsA4GA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050792;
	bh=WuJ3fnkzqpl9VQKklJvRGcw0T2WQ0GJG2q/U3w7SkNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IdYFsgN8pmL0nqm6I1sWJqsXCHBqUPE0kTWkC3iCOj+YwGACUvSPspHCjbHED7b2i
	 FlF/lset3bk0Qe47dWUW/6P3vFA3G1DRetYTXMs0JEfxWej5y8RdXEiWQk/OdbVlDV
	 t6qoxt1BqgZBPwDN+i16/Wj0kwRvt9OletftK6EzdwW9R9kQDHkdce7EQosnGt++4K
	 pPlhXjs1NUxgrk/BlXgdz5yeDYfz9pqMkjI15bWLO3tgz47fxSr+zXAAVLhYo2NuXb
	 vlQ8DND3ya8YjaY9WsisMYO7ueUzCQIYKaj9pcnV7FhYMeDbCFhoDC/Ttj4Ay+Aage
	 5EQM4Yzt/A81Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B05F810AA;
	Sat,  7 Nov 2026 11:26:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0570432A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBB5A606EA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-FXSkiYLCmI for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3921606AA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3921606AA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE6498137D; Sat,  7 Nov 2026 11:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 027ec16004fa96d1c80570b529c3b27decb588bd
X-Git-Newrev: 74448922f154ae43e70dc0ba400c9082bf24cf63
X-Patchwork-Hint: ignore
Message-Id: <20261107112456.AE6498137D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix build on i386
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74448922f154ae43e70dc0ba400c9082bf24cf63
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error:

/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 libavutil/x86/tx_float.o: warning:
 relocation in read-only section `.text'
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281
https://src.fedoraproject.org/rpms/ffmpeg/c/786464f23944a2a6e082404b589d1ec7ac568d00?branch=rawhide

Fixes:
https://autobuild.buildroot.net/results/c3a/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/e66/e665577347857b548f34f9b4fc86f2c573f27282/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4ce129132d..6eb3afe277 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -584,6 +584,7 @@ FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
 endif
 
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
@@ -599,7 +600,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 FFMPEG_CFLAGS += -marm
 endif
 
-FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
+ifeq ($(BR2_i386),y)
+FFMPEG_LDFLAGS += -Wl,-z,notext
+endif
+
+FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)" LDFLAGS="$(FFMPEG_LDFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
