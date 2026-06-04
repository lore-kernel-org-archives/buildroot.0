Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C846CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D491841B45;
	Fri,  5 Jun 2026 12:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGRK1ncPNsNR; Fri,  5 Jun 2026 12:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E2241B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663255;
	bh=tdLzsyq5st6H8XjsRuDK3Az3+Q4ZSs+iDdqhrU3xNwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ozzQ3HzA/PNq0/wEXuS6iTMHfkDMlYU84djBUm0GULY54bQC/Dx7Bbs3ubtY5+FMD
	 AnE4biovoH9Mg6RjZtfoHh3HXUKzsBsNOCimnePG8SKucbEpor6az3odQ3wsiauGrC
	 cXsIuyw9wfRqwX9ahlG85pomXBS1lIebSVQX6cM7xOyJzaD6EH5tvNy38rT0jJzIRB
	 RwjyuXuQ/0sq7IluqX47a0L6xJJLrGn2w3s6ObsaCAxRlG1A3Wuvc3CkZXm/Oh/Utf
	 AqvlHAAFE/wid/E0JrJyrZs6/CtgboNdEMa/D89D4735qm/NohholiV5Js2zoxBLGl
	 /Pfw2ElJKURcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E2241B4A;
	Fri,  5 Jun 2026 12:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB243B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B09F7410E0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxAcd8MnUVEl for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E18241097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E18241097
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B846087B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:25:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8f26816379bc7340953d9250ad67d19d9277602e
X-Git-Newrev: ef803515ae318ca4956bc83c005decccdb6baa04
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.B846087B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/lua-sdl2: fix
 cmake 4 compatibility
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef803515ae318ca4956bc83c005decccdb6baa04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/f75/f75d1d0b83c90c0cb5dc7781ea8ce7ff1d67512a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ce3b3bf876a527da0e4be925ae28f3d40c25c250)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
