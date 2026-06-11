Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66730CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD89560F4D;
	Fri, 12 Jun 2026 11:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNrlUEgQjB91; Fri, 12 Jun 2026 11:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D7F60F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263363;
	bh=Sgr58d6spoafSsyYBA7ncWmithd78M/XodZ0ZOTU9n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lyxxp64GXjnrXvZJknr8SSZzFbqllOO7TDvOAWGCeb4HZSEc8KZucpWf9Q5OZSvsG
	 ChapM9NvUSta+bQcuvN/QslYXXidOvYLLwTTF7lux8KB7r4/wP042TZHydhpZgFEhx
	 VshQw7DeTurJOfCEkSjpsn8fm1kXzA2r59arixLKJAGu2oq9rQM7S7cPAqDwyVe/qe
	 VSYFKeOoQaJlGDunmtfu5N38BQVoHIr46IushjFp0nY7Nmu8mjkGe6sw5Kccu5Bv0Y
	 BEZzBuBpj4OirOjNKRY1LCLrXT8vuKIUJ+rksgUX1EHHvUfCVEoqfyjLgLsqmqSd5j
	 FeSmbKXealBtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D7F60F84;
	Fri, 12 Jun 2026 11:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1873B3B7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DEC760F1B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0O3MswlK_wV for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0069E60F16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0069E60F16
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB66F880D5; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:35:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 477c5c0510cf78412935da47b6e7e761822831b5
X-Git-Newrev: b347285b1d8d5c9e1c07e8b138fbb5a1cd792b0f
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.CB66F880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/runc: security
 bump to v1.2.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b347285b1d8d5c9e1c07e8b138fbb5a1cd792b0f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security issues (in v1.2.8):

- CVE-2025-31133: container escape via "masked path" abuse due to mount race
  conditions
  https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

- CVE-2025-52565: container escape with malicious config due to /dev/console
  mount and related races
  https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

- CVE-2025-52881: container escape and denial of service due to arbitrary
  write gadgets and procfs write redirects
  https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

There are also numerous bugfixes.

See the releases notes:

- https://github.com/opencontainers/runc/releases/v1.2.5
- https://github.com/opencontainers/runc/releases/v1.2.6
- https://github.com/opencontainers/runc/releases/v1.2.7
- https://github.com/opencontainers/runc/releases/v1.2.8
- https://github.com/opencontainers/runc/releases/v1.2.9

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d25d8facfd..33850238f3 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9785c144c97974b52b6091b7a79168b73681ff574bc8438b44f3f5f8c112f171  runc-1.2.4-go2.tar.gz
+sha256  8e298469fc729d37920a7ee45c7cd587a4139149abccca485e08d616b80d2fad  runc-1.2.9-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 51ac32de26..0daffa1368 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.2.4
+RUNC_VERSION = 1.2.9
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
