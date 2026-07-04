Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AE4C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496904097B;
	Sat,  4 Jul 2026 16:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnOJSw34xrYO; Sat,  4 Jul 2026 16:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663CE4097C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783183180;
	bh=j0wV8JELPA8O7uEkKkbDqtbGLGzPS6uj5IDthAwCGp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AJKcntwgRdn3pZleUcbXsqggLzx4th3u0nH3vz1pqwsQjElbzhE575vIDg0xleiix
	 ZCEcVMusUYBhu4N3MW/+n2SfZJ8GOn8VCu+AwwRNjs62sxml/6wR6a7t7K+Y0TDd5q
	 GkdXmk1go2AN5IpNCp+iZ7ycXYkGWdFlAun74lsq7lDF02BYfnNLWvKCc6ZaYZi77Q
	 whPnnHyk15Eh/Nh4UtKH/UpCrwtojwYg8Hk8EUnqCRZhz4b5J18yNtyuu7yvI1x8EN
	 JekLu31zs+vcDQINtePaLgyUVV7HSAhjdM3BR0pcnAPni4W5/DfTYhMs+eYCux60re
	 JRMFdyYVtEzVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 663CE4097C;
	Sat,  4 Jul 2026 16:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D70D14F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F9C38114E
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtEjEy67YgpS for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF9D8114D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF9D8114D
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D9B7881E8; Sat,  4 Jul 2026 16:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 18:35:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31cd41c84b7d76800c85df4433dc280e713890e7
X-Git-Newrev: 980d01157074d4403221534a54d17f5bf9563697
X-Patchwork-Hint: ignore
Message-Id: <20260704163908.5D9B7881E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.53.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/980d01157074d4403221534a54d17f5bf9563697
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_53_3.html
https://sqlite.org/src/timeline?from=version-3.53.2&to=version-3.53.3&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 948a603d4d..1b81bef6e8 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316  sqlite-autoconf-3530200.tar.gz
+sha256  c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0  sqlite-autoconf-3530300.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index aa2e24e8b5..b27abef9e9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.2
-SQLITE_TAR_VERSION = 3530200
+SQLITE_VERSION = 3.53.3
+SQLITE_TAR_VERSION = 3530300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
