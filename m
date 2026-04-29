Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D03FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50448461F;
	Wed, 29 Apr 2026 20:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHdQ1L2GsPdB; Wed, 29 Apr 2026 20:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F5184524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777496154;
	bh=piXPsPVHDPDQ28NtUvjjeBBhkJpyfuAZjKdZq0Sujsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IdM3726cH0XNqOA09laElSRX5Z4G+/B2v1wciw3qUPwFMtbSU/Xew94q7E7noz+jL
	 esJgPb8lGab69miYmh6/yqyxjAwPqemBElnFqF6nRtQUMAkuNNoxIcZAkoZr075l8F
	 7N46FZo4hf2fsQfSEYC3x1lrmnvns99Pt/gd7D/PIvEgVH0BHdygOQrmznUEfY4EW4
	 GkbDs79Sjhq9XR6HApzpGvCyfCilbP19w9ZHlS1EnV+t1DNowbGBds60BtNgtPdkV3
	 60QXHgIhp2QbTGxilCMxZO92qq19VqSYIjuvBhnwsMTRX07tPg32HfQBqAAOwQZaAD
	 4bFfmILHvwiMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F5184524;
	Wed, 29 Apr 2026 20:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB233204
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD5CF844EA
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOrCR49Uy2Bm for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0EC844E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C0EC844E4
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9F8683BB3; Wed, 29 Apr 2026 20:55:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 22:36:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 872a781c0c454666976af73d1786fe822f97302e
X-Git-Newrev: a9942e87930072d16818acb7f6949b4518c8050a
X-Patchwork-Hint: ignore
Message-Id: <20260429205551.D9F8683BB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 version 2.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9942e87930072d16818acb7f6949b4518c8050a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/pydantic/pydantic-settings/releases/tag/v2.14.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 7d450bd9a3..8b4850c569 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  11f7d886512c22a68c740c3e2b58651f  pydantic_settings-2.13.1.tar.gz
-sha256  b4c11847b15237fb0171e1462bf540e294affb9b86db4d9aa5c01730bdbe4025  pydantic_settings-2.13.1.tar.gz
+md5  08bd879ddfc1547b9cf1a32a90cfa86e  pydantic_settings-2.14.0.tar.gz
+sha256  24285fd4b0e0c06507dd9fdfd331ee23794305352aaec8fc4eb92d4047aeb67d  pydantic_settings-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 8ed968601d..10d79b46b7 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.13.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.14.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/52/6d/fffca34caecc4a3f97bda81b2098da5e8ab7efc9a66e819074a11955d87e
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
