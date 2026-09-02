Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10290C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A1580DCB;
	Wed,  2 Sep 2026 20:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoFAV9_uAm3M; Wed,  2 Sep 2026 20:40:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90F5E80DCF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788381635;
	b=EoieKy9TXwwH68ePU3A0VMRNsrAEgJXT59YjVQeIpPaQTekZl/OwMF4ZaOBDrDy+kzEm
	 9V3mOD7oPWXlsjDifhiU8xs9Or4kKRymftVWxODuGT2L8959yEM9XzcCiXZ4WLHyC8ac2
	 rzgUlMt2IUADVFvXkARqGcRAFGBnBfKYV90DD4fe2R89ZEu7CgttWU9zq2+XwWj2BuljQ
	 TnqyZ/fZ7fx50sbmtX0RRyGJ+h/hqGmyd4Zx8TPxKk/1IXLjbGmp6m0sf2tsnbykXh83m
	 sMBtb1H6FBFwI5IpoQJSScHU8CJQjlMcxuBLgDWlxe9lwj7ltFDeryKCVgfsk/ux3lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788381635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/490OLBXRmKeY/tTup6Zy2xT3PMlPQ0C03XVNSKl+q8=;
	b=QeYHFUt89y/EDj20g2uDk2fgy0W//BOeVz160a+A9tvttoTr3KPoDf3LehJiFLG9zrqo
	 0bBA2DFsl0mZTzLsEABholJyi0MVQsaDH9zVpD7m9Ez/n/LP6qeptSXrUC6ZKrMpGXFVJ
	 oelwKGEghIsgow9Sn6VUB0GMotdrq8YOqpdJCM2NOwjyzcG+e0DD5n6WN/Jzu+u1Szezg
	 u/+MowBxrIKukXf8UzAcs4/7KvhKJ+dZK+tVu6dxPf0hDyIBd9q12xD1hqisn5o5SyKar
	 4N+CZNZcDJ4a5LQmfacrH9q5jAXmUfuliiGeUt8SB/Vupx5Sa3Y7RPs47HUYnH90xeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788381635;
	bh=/490OLBXRmKeY/tTup6Zy2xT3PMlPQ0C03XVNSKl+q8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SW9gDYdCISszv6SF0DuI/Flt4DIPVvPRBoAje/dgOCRhzXgtvp35jkxMzMnixfV8x
	 v9rrc20fIrZYDAwXkQfiEMJS+FefoXy1URU5ImItIWAVYs5o80j9/iTTpESgFueQo4
	 imCcr5BZew1t+eniD0em0lk7MVEyJX3W1gmhJOw2zAqTgR4kL5SSqAwKPDjtBnGanD
	 p8wlpsNhTBYgafUzQh4ySw3dO+E/XniPCyJ5apBbfnkAcTTHvbPZYBtJUK8QeVJ0wM
	 4TY1Z9JXRd8M45QABAsrhLhsnVwmX/HN4thAo++LGSJ6P9P1aVXKZyeF2p9j/jqMng
	 QMKfANY17quTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F5E80DCF;
	Wed,  2 Sep 2026 20:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9E7363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2C8C80E25
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzeYLvHyLuxz for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EB93F80DF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788381633;
 b=aww/vt+OjLAc/EAGiDVd7/RxBYg7fLA04a6DDwOHJNNnqrpjlzj8CMN9mwRRxuHxZVtg
 6URscdCpqI41I+oJsr0mDIqOVtbm51/jeTwai6WIMF7G2eF2VrhLCFbbL3dTAsQRE3e0O
 iEa5f+CH5PuAiQmd8sdPcH4Jg4Jq5f2Sd7u2AhwYiR36ECrsXkiAtxKzR3XcNnlSi56Sw
 kxZUD536H+LHrNgyPgEJVLmzyHn6jeLwTb7i8MntE9vztP6tQpEuQpd91XSKPL5ZY9cQg
 2JyIN9HYUC1ACULOyKpUwqMUAvNBBMaXWblLAcvi7ZVnqvUSTvz7tss6JLten3jkDyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788381633;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8XKdYVCB5c+sD1Sqotm6XuU2nAMsB8OgCHyIRPET+8c=;
 b=YJXxg60d6IZLYMeUTPqs/TqN2pkxJvq5vYMeTkW9QzmDLNxrwUOz/xy1C/LfnRE7DYUq
 sDbPhHnHZbQgnTCMnT8wGrPVoFpTo9I3F7xz7YVxCRqgaDezXUHAOu5pIolXPG7p5hEnO
 CNHsvXNEIaCbfP9OQhwjj2jQgzgLUzX6xXLyodRJzKUfK2buZojIBi1OuMKQqNoFVLnDt
 aOyyTkhZsNv0VKCDBEtaK+HBZ2dd6tb+QEU87NjmlcxT765XgxehP797EDRFxgJDrPdhz
 0YeuNzhiDip1iS1BOmdCx3OcO2ON+ScSG62xskznchoBbPyz/ED+zxxaX2mMvcEGrMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB93F80DF5
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 424E5935C7; Wed,  2 Sep 2026 20:39:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 22:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f38b17f76cc5963e69371c51d4915cb6ee221a6
X-Git-Newrev: c05de97a2bfe51d5d85e3071df3be7eec61a8375
X-Patchwork-Hint: ignore
Message-Id: <20260902203933.424E5935C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c05de97a2bfe51d5d85e3071df3be7eec61a8375
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.107 -> 6.12.108
 - 6.6.155 -> 6.6.156
 - 6.1.186 -> 6.1.187
 - 5.15.219 -> 5.15.220
 - 5.10.268 -> 5.10.269
 - 7.1.12 -> 7.1.13
 - 6.18.48 -> 6.18.49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.12 => 7.1.13}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.268 => 5.10.269} |  0
 package/linux-headers/{5.15.219 => 5.15.220} |  0
 package/linux-headers/{6.1.186 => 6.1.187}   |  0
 package/linux-headers/{6.12.107 => 6.12.108} |  0
 package/linux-headers/{6.18.48 => 6.18.49}   |  0
 package/linux-headers/{6.6.155 => 6.6.156}   |  0
 package/linux-headers/{7.1.12 => 7.1.13}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.12 b/linux/7.1.13
