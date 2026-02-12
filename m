Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5890DEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259F6615E2;
	Fri, 13 Feb 2026 19:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95JOZiV-tWdL; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B970615DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011458;
	bh=CZJWZJYm/kABNUIS1KUnxws5whjUUCkMjy4A9Goy2As=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HFeXmnGeCZl5mPzBWmDzAYB2JG5htbBwcNSZdBOfsR3qBh0SKgoryUfK1XkpWu02Z
	 EAdVLRcJk/EN0crC+uz+gKTKNJlWABXkyc4psReBw/xWJPcStoZriz1unaydWwX8wx
	 cBN9tPB9ItW3xiWSkWbha4FydH6LnhrTWzIKq8hHeQgZHEcKnfIWGlDRwK/355LqHc
	 0v9rLjqQZYYRZGju9+fMF9njeBAcGF20mRYksF0WLIt8hDVWhQGZQLt8Gq2KkmSoUJ
	 FH7MxQ8UzkAdbCZVTsAjN+3EYcKcdZ78Lwqg/Idm6ns8YzAU2eQqf9e7+OqdS3rd8u
	 uyEtjwAkJzb2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B970615DE;
	Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2C2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F920412D7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxym8vqVkt8j for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FAA140380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FAA140380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 315E684169; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:15:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ef477d838b92c463874acb4c7175a23da027000c
X-Git-Newrev: c84505230c90e3d9d4d22f65a46d8a0cc31cc0ea
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.315E684169@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/efl: update
 Upstream: field in 0001 patch
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c84505230c90e3d9d4d22f65a46d8a0cc31cc0ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bac34296bfed5282df07496c845d74924beb5da6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/efl/0001-ecore_fb-fix-build-with-tslib.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
index 2756e0932d..4b12183de4 100644
--- a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
+++ b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
@@ -12,6 +12,7 @@ ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
 Fixes:
  - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
 
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/f28462ee1082a26e4c394ff5fc6e2994d02bfb0f
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/lib/ecore_fb/meson.build | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
