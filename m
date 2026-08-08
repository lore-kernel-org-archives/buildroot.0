Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB92C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 07:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38264407D0;
	Sat,  8 Aug 2026 07:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74D0ieoSsNxG; Sat,  8 Aug 2026 07:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492C8407D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786173378;
	bh=tVewJPBetcnM9mdJ/ZOQ34h/rxJeMvQxefWQ9nfaDU8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sadJbzJq8XoYNQKsCK1reXvNksfPyn2PlyUdajn3/uA5kcjQNEcrYPptTdrOOfwI1
	 ToejHN3V4UpyrL9rELBJSFFZDuLR1U35QDfNMbqs5QccjJtz3pnsVTZFDUxR4x/Zxh
	 vejnwmDlInMQBTsw4kX8LJBUtd3Gbms146Xx19+N5O+8PyrrZeZlJlCtBbb/SEoDgx
	 Kjefwz7VKQ8joI2ed7p5UJ4Fti3IuA302XogmckXcNOHc3etXb4UN0tfnMt45HKTjI
	 6QnNiwL5PQrO9Nsj7K4ZBc1CMG19D2RPaNaRZX94WfICwn+rr2isrOwhfB5KvNYnTR
	 TlEnc6dePfuWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492C8407D2;
	Sat,  8 Aug 2026 07:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4FC10E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C0580F90
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ka7qCHp1R4K for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 07:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B4780F8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05B4780F8D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:16:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D6D58841C; Sat,  8 Aug 2026 07:15:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 09:02:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fc6765289dc98f2ff1ca2e4cd566c72dbe7ab10
X-Git-Newrev: 3f8db818dfba072c9706624c4548fab0ea987b48
X-Patchwork-Hint: ignore
Message-Id: <20260808071529.0D6D58841C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.6.x, 6.1.x,
 5.15.x, 5.10.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f8db818dfba072c9706624c4548fab0ea987b48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.6.149 -> 6.6.150
 - 6.1.181 -> 6.1.182
 - 5.15.214 -> 5.15.215
 - 5.10.263 -> 5.10.264

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash                 | 8 ++++----
 package/linux-headers/{5.10.263 => 5.10.264} | 0
 package/linux-headers/{5.15.214 => 5.15.215} | 0
 package/linux-headers/{6.1.181 => 6.1.182}   | 0
 package/linux-headers/{6.6.149 => 6.6.150}   | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 34d3be41d6..7102a69377 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
-sha256  a7ef7a894d6c5111eb5281167819a76bf08914edacd953e7704de045b73ac3d0  linux-6.6.149.tar.xz
-sha256  d9b94ba489852aceb676c6f9e54502766a4e8363d9da114e6213bc0b6fb18908  linux-6.1.181.tar.xz
+sha256  6eb823269151936c0af9e050678ed5c70ca515d6b20a09af741852b02d228979  linux-6.6.150.tar.xz
+sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  61d2c47f4b7148ce101cb257b8dfde301c2df5c64b4b53eb2e038a2fa709e541  linux-5.15.214.tar.xz
-sha256  c93338f367aab6c746bff8a05bca82665702065493127e204be4a96d4e4c7da6  linux-5.10.263.tar.xz
+sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
+sha256  f27552ec32783512c81918c3b8f155fed8dbaf8a90a5a20afdc01aac715b489e  linux-5.10.264.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/package/linux-headers/5.10.263 b/package/linux-headers/5.10.264
similarity index 100%
rename from package/linux-headers/5.10.263
rename to package/linux-headers/5.10.264
diff --git a/package/linux-headers/5.15.214 b/package/linux-headers/5.15.215
similarity index 100%
rename from package/linux-headers/5.15.214
rename to package/linux-headers/5.15.215
diff --git a/package/linux-headers/6.1.181 b/package/linux-headers/6.1.182
similarity index 100%
rename from package/linux-headers/6.1.181
rename to package/linux-headers/6.1.182
diff --git a/package/linux-headers/6.6.149 b/package/linux-headers/6.6.150
similarity index 100%
rename from package/linux-headers/6.6.149
rename to package/linux-headers/6.6.150
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8f4cd3b283..4fa0bc80f9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,10 +472,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.263"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.214"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.181"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.149"	if BR2_KERNEL_HEADERS_6_6
+	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.150"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
