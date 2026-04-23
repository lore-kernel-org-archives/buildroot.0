Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC33DFED3EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C8B84E01;
	Fri, 24 Apr 2026 16:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JMnRSuNzQ44; Fri, 24 Apr 2026 16:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C17E484E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048727;
	bh=NXlFPLse+30mnJuwEVkOAr8ATz4E0mCnCydq7rNK8QE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FWEvrDr33Ri5ROi25JSKuGwa2vP4s8UxO5x5JkgevYojCdJpX5odeMbpP3JFIYnHz
	 zeXlKWKaAsJPlSt2BIZDosG+d/E0V7MkOdSsYxPasUS6R5jAJw5u9aehfjLxQ9/MKG
	 UxOfWrOOzfo0ZsHo3H8ON2tbFG6Simag6Afyvq9MAkNZJZhuN/DY07/zvM5WNqcpWo
	 YgL4L29qV0hYkW+rtCLPZ9r8KKwt2sqUEOI5xgz8dUS801kOKh8zBaw2MRzz0GS9Sl
	 NkygaPwFfrzWOOx9DKhgwO4EEWuOdsatpj9Bp6mGqhplk0KuRwmuPH7yG7bR7oB2Ku
	 gFVpYz6ESRpxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C17E484E21;
	Fri, 24 Apr 2026 16:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA5A24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26A30423ED
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWSFSsI_CACF for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FAA423F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FAA423F5
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C47B582AFA; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:33:50 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8fd272727005550f3b6e1acc6c31d1990ac269c3
X-Git-Newrev: 0be927b89a319c9ac35249354558e9f4cb102fd0
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.C47B582AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/systemd: security
 bump to v258.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0be927b89a319c9ac35249354558e9f4cb102fd0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This fixes the following vulnerabilities:

- CVE-2026-29111 (fixed in 258.5):
    systemd, a system and service manager, (as PID 1) hits an assert and
    freezes execution when an unprivileged IPC API call is made with
    spurious data. On version v249 and older the effect is not an assert,
    but stack overwriting, with the attacker controlled content. From
    version v250 and newer this is not possible as the safety check causes
    an assert instead. This IPC call was added in v239, so versions older
    than that are not affected. Versions 260-rc1, 259.2, 258.5, and 257.11
    contain patches. No known workarounds are available.
    https://www.cve.org/CVERecord?id=CVE-2026-29111

- CVE-2026-40226 (fixed in 258.6):
    In nspawn in systemd 233 through 259 before 260, an escape-to-host
    action can occur via a crafted optional config file.
    https://www.cve.org/CVERecord?id=CVE-2026-40226
    https://github.com/systemd/systemd/security/advisories/GHSA-9mj4-rrc3-gjcx

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Marcus: note which minor versions included the respective security fixes]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit f6e0ad3858687d5a0194a3abb4171770fd49be35)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d5a97ffcbd..e96d3ba7ad 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  5c95e54e555b21594ab11e76f91a092c6383553ed725292eb0a929bf2fe028ae  systemd-258.4.tar.gz
+sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4b488857fd..9ce4f8fef2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.4
+SYSTEMD_VERSION = 258.7
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
