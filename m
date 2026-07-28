Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1E0C53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60015405D6;
	Tue, 28 Jul 2026 19:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxYmpHJyErON; Tue, 28 Jul 2026 19:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E5F40541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785267980;
	bh=Rrd7IkmkM690a0KcJ6dojBIDwVt+cVzXKww4ut4oRzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SoYF3ebY/EUMfuLMWFpsJ5EKy7Bqz0Rxbi10mE3dAxek7Op9AVxHJzy+OE38iq4Oc
	 u0wD9sYtvc0GGFD9bc5jlVG0Ua4lm1JSJDGy2BJHO2Im8qMuhS8Sm6o76uGE3FMGzn
	 Q+FyWRO+5Vti27Z4vj/A3Pl+FgOwUvVX3E2lemnjzqswFRBzf2XbAK+f5W0FG0tIaN
	 0KVX2GS8+u/uSNxpxoIEpFphWhZt/NCfG6LzTo2IluHbyiOu4Pyo7vn/9pFCMQCu8r
	 02pRRLfmcWdPWCHLyRLKZxCVbqf7eRNBzjNgITDnJSDF7OpfN/FuAyr2GKmMYO3j/h
	 7q4N0f6EKIdkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E5F40541;
	Tue, 28 Jul 2026 19:46:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06057788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC26540099
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lMCvbf6WZUs for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4042940097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4042940097
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A96E8B464; Tue, 28 Jul 2026 19:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 21:40:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79ca651aa6d6f2ef2d040cba5260b81eec61a904
X-Git-Newrev: df6f3ad43f6dc4a8e76fa4b27a2c85a0b981de79
X-Patchwork-Hint: ignore
Message-Id: <20260728194536.5A96E8B464@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lyaml: bump to version 6.2.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df6f3ad43f6dc4a8e76fa4b27a2c85a0b981de79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE: update copyright years
    -Copyright (C) 2013-2022 Gary V. Vaughan
    +Copyright (C) 2013-2026 Gary V. Vaughan

for changelog, see:
https://github.com/gvvaughan/lyaml/releases

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index a8599bc3dd..49c98d9805 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c6169f516ff2a8da96d55aa3a087e718edf7bceb2f1cae2def4e65cd2b41ac2d  lua-lyaml-6.2.8.tar.gz
-sha256  796d267e51d61652c55694d21108e7352e98b1ed489ab7516acc07102157e08d  LICENSE
+sha256  515e81d21903c1e428b017f2fe9dffa4e29ae9881b0d49ddbe6ba625e3164fe3  lua-lyaml-6.2.9.tar.gz
+sha256  30847a6989db6d5aeee177099fbaa1aaba793a0e5359ab0dafe1582eefb5a028  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 00a868ec29..965060dd62 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.8
+LUA_LYAML_VERSION = 6.2.9
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
