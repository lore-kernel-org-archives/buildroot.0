Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FD5C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 08:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D94CC61264
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 08:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D94CC61264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E43760B28;
	Tue, 19 Oct 2021 08:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhXr1cPs-8PN; Tue, 19 Oct 2021 08:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C177460AF7;
	Tue, 19 Oct 2021 08:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76CEF1BF97C
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 08:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6594060AF7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 08:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-f-VB0L96MD for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 08:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic317-3.consmr.mail.ne1.yahoo.com
 (sonic317-3.consmr.mail.ne1.yahoo.com [66.163.184.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EBF960896
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1634632669; bh=pZCbAeJqCIIKoh2QJqF6Zq8ehWMKPOpiwPvnhg9qbgw=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=nWzd/P4HFbwPkdeGH9Zx+RJGPE0H/v+TxH0n53Aw9tKCw/pjC2aG8BH8PRQk/WryWlSTLO16gBmXQBERlVJDBfIfIHyuI19y4AeJNfqAfeAno1+t2A1WyNlM3eG085NVb/4q3628KTOVoiWUiM8NZ0yeZPrnK+Q+Ln/vq67oGBJN/AMYue/Lmfb8QH4TC2RgQWx8WwPXzRzwondkIZv34lfvaPrG0tOj7kvDln/TQMLntkosc5VYUQPBcrxT8XE1hgzvDBEqpf08/uGMlel8z2UUR+5jQZ5gqSarWyERznfK5cXzsifGNErqgA+Bo7iF/tOf+vy1pXmjruRclKCpVA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1634632669; bh=EVcg8EzvURmQS7l9xKXkW0Fm0RHbuKGVWbioQhjFwKp=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Ir+bRxpbLYtDUyBqT2nifZcDoUSX+ycsgm6WE1lVqpiKcYAMkuvF6uopkyR072cz/Jp8PbWUA86Jn6o4Gi/a7hYRLPUTyM5WBOzCnctUkuNj3s2cQfZZxuCkPRs+nLVk6uHGOc/KX3ItjLgKXR9ZZhU0l/SRKTCOFiucGSmRrRlEo4vk0mPFNCfk+dT0g7wvrwY4ReBWyXjx1zS5uHuj3iJj2+PsFGbAmpzXKwP8I0iUF6+B821QE8ICBmmsIt6UKQV614gsgHD+RmLiH+BeMqn4+i8pv4QWroObDgaL0wL71csUbVJBqEeEkax2yyx3qj9Uo9K5x0F6vF+8QHT6Sg==
X-YMail-OSG: HK3.5YUVM1mYM0LNoabcTJTtZRtCnWjwlhphmTXFVJ.LOghOoAEq4KX4h3x5Clg
 nPjBcWYjz7D0jIl1x6nMYKMI2EtTzHskz4uxLo0MGuBt1qJLwqaBFYyT6PPsjpsFn6mI3evFUc0D
 1Uv9aDbTrVBtSJJK.gNsYBeVFfhjhRtX0GoCTrRtkmTVeRAlNz8VRiT4WYOahLdM5bPqnwCZMTDQ
 0Ijbp67ZOBnlFhk.4PU7kotPr2Ef4GCnkSigwJm42Fe_9EyNsJFa3QihIdQunzOS411qHcdNm2K.
 1zf3q4m9HJ6bSEnDIfKVgh0ERB5qzwiqlw.230rckHXPVV.VgDwsoOT5c4juPLyGcWxVo.2mUnh3
 7N4F1mqIRAGHtSXqBlBb9nvqh3ekmqUiqk.wXqwlxOXLjAih99kcyzi6y8Va5FYOBVpz7JLTi4X4
 XT.9gnXwLCDNPP85VFmKtxptAR8o1PQD0Ol_vSz7DYFC_Nfu3W4lx1uEjKPG0mixgCIOAHf3SIut
 vviw0CB7Oiuduc.2of7qipzSzoZGYXHiPsfTsmjIKjhfbuPPt2es38RO5lANm.ahbcEdP9zkUzlZ
 MWS5yOkAT2SImd2N8c4qku2dgeZYjAjY6Uy1TEyQ_bbzn9IJMvrrdqo9UGJqBjVviSsUIk302W4m
 N0mBiB8n2z_L.5Pr0yjnZx3xRyK3.rAXOh.FFry3A8GjX3eEiRhzzkTs_0tDyxkDS60LHpe1ws5i
 goUN4UA9f6KFmg0czYxNmi96jiVhmidCsO2HKoMS_BBBxJPPJ_SHjbIqeCuXTkGOMJZv3pwVNgYd
 FpNNZ4uhXnknWmJ0V4tsQsmIaNpkrDOwFQOOIStqcYRXVOs3uyKfKl.r6g.YQGhKZp.DHIYUAwlj
 CQS9BMe7XoDoIE7avZ_KbXe7dVPCFxt2W1JGPSXssY6L9E3aQxGh2L2kPZaZdJqW7zRTJ0sbfW_9
 cTJLhYWfB70rx73Ygw0mLaFvEQXiJBeBc4dqjbCfzKX7c_S1WFfmE3D0ABfig00Dx.1GJjpZ4ihq
 tBoyjbOqXMZxbvkirzsV7_7bR0rfheciW6QIRc.Rbdpilv0Bc.2PaJ4R4ySJTWdMOXBm_XVgShsu
 n5xVfQNVupayUa15wHpHbsTzBjNxFQz_7P84EG4d6nW6Vjyedn6c0lgo2r.CuoWRnNj9LsMRDb0I
 x6JDVp0X6WuVlvxj6kFwyK3uiYpUgtJ5ucXlOeWHev_m5oJb9.EdQTtV16avw92SiQ7DTwpqayCA
 L8r6qqvhfQGFFTTnCXbVURVJnPkx5j_TiVKsUlapfBQYeaiLJztOyk82ZP_BAXYeS2TsTLZEsDJ1
 7PfjgmH0PKkS54CKNDj_cYi6Lb2U_Wona2cDRKObgx7PXyI7B4pFAv5XbBEwKDedqCY6lXfu9TYC
 GI0hxj5kW76bsg9gAZL8E4j3kspBjP8d0jh9kyGTB3PMZsnVkSuixCVXjLuljIr3GgUO5KgsvAMr
 VO_VyFOyDWgtI.tJzNANYPEuvqsR5Rx07cIS89bPGvJpxrbSYazFni7wTcNyXdD6Ms1LCNm9IVz.
 GJM.F34_wmvfqpK5aSnn3malO_3gTddq1qcDcNrRtlT4kkhanDIqSkiEFv0_Xqv_GkHNaxChoJLM
 t_tx.F3cJDLBwcvY3Rn4t_c83mlwpn2uGpDDF3un7w5I9wqrmoiXk1BHg1uqIAS2tzp9ebccNOho
 qW4Qjp.ZTiCdh5Xam4aaQQnUHiZCnR_JLuNYCn_K.gTu8xJ7rtY6NjZ6MTcsrSYzqeHn8.2WkgO9
 xo_gl090sdbUi.ahp9ejPmY17KDD8R6MQRHqQQ6viOpZjTGgAVeklCKLlpv7UjhGhuCzj28rNKWQ
 wnhHtqA9oTEFF73KWvqi_mdct6PXk.nxvVNbad15lUzTQvW51gcq2nTA9tBW7IjJ2Hr1LOBz1f4H
 I2NV0hXY6UWwSnQtQO8s1g5g7.D5A7ZkTQAt4VZrHeP.B2KLTOzF4G2hF4OOQDPZKpjQc3xxV7Mf
 ooPLDSdNckqZPp7LalwaYPxxTdLKs6a6.DiqXwITkMwVI1nLbQjIkFXnPe0_x5JZATAWVTzEQbb2
 tzavMYLanOXX6ncdRrjT0wCyrbrzuxctWHCElU2HUUvW.P0EhJ58pVDWhbQ41U0DmPhazAhr773M
 BlkAzlJwBqPqf4AxlCvE0Cg_pvgUM5Fb3l4OxYAS4u5q2ss74dsyZNSyHqqEFtWdS1j8EmTvcK7j
 2X93l4uXDqZMMYdpGsOIxarRjXRTek..cL9QYXeqUKUBO.nnb4UFimDYyyZgQjhPhwKgp8tk-
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Tue, 19 Oct 2021 08:37:49 +0000
Received: by kubenode533.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 67f2947ddb982099129eb69d96ca46f1; 
 Tue, 19 Oct 2021 08:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 16:05:14 +0800
Message-Id: <20211019080514.6189-1-xiangyu.chen@aol.com>
X-Mailer: git-send-email 2.13.1
References: <20211019080514.6189-1-xiangyu.chen.ref@aol.com>
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: add svn repository method
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
From: CHEN Xiangyu via buildroot <buildroot@buildroot.org>
Reply-To: CHEN Xiangyu <xiangyu.chen@aol.com>
Cc: CHEN Xiangyu <xiangyu.chen@aol.com>, Simon Dawson <spdawson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since more and more traditional companies are starting using buildroot
with AT91SAM9x chipset as their product firmware, much of them are still
using SVN as their version control system. So add svn repository method
to AT91bootstrap3 package.

Signed-off-by: CHEN Xiangyu <xiangyu.chen@aol.com>
---
 boot/at91bootstrap3/Config.in         | 14 +++++++++++---
 boot/at91bootstrap3/at91bootstrap3.mk |  3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 650d3a23c8..3cfc0bbe14 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -30,6 +30,14 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	  This option allows Buildroot to get the AT91 Bootstrap 3
 	  source code from a Git repository.
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
+	bool "Custom SVN repository"
+	help
+	  This option allows Buildroot to get the AT91 Bootstrap 3
+	  source code from a Subversion repository
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,7 +45,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
 	string "URL of custom AT91Bootstrap tarball"
 	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
-if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 	string "URL of custom repository"
@@ -47,7 +53,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
 	string "Custom repository version"
 	help
-	  Revision to use in the typical format used by Git
+	  Revision to use in the typical format used by Git or SVN
 	  E.G. a sha id, a tag, branch, ..
 
 endif
@@ -57,7 +63,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
-		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 1e2a3a44b0..f609176a3f 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -15,6 +15,9 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN),y)
+AT91BOOTSTRAP3_SITE_METHOD = svn
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
 else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
-- 
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