similarity index 100%
rename from linux/7.1.12
rename to linux/7.1.13
diff --git a/linux/Config.in b/linux/Config.in
index cdee08b99c..401f2828cb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cba5ae653d..bc2b34b856 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
-sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
-sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
+sha256  e1d1ea200d22d55c9f5d5fae59e69bb3b494515705fc3390cd54231ee4f4baaf  linux-6.12.108.tar.xz
+sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
+sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
-sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
+sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
+sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 0d4b7ba9bb..3c5e96ef4c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  389716b3ed27e4cd520b903eea04acc33b9804c4282cb7a918f05ff14e9b5ae1  linux-7.1.12.tar.xz
+sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c  linux-6.18.48.tar.xz
+sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.268 b/package/linux-headers/5.10.269
similarity index 100%
rename from package/linux-headers/5.10.268
rename to package/linux-headers/5.10.269
diff --git a/package/linux-headers/5.15.219 b/package/linux-headers/5.15.220
similarity index 100%
rename from package/linux-headers/5.15.219
rename to package/linux-headers/5.15.220
diff --git a/package/linux-headers/6.1.186 b/package/linux-headers/6.1.187
similarity index 100%
rename from package/linux-headers/6.1.186
rename to package/linux-headers/6.1.187
diff --git a/package/linux-headers/6.12.107 b/package/linux-headers/6.12.108
similarity index 100%
rename from package/linux-headers/6.12.107
rename to package/linux-headers/6.12.108
diff --git a/package/linux-headers/6.18.48 b/package/linux-headers/6.18.49
similarity index 100%
rename from package/linux-headers/6.18.48
rename to package/linux-headers/6.18.49
diff --git a/package/linux-headers/6.6.155 b/package/linux-headers/6.6.156
similarity index 100%
rename from package/linux-headers/6.6.155
rename to package/linux-headers/6.6.156
diff --git a/package/linux-headers/7.1.12 b/package/linux-headers/7.1.13
similarity index 100%
rename from package/linux-headers/7.1.12
rename to package/linux-headers/7.1.13
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 14c62a698d..433fb363ee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.48"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.12"	if BR2_KERNEL_HEADERS_7_1
+	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
