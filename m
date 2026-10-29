Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09F606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JgBD2ja5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF0981671;
	Fri, 30 Oct 2026 14:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKhmYZH7yu1N; Fri, 30 Oct 2026 14:19:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 092A38165C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369975;
	b=rfMtVcCWSMVlVhH+SFe33DDpGAOMB5iCw+jwNX0VcpyNw5Jr1TNc6cr6eW8yMw0Jyv5s
	 ONJkPLWKRTdCXqS9aumDvsWGivH4VIkm99qkG+MdOGBg/nxS1tMtIKivKW8EU4OfPjA9L
	 ChsZoZOvVFmg6WRXmKV3RUulcuLGNBvCrBztvIPrhtx73f+OiCL0HPVKQUoIep7SdarAR
	 yOxHzw/CrDJGZWsI43numLv6ISqevPlGS8sRuDXGyPSBImTHudL2a4llpEHCY/Y4dWUVS
	 F3ApRmzncpDcXfRavBsJ25IQUNQw4FVaWjIR9DEgXle0TLDfZmpZ2oeZurt1rRy46JQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YbxRvPLYUn2R7/EFjQjI7PpB9HusbNlxk1K+JnOSMAY=;
	b=UnM98Hg37HNL3AciQM/hvHLTo5Y39eV97hA6Cnx6aVx38qfZoNzmZjbueCENLKEqFYtj
	 YJWjFbQJ+cfDQabQNSDxt3t7g8ZvQJBZxONFhddHs39S07JdkqQEyQNi8teuObTkK+OFW
	 o6Ibn5CXufBFfgNd6fo4kCIn1a83yy9X5E6GdkZJHoIrR9nRr9Ney2C0SpTL/XQs24SQ2
	 BiCzJMpeH6ysyAFVCmKHaeZl7rGgnjDMg49mvT0ZlVnr9oYw+txONtxLIbwH8qeXjzXs3
	 BfelSWfAznoSY1R8IQKxaOsysEP8UwGpzjTuD9msf9i17GHvOrlAxX1Hs0LC5NHUWGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369975;
	bh=YbxRvPLYUn2R7/EFjQjI7PpB9HusbNlxk1K+JnOSMAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JgBD2ja5S1xblzAU0iHv4SIZc3PzJ0C77ninWt004aITSJcvwA9g9Oz9sre+WpUHN
	 xwqzGyAMsEF9WUSZCkuwivqbT6UJkUGzPJT1hRWbakCDgOAdFYitQfw6m3+7hTxtcx
	 DZ4gieKC8OSD4oFUmpttFoTWBcnBQ7QmvGGNWWy6B3q5vA2tTOgeZ+ZpTDo+5Szlp3
	 IQxFVeVMVJOyLdZGn2XmHiKt3lJ5EIJJnfbM1/6/0qWoZGEOf7R+MSb/yjj375jy0n
	 bvTq/gBK9QlEHux2qpISKVt4K1/oT5L/wU1uup/pF2bzXjgqvez7eLWnYWmF1dFMOs
	 I35Zd1m7nfFEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092A38165C;
	Fri, 30 Oct 2026 14:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF35A362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F0160B72
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nx6w67LBeorz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A5B4760AFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=SkPHM/b8crs7tLh/blo/s6L8VeIr3ZmqiTnSChq1sYuDdcQoO8RbuPKW25RejTakjql0
 8Hd1DFSQAIwn5TeG+Lce9aPDx8rROQCc6WClmyUQ3EyiKaht25NYGj6IqyHqECsHGYSLQ
 AYoWRMGiTgE69QQv2F/Sq63qyWteOJ34qPWx2DMYTc0VpQJlaIDkhSX/R3UR5nrQ2KPRe
 hOOBx776TA+Wsj21zJq6quumnGNvwvvD3eUFXY5LW7CFWN+4ebCDIJ2bTZvjfibIahvRU
 18FyTUjRPsDUMcsOFBKsAVxZDHIhP+kEbUzgl0jTlgcfLr++6pxh/vfbRyYm12+MJ9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zFXL94JNQ5uLw0CDsEZWhxJsDKBWSIBu80iatR+qr8c=;
 b=l2Mb3o3kl/W4vvhHUllNYCIkTUucdzYlaBhzpE9b8HalNWQN2NiU3KFnWVRDB7FE4cTY
 +Y9/fOUqIIwg8be4sReE62HlyjTnlH4VuKgYUCWzVXH+9yZZRVqCDd14jWJ3Z0bfEKIoy
 KxGljMmTRgqNUDyuJu7p6IOiLPVqW0uY1mUU3qWaGYMkJP5ODAxx9cq77WGAMaMvKKrnx
 vbmq2L0SyE2Mqnt2VYLWaZHRxDKKAnp9bQboueSHTbeLNgtz7Ru3fo+BEUXpYUjeHej0P
 N1JEVue4mDr6KVheI/w5ZUPp5Z0tFTdCYrPUQ6bxvif2ALH8qA0cyfR7hY+0eq6zhTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5B4760AFF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B88419D389; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 29ef0fe8e037ab2af97fae44688a3c7cee982d67
X-Git-Newrev: e4281179393a4abc4b7f4270dcdaa2dc1401915f
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.B88419D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bind: security
 bump version to 9.20.30
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
Content-Type: multipart/mixed; boundary="===============5142935933578839950=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5142935933578839950==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4281179393a4abc4b7f4270dcdaa2dc1401915f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30

Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b904a38926a15849ad92482a7ca63914fecda420)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8129fa2d2b..2d6aa2fde4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
+sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a05ef6c362..7fb07fc83c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.29
+BIND_VERSION = 9.20.30
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============5142935933578839950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5142935933578839950==--
