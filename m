Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E1C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669E560631;
	Sat,  5 Sep 2026 17:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRCJ1V51AcaG; Sat,  5 Sep 2026 17:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 355A06063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628031;
	b=SL+pTS+fgz/V5ND709sJRzBPWuGI/X4X26wFpEyljox/jLpOcpU2FTkGG6mgrIUbezwE
	 Eh/s4ETWCJZ5Evwr/1W5pBxgSnvbj/PtClaZWzzHR1RmnFtiMP8NtnJkR+xkdhZ+3nXMk
	 mNZ5trfjINbS7EzurLzB6jrBmo9F9rM1+uzepeUsbymbsE+O9bM2ICRwTaj7KB+Q9ng6E
	 U8nlUwDe2intQrghNu8JvOsb+SM9wWhDhUb5ZpACUyF67SGW8nAjewYXItzDQFhQH/KxI
	 8TC55/5G+MlSqRUUnVcbVc5U6lVQEc5gnpQxY9u5Ok1aIyjaWlR9tTxaIxOn8L6l/Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TP5VRXBOPus1Uyc2Xe0sAZCQRETJiH8tnl62xGRXbU4=;
	b=Du9em1UswY7H6PIF05eL+nqRScMegqzxjI6VOUNGE8M2JfBf3PVAkbcpkmOxPLpeFWjt
	 Qn19yUFK74OFGJlOFlxt5iwRTpQTDhF+TNFg7NUQnzXoIZHVCcFnfRNSFwfTYt4ZSl5LU
	 uiZvl2LtSXSxvToDfyiGGUlZMk59uX05K1tt//FTRH2xSquUxugtXmttXQCosJmm7sci/
	 H1BGoD+FByVvPeJQXU0TO2gceO9ceyhbstEmiNFiHrDuC2ybq5itmm5uTSWgT0HYZhsJY
	 2dUIoQWgAm5jV5MdqnB/hgE1NGShnDSyWYkLXwwfMI/SNr6zEJ+On+/8l6FMqrp3mPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628031;
	bh=TP5VRXBOPus1Uyc2Xe0sAZCQRETJiH8tnl62xGRXbU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X0L4fleAWa1fcb21HmALCiRpOXgtDlfd39PbGeeHLIgPSelToL3x75m01Mb85k8qG
	 qmtu9jV3qUaV4MNEbO6lo/49AUyafpHq48gIfwdMLaXfrauaG12JaqT980P0xiSuWc
	 yPshFc8WuOJ/P2fThiCgX0aqlLeKJdo4wwujUSV8jdYot6pB0XlvKAn08EM9swh7mC
	 wE5tRzWGWhh4NvJuYlF2MSwD9KFGh+wVk0UOmpczvxCYs6O42+CtoXdHUbq/y1oMED
	 b5hXgYmqsB9ueCpb9j0DO39uKmPc5Zk7Aib5ZGNLfCp9uawxM6WcZVHqQSNHu8GTME
	 iqFWF0QPrF34A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355A06063A;
	Sat,  5 Sep 2026 17:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B0171F2B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB51810B3
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGVU8upnPIlb for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E944080FFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628024;
 b=AFKur0f97cjcgk6j0B36JvOU9HTCCOi6la0XZ/4zwD7GKThFvsEsnwL3V8AxLDwIhyDa
 gtzU/dSH1m3wswtt6tOy/jDa/Dmn0ihq7oicosc5smD+CGPehnFbU9sNGbxq8Uy5jAiws
 Jt6SNEAIZo4Hqu2kV7SizQTfNouOPHxFg0djI7tjwgWYgZtcz2kr5rTMqI4zX9LAVirQN
 SOCRG2fvRCqZfcBHoj/47qaN9PzuWF49RW312ETDiNX6Oi263B7gdJFqs7W+UFjcr+DXZ
 3h7vdDH7OysxvSjDWf4SWcf/j3cuF+cuNcpbz2MfuZcuxqTRRqLO74+yziCxi5oadIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628024;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t/PMOqH/XGE8bKKx33X3iUfeLozzJSY7ijkFVvbEt0k=;
 b=lSXQTs3RXP1bKFVJ2+4Du3m10cr5t9Qu3SmUhNWiGuzX89assrFgeWkRHPDAEhy/RkxD
 fVEruHKosHuZQwxgMXOCeKv+B8u6PpwSPCDmuFh9ckALuZO4FY4H1UJaEitjB2b41nXFg
 1m/qLrXeZq6TvpbBKp0HSqMxPrux9T/uBLncLbLbQA8/CD2R+etpM2C/AqbdoAnuM5RwJ
 dum9wZOGw3RmtvF6D94g40eToACG6n/qWfwdflq7WFg+luX5Z9ibmV5S4VzX+fKjQQyyM
 YkVTUlm4EjACmd+xBa+B+1vUbuyThU12LweF+ZS3VM4ZZhNaRz1ltPkg/qAP3hQqEoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E944080FFD
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD2EB95263; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdfdd430ae1957e309602e3360775c486a17e4b3
X-Git-Newrev: c3e961b5af1f81917589e18732e157dfff0ca969
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.DD2EB95263@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lrexlib-pcre2: bump to version
 2.9.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3e961b5af1f81917589e18732e157dfff0ca969
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE: update copyright years

see changelog on https://github.com/rrthomas/lrexlib/blob/rel-2-9-4/NEWS

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash | 4 ++--
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
index 090b83d48a..13ab6fb803 100644
--- a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  9bb1cb2f307eb70d66fdab499864de732c891aace0ceb6a338194e2e6631b9c3  lrexlib-pcre2-2.9.2-1.src.rock
-sha256  067992fa7c5866e01d6c8fe93dfa1e1456a6ac81fa59ccdc72f5adcd6e5b3690  lrexlib/LICENSE
+sha256  d41d736a309b14fed859ed4d3a49de89ef8f6565a7143570ed0cf1ccdbaebf29  lrexlib-pcre2-2.9.4-1.src.rock
+sha256  c1f071c55958bc56292706c46eaae7a58f6876dfd8ee125b33f7db0700883403  lrexlib/LICENSE
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
index 3d0c3c57fc..40ce5f6ffe 100644
--- a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LREXLIB_PCRE2_VERSION = 2.9.2-1
+LUA_LREXLIB_PCRE2_VERSION = 2.9.4-1
 LUA_LREXLIB_PCRE2_NAME_UPSTREAM = Lrexlib-PCRE2
 LUA_LREXLIB_PCRE2_SUBDIR = lrexlib
 LUA_LREXLIB_PCRE2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
