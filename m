Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDCC606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SXbxgF65
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E9940577;
	Sun,  1 Nov 2026 21:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzXMy73Uz-VO; Sun,  1 Nov 2026 21:05:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 776164053C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793567110;
	b=tGZM56S14xnWJIHYiZXArLWdoDVn+i0/cmNfQseFOhAuLkLcfuhmq1bxgt0+mHhsKDwi
	 OsNoanDW26GSa04ymlmPNBK5dZkWcimSH0A9HMBVm3h9kRHTPZA7SbQc4uY0sH/LIqj97
	 3S5pb4zwjh1C57NE43kQr2aAjJn2m3cP1XQGWTt2COixh/f4iQAiatU5qCz9Jb9LrZBY9
	 lhaxMQPfvd1UzbrDx+sHHVEY9aKixyXpfOB+ORSluHVJ9X3uSyJGefKGPwnnufL8gOSMk
	 Y3jwScwIW8fhsrhRjjxk/B1Y/cTtf8z5favPypVVDdJGFxu9Smd/gpCSf085SgBv4oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793567110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7UD0/Msu6lWlOk6byKQfNtrUc/tjIdKC55Q55rFJNfk=;
	b=N6nqk5SpoDGk4+g3C0dKB7scxsnuHsT12P06DH78fx5t3W6OQqpXa1PCh4xIIcdebV1j
	 /MmzCzBRTWITeOZ9J+rYs+DZfn12AqetwOm1jeyZKzn6dt1T0Hr+UAtcDyUL1mI2ZMZwB
	 1Z6UavL1woy1KapOQLAVhY4Rpf4A6rsg7exj6K17CnY5YAYTvFe6j64XWBK4lsVZXqeGX
	 uHaDvziUWLq84pWvjK+QZlEWHzhnO4BxU6OP0YnVWZdXfCg8UDSs6+wwLR+xydKujLWCF
	 ModsD1mSzBso6SKoUQSGPMaxuLRq3a00PAT5GQ9o9MsZcrcw31WY+a85P4xYxDK9mng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793567110;
	bh=7UD0/Msu6lWlOk6byKQfNtrUc/tjIdKC55Q55rFJNfk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SXbxgF65jmkn1FdsBQ4oE0dlOz63eYUjzouSl2R+FgkTVNcy5XINXlwfVE6fJ9Rt5
	 aJ0rCWQjr7OuTy0QFfrE8MirdiS+FSwJwW9e7IKTDIT1Vg9rZJnLtVeygDmyrpVSOq
	 VFMZLC5HzgiO3nxGZOulY1ert+WGFcVk+FyWRwVsXGkR1L7Sgb4bsRYYKbvIUW+RF5
	 x56lRp5EwXCHoCeWqt5TDVAmU2Fp1RvWOJjJS6XV2FIBtkPkaLRdiDtDg1QpFXrJQy
	 PlxsB8ndvLobAE5oIZNPTv3A/Cg6snYLXqyMhqet3Q25J8GDrJz0aUddoNVf8duNJA
	 SmwaWE5zefX+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776164053C;
	Sun,  1 Nov 2026 21:05:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43873323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31CC780D7D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFNyq6jzMlal for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83B4880DB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793567107;
 b=Mo6zi5jRf9F8ELFsObhACiuh0IxtjNkWEJ/z9oqA7HahVA/JypPzKHAD1OQGfhwns716
 mkO5oi8yG9skuXaMSTAnm4FcoS70SatooMTy7eSPy18uJvR34tsqCUcKsXUUJ+hUzTxAR
 ujNSrm6YyPO7mMicgV5AnaB5a2LkKPpC2oXSAH/grdbx+oSj4DxCLt7WESu3TIKB7d5tI
 vCCsDFh98ttb6pWzbGYz1oMWA4OxbrkgkuLiltxvenwftIPVam4/uTKzulyBquwWGhZvR
 QxsBqP4YGq6bn4b5/JFfLJE2fVYZsgIOL0mywW/9h/RrEdf/9mmAbdEs4CtqKr8DmsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793567107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WyYifgLKfbbPmkks0c2oxn60P467tyuECAQFAaOheoU=;
 b=mZEZ8s6wbITtIT5BAaHy87hbj2DPRbzn8hEH+NXjnF0QSHdArAdUa3LySVMeph+7m06J
 vHy36y8GQ6cZGvylTqMOrIiJucBD+30CyPpldzRUXZIKTkHaCmDmWEa7Xrp0+/brRZe0j
 t/lmFOIV9K/YAeyg2hLXoCd91TjVw52XueBjQiX4Nv9fSkwgR2ZSJyrr+dZk991jatE1Y
 eQP+A5yxs+hWGgHQxRS2crwAuvYOIqXeY2f+SQKJ7Wh1cDg9vrp1qDE+CgPvuLZs9YRYQ
 W7JBzcAEkxm2G85zJzeW9OQ/OfgXRtpVEtZSnO2cn43q1hsGBi0/wFxj9lcjsFYvKmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B4880DB0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A1F19D57E; Sun,  1 Nov 2026 21:03:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:51:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a34e1e89f6b9d23270276fe73b9253981247cd8a
X-Git-Newrev: bf3006e63ed800dddd92bd5243059ceda4bf5b66
X-Patchwork-Hint: ignore
Message-Id: <20261101210338.2A1F19D57E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpdf: bump to version 12.4.2
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
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf3006e63ed800dddd92bd5243059ceda4bf5b66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/qpdf/qpdf/releases/tag/v12.4.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qpdf/qpdf.hash | 4 ++--
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 81bee9e58c..dad4fbeb5b 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://github.com/qpdf/qpdf/releases/download/v12.3.2/qpdf-12.3.2.sha256
-sha256  6cba2f9f2cd887d905faeb99e0e51a307b217920d1bbf3e9cfbb2e8178a2deda  qpdf-12.3.2.tar.gz
+# From https://github.com/qpdf/qpdf/releases/download/v12.4.2/qpdf-12.4.2.sha256
+sha256  8a58af5b6141319287c1883bec8bd1bd545b7567b7fc5e6ce5d25a1c85f36397  qpdf-12.4.2.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index c11b42f60c..659204de6f 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 12.3.2
+QPDF_VERSION = 12.4.2
 QPDF_SITE = https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
