Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D070C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD24D60D76;
	Sat,  5 Sep 2026 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9B4jNKrIgM0; Sat,  5 Sep 2026 17:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD00D60BC1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628046;
	b=TGttZ6+EfDjIHx49imm0gELNn/9R8lL57eHWkRVt/gFrNgVHhfX7vktoDj6kBYnxnVvq
	 fT5wbLmCR6Xsaf8SAEt55sNobaxWZ9SDwW2jc+PwE1a3GsV0E+A0+sUwEFK7GuO37vKlN
	 PCe/bqu7PIvrXp7g6oDiC2jPK7GKL+vgDUUYZfHCuTyIM40wWEhpwfGf4/idRLtd0P8kM
	 GleV3Sb+a4jIDUOONn7iZTXPyRfRILW7/cT17JRbwNjn/npxXS6O0VI5dBTiocuIbQHFU
	 yO413CEa5BOVGd3yfJBreFkZHQG22OjNp80BHJZ2BlW+aIl3kfq6uJUIds9HxvNAYEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K9AM9SmDxDcSRfnXKohBYS9sB5uFONu5mRwMuy0ouq0=;
	b=cOhL6DxayF8EYmGs3Xg4cPhC8EDzYNv/H61Fq4JmlQx83X72NSugk3OhZoBlq/OFJPdE
	 CGkyJvHW/7vnNNydCVJAEzc+LsFUCw0KLHFtAXk/Vo/UQEB2tpkma6YcjC/3g4TnFEtFJ
	 rXvkjw34nLGXy/GJJrEXsUoigqABUJLlpNR1CX0lYdqCuU23+RZfD4Q68EyeGGm7R5GQR
	 ASsXy/xJPdHWqSK+2DhEqrCFUZvwrIria4Upo516PXCb+90sAcFM8NOWIyWwBXbHHkofH
	 yoE8zgNGOpgCVPtOFwuOzEACkOyAnNsVHZ8vSECYj9RHKsmqoP98LkPnCDJLn6Ce/Nw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628046;
	bh=K9AM9SmDxDcSRfnXKohBYS9sB5uFONu5mRwMuy0ouq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qBwbSatl8viazML+z31r/0T6MYJk9WWbS+jYc/1W1HoIhBsyhrpmkQAMV9uvDvSGG
	 bAD5QcKb5JhPesKv/t5tfsnHdqZLt832PvWjQGV8Pi8mNYpImouF4IBGrwVw0irfCe
	 kyylQyaJwZQWWUdr0V70rvVT5InxOPaXLf6pugawF32Y6y2fQ87Oj7ZxXMBGLCVAWQ
	 0Nqb9HpnBatZ7VNFmxUZvM0A6vGOQDo70ExXKGb9kHmaDwIKOqeidmmX1QYtRyhLA4
	 x6ooU3cwvDdos/TV2WplvQ3M/Jb56Tj/vJixIVFNfhhALavZbsSkXoRpSxX/wqhWHt
	 oX1yPzyoaPfwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD00D60BC1;
	Sat,  5 Sep 2026 17:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6CE105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC4D680FFD
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S91_2onUbYsj for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3F150810A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=p2n55nItyI0xAiRjbskF+dg0Ri/dccfDs7aKS5DPWk4QLxQuBoDQqUsARseB/RQQLlh6
 3V/X1sJ77TLXcPaNjoUpHOATChPf+vvmOKyf2t3kB9gAiFHHmgvOJP2vcMhPZMjq56Tvb
 lVAxcPcWc1wgPDOmaSG4Zyhil54GyJh8niNYqS0b9/0LQQDlYfNM73obPfIKy/4ll2/+T
 ZCUCwdcAxRpJbHRcUPwb04aNQv2+4jyAaafsIiVQOyUyZob4Q5IcgLyXS0dhl2UdbagTi
 WQz+vqoZFtkZBQshaX2jIDnbMiRcMB6yHpBPQo6BA11pxh9RywmwmXiMHQojtLcJIjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wIrtHah2VWymz6Y0lX3dPdDt1OySYBJDSrE4kXCIVMI=;
 b=PNiOZYCMEkyWw7H+09aq9/rr8LjzE0i5IsqDzAQQZ2wVrS6pNza8RErn5oORqn09itX7
 7UPUGfGR8XAqX5mABOeIRbm1XrA4XPq5174EP6OeoLu5RRtYBkrma724k3qim2bL6fccm
 bByzr3t0YTS7vGEXh9ieB+GvdWbJADveSX84Bc+puxobWPO0NfNpVocwrDdSeAmpyBtj9
 sPKxA8L22E1EeiVXJhxsc6MDjxx75iiKdbMHgXJAxq2MF2fRlfCQMOlmDB27Z6Vc39FFL
 Kqf3BSnOYMBaADqsQgRQRFM1MHiJEauNunkoXQ1dkHKLh8X59rMPaAlcKa7awDzz00g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F150810A8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 344EF95260; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 064e09e028cad8db09ffbca72d37b4dc7709205e
X-Git-Newrev: 1f6e5d88361b45fa11e81a712d0fd0b3cfb88040
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.344EF95260@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasql-sqlite3: bump to version
 2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f6e5d88361b45fa11e81a712d0fd0b3cfb88040
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

update homepage, Kepler Project is gone

diff doc/us/license.html: update copyright years and homepage

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luasql-sqlite3/Config.in           | 2 +-
 package/luasql-sqlite3/luasql-sqlite3.hash | 4 ++--
 package/luasql-sqlite3/luasql-sqlite3.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 3a1fc6ba60..221820f79f 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
 
-	  http://keplerproject.github.io/luasql/
+	  https://lunarmodules.github.io/luasql/
diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index f8c7376558..08baa8673f 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
-sha256  c8bb3a3947379addb89412e578d0aae95ca37dc6e48a17e128f40e512d10b025  luasql/doc/us/license.html
+sha256  803da6e49ee6e7bc3e6701d8b7453c3eb6b0b4d842ca61414c2da742cba47691  luasql-sqlite3-2.8.0-1.src.rock
+sha256  065bcbcb6cb43e4875e2ba47c91e0f9e477c754e4bfbb5e557125a1967a4ad7a  luasql/doc/us/license.html
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 69fc956c98..8b1c6de13e 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASQL_SQLITE3_VERSION = 2.4.0-1
+LUASQL_SQLITE3_VERSION = 2.8.0-1
 LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/doc/us/license.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
