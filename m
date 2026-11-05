Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90547606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X7tN52J3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66362812B3;
	Fri,  6 Nov 2026 16:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoRzZ3CbV6bW; Fri,  6 Nov 2026 16:08:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D198812AC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981298;
	b=loHHsFBoPt4TOectdvP64fH2HrDtUEQR7ZZL2w1V2qp2VurnBkoUjIdL95kJlSiqBUfU
	 We+e2jmhyuK+i0cmwOa5LBQpQMvDU3d8AcuJjeRhpmqkhnqJri2ySJthGQ7OuxvJeV6Uf
	 FKEcUnXMVmgrDuRO7Ynf2gO3Cp3sfM49JjmqOyH0ZIrS7jvV8JpL1JTj2A0fEjzaSKLxC
	 SvogAcPtsdPCCmLkYiQZsflwg4oiPPcF0iea1U7OBaNtTttGq2l9VlJJ6MlgjJTd2Zybj
	 dVd1iQ7IDjM77ZKiPGrugyP+2DcpXYSH1E47XHOTvxWfjunXmr4ehZDDXwwTBHKYwXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=BhQB2FQ2vblb8CFY7zgqAolgksuikiNaZJGVf5sjDLw=;
	b=E5hCHBDT4a8Iw49UQEwv9ka95Jo5nG6UwsD2r4uWjeg4XZlbVK9xhmjnY6O8Dci0YuD3
	 hzMdJ/9E9Cd5Yue6GcX2WkS0C4Smzm6az9xIqiXWyqFpyZBKfm8cCbfPUj8+W/tcC0KQ+
	 Rs51IxyB1odq5stfUch1//30ZbMc4UtQkFzr5YWLxl3sUpJPviUAqK6sHn2JDG33wBLBT
	 XOQ3Tmzrc5tVF094AylCszWI1+Ls5t7ldKYc7xTjTlzFzJzDWKOYkZoGNg1QmhY+OMVpE
	 YhssFRdmm+cl2S3JUK27N6JJwTfnNGxOjhB8SyDTti9pOSANi65DxojJISegoUVc5jA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981298;
	bh=BhQB2FQ2vblb8CFY7zgqAolgksuikiNaZJGVf5sjDLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X7tN52J3+fr/Ub+WC4+f13Feh5Dl53xwRRyAd+xlNaveie4y6HzXfrq7rmEvspnLe
	 OoAXN0yN4mZgwbGlbAiGdumAXCDHm2mAOyq05D2hGvDzIaAhxVpkR9tPOX+GwyxRPi
	 U9mwdHhIMoCWTmaBG/MdSJyKny3gPDoXaS1hMndyUseuFGoe6bK9dzwgTWitlPnb+8
	 PtyjSGJWbNOWx6byM1jwh7GYVMXlhmiErKunfYlkap1xDEOIczGbB2h8IFLOWXI3LO
	 ENOSprX40R+11TVv28+JGYY1ikqke20tu925E7HlvDKsnypw/7HWE8JIL52JaALi16
	 vG9m1K96VPy1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D198812AC;
	Fri,  6 Nov 2026 16:08:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 082212E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECC136061F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRr2XB089Duo for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B52BB60744
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52BB60744
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB6D9E0B1; Fri,  6 Nov 2026 16:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:55 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b3fa59e9ac16478d630649f8eab421fc6761ab77
X-Git-Newrev: 30f25422d2a530ed4cf3038843b72c324431137d
X-Patchwork-Hint: ignore
Message-Id: <20261106160639.DCB6D9E0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/swtpm: security
 bump version to 0.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7713735543764791947=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7713735543764791947==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30f25422d2a530ed4cf3038843b72c324431137d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
https://github.com/advisories/GHSA-gqrg-h59c-j4wj

Upstream changelog:
https://github.com/stefanberger/swtpm/releases/tag/v0.10.2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b6a653e5fc31ab9e0e0b105583a693938b59711a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swtpm/swtpm.hash | 3 ++-
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index ebad1ef4bf..4f6cbfd61d 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,3 @@
-sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
+# locally calculated
+sha256  f61cf6f1e9bbcb4cefb30b70cafaf1c4df54c6961e65cfa63830e8ad0e220134  swtpm-0.10.2.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index de7f2fa05e..d6559c22d6 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.10.1
+SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE

--===============7713735543764791947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7713735543764791947==--
