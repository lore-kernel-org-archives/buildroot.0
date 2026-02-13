Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF03EF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC716155C;
	Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhBuVdFYs3lD; Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB6C61573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011392;
	bh=qmLiEZJpaPMz/gK8fYkcP9NLBgxLMGeXtkj8fUJzshc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RbbCbwuiXl+18La70BQtyPKBEMpTqoUQEPcxi4vhYfSTk/o4l2zMEWqNRnU1dkQ1E
	 sNsBVYogL+aYY68sK6M+doZJ5CxqnlrnEgS2jUMzSjZHA2/s+iqqRw42vc+FstOITd
	 0bBcr39xSHqhGmajCmNXY4RIntB0UKji7sYUMmYniSDF07WHUoWn81uefyE+Lqm/yk
	 3qAxRlfKpygv6FgOOdjI/bezVsb4/JJUhbjqSlcMOjAKz1ZJuVZZgL78dopAbIi+9S
	 3zX/F2XwTS4k3JAcCgmDuJO7vuFSuZxu6+lWZMQhO/vLDIkUBbh5mNNJXqiqQuE5FZ
	 b7Gtl8RDLZDNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB6C61573;
	Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 118AFEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928DB8451E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtPEho_zkmPn for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E7F84536
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11E7F84536
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06F9B83A88; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:41 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4a50565d0758ce96fdcdc194833344cdb6cb48d2
X-Git-Newrev: 287645b65df4559adcb9f8490d9d52c837bb4544
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.06F9B83A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: security
 bump version to 9.18.44
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/287645b65df4559adcb9f8490d9d52c837bb4544
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/changelog.html

Fixes CVE-2025-13878.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fbad192a4dd9e2ebaff1d023d781b345cff731a0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d601e87b75..aaf3519ced 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.41/bind-9.18.41.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d  bind-9.18.41.tar.xz
+sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8b336ab781..041541b037 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.41
+BIND_VERSION = 9.18.44
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
