Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0A60A2603
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qieP1Er6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D588F80F8B;
	Tue, 27 Oct 2026 16:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KG7cwUnWz0nL; Tue, 27 Oct 2026 16:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0867F80F80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793118159;
	b=WDJclPvogZK4/mvDSDXlR+lixHfyRHewnKKPXx3wt5yrC+5V506CRsp+tYE5qHjAIJzX
	 Bayl/UnjciqtKG2HP8UNgSuADfYz60HxLm99W7VAxfqOsb0aKmbroXEH2BGVnngSK0wbp
	 kP43p4tM5ba/xYoG4MXc77xUQTTb2p3Fkj3lxCjXtkl3BhB6Y5fVecKuU7GSKU0dzehML
	 pbhJ3X7bfmafjsDK70dQwAw/gac/cDYHG7/VNKyZRo4JZaWp2QVlpTLpl8V9T7F9tDqWI
	 9XGZ4EWPY66ajXyTbJxpjnA085GMT62lJOOAJnR6nLPbFQ1wLzRIHnO3u+GGRTNeNVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793118159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FHNl20NJ+I69++K3+RvF1Pc5WGBEzYeTuufMVzOHC0w=;
	b=H1NyjnImrvw/tT/MZ41/l3c6iWR/thPA0xw8lXcU5n+VWxnhxfQJXv2dt8QNAR9ULfzo
	 tv0wUO/fAm0hGWsoJ+upL+0W8kMIQmsdEPu+nB0eo47+TC4U/FmgqA9CYzpSgMyTqs63R
	 AyF2eUDWsnJci/QvQQDE8OuebQv2okQmuCPUzScuNSt9nE/N/PjpF0XTNOZnXnFeXZ/lg
	 2IerYcuUq3b6N1qyx68+quljYCCx/X1+G+Dwm3Mv16802oeUfmzRjVoOtxMO0rqqmjfzE
	 qH/gleGgKcOdUu6eIHj8MH6XBhoKr3dKUpxwMYDEaGy9q/IJ2NqNa1QBfSaqfgEDF3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793118159;
	bh=FHNl20NJ+I69++K3+RvF1Pc5WGBEzYeTuufMVzOHC0w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qieP1Er6L6zl+48m49vbiEl3bpmyWr0AgF/ajHeAmTQ93nXkybLvZ2o3E1/rie2+I
	 BXTfkB5YQql1p+4CHZU8AWvXdvpZHRJtfOHKeRY+LJp3MqaXCH9E777YfdM9Y+TFWj
	 HEAhfbfsGK94RwkK8DZsMuzjJJE4iWjnlo3RUeU9mTFb11FiVMGQYrIrvOV9PkeBZL
	 zFlUBkVzQLkIpifWKRdFDVD6EECtb5fpKXvIwpiSCbLLtMSF9S4Uw8GGKiFHus32jF
	 NZpukfSSvk53hHu7+xvBf8XGQl9xHh7iUOp/yZUb4E1biVm096B5aXUZIDyf/xA15U
	 201leDDe7Bv7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0867F80F80;
	Tue, 27 Oct 2026 16:22:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 153514BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF50F4060F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1UT9kxncfw0 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4FB8340608
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793118157;
 b=i7HzAJ643N9LauUco0fQ8Jn8r+GnL2NcLCIk0LZumz71CWTHHVGfDkOYccdEZI67qnCn
 NokLEHIbzA0Gqy57kXnlIEg5E4uRCCMeVTZiNrNHcr7gZ+Stvtm7PkU84RBmLAbKHa1wT
 tcy6dtM6Kg0u9NvlcuBGRelyhT+OpnCwRt7ntmDmyRRiotGoDHMDzqSdxsEygJhFUYXLo
 FnQ2XjKUO0Xxr62KQn0xZC00rxNOkQyOW5BAjUJ3AywPFaWkgnNNksg+0vSWtM1JJektR
 iegxUQXYZd/Z83lZr6zecgktgQVg+uGWuYaa79i71QETscGEQj05c31COmlqzl1RELQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793118157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uRflhx75jffAeDBuaK0joO+72Ua1rkbbk2kwzZMjAlo=;
 b=XjzTPIUERMve1XETeynxQeBCMVv2Z2p98CH4cMDl6cR0SpREPCP+VU9JBzWZtr/JolfK
 gMg3tCkt3sgORR2R6zBSSgxbpRyliYRPJ4VJsbUuJMoctsPTNAK/cH5RNvdgklH2mUHu4
 n19J8KZOGQeen4jC5WPKyoel5qtFKqbkc2QD/RB2nXJtWTtyPxeuQFRc9H6sP5qNnjCTo
 xXPnWAmMZ6CvDJ+2odCxqBgq58BHYeBAtYZy8qbrPERhXP7+6q/TU4xTnJUEHYhHqwOOL
 1zNoJFcAHMYS8Mx/s53BDoAjI+SI/7R7IwtrGo7kQ5t4jwAh3N4I3gO069TgGByYV+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB8340608
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:22:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC279D105; Tue, 27 Oct 2026 16:21:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:15:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aad652355035386e9de15f102549bed5395f022
X-Git-Newrev: f30941ab17c31bc088d4914f7b40996c596b2438
X-Patchwork-Hint: ignore
Message-Id: <20261027162110.BCC279D105@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: bump to version
 2026-10-27
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f30941ab17c31bc088d4914f7b40996c596b2438
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version allows to build up to Linux version 7.2.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 2e21e45224..0fb5fd45bd 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ec126dc722b4e0837c866ec3f73eea9f0835d518fef38b880e2c37fd2fac55a  rtl8188eu-cca7c28087db740d7d745e81e4096c9eb9084f9a.tar.gz
+sha256  8c941d91f1ae70edf053e0550317ee36f7944328844710922e1a482d5f63a407  rtl8188eu-db2131b227dd439587f37ea38927178286b980b5.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index cc4651ed3b..ee7fe2b796 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
+RTL8188EU_VERSION = db2131b227dd439587f37ea38927178286b980b5
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
