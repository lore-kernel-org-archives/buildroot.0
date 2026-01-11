Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E785D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4635540157;
	Sun, 11 Jan 2026 21:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFLLivpJe-tJ; Sun, 11 Jan 2026 21:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6104016E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768166750;
	bh=nD2foCjuJL5K93+st1pz4ltKK99wbFlMtvKkozqIZ+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GU9LPR27hYhZQu9bmwGqNk8JhIYqUfnC/pZfWKlU+MjuOgpFj4Bvf8abBK2vCWBpp
	 tCqAFKwfA/ZHH7xtQHly4E230N7cZgVGrs7CtZBvI1xuT7x46YjO/cu19KIi1oBEOz
	 dxY0fhjOLV/AZPpI7bVNHPcZu9tPZq81qPm7zNHLrOkj22ztYpUKBVGB7U6oZnFthS
	 pb4D6L/nT4j/b9cKJ4kRU3brZ2MlBeQBmGcPYAr4LC6RVExbdXmL/vqf2OKIQWmWxv
	 jF1o1Dxnd0LD614SpZyn5BaR2IjMAUp4rTJKXWLRGTax/jaIB1XSTTop695EjxNAQj
	 FcKemGjPsZ5pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6104016E;
	Sun, 11 Jan 2026 21:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE8212E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E0F40157
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ProRLZhpboxR for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 21:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817664014C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 817664014C
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B035884C3; Sun, 11 Jan 2026 21:25:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 22:22:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58111696d72828c1658750dfb5cf13a32e117f5f
X-Git-Newrev: 9ff4256b19c2880e6fdcae08d9317b6f70397162
X-Patchwork-Hint: ignore
Message-Id: <20260111212547.7B035884C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: bump version to 78.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ff4256b19c2880e6fdcae08d9317b6f70397162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/unicode-org/icu/releases/tag/release-78.2

Added tarball hash from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/icu/icu.hash | 3 ++-
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 4f60681c54..d79b95b174 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,4 @@
+# From https://github.com/unicode-org/icu/releases/tag/release-78.2
+sha256  3e99687b5c435d4b209630e2d2ebb79906c984685e78635078b672e03c89df35  icu4c-78.2-sources.tgz
 # Locally computed
-sha256  6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886  icu4c-78.1-sources.tgz
 sha256  e55522d81edc687a341a4411e0776e54ca654e90147f354a90458aaced4116af  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a0b4388355..3030e0c71c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 78.1
+ICU_VERSION = 78.2
 ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
