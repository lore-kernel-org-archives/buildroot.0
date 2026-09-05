Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9BBC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEDB60622;
	Sat,  5 Sep 2026 17:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaKYQnOOjhbV; Sat,  5 Sep 2026 17:07:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 202AF60604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628027;
	b=S2BAJLI0q5lcUHoUUvcAtjEl9orBf/AcWpbtGQl+/DBcL6yHEIva5NxGOkwk38hnuHRv
	 b5eNyXhK0wNrPW5X4SVsEXRlt9JFnsjXOVcXx5CxWyygqQtSsM/AbzmOz2HweOD/DHSyG
	 bsvgt3rF3yTVwdJOSi5zAfjYJbhY/L/5InwUc6GCMmxioAywe9nCitsQjOXQfi8TezmTJ
	 eCImC9HRHDaQ3SRIFCoqmnAVMsRuA5eu58/ZYGOZ+WybKVLzr1xEVTPxdIAEiq/baDzK/
	 1/8g+hJrCpdM6LOhqJ8Jy06CR/DSZy3bkeGRRSZoBwkhF+pK9LXdn/oMvNxeLhhsqrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ux/Le/E1faQv/SmI4lQi91HCNCl3QA22rmRC2RPqYjQ=;
	b=Wo2Waji3qZEak3g6+uX/JctjsDAdo5cMWZCdGBh8x8xFP5EbhOGpQtCZtD8H+QfZHjhq
	 pGbDgrMkoxclh9kRkEZ/zm47v7BOCaOtb9Ek0NQSzbgwYGyUsw+dwBg3qXNIvjqxFURuC
	 ftLpMFZXl/PK7P5i0bULODH8vYtj5PoksUQdPrFR+il6u0RMQgzQUcuuEM5Sr+r2xGdG6
	 P/UqQJnrz0+ANU+//MlDjeAx7ElLJYwqI8rKCDF0G0UaYrVYADiMKesB5kLAfyE7dvo/Q
	 3aVF03JV6LQ7Y0B5T+Owd0x8O0fAfs+abmrA5AIr9uTweJb6yFyjk1eYn90vX4E2S4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628027;
	bh=ux/Le/E1faQv/SmI4lQi91HCNCl3QA22rmRC2RPqYjQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TzOGHqSO0/b8HPLvOgW0IThDvOy9nKAN31s5q8zLZCIsVqknfr7Zj8+4YLWYtKqh7
	 SO+g/j0eJO3aFSTkt02gHhA1Pz5q7J6ICvqwrTLGZasmltdZQ6NsZ3xxC0VpLnxrrB
	 kdlVdC/BCa1BHRfs9Mu/deoNW31nyMGJs/a2ut7NxQJcPiKzM934wujSmiMiXBDYP6
	 8RcC80Ru9E6ehJPw1TcbB2qG8mnyyJXtzDDCGfBu6vMPeVtJPnO/ybEd/T/ar/Jhaf
	 uPrPMn6+TCP3qkdgUiF8a/lEFqhOOgP5Z65tWArIJKhcG4XIapcNa53eGkbPnigFcA
	 vEUeycOe1jpAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202AF60604;
	Sat,  5 Sep 2026 17:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3F5B88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 006A94004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pezd4WZs3ZTd for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 007A640049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=sJKkNMAmBsjFX8CND/ZoPcPw4SVdsfaZ1ky76lYagJbNWJdeJdWodt2g+alpuLquptLR
 tzmY7HiFPWq5twJhf33Cqp9cCz3pLBfTY+ejZm4LwxRoEfEtw/FLbbneNGy1h1j4j/p7d
 2q7lUCyFbp0znj3vDNq0eArC0bFkOZzdJm5xDgD9stwYRrNN5JArI+ScLSDsEdVjNHQbj
 0qGL2Ik8eCZ5y7+Z3K4ZusrZrnQTmOEGlS/Wb9G8i/ffcjMPW4V3fKhTt7JG1DRx2axh4
 GFfjdt3v0SB3ee8UWEjQ8ffWN2mR2xLSAZ6W7kPkrCUZZqzE/EJVzw7HL16/LAd+TZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9d/G7Vka2bI38xLHtW17kdCOTsnnoYKzzzI4ItNAirI=;
 b=QoeyF6GVwhnDND4GyFjthqvEgBMrZEfFqWquhXdwfHUosP7L2K710xl7kEknFZq+qZLk
 u+tzAxidTdx0Y5NGQUTlIbJPJ5uGQtPVVNvjY6HShC5YpDT0sJcFkPT39GTfUBSDOOW3v
 nDP9Qs4V3K/guWBt1NxN2nHXriirq3Bm24fAghRS+FgLt3f1rDg6mrDJg0Wj1PbumS6yo
 r802kbIrw3e/p7NMWW8z5iR0c6PcK7mz+KVm/qD4qqiz1t5asmKAULf+QjueutGGQ53o2
 bWd85r8leSwBVbzyfTBbN75Nhw55U6IyJIARbTm6ABhK+O/0FX9seL0R7xoGU7Ku+ow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 007A640049
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAD5895262; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87229b381a6b14171f265811da252f6b883eae8f
X-Git-Newrev: 409f7867a7490da38e160391f2800caac805f157
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.CAD5895262@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-compat53: bump to version
 0.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/409f7867a7490da38e160391f2800caac805f157
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index cd2c35d621..284a8f6ad0 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  987e286e63e568c2a7d50b6a66ea9d4189254be49ebd6477ed8945e23e195c44  compat53-0.14.3-1.src.rock
-sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.14.3/LICENSE
+sha256  c9e34ea62ac89a6b7ab62333a990b47b1dd37e02f00b0309e6a31511fd5b8806  compat53-0.15.1-1.src.rock
+sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.15.1/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 048a52279f..b4b4a9e0a3 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.14.3
+LUA_COMPAT53_VERSION_UPSTREAM = 0.15.1
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
