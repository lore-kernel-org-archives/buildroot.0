Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2857CC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B4660C31;
	Sat,  5 Sep 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JItBuAanNPy0; Sat,  5 Sep 2026 17:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0230160D57
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628040;
	b=SOLSw5jmeIS3H0AzroY4W32klO4pi2DKWW+2u9kHYXa0+9+izo+GC+eSn4BYCQaoghPh
	 sY5t6XcsfAaPFcVjIysUf7jUL3re790iAdEvrGILJ7+n8IJ19+Jj1TiVJQZaCisFCPYZ7
	 Q670kiwqvdC/28dVamDY1/H/+KhmDSjs8TMxH/VCup9vhpWrA1lvynyY8MVNuh6i9POXa
	 DGyocZ3PHiQVWkPN1HhilusZTES4sPYGXpCerGLG+w8uBrhfV1FqzbJBr3M7LFOdE5yjR
	 Xd/eBT6b7iwD7bOghDsVw//Yb4PphcxphlzbxRV4K+qpzu5v4G8M3LeuC6Ayx6rj2Kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tIy1FHgconfu2LFppsBhAAKLRIX0Iil6ouCRxzE7XHY=;
	b=kZvVVN0EcB6DFw5n/S5podld4iM4hcfT+gSCr4OborwR3TWcQD6HiD46uIYb720as+k0
	 oZXMU7OtkV7tE3FNMSoKCQIyuWTF7DuwGznJm47SXVU5/HNTfZ9mI57mrR4Oa2yvoZ6kw
	 Aq74Ka5R/kyQe0t0pAJw1lcz00dr6kDDMXk6ASfEVml1RgsKUxtIFGjF+Wnu5oUhLPGIe
	 Z6Y3O9GsWUXeZeaTEYl57R1qSS4v0GGkH1dD5CKpj3UueYVFwWDfNqx8d01TYXbhvQDKt
	 UQzdJnpdsvqxQiVRNdAAmBkL3UEojNW6qla7NN/lCpOdKw77hwCZ7hz6jKizncwMJlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628040;
	bh=tIy1FHgconfu2LFppsBhAAKLRIX0Iil6ouCRxzE7XHY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=seqql8GEflwu4uNAdNZlEJsqzMQbO+aMLTpCdL6CsADj28iAliB7/s3MJKPyBQtgb
	 5cfbqFAypSqh1fb69kVA0QED8ETZiO70dxZkfmDVzvU6yyO/guRvYYpnrjTXTjuJDa
	 KJpw9jo/7DE2NyovHIhcocM5YyGuS2mgyGxH5nFrfjf4Ojbec5fJAlqh8E/17Ofm2U
	 VlurYTJCRLw+iGSYDY9rGVVK8S4yv7YZr5Y80IthW84uzyGLw9VQpaZh377SZ7hz9K
	 denDpd+2YTi+cPqA3myFYtYiMOSiUmjCEB6Ff0fHKg15ZCY3vDlAlr2byNGPEgaGGF
	 lLTowBUb2B2bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0230160D57;
	Sat,  5 Sep 2026 17:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37B1BB88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A3EC40B1A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kflIo9RNz7Sw for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D91D640B12
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628024;
 b=J7f55JmzRbH3fBJwK8+U7c4Sl0+c/+hKR1PgzittvP2PSiBTZDAXwi1FNwuj4UNBsxQt
 l7m+5NWvonpzUI0RMhpfitQD6z5Lqk8DHd0FMoZqieBGtfBt9oulcQLK5vLeZdeQxbnAu
 DXLWgfKoQJuE7l8gFu9yEEKu3+JJQvYRvur14Y+NPeZM2gwk+CFMhdmRGbDiKfLUwlEzi
 QQ9nETKlULn9FEm7VG7vzyYFeYyRHg8sdVwE9DRNmo7pUnb/OJpF/cEaswxyGsKVoAQFn
 c9VGd3B1cy5kfzdxSnWbdwdGD912oxSS4LiAN6/K8eOca0IF3iGOxJOSy5Tz4toAMeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628024;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8/2hy834PG28yHGuTOANTK5R2ILFaCBaeDrXQEV0vkE=;
 b=h5Lt3YtadpJS7gPt4cAfCaSQAiDVLybENJtbdAnY3yPv6V7Yip7GOLhvj6ONVIKj0goj
 ch17//Q3dQ4f7RHbNi2+yfbvA0MUuEO8v0UjnA3wdKPRElcwlvsCRMrEs4gX9Utm7p9Ou
 Ky09/++W4Aj+H2C9vLXbmyFWyBICwD0gCtDqkqpAextZlViJNDG67s8kVYLKlBkT99gw7
 y6Lcd0t7lLj1+KkH6EFXCISlKhYejl1DJLGS19vM4thHIjaA/0zB0+skz2Ci1TN8PLe5Y
 YlaG+qEykSBGuj9/FPU4Z18xX34uOtigmF277ELehFuEWb0oXYiyfwo7VrcdDKJ7ZAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D91D640B12
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C13C495261; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fbe63e14cd58bb5cb9e27c42540dcf820c5a495
X-Git-Newrev: 87229b381a6b14171f265811da252f6b883eae8f
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.C13C495261@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsqlite3: bump to version 0.9.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87229b381a6b14171f265811da252f6b883eae8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lsqlite3/Config.in     | 2 +-
 package/lsqlite3/lsqlite3.hash | 2 +-
 package/lsqlite3/lsqlite3.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index 932657e580..6e84d1ef8c 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LSQLITE3
 	help
 	  A binding for Lua to the SQLite3 database library.
 
-	  http://lua.sqlite.org/
+	  https://lua.sqlite.org/
diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 48ae2fce85..e16deab397 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256  fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
+sha256  29889cd8366849128d02e6080178af91b776b01ffb22564b9508a0a4e4888af1  lsqlite3-0.9.7-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index bbf6a1db1a..ca0d0e745b 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.5-1
-LSQLITE3_SUBDIR = lsqlite3_fsl09y
+LSQLITE3_VERSION = 0.9.7-1
+LSQLITE3_SUBDIR = lsqlite3_v097
 LSQLITE3_LICENSE = MIT
 LSQLITE3_DEPENDENCIES = sqlite
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
