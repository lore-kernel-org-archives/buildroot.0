Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41906CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 07:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FEC851F1;
	Sun, 31 May 2026 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRP3DU1iBc0Y; Sun, 31 May 2026 07:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4076E847BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210866;
	bh=zPpaw2BnGpviwmZHgM9Rk92vQtcdWkPn/g0CXUz8s6E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n3vRoruc1jqszcjd1/0KnlQK7CSx+AAXDhIdkZr/WTMoIc7vPphxI0fsHNWk3DwjH
	 jH/w5a6/lCfMDxGK3ZTEZvHmWYNBFUvO5dkbdypVRxoLwrifzy7U6tK2exCm1hmGkc
	 PgFD7CmEWCx8Jhoidgb86plgmeAGCAkTe7ELG0fHa0LzczSy3BrY2hgjkeXXbO1Bmb
	 OnCiM+h123i2tu+/0Nr3B0sgIj22dP9tGvqmVKFEnvRE+4ozI4NnLAAcMQ/7yCvrHB
	 8iElF+APldJr4cUVlpPwskeOaII6p5GZn1qx171U34v9ONu9ahNdl8pFCxYTm3025P
	 sx62nyJeag+0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4076E847BF;
	Sun, 31 May 2026 07:01:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CABBF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1223440422
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIVTg6St-E9j for <buildroot@buildroot.org>;
 Sun, 31 May 2026 07:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68ED3403DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68ED3403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BAE0876A2; Sun, 31 May 2026 07:00:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 09:00:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 299567b78eb393b0b90a28c208f7b1716a8a1f7b
X-Git-Newrev: ce3b3bf876a527da0e4be925ae28f3d40c25c250
X-Patchwork-Hint: ignore
Message-Id: <20260531070051.0BAE0876A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-sdl2: fix cmake 4 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce3b3bf876a527da0e4be925ae28f3d40c25c250
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/f75/f75d1d0b83c90c0cb5dc7781ea8ce7ff1d67512a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...use-a-better-FindSDL2-based-on-components.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
new file mode 100644
index 0000000000..ce3a96e5a3
--- /dev/null
+++ b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
@@ -0,0 +1,29 @@
+From 8bb1cbb2b346502d6285a40e25e52d3e41551afb Mon Sep 17 00:00:00 2001
+From: David Demelier <markand@malikania.fr>
+Date: Sun, 24 Jan 2021 14:28:15 +0100
+Subject: [PATCH] cmake: use a better FindSDL2 based on components
+
+Upstream: https://github.com/Tangent128/luasdl2/commit/feb49bb1eea77aa953313f2a641576e515f0ec3b
+
+[Bernd: Partially backported to fix build error with cmake 4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f5b59de..cc28bdf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.10)
+ project(Lua-SDL2 C)
+ 
+ # Project information
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
