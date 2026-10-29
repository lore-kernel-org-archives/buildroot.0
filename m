Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A47606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nQxaKmSa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E637540BF3;
	Fri, 30 Oct 2026 14:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWwEseiA2Mhr; Fri, 30 Oct 2026 14:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 090F740B77
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369275;
	b=iXu2DMdUORNS3cggpCVJTODAllVkHOKixehb4pMFFGirMSQlqryH6ED41ZrPAdCu0WLt
	 tqestxOESAoxYdTdeZX5EcDEmgqzaIeJHDoQ1cbgCmvEklQLRpDP4grVIZcx/uuTQoh6u
	 UthEobyTluPU2n72BR8PGyiqszJZlFPqwldGO+pBz6tJX78tb7NG9tNoCmwYjDry1R6iB
	 /SjiXmT7B/87dFu4vcG2hQoXaNyqY53vNB4lq8l5iS4EnzGwW52EkgCF9MKVYwKqLAOHA
	 4tyUEgrNU4vp8qWMJxwtgnvTGrejh8r9/gmf99WHgf4AJVKQq/RS/D48YKR+vJrRZAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sEHsDjE94goGwsUSWr10AwZ62GBriDLSTimXN5U3OIk=;
	b=dYO2RanbzInhD70CvDzRGHYSybdqsB55KyVAD6nIpjErfn5+tlF7Y6SP22Gs6A2js5BR
	 t6QOMfBFKRYjvXl5UrfVb8BKJEGAZPMRztrcmGiH9WEwlFtpdg025vEW2GVSYucPtKERC
	 mQzCwXBNIGjm+DR27cZr4QLhgg23cf9HjPi1b2DyKZghtYDtAzNooP06o0ERp10nR7rpW
	 0GsQzW8RWYR1KfcmDHnQiU2dZhEwXeAASEsu2R9yANBfiIQMn+TphsIKr7JPS/kV5eUzj
	 ayvP5m5/3WZqxduIjA1Djglo+SdKC3wFyqFyUoDwRG/l2iPKHABw9X9S6Lyzuh8bJ8A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369275;
	bh=sEHsDjE94goGwsUSWr10AwZ62GBriDLSTimXN5U3OIk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nQxaKmSa3jEhLXmjW2r+47g5xarQn4NH9RCP2Opaq2jNR6v9vc49hP2rR0CObSgNj
	 8vHlBl7MKbot6Asb6+cjnASfR7i85M8VCRBvSAEyigyyYdCbq5fTSJI+89+j8CHw3E
	 L1H+p2dfU518pWTAKXA6AWjCFvgSZs8tNUCybZF+DKF8drVN5B3QnaiBup4lGSH/rd
	 opAbiAdTmug0YeVty/prCS5+9sBB/LZkapjEGAf/P1Y31+gdYfggE71PGiwjjyz5at
	 mpS2RSp/yI5Yu/g2emt3fFtUXtiIY8wCsnf80P4rT4chJBck1Y803RJztrGlsx1MhH
	 3w6C7ylryWOIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090F740B77;
	Fri, 30 Oct 2026 14:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1276ED44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E941D40B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm4i2H88OzFs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 353F740B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=JDUniSTpSrSxcAtdkMCZnuSIO09Z+Lk9AgpjWHI3JKeu11Fq8e/MhXR+7GzAXT28F4hU
 kEFdbzKT5F14OAoampPr32WBPM62XyBd6uo5Kt3yuztDcBT75Y0bPPPxcfcJAKch5dfZ6
 CnJzGq+Q8Tv8dfOCCNof0Z2hwarOVkaC2V43LYz+bIgsUkqnMxbvjWNmC2NmNUDcaitLJ
 iJFFB+CJW0JlJU+8Cf+uV1hUp37khRSMrA2C7R/EftdtuyzoO5kbIrkUInwCjWCP9Q70W
 8tVvVDFGz6Fs9uAwjPvdS60fz7o6P8wGr7LkoNL45swu3ZT1qWv9gnwgSTt4kOvqXZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SjnGAN1bch9fMeohcvPjRC8yRDTni8cxrYSbbVQIVSA=;
 b=KQtHeCcHm889OnLhDtK2zdK8G+GEuxwaSM4m6qeI3lGsT3vJi5fi1dPqOIkgfYij+kbb
 IX12Up4bfIBtOxWpv6CkyEYyaiCRWzY+xLHSaL0gxx/Fr5leZSW9nnZNCw6NJynZrQzy2
 9sCVQ4Gpx3+DsIqwl1mnK+Vjlt6vbHSgfi8d4Ylj34jv0ugqSXZPeOiJi9bZqJSH9RzJa
 j9qpR4PefJn83NxuLYfK0txsPQoal/beKbtuVXuNVjfIiVL+AvrfI/7zoEcnC4AnfgkFP
 4yirGo7fPpTMgyydb0N8PB/sFEE/s7MSWLPqMuhfmpBNqTQdpRi3ZfCpGLStVpm5+vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 353F740B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 551B09D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0c6bc2f7f8e15ace15b7b61385812d2929647dac
X-Git-Newrev: 7ae7e06159f5e019ee739e511e3ffd946143391f
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.551B09D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.131
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
Content-Type: multipart/mixed; boundary="===============5025032361024218258=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5025032361024218258==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ae7e06159f5e019ee739e511e3ffd946143391f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release notes since 3.129, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a152da33b17badcaa1aeba1742c24da3f7391475)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1851b1e5fd..02bbcaf00d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
-sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
+sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 42021503f7..6b4e68a624 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.129
+LIBNSS_VERSION = 3.131
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============5025032361024218258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5025032361024218258==--
