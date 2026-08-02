Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF317C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4226680BFB;
	Sun,  2 Aug 2026 16:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-RYa6YW6NlV; Sun,  2 Aug 2026 16:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B04580C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785689160;
	bh=936g/QuT4j3y8FoZ1KOM7YIHskOA6oaR97vk/ltW7KE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RXwM24w9RZFdR77coXI2+23EY3Xh4ZQriAKdeXTvLoHf1e1biIOdbStNPNliuIRZe
	 vonBiSwF9xXg//2FO3iw6yamckiyQWdGN3bQQByWceAnLyXow2EOWwVEImyt/9D5Pj
	 6b6GN7KcSTdnzo7RypIkfpSEYyqhaVwrj8Yfkr0dr8ql6d4e5jDRBunbZjpNAoTys5
	 ZIeUVxgbVBajLmlN2+QKzDEOURdVddR9Lqy4pKfidYD+/ZtZLdKm2gkh8hjD27fbma
	 Fubh/846IfbxEMNps3ILXOS9K5Z+rjWXX5MYnZ1bUzb/Bwzq+hFWCtmdMASDbpelPU
	 4lGG0yKdCmFow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B04580C26;
	Sun,  2 Aug 2026 16:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 995632CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4CD40085
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maOB8omM5JDT for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 16:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF1C4005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EF1C4005A
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 578208B829; Sun,  2 Aug 2026 16:45:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 18:25:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bba497d60daf565dc230e4dbd46af1e16988d966
X-Git-Newrev: dd7ec89b7eaf1b9e1893ea8fb5d2c9600b88ef02
X-Patchwork-Hint: ignore
Message-Id: <20260802164513.578208B829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-argparse: bump to version 0.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd7ec89b7eaf1b9e1893ea8fb5d2c9600b88ef02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

for changelog, see:
https://github.com/luarocks/argparse/blob/0.7.2/CHANGELOG.md

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-argparse/lua-argparse.hash | 4 ++--
 package/lua-argparse/lua-argparse.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-argparse/lua-argparse.hash b/package/lua-argparse/lua-argparse.hash
index c573ba5796..c5c61c091f 100644
--- a/package/lua-argparse/lua-argparse.hash
+++ b/package/lua-argparse/lua-argparse.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
-sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
+sha256  c122a25224876e93bd380ceb51af28cd8a72296e098b2eed4f06d85f54f1a0b4  argparse-0.7.2-1.src.rock
+sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.2/LICENSE
diff --git a/package/lua-argparse/lua-argparse.mk b/package/lua-argparse/lua-argparse.mk
index 77f6550fac..21835edb2c 100644
--- a/package/lua-argparse/lua-argparse.mk
+++ b/package/lua-argparse/lua-argparse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ARGPARSE_VERSION = 0.7.1-1
+LUA_ARGPARSE_VERSION = 0.7.2-1
 LUA_ARGPARSE_NAME_UPSTREAM = argparse
 LUA_ARGPARSE_LICENSE = MIT
 LUA_ARGPARSE_LICENSE_FILES = $(LUA_ARGPARSE_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
