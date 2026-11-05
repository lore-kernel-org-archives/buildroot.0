Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE81606A336
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KNKe6AGk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F986817F2;
	Fri,  6 Nov 2026 16:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9I3gdKDDCRO; Fri,  6 Nov 2026 16:09:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6188817B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981371;
	b=RHBrnNr8kboeGK9It0Oye4NRnMpnp4+lbMouv0kN9B6TxL+OAkppu4peEEwKCxqppYV1
	 2amYl0fKGpj9A8CVEbGAQlP/YAjmHDxXhKKyYC+E282I3R+wtnTELPyYPJJV4NcV4nWPN
	 1q1UPAmS7hvQpgkjfsMr+Hc/8gqc/Ms5ig03Jfy+wzsp4yFOPUl3/R8ZYx5mj5FAO86ez
	 jvMyuxtKm4+453U9CdfqGJJt9iGaHqvMKY88wFaIGy2wj514193gYCGL1FJDh2BQM7XU1
	 P1AbYJCc6NGpdw3iOfY+mitmE0kTmhihYNi3uWoemby5KrF4fKtiLiYn8MAuBoXf/yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LQwu+TcizqYIJhtFaN3zROyXsyQFXkigY8/0zan2H3s=;
	b=EbrlgF+oSJ9Kj9EVFnkJxJwC983Ra+yUgN/j5aeUDhBiru/imP7l6NliB0kw4FgUaK3h
	 P+jQh43bo+gKS8NkWSZp+f4k7DtsOoq8sGwDfJQO8WBVnl/1nRFB2md7KugBFO4sw8UsB
	 YpOxMETUOAan8e7yw30Qt2iWX84YlzczeNXiOskUfmwNGQpk2aennVrXeBpXs6c9chW8F
	 nO6nuRMA6BeeqolFAebDuIEevr6+O6sHAlYu9j3P4bCJBdMmKDY7aKjB4JFsp6pFx0Rhx
	 N1PChp3UKnvRwdilJuF4gtQow6vfFd7aTwk4u+fqHdGc5z2SkvarFOO0kOkhLDw70TQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981371;
	bh=LQwu+TcizqYIJhtFaN3zROyXsyQFXkigY8/0zan2H3s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KNKe6AGke0SH0zl/Sm+XQw5tXSG6UlKZZmvlbsbHRHKHOziIgF6ku0So6C6OqR68D
	 z6hwd8yu4GRBv1oN5Pg0qrvUiGepApR7fH70f2KsHt1WMSrQsyYiWWb3e5f63YIXNN
	 cueFTUY7SVH7fcSCUOYqlS71DacvXCK1UdsgRFJ1qmDNLarTdNlxCQAVEz3qQIBjFg
	 qtJ/AdC2FJZx9JNYZrXTS+l2vppixeevkzjJm48TFvaWbkj0ALpSdtLhSEqAvnIVRn
	 NTr0RlMQDVAo0TRR9G3BQHy3Q2Rj0yS9gLueTjzT6vLs7HXS9Nu36IanF7gnpP/dbS
	 VfUu0GC0hBrlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6188817B1;
	Fri,  6 Nov 2026 16:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6B62E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D4394090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1225cNyBEj32 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE8D740913
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE8D740913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 212379E09B; Fri,  6 Nov 2026 16:07:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:31:01 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7920ba9853021c6caa8254680dc4111ad9fa8a0b
X-Git-Newrev: 75f325ad84251ee9d903467f84d3683e3bcf3fd5
X-Patchwork-Hint: ignore
Message-Id: <20261106160712.212379E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
Content-Type: multipart/mixed; boundary="===============2721233935005702037=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2721233935005702037==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75f325ad84251ee9d903467f84d3683e3bcf3fd5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases to:
 - 6.18.59 -> 6.18.60
 - 6.12.114 -> 6.12.115
 - 6.6.160 -> 6.6.161
 - 6.1.190 -> 6.1.191
 - 5.15.223 -> 5.15.224
 - 5.10.272 -> 5.10.273

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.272 => 5.10.273} |  0
 package/linux-headers/{5.15.223 => 5.15.224} |  0
 package/linux-headers/{6.1.190 => 6.1.191}   |  0
 package/linux-headers/{6.12.114 => 6.12.115} |  0
 package/linux-headers/{6.18.59 => 6.18.60}   |  0
 package/linux-headers/{6.6.160 => 6.6.161}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 8be46f25a9..eb8307fe8f 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
-sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
-sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
+sha256  0ec90fe4b20422b1b664b77e6d2dde22b40bd41e7eb2cad8ac8739a4749cb1bb  linux-6.12.115.tar.xz
+sha256  7d34405be5cd4989b2a5e9cbefa798e3a175218901271e034af3fe4e840b71c6  linux-6.6.161.tar.xz
+sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-6.1.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
-sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
+sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
+sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index cb46fca50f..7e807d3143 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.272 b/package/linux-headers/5.10.273
similarity index 100%
rename from package/linux-headers/5.10.272
rename to package/linux-headers/5.10.273
diff --git a/package/linux-headers/5.15.223 b/package/linux-headers/5.15.224
similarity index 100%
rename from package/linux-headers/5.15.223
rename to package/linux-headers/5.15.224
diff --git a/package/linux-headers/6.1.190 b/package/linux-headers/6.1.191
similarity index 100%
rename from package/linux-headers/6.1.190
rename to package/linux-headers/6.1.191
diff --git a/package/linux-headers/6.12.114 b/package/linux-headers/6.12.115
similarity index 100%
rename from package/linux-headers/6.12.114
rename to package/linux-headers/6.12.115
diff --git a/package/linux-headers/6.18.59 b/package/linux-headers/6.18.60
similarity index 100%
rename from package/linux-headers/6.18.59
rename to package/linux-headers/6.18.60
diff --git a/package/linux-headers/6.6.160 b/package/linux-headers/6.6.161
similarity index 100%
rename from package/linux-headers/6.6.160
rename to package/linux-headers/6.6.161
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 06ef72b5b6..af4ec60993 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,12 +472,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL

--===============2721233935005702037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2721233935005702037==--
