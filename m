Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB1606AC1F
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BZe5mvjV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E361E81281;
	Wed,  4 Nov 2026 22:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJ1kOGZ7I032; Wed,  4 Nov 2026 22:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E660D8127B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829633;
	b=IkxqJOtb5bl0VdyDst5zHQhWupI784u9Jm6NgHrWAbI5Q98jQGdVpoyFOX1VYCypevGJ
	 AXTRE91tl/7dHZQPTU4RJ6hcAav5V3Bn9ArnnYrGlFeNpwClDm39PC0fr1xk0r7NbrAH3
	 dRHM1a71o58aIYDP5NbVxHoye06qyuT1LYROINusoZJM7qz/WPCbqN2CXlnNIqP34QOB4
	 3b/ObQGeVfwiOmTAnuWNwA41WHrsNhjuBFRS7wLcuaaC7BVzVY3Zi5p3Hy/mGcmF6DuO1
	 p8M1D4LZst7tTL2OxSEORd8sYbGadLB0WQ/idHgIeWkX2sQn1M9C4CUZ8Cn/BhD0HTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KDEeiBg/KEtgPIZ90qxWVM+pUhmTneq8aiFS6Rbn89U=;
	b=qNXAaREl/UFJ/5Mm9pDt2yxj10lvlDWekdfZFXgTet3JBEqrwa5Ar/iJNbNcI961NS1d
	 oae07qTflWwapyzbs5iEcVQbdLc4g/YCJyN1l+Goz8+saxrb/Fr9eoL5mbwFiSXVovOmb
	 Mo5B8kftneU4MHtmSCWun0XruAUqb/qWeoMZMQun0VUZS7J6DwDmz7JZffsTJ8qYglBBl
	 kBAUm3TPtZTSSf/Pv7s8ng13D25K2QAspFSW4xAmwJCUb/N2uSf45MONq3N41+jVpQRSV
	 pZRWVZLYnzPdkDl7l7/SQzQbqRykfqsyn0fABwPR0iQNJcJIDMubXw2OOuNzpwbDDMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829633;
	bh=KDEeiBg/KEtgPIZ90qxWVM+pUhmTneq8aiFS6Rbn89U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BZe5mvjVXczp92wXlwz6OEh7mfHN03Vok2vBEiG0edkS0vtDjkGT3bgwaEw+ee4U1
	 fN5cTzvXQcdgX5r5bgeOVF4TTd5Rr9XRUuT5jd/PTHbITyrYJiNYBhe/B0whYxz7zu
	 1xN5H8jPTectMGUw7MnF0je1B5Bs3Va3ASg8woQ4GADXU9gWeZN56PAd2qXiQ7Ntlk
	 eXJrHx4DZN8NQrKe3ZniEi/ynrbu0wxo3JhhiDLRwj597s0k6hsam33aPqOAA8McQZ
	 oTB4iPkl2aLMGX25NH6uyW7remKVNxX6eRPus5wBh8R+1NBtlnXOKyEtj5ZLAHH6t+
	 wbRLYqsZ5qxwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E660D8127B;
	Wed,  4 Nov 2026 22:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0CEB6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2FC0607A3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SiNis-LWbse for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:00:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7333605D2
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7333605D2
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E30089DE25; Wed,  4 Nov 2026 21:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c51942450a639436d8dab52b6dee1dbb99ad9538
X-Git-Newrev: 347b18995975e4e857e940aae5f8c8f8f993ab37
X-Patchwork-Hint: ignore
Message-Id: <20261104215859.E30089DE25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: security bump version
 to 1.13.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/347b18995975e4e857e940aae5f8c8f8f993ab37
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/freeswitch/sofia-sip/compare/v1.13.18...v1.13.19

Fixes CVE-2026-110658: https://github.com/freeswitch/sofia-sip/pull/347

Updated Upstream: tag in patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch | 2 +-
 package/sofia-sip/sofia-sip.hash                              | 2 +-
 package/sofia-sip/sofia-sip.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
index 4e1b2ad87d..cc1d11f7f6 100644
--- a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -3,7 +3,7 @@ From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
 Date: Fri, 17 Jul 2026 16:41:11 +0200
 Subject: [PATCH] Fix build error with OpenSSL 4.0
 
-Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+Upstream: https://github.com/freeswitch/sofia-sip/commit/3cc785eeb186d6103ea628d15ec4915f1a59be1b
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 623b010190..e852c92000 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d2ad4e64753a7c9843b766b8de8081d9c1d7acfaeb53c12b3aed7fdb9235766c  sofia-sip-1.13.18.tar.gz
+sha256  99389b574dfcff5775b260dd9ef1bdd2bcb5a42e655bd229d477e488e658064f  sofia-sip-1.13.19.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index b8679f6961..c0d15878fc 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.18
+SOFIA_SIP_VERSION = 1.13.19
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
