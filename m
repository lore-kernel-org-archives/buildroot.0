Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F49606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=APQDceC1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 062FD81218;
	Fri,  6 Nov 2026 15:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X03BCPM3YH1k; Fri,  6 Nov 2026 15:59:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1456881338
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980767;
	b=LB2Lybcws20TBGMqAQzDxua7WFKOhIgq3JpioTCUTGwzZYW4Lwk4jtC0TR81ix/STWht
	 T02lSKdHbrt0e2kO23CeFIxJW/FOCMewvEYUJ/N1U3Z4PB6aWxp7FmBmzetPpm/TU1Qmx
	 EXxYkt/OiKJ/OLRa9PczGu5RUW8jl/Vy+gU3o5QTThzEHJuKpysUEYS1EusQB13KqP6L7
	 BFF1F6PgJy1O8tuFbdCcF/18O5lA/5iSUpso0wOkX80bvskad3GK0WmH+RsR1oqiKejZM
	 1LilMnu8s+tUE9K3nVJWpv3ATLMMpM8F5QoEH77xoeufwIbXzKejknFEtQrhTvFsN6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cR8vq3jYsCKcVjLngPwnzvkK20mSgkQUsZ2uXYEZGf4=;
	b=QJr+fA2kvqs1DC5HY5eFKyeH8L+k5MWfSLaUBMbzrNWK5X1Ma8QYIYjJgkJj4oMrWkYH
	 FqAbmPKzr+DkuVbEvN7mrVB0nXSvMMQunBEQqFxdlGSSppsyfY6TNC5vCLOIPjTD3tZJ0
	 A4LebBFcNC17PFX33b/hpvv3hhkGSFVdFkFLo4CRKviPp3DPm8bQVFlkfxjVYwAxK8V/D
	 o19SjOP9Yq1bPnWcsNK/fMiRvyVV6i7e89z0iP9jLgSPQguIYujoLrFnjinFbg4SAXnzu
	 A4noiZ84EYz3Vom/CySVg/o7ubtsvu093ku57dy7qgBzm2TLF/Cr0vukG7t+lfbnaHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980767;
	bh=cR8vq3jYsCKcVjLngPwnzvkK20mSgkQUsZ2uXYEZGf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=APQDceC1nZ9dKY/0qy//tnX05i06RWgFSj3uWo47K9euCXWRtU7eqCCRu5JawxAje
	 T+pRQS/qcrJ+0tHWR85FQTLvSyMSQyuO77yb3a23xn9emdGkN/MN7ko8Iu5koH6lBL
	 9CQKt83w7CoKFoRPbrfV/abdjBQmIUtGzC08dsbt8QzCyqHGq4662tIHu/bJ1SunUz
	 dG4tJGqBR+imFG4LkmyNkiI4Lk7jDOPmKhgsGlqM6/60rmnAmRWSKwLmkZQ59tRD3W
	 w6xAA5YjiIJCWCM6XrJmCxIoIvxy1D7G4D3lCm/LB1kXRdGida6tdZYhkJKYNWOPXh
	 C42R1FTdGxPyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1456881338;
	Fri,  6 Nov 2026 15:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07BEDFC6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9B0B403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isfDVadYOBNr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 353DC403DA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 353DC403DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CB0C9E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0aee3548d37be45e8847ca7e6537521ee2c57c51
X-Git-Newrev: 4734ba2b3f170750e1cf794d8db1145fc7ae6ef2
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.6CB0C9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
Content-Type: multipart/mixed; boundary="===============3333445404555243583=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3333445404555243583==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4734ba2b3f170750e1cf794d8db1145fc7ae6ef2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases to:
 - 6.12.114 -> 6.12.115
 - 6.6.160 -> 6.6.161
 - 6.1.190 -> 6.1.191
 - 5.15.223 -> 5.15.224
 - 5.10.272 -> 5.10.273

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9ebc2cd41e..38a480967a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.115" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fb733f1f35..75980346ca 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
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
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8003243b0c..eefc05bfcc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

--===============3333445404555243583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3333445404555243583==--
