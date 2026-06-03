Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B74CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB1461B27;
	Wed,  3 Jun 2026 18:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaZzItztFEdJ; Wed,  3 Jun 2026 18:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E52461B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512596;
	bh=mGpA6tUUWQQDO/p/c8HTVDt/+WIP/cwFgCpztB2RQ+I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OvNyu5b+iNjcJoNAl2j+S+YD4Vi2VXx+ODwuS8bPGdNkx1trCL7U5VAdegomL7Yd0
	 N/ihCvebTWn3f6ihwe3PVYl2ez//AsDKOv9EwSEDXK0XU8brxJWbS/AP7HKg3/+MbD
	 y7gIqt4bnG5b/1lsKZeiXNmgEr5MBOX+Ai7UK/OYrACqlTGv1If13NlqZrqQu+6U8L
	 lXLyxzzkmKLlvl6s+qYXmnHVVaLnhpUSz22hnsbbllNvJTX3T1Z6cUTSIcFUrNY1BE
	 /mHiPLQLpBDyqg82p16YsaACU2r189jiui19Q9iix+8QSmG/KQ3XFuaPF692ngw/JN
	 9xSvGkIP/Kdug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E52461B11;
	Wed,  3 Jun 2026 18:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE362F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B08F8427E0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nwGwcpHSQUv for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AC7427E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3AC7427E1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C98B887992; Wed,  3 Jun 2026 18:49:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:47:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3687ebafa0a3d97b094d5b972a9323e00345da4
X-Git-Newrev: 41e76b356ceb3dbf8aeec5597e70d7a64605af47
X-Patchwork-Hint: ignore
Message-Id: <20260603184935.C98B887992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-backends: update CPE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41e76b356ceb3dbf8aeec5597e70d7a64605af47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE 'sane-backends_project:sane-backends' only has a single CVE
assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
[1].

See the package CVE history at [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
[2] https://security-tracker.debian.org/tracker/source-package/sane-backends

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-backends/sane-backends.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index fe89e7747d..de1375550c 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,7 +10,8 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-SANE_BACKENDS_CPE_ID_VALID = YES
+SANE_BACKENDS_CPE_ID_VENDOR = sane-project
+SANE_BACKENDS_CPE_ID_PRODUCT = sane_backends
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
