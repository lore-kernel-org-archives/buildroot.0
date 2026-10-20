Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944A606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KFTfbDyl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95B4810C1;
	Tue, 20 Oct 2026 10:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQKvIpx5_Hxe; Tue, 20 Oct 2026 10:21:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C72E781167
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491695;
	b=YQVUTs95Bxd4BugziAE9VQzsoLL9P2SPV/5MPqnj2E7HmedfmORt2D91CulSz1tSea5L
	 0/w3gR3m99lxahUyi/0YiZqmMOCBIrfX8lJLwM6//3J2qNSOplJiJFino2ikukTQVfMiJ
	 HMC7wF/MyscMPC+shQ2LC+6CtLTmxaEk1yfKaLNQw4QyQ75lF/ty4ajf0VNXp5ySnVEFD
	 us2UGNaNFQabDtFTRUWcDF2NtrJFtBU1dOYjn9WuIoZ+xZv72T13JT5nrt3A4s7p2YPDR
	 icZITo0yrSPKx/8wTOCvI+ocWVri8abEmPV3PpTmvCkbSxzf63BC8cCLtK+utccmUWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=GhxKeeH5c+QP3x/Sijy1EjL+Oj/4ptmZXccPQNKFvno=;
	b=e30F+waOV5eCkh3dCRpk5zomdqVPGxpm+Nn8eFwBRF23EskAkKN/epEcclVIuB0PxE78
	 SttDPNKZygbZ6i+UasKvn7j9A53hAUQqxvDOMiFBD9lh5wGsUTVHg2PO+91zXgzt9evbr
	 mwcv+vJiG5ZfWlsHKP/68e92/FYzTY52Wp1/IR1QHTYgeiKamunQ3xwSSbB14KffLTZje
	 C9IRE4Wfskla8oIC5AerEd657ghuqki+g8ebsiggHxkZZQiDyScLlR5n539KaMNpgKUsN
	 3T40JUWC3dMMOmIBpDQrQuckVOFsOz/QklTU8xMOvYExq+JobXXriOxorSr+ilLmGrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491695;
	bh=GhxKeeH5c+QP3x/Sijy1EjL+Oj/4ptmZXccPQNKFvno=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KFTfbDyl3DG7wcTFLiNGzXUBpFEIsy0Jbl4TP4EY+AUvZ1D/bcuQuMC29KPKeoxMX
	 sO+in70owKQfkqBucVi1SvIQo1vpbRTq/BsddHHi7rAD7KLanfmPTPvSMoq8h3jfo4
	 pxAkJJZJgEuITEPh1yIe6gTJ1PcqnfbaOsCY58RZ0Fc9gr4BDAE56QMXix7rbtjqY5
	 tEb9NuNU7jF4tNoWy+ueGFwdLJm/OpESAzPLDRKgdHYtoF+gUpQDJKXn51BxbdaAL1
	 GXVa3BPXdyHZDT/jS1p70l6rnbsosGEj89T4z3MLzlWFzxPlrqGFFZa4jUScTnXWd+
	 g95KuwpeS7h8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72E781167;
	Tue, 20 Oct 2026 10:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF96D3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64F76083C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiCXIOf8VUk6 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C913060822
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491686;
 b=BtnzRjpVhi/I9KPmKtppWLMGL46VjETA1FFBSarTdo8878jctbylvDpvTLlrrBwN6rzQ
 C0jFhuS9+PngvM0hVxcoyI12RrV2ze/FSoHJUjyN3dytwVTbZiRFG+xWdFiFrhT/Ym74H
 NE2yhGAEP3D2y9pYgVwrYVWIVMDam9LnhwmxvB1NvzkpnoI+KspVg/vgSUes2XJnaO0r3
 I+r+PC3Qq/J/QPQ6mZaDL/fbCRzRDLJaqINyf3n4ir5CmhYbaUvXESTlas3cDPdX11Q3S
 5sU6ynaUv6rJ3A7+j7fvA5zHJ39ZhuUExBvxXjGbz0W+skSeK8Zcu9dVh7vL3J3/qpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491686;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L74ZzKqz1NAYRVpQK+ik3I+xJksee7DQa/ztFFjE/7M=;
 b=lIELp5FIhGbBWWR9xYcJxhR6MeOOZiFZvGcITGNe8RbFRdAnqyhXFxY7R/3kQZUQj/71
 +Cg3tyMBt8V/kckPWzlrWuXRjuFKs9iG4umclaN7l89j4dvapU2bZk6gEEg8sTUis5cEf
 1zG3CpNyAmR7TK5HIrL+Kf4sHDzdWWAuqHl8mxMOuYiG+ZA3Z1M7vrKifIol+YaXMGooR
 PfNuv0lB0PbhZ1BJQ3ap1JTETGkjrfvs7m9zbJxuWwMocOlWCh69jVvYjx/lSgJ0eCOoS
 ajo0qXCdAFlPDLTopveTOIcbsFuHtHK6TJgWLOPAXCyvetFqphbZWs+M23RqJxSKnRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C913060822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF83C99715; Tue, 20 Oct 2026 10:20:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:17:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad1d1c6dbc4b4d789b0136c814ad0e904dff6db2
X-Git-Newrev: 874aba9eba6799b6bd033bac73e35af8970fde3a
X-Patchwork-Hint: ignore
Message-Id: <20261020102003.CF83C99715@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/am33x-cm3: fix build with gcc >= 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/874aba9eba6799b6bd033bac73e35af8970fde3a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

gcc 15 defaults to the C23 standard, where bool, true and false are
keywords. The am33x-cm3 code base defines them in its own stddef.h,
so the build fails with:

src/include/stddef.h:18:15: error: 'bool' cannot be defined via 'typedef'
   18 | typedef _Bool bool;
      |               ^~~~
src/include/stddef.h:19:8: error: cannot use keyword 'false' as enumeration constant
   19 | enum { false, true };
      |        ^~~~~

The upstream project has not received any commit since 2018 and none
of its branches fix this issue, so rather than carrying a patch that
cannot be submitted to an active upstream, force the GNU C11 standard
in the .mk file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/am33x-cm3/am33x-cm3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 8c890a75fc..f753e46134 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -13,8 +13,10 @@ AM33X_CM3_LICENSE_FILES = License.txt
 
 # The build command below will use the standard cross-compiler (normally
 # build for Cortex-A8, to build the FW for the Cortex-M3.
+# The code base predates C23 and defines its own bool/true/false, so
+# force an older C standard to build with gcc >= 15.
 define AM33X_CM3_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC) -std=gnu11" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
 endef
 
 define AM33X_CM3_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
