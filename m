Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9EDCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23CB83145;
	Fri, 15 May 2026 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epyzuHuKvGDv; Fri, 15 May 2026 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C159582798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867263;
	bh=HtugOvWcUGYL1FwsNoZ+p2GRhGOCnku5oeFoG5lYDpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rg0IptQShY+n+R/5agJShCSTeeSl9RTqIqRxoQdnnooy+OZKWBXCUkxh4SnLkQjgw
	 dQpShw1ndI2uf0zU6o2yNbs8BGtOdXa6TOxcsO6MqDk+3G0aEMB9VMKfPZD7ixmmjl
	 /8NDZymX1yVO8Bq6Yh4P7tv4S1B0EJdNldSuxbhjNJesh2FpvT1tETApLyPsV9C92k
	 TTwQz2oVEGGBCT+/VARqyq4AXLlO+RiDCpc8KGuuCcudzYnjI57i5GRTI/SxChfsIj
	 7n2V7N3QoFmy0uCyj47BwJ4vs/Nku0WP5dgfeogMPa2SXUpU4wiQGacAoPIjjFZ5kk
	 4mYiO2ONM5T5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C159582798;
	Fri, 15 May 2026 17:47:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DFC23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B9E41D50
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioL_Xc-th_QG for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C5A41DA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C5A41DA3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3E5E863DA; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:50:06 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7e18e312205347656e1e1e2c17bf6529a6275174
X-Git-Newrev: c023dc644a7dd157d307303578d4e47b053b02d8
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.E3E5E863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/php: security
 bump version to 8.5.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c023dc644a7dd157d307303578d4e47b053b02d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.php.net/ChangeLog-8.php#8.5.6
https://news-web.php.net/php.announce/492
https://github.com/php/php-src/blob/php-8.5.6/NEWS

Fixes CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258 &
CVE-2026-42371.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 952aa90078dcba233b5b9723f4855ade4a695b4c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d400f8e0bb..c85df44d73 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
+sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 9976884001..0eae93fac2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.5
+PHP_VERSION = 8.5.6
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
