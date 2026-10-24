Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF8606A31E
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D7R76XSt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA48081172;
	Sat, 24 Oct 2026 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3RUSfToac4o; Sat, 24 Oct 2026 21:30:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D5AD48113D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877421;
	b=FPio8cZsjwrPKSRhIMic5Ndvm/mTTu+sptbL+ERZBGnRkaSYTE4D7TzsjT9PG9Hto8Dc
	 XDUslR9bENO4FiqaOA/Ud1b0/yKMXpoHZ8FGNFpOemHQCUiOL9QRp7v2kqxo6QcpSWlAx
	 lyUDBboQUfRuIBj+IgK6q2GI6NvVODtkKfOqE5cfcfdKZR0Dvr9IExsUCjtrWm1f8y8ud
	 1t8/x50srux6mx/YouQBRB+NdT8CfBy/Wxsh1Xovt0iNU9ud0M5yUo21zS2KG5OeuvvSc
	 rOMNeJkLmSTgIUGC8lvI3qjgyLEnC9oXcrje013E8qgN1m+yUiVferq11sPiJMfgZ4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P5vIotEf9eodfmpUqyAr/7sMYTfEXuu6WNR7JuKYdss=;
	b=Rpgk6TIYgDw2gOesNPbpe+vPRdQVFFqBVqDy84lUZZ4A+bybMqfFBMJhvujcFmDyGcEN
	 D53SRLquZrpfHpZynAqxjCRHeCEMB9jZpAAF2woooaW9wutSgWxDxW58ZTBZDOAAypgwB
	 cblFQ+UOCys7Dcwep2kFWMN9cf3Hf357Lnoxqso66s9nGVK8CCZKh7QC9b4lxFNKsiiiC
	 r+0kb/C4JtPnuNJ3Vay1eMfaOT8A5UnKPMHSmWBjMijDBD4OGXdLHzMeCZvOaLrKAR1Ea
	 wvkdrKZV6YiX9ut093XBYyC2mT4c8bZujMZgSBJOBWC76I9J7gJykrF+/l+k7KgutVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877420;
	bh=P5vIotEf9eodfmpUqyAr/7sMYTfEXuu6WNR7JuKYdss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D7R76XStvD/AcwtNSvxS/CsXxsLs1adNptghHpBh7AAWhm2Uu8htlxo3dKdx5fDcD
	 usEo1iLhfG4GnX7UWBT/kbnp5FhF9JJnI/FA8vsQJR8Ph2YIuJJJOVG0ZgP5acABsk
	 +9sGdC6oOziS34ESEN09IONPGUIWRM7R4XQLtRaMQr7IxP+Wk7e8MpfxFSNYv9xatX
	 Nq3w/oHuyEuiZXZ31SLXeARy/c4WCQCf2ccz1bUkh2pPKxWk0NPgQTZAl/bmySJ8UF
	 qx8su3lQCUfrhKEagdWXecBHCjXaG1yU1ZX6nqifI74wD87ewkTpD7hd0H9oMx3dBO
	 eWjAhJUTuyTtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AD48113D;
	Sat, 24 Oct 2026 21:30:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4689F2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3908F6062D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5yseZeuQqgm for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B12C6061C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877419;
 b=phnOdv7ijdpXYQGy+RLe6J/2YDZt4w6ZqJ840favR13DxuddnexXspCKfuprfqTP5Clm
 2I2AidV5QV16o8rYty9htHyUJvnxJso6LTKCIpKCNta0WUDLL1JpQkwCP6/KDE0zFBZ5i
 D4CP0/s7b6X33Dbnp+S+lgdf3lu+Bnx8YIc18y9hJkybtEhxHet9e3YD976fPo5v5XK1r
 peG6a7dwVumY/4umgSCVo/nzR41lUBBkvJpMhFP4coEdRrZK0rwU+m3IMc8Mx1gAhJHOl
 H51G7wJ1QARYMDXxlmtKHNO7yWjfO43M6ZRoPxevZGRcwhCLJH07ITXGXbYytZQG6RA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7zrMR73GmvcskN6alwQsaPyVo5AAD1fTRw+ELgKLhDo=;
 b=Fqeno5YTAQTrGkwc7Y11PFK7HqrBrbAiaHwBeLGZiPlXPG2yWzH/suOZDRi5dNqBqTAG
 BudASjEkjVAx9IdWWbB9oMRnVJAnIBTh9IuqRqS2fVs13mUChYSR616LW+O2l3M/kNTqb
 lQRB3EQgMfxz/KlsPpJM2P1Cziw5y8g2ksHIm72R58LLvSFdWfLG29XlcLMPe+lJ9XsyK
 GUcMon9uAIZCGu7aQEQyz96Q2m6L4uMDzaaXEhZVwsXJ3vaaQkw9jkEMHYNbAnzO/YGhb
 chE1C00pFRAIu14PUEHKavP5MxnsGVMiIDtdWIFbuEVbcc9dTcsSMyoHjFdzagsPq+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B12C6061C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F2329CDC9; Sat, 24 Oct 2026 21:28:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:29:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 662e06def985c76a79210f7f739536d4dbdef970
X-Git-Newrev: e9d5ba526565f9011beccf37209ae0287a0835fc
X-Patchwork-Hint: ignore
Message-Id: <20261024212854.4F2329CDC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtai: fix download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9d5ba526565f9011beccf37209ae0287a0835fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The RTAI download area has been removed from www.rtai.org, so the
download fails with:

  ERROR 404: Not Found.

The website now points to a GitHub repository holding the former
rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
Download it from there, pinned to the commit that added it, so that
the URL doesn't depend on the repository branch. The tarball is
identical, so the hash is unchanged.

This is not caused by a Buildroot change: the download URL has been
the same for years, and upstream removed the files. All maintained
branches use the same URL and are therefore affected as well.

Fixes:
https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b

[1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtai/rtai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6b309ebf85..6e189bf27b 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
