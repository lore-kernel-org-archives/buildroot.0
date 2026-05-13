Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF8CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7624E80A92;
	Wed, 13 May 2026 19:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEo1UwFJ2H5d; Wed, 13 May 2026 19:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B0280A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778698982;
	bh=b+n3Gl2MGRo1SWC+NVx2P78jFiSe8uaign4wPK6QaVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ootkXlwyMZBx/rV7Ji9S2O1BCACAXBu4zY6rnSSLV7/Be+e8grrKkOXqgFs6zy5cZ
	 6IWXH33ehJwEXUaCs5EYkpgdFG3Q1A2u/1eGlgnjF/VI8akhGb5bG9yJ56YFik0USf
	 7GU0jQCMOkNcUYUZPxebbrv4baaTBgdVVh+5umyNaIiQsvDYE0owWkCGUvluujJlsn
	 yq2RRoxSYJQC7t3/Zt8L2hNqB1ejAt7D1E0ARsi5Jx5qjv+sBVM2ja4v7QgKrC6jXe
	 yZwDXNlhbhlJGfeaKqq7dozJowNjW9Qt1Oo1SkewuCHbfuuxVE6DZqGNKy0VrsiD0o
	 bab/w7DbE2WDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B0280A9F;
	Wed, 13 May 2026 19:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61018270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FBBD80A92
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHKHcFmn0VWi for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA4080A90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BA4080A90
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:02:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E90C86139; Wed, 13 May 2026 19:02:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 21:00:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 258128aefef95cae78cb5fba8572dc6ce285c801
X-Git-Newrev: af2f3208cf31de0289a53a2c93fa1422da5c3acb
X-Patchwork-Hint: ignore
Message-Id: <20260513190254.4E90C86139@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-modemmanager: fix
 sdbus-modemmanager intall path
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af2f3208cf31de0289a53a2c93fa1422da5c3acb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the last version bump in commit [1] python-sdbus-modemmanager
install step miss-behave following the switch to poetry (as reported
by [2]).

The sdbus-modemmanager python module is intalled in a second
"modemmanager" subdirectory:

  $(TARGET_DIR)/lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/

This break existing python script using:

  from sdbus_block.modemmanager import MMBearer

Fix tool.poetry install step by removing one "modemmanager".

[1] 7c30b1e522988ffe5d4b300b2447f912b83558ad
[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t.toml-fix-sdbus-modemmanager-intall-path.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
new file mode 100644
index 0000000000..40638c652e
--- /dev/null
+++ b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
@@ -0,0 +1,50 @@
+From 7a99efa663bf9602099f0658aecbec6b5dce778a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 9 May 2026 00:29:59 +0200
+Subject: [PATCH] pyproject.toml: fix sdbus-modemmanager intall path
+
+Since the switch to poetry in 1.0.3 [1] python-sdbus-modemmanager
+install step miss-behave (as reported by [2]).
+
+The sdbus-modemmanager python module is intalled in a second
+"modemmanager" subdirectory:
+
+  /lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/
+
+This break existing python script using:
+
+  from sdbus_block.modemmanager import MMBearer
+
+Fix tool.poetry install step by removing one "modemmanager".
+
+[1] 0d8ae7217841ab1bc12282076f766f94415573f5
+[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359
+
+Upstream: https://github.com/zhanglongqi/python-sdbus-modemmanager/pull/25
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 5e57df6..bf97a5d 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -27,8 +27,8 @@ classifiers = [
+ 
+ [tool.poetry]
+ packages = [
+-    { include = "modemmanager", from="sdbus_async", to="sdbus_async/modemmanager" },
+-    { include = "modemmanager", from="sdbus_block", to="sdbus_block/modemmanager" },
++    { include = "modemmanager", from="sdbus_async", to="sdbus_async" },
++    { include = "modemmanager", from="sdbus_block", to="sdbus_block" },
+ ]
+ 
+ [build-system]
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
