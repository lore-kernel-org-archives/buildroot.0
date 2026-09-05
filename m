Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C664C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF8540A66;
	Sat,  5 Sep 2026 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLgHp_wtMeMd; Sat,  5 Sep 2026 17:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3CFF940B54
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628033;
	b=f9zZn0T19HLbhmiJxH5/lUWoElo8+D4CrroOFdnBYuatnuJqdoYfAduGY+/0uxpHOqLS
	 IOJqBTGhm+kzPlSEQpR775do4IkNUblang5kUb2tfHtkXHlsUTMn5tPa/bJbRXp0kOyVf
	 x6DqalhNDRJwAoJi/5PFsqN8d55wkRF8/T0a1ELXfAQcqTZxfjXvmUqEEuFV6pJxH5iMl
	 mmUWhATREpjku3S09FQloUYO9whmGHRMk4jiq9XU97fEdKfpq7CuzFCaDNAcAYggitFN8
	 3Dz1PrKZ9F26ymKdlTpKDgEMtDZD9uWaTly92pVPMdWW2xqpCBDTnceWD6PiCpqNTMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tV3GVvisMJ3BeLSHYkjJ+eBuaW9XBtE6uQRj6XG/7dQ=;
	b=dwXUpAlcuIT9l7TbfCwX1POzjPHgqSktuDmMFqWpz8pB6JY7mtJiglB3+KyqZfd9q0RR
	 /JrksMuVJfSYqVAqiM6i/CVG62dm5JvWiBDGeBergLuq3CLt9QWsvPfsAslGVUzD2qBN9
	 zpJ3avpsGTUqLoYieMjcJBM76ueH85Q3dckUwcob3GCCmNZxQa7IjuSggpYsRgClzZuIZ
	 uaadZ+aXGqt1bIKGx8Sb9HGKUczpGzcJwArgzGJAYh8hfYgxEOm8zVESsk8bnLTA2eG17
	 d4NCJzw4AtRF1c+OKP5Wxiy3OhYqdm+W1K94YWdGF799jJeuKmqCkRie7pchgZtktLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628033;
	bh=tV3GVvisMJ3BeLSHYkjJ+eBuaW9XBtE6uQRj6XG/7dQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MOmzlaGdv3ZZKF+VMDeAPaEUqAcVEK6G7Cx+O7cB7SFbZM7RZAzl3tBVlzZIydK7t
	 +l5RqUCGURnpxTG3oi6+pKdlR9ylbxhTQE5XYrKYMG7VYShGBLGUR5WSdg5PD7OhSM
	 DXaYoUbKUPZNMeSvbW/HjQ+4OOuuzC76V7+67cWAGfjMO+2w0cdFpH6lIjBAa4J1g5
	 xnk2n1GqJQmQ9Dv1nA2kW04oCHpPVcnSmi8nFhc5ntX6gCCy5AkIf6RGWIK28UPSbt
	 73+D/F0bRgL9P1wkEEmT1WIK052LK2vuM4ARJLw3Ampmhoh+Qv8aocdDaeyVooRthj
	 iK8ZPVyhJAlSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CFF940B54;
	Sat,  5 Sep 2026 17:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA2F1F2C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1038580FFD
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byxYZ1a0p9HU for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 09D9581097
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=eEuBb67tt+lKZbjizgMLmlNI+B+GeYWob2p52+eOORm9MFDN4Cg5lpEcP6KxQQ/fXPLL
 oaiAMvKnPY94HsLZQ4903TVnUQN+6arm9bf0kd3RGzZjo9k4G7vqAFUHCqiyXa04QGKYR
 c0UXJJAG+Cp2wlx7N/brDDzItqq/mbqh+vnLZS1mO55wHuWITcHosJRbRp4OQtacq79pt
 Lz/UwWKcD5rqIgmJxRzr2Uy7Xqu6XqT0umhdV73nMyWEyp29d5Sa0NzaX8C6gmFrdkoPN
 XvOTtmH7VLp+vuVqJ4i0wn4tANaL042lekTQhyDiopT5HCeWec2WYFGC4XH/PlUTiew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WpLFEsJsVWjwXK0oiwRxjZHd1GKwBONW3gjErBLAFEQ=;
 b=FYEQ7vp9iJOtd2K+7g2PPrAx7bYC2dvfKYYAAzsb68kLzw/vZzv6wCdkgU2m6xX6qZNZ
 WQGP6miKZRLuAUEV4HPV6YX/rgSHKtCUBtne+P3pLuzBt6HHm6f+y2QT3y/0QEmUXpC1D
 iTTYt+M16A94UHYf0Ufj6Vdt+w8aDPnnmnM18r260KWZUI5+B/JvNtQL+GYRrl4YEsDnq
 zeCdYssePCogPlLHgs8HDUvlUnwwC3KASpCbyjWRWiZHGxUyOniBof0l6mXzo85WiaK1/
 dcTAxNQTbpqyaiDCXvqs9/vs+vcJKZqHITZ4BpjtHkz5ETC2ucOC9bAMyuaoMrAWGkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D9581097
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7E7095261; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3e961b5af1f81917589e18732e157dfff0ca969
X-Git-Newrev: a0db52966bf06f2ce2d0681a5f76eacfe52ba5ac
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.E7E7095261@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-std-debug: bump to version
 1.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0db52966bf06f2ce2d0681a5f76eacfe52ba5ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE.md: update copyright years
    -Copyright (C) 2002-2018 `std._debug` authors
    +Copyright (C) 2002-2026 `std._debug` authors

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-std-debug/lua-std-debug.hash | 6 +++---
 package/lua-std-debug/lua-std-debug.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-std-debug/lua-std-debug.hash b/package/lua-std-debug/lua-std-debug.hash
index 8e4bc69f20..c948df6209 100644
--- a/package/lua-std-debug/lua-std-debug.hash
+++ b/package/lua-std-debug/lua-std-debug.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
-sha256  034abdbbe9a13899c813509776d1e04af81bc58c2982b704c8b3663549504a31  _debug-1.0.1/LICENSE.md
+# computed by luarocks/buildroot
+sha256  7f767897257e7d25b6af5b45a53acb56b34181d452f831d48634db20a091f15d  std._debug-1.1.0-1.src.rock
+sha256  6f8eceed4659fdc39ceef192458a72a05281e429b6028aed7408f26a9d6c1aa8  _debug-1.1.0/LICENSE.md
diff --git a/package/lua-std-debug/lua-std-debug.mk b/package/lua-std-debug/lua-std-debug.mk
index e044d6cb4b..55ed6d20ea 100644
--- a/package/lua-std-debug/lua-std-debug.mk
+++ b/package/lua-std-debug/lua-std-debug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STD_DEBUG_VERSION_UPSTREAM = 1.0.1
+LUA_STD_DEBUG_VERSION_UPSTREAM = 1.1.0
 LUA_STD_DEBUG_VERSION = $(LUA_STD_DEBUG_VERSION_UPSTREAM)-1
 LUA_STD_DEBUG_NAME_UPSTREAM = std._debug
 LUA_STD_DEBUG_SUBDIR = _debug-$(LUA_STD_DEBUG_VERSION_UPSTREAM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
