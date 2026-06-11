Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE2CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49406115E;
	Fri, 12 Jun 2026 11:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3W2KBOyWokSj; Fri, 12 Jun 2026 11:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1216161151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263481;
	bh=dMaW6AmpZuLpS4I0MvY2HpxYSLE+IJ62AesdvCdvW80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bVMDo+yo4c8+pwVrdHprMLOp/esXRUhqTN5uipaGOHotBCUtCf1uZCgYjnvta/fZN
	 OZnwf99igcjNgywr5JX+N1HqpDq3seK7yvak3dIIfh6cCujgwGIPRuOu2B6Uohs+ae
	 aZkVsxIUPRO/BQSZqhlson0aDFPaCxWc8J+F7/Ryk1nOtUw+rudWOF2AvP3U5WvPex
	 0oVD+N5VCvghxUAe3ewUzKKs1+8DfB/LZLaxQR2pMPmz5JL9gJClp/+QGNQF0wwPhR
	 ZOAw30+VeswqrQZ9PS2huPwmf8CXAg5x1CzmRgpAITO7du1vhEVpXaBcQM23sMkwCT
	 QRRTe6vHpjhFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1216161151;
	Fri, 12 Jun 2026 11:24:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D89AF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C71E60FBD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEVxf-V0gx-W for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF2CF60F30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF2CF60F30
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8D3F880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:35:14 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4855845127a9eb3e872137b3011b818b8094115c
X-Git-Newrev: da1c00a6f1f512d86bf983a8aa11e3b74516fb68
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.B8D3F880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/runc: security
 bump to version 1.3.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da1c00a6f1f512d86bf983a8aa11e3b74516fb68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issues (1.3.3):

- CVE-2025-31133: container escape via "masked path" abuse due to mount race
  conditions
  https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

- CVE-2025-52565: container escape with malicious config due to /dev/console
  mount and related races
  https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

- CVE-2025-52881: container escape and denial of service due to arbitrary
  write gadgets and procfs write redirects
  https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

In addition, 1.3.4 and 1.3.5 fixes a number of regressions.  For details,
see the release notes:

https://github.com/opencontainers/runc/releases/tag/v1.3.1
https://github.com/opencontainers/runc/releases/tag/v1.3.2
https://github.com/opencontainers/runc/releases/tag/v1.3.3
https://github.com/opencontainers/runc/releases/tag/v1.3.4
https://github.com/opencontainers/runc/releases/tag/v1.3.5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e013e2df84fb36985261d7b3c6e6af06afd40f93)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 76857afb31..d3132b1008 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3262492ce42bea0919ee1a2d000b6f303fd14877295bc38d094876b55fdd448b  runc-1.3.0-go2.tar.gz
+sha256  72620f9b0e62d8da80c0c08a6265ab10d24330c544115c30713ba1429bde706d  runc-1.3.5-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index bdff619751..10ff98c9d7 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.3.0
+RUNC_VERSION = 1.3.5
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
