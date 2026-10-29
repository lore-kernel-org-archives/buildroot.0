Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4A606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aV5es18w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B04607B6;
	Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqpUo-B_NyKT; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B31BC60AF3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369885;
	b=fEVFyTKrQUW2r5ccg4UsG9hBGvDWW+I1Vi/I+6aLb4vJCQByLlProe83oKIpuICOwWhc
	 Wj2lXCzk/PeZvC0RzW87U9PsfwNdvOGfygYIUQxkHfIZAATAbo2/nRQHpWkwoSQ4onffJ
	 8JXhmxrAkgv/y7dCg5+yLR13+d5NFnR+LwC/JfeXe1I6+xuSvZKfgj4/Jp3EwqziqXTUy
	 C7Tly0gdlAccPlm47YCoMg2oADBLvcJBY+QHmGSjxfsMKijpttXNXuUCRNOHVaL2oMPHL
	 MIPSacc95/E29FJcYUyG54xfNgm/QIgfkU/q912BEzX6kAs5w3++VXu+nWx6cRPL4jQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KPoH9WzWkAo55aC8W7zlWWNKL08MjAgs4qc/V0wSndw=;
	b=FRDTFl5BoP87lPP49aN0bsMfUWxLQ6R/Xi3hIDjriDh4NuZs9jlLBPuIw0gAahm1mNVV
	 A4Y9C7U6BssS42tzl8pCe006RSbEb4z8vB8/OIluHPsIe6zuCTBv3FXwKB9vcnenJHrrd
	 mtyB0gnXzSGLJ9eux93+5MpSBgKX+qfACGGFowjJh+lOJBwPK+Tz+51cjsy2erg0WLnFv
	 Pomb0K09ZT+C+Dy/8Vhl3aMEQOyI3PCHtNIpheaXnjKK5CSTT3YqLZqEHmNstfFNFdEg2
	 JuPKAleEMqs4A7iFS5i9cabdBe92nQJV2uGPnF3/RMmG9NTEW0SUloLEqDO+6RfWdHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369885;
	bh=KPoH9WzWkAo55aC8W7zlWWNKL08MjAgs4qc/V0wSndw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aV5es18wQl0lKVwbRJopzK4uDOVFuUCPj1sJc21pqCgj1drt2LG10XEEv8bh1RL37
	 wmFF6mf86xQHMnE4Ew4PWxFlkF8cddVw/mci9iGX8JMgqSwZaE7aiXQrzahLPmWUNW
	 DZHEjhTGHnJGU7RkBC0CZpmfoTJi4nGxNkJtinJz7dq8QyktagMTDY6mk2m891AdcC
	 i+h3EpOxXq7CQ31Qp4CSg3Pxin7q+Rf2j/zIKatBMU12y5bPsNZ0J8KlipzFgDAfEn
	 CD34d6oPLdxwc0S/ixRTmrfSYhiUIvfhXeXYUXSzcbRiZdYp2X27ocMRroloi53cVS
	 rMVKSzfP33GHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31BC60AF3;
	Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BAD3712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D73A812C6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHHLmAzSJ36r for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C3C4810B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=W1V8UVkpuPvZTHvvgl8UId92oKwxylWHdb0EdFkoDn+tP2LNSDI7G3AAyZAejthord5y
 WdMF4kdMksRzuGgzVFptbNOdeLs+Mp85dVdr9NbGkTYxef7YlGmnrVE+Mfvgc0BBnb/P5
 HOSy1DIDrkQwIqCtgDaUwMIsCYAT4XiFEK743gxeoSTfxb8DpiOqx6O08yY5PM9/fvm3J
 m93g7+9aR43L+FO+af+x7eWI1jmsg/PF/AcaTbsq++Ro1YGgDXMimwK55l0jx1xTKNxHM
 svz4k8Q27QCxIKy5Ij187Le5TNZEF/4t+H6Tm9+p74l5OT8deaYsNX6ZtJzclTUJUiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cKFqR3vZNNn/ZZpB4x5vhWDjCD8KhxIeZ6f2waPYsh8=;
 b=VqZlddJ2QqghhDHjTs0+sMBebM5MNYyAGnjbLls5paXW++R0tztxyS5XOL1W52ckh+Qr
 o/PSEsTalKd6m4y+RGTd5O0vYfXK8C50zuIIIaPzBXdmiNAfy8K34Pl+GF8pKpzA2I9dr
 hrZLU5aoY+vno6IzovCh4Zjir/V826QCJgdZdLYRqY3iCVVJyZBuM0PqBzFuEFyXpKEmQ
 Qs3PZSh7dUPLDKOLUyy0n9pfuDcKlXf0WybXrDn1yCTchFlLVIRddrrZ/q6RMYlp/uS8H
 8BJuF3AYGdgqXhoNQBFfzEtL0GJ5yKg6jC4CN411n9bXXtSYt1w+0QsAB8EYnidup5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3C4810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A5669D388; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 13:52:48 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8b238854d909c9cce32ef9671d968b03e323b55d
X-Git-Newrev: 0f04a915e60a752f5aa33f0b59c78ab5d88a64b1
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.7A5669D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12, 18} series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f04a915e60a752f5aa33f0b59c78ab5d88a64b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases:
    - 5.10.271 -> 5.10.272
    - 5.15.222 -> 5.15.223
    - 6.1.189 -> 6.1.190
    - 6.6.158 -> 6.6.160
    - 6.12.112 -> 6.12.114
    - 6.18.55 -> 6.18.59

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.271 => 5.10.272} |  0
 package/linux-headers/{5.15.222 => 5.15.223} |  0
 package/linux-headers/{6.1.189 => 6.1.190}   |  0
 package/linux-headers/{6.12.112 => 6.12.114} |  0
 package/linux-headers/{6.18.55 => 6.18.59}   |  0
 package/linux-headers/{6.6.158 => 6.6.160}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bd821b0800..8be46f25a9 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
-sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
-sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
+sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
+sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
+sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
-sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
+sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
+sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 89bd681573..cb46fca50f 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
+sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.271 b/package/linux-headers/5.10.272
similarity index 100%
rename from package/linux-headers/5.10.271
rename to package/linux-headers/5.10.272
diff --git a/package/linux-headers/5.15.222 b/package/linux-headers/5.15.223
similarity index 100%
rename from package/linux-headers/5.15.222
rename to package/linux-headers/5.15.223
diff --git a/package/linux-headers/6.1.189 b/package/linux-headers/6.1.190
similarity index 100%
rename from package/linux-headers/6.1.189
rename to package/linux-headers/6.1.190
diff --git a/package/linux-headers/6.12.112 b/package/linux-headers/6.12.114
similarity index 100%
rename from package/linux-headers/6.12.112
rename to package/linux-headers/6.12.114
diff --git a/package/linux-headers/6.18.55 b/package/linux-headers/6.18.59
similarity index 100%
rename from package/linux-headers/6.18.55
rename to package/linux-headers/6.18.59
diff --git a/package/linux-headers/6.6.158 b/package/linux-headers/6.6.160
similarity index 100%
rename from package/linux-headers/6.6.158
rename to package/linux-headers/6.6.160
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8c39ef70be..06ef72b5b6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,12 +472,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
