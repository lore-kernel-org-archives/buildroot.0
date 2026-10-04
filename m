Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB3CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362EF809A7;
	Sun,  4 Oct 2026 15:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caULylFeuBR9; Sun,  4 Oct 2026 15:50:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4264180897
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129059;
	b=pz7+OKwsLpE+KiqTdSFOlNv4YOCqZFpNaXYQGEpYyQz16pwIkWXEkit0A6vX2AkRgBl8
	 idkUnkDUNpt0sdykcBKRC3WNa/BTiOnyQNrHLRyoSDsV4qBsYDrS0sxuUf2zOulnjyz13
	 inU1L++lip0I3DrMnUe0cIC/PGl6nJjyEzPFtJeM6d3JNju20Ue6L+yi2vMgec/wn32S+
	 tNk/e5tt4LspqhlHc8QHn/60FzxYbFnlkOrhAhz0rVNn2x0olQLOtlgp/2IfM0g8Sz9e0
	 i+5w5BnYc0x0AbrIZ2i2L00i4UC1st79XX1jF7upkzgfRPdZtW1tl+fORRwGY3W6g2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZMyopZou7FKApVE//IOyipEsXg56Hc5tdlTJTfzVGKI=;
	b=O639qMO99FVeOcSXNc8w50eFhGbO+KMpFSFHRn78UmxC9IhZBqcH14LFof5DR02X11gw
	 Igax200EZyyI0n3+ou1FkmbpUwMhjSkr+qWW09eBJPBvp/urFCp7TfbiOPQFTe7NRMDM3
	 H03AktjhjEtVCsIMz+BfDFJmgYXOZOQ0vo3dqS8yhKFacCr1mmkqo9/k8c+FCloP8mjdr
	 TIEp5rzZePb3MWhbbjsSgscvRuNQ5nvlCQLtHbj3EaKSOfTeJ86hO9HO8tL2EjY1iLgCZ
	 wiyTOiDc0rasKDFkppzYYUKcOdLgSZV/jtZbiON4IoU46n6i3SWiN0qE0F+PljxH0tQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129059;
	bh=ZMyopZou7FKApVE//IOyipEsXg56Hc5tdlTJTfzVGKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C9iPa/V4nPTYdOusOQ0GramOoU+6hUMzZ62ZrtdFaxCTgeGTclKoGhH3ml/JdlqNq
	 8UOriPrtC+iHqjyNOQcdQw2CViv0nrq4x+Dx8vBVFR2v0SuIOdnl40G08LeLwMl2/3
	 mcxjYjcdkD9ins6ZybSq2fGq07ZdY8orppXqPJOJ3bcpwA4zmOUGXp0xhuYbKw3XAG
	 kNlIMq9GXxg2ab6vz9DrBYphecCLjksBgzmPxFtFivZNhtEb6zZAARPq0zIdqYOtUn
	 Vk7pwf6eLnDBYGKDDH/cd+bBopDyC25i7+xkNoqgqXWVrhsj9vMZWlu7wrMua1P6ub
	 xALVpwGTCRd8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4264180897;
	Sun,  4 Oct 2026 15:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B63232F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1918040653
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNNI2Kh9WMRU for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:50:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5ED924063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129057;
 b=U0gyVluGGvpIt4m0ta274fSwX8K1Pnaxj3C/r1oemdYcy2sZ4NpOW67kwkDNLplwAZtJ
 Xfzk94uR/przitNWU3jQPNaDwbyUpTpboWjvekZwYjoV+Uhq0ETqzwT2QonJrtNxHqQks
 /ztu0BGBEY+QNA4+eABk9o+kyJTm5o+7k7ktS0dYa6GS/rTKRwhPG0r+r6MzZEdEbcbKz
 ttbKWMItyHtLb7c53dtIbxz5DngYsrHEcj64XZ4YKjfrlSt7aAuFZZRzLK3iYmsJNaDJu
 T590tqAgoyOgoy5N6ExSoCz/8PF+6iUK4HqJkkJkMhP2Q86ecu1P+TiTa8B3IueUTAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129057;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kvmVZLm0BB8oaZg+ZM+k3m1E9cMD5FcO0ZpOkFRCLZc=;
 b=Foo0SDraC+tuLFvGhhGxwzWN5xpmQZZqDoi/B5kEdct+fxtvbCo6ITQxgaC19UN/Hy7o
 bOgzaLEGThmcEQcXe+4dnh/1PnLUioSys3T3y7B3N1ALSGN5u5Qxi8cxafw9vZk584uHK
 XhjUU2uy+tOis32EuCj0VuUPsx3967i0woWnTN30aBu4bQ1K8V0DUMW7TNZmYIOAteO64
 Wej4h2Gn3dllW3OFUT/i5KSxQ45hJFBYC4T4QD7TnuP0XWMMr5icRSGvfX8/tETiE85U5
 9mqXbXcOeWExEVnHPVKMuUOkMdA2Va4entwRHbi3om6K+H3PBWSDsgEXZeFYwKGA39A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED924063A
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:50:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A0498B6AF; Sun,  4 Oct 2026 15:49:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:44:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 722647d5abf5d56041eab7db7a7c7179105c8f40
X-Git-Newrev: 73761afe0fceddb66228add1ea7d205428e2340b
X-Patchwork-Hint: ignore
Message-Id: <20261004154942.1A0498B6AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump to 3.27.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/73761afe0fceddb66228add1ea7d205428e2340b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a ChangeLog:
https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 8e62256b9c..4cf58d0db3 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  c32f135761724db05f018fff67e06c4edf328770  valgrind-3.26.0.tar.bz2
+sha1  0b113f5c80d34743195b78651c2520901ba630cf  valgrind-3.27.1.tar.bz2
 # locally computed
-sha256  8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7  valgrind-3.26.0.tar.bz2
+sha256  5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc  valgrind-3.27.1.tar.bz2
 
 # License files
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index dc8d73b943..6dca6252d9 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.26.0
+VALGRIND_VERSION = 3.27.1
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-3.0+, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
