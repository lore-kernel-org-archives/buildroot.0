Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2580CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A43A41217;
	Fri, 12 Jun 2026 11:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgG2UVntwzM8; Fri, 12 Jun 2026 11:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E5B4121F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263463;
	bh=xQruDxoz0dpiiGgo9kGWYYCv9Z1OFrTJ/a+Ehg7CzXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PzXM16bZ62oeVQTSTHl+3oZub57VZiC7cJJ5EwqkwhP2noagzUaXUvfyPAQXzaaLS
	 XgLbmL+zmRjsTrYk86UxeW/keIRblKjoWw0hGF5zQMgFCDIZU+DMdF4gF6LMNrIc3R
	 jVRhhBVFh5a/RIasyczLFf5gxa5uFGxNHPRO2qgpOt7ugaUb/xUfsq3MS6BPaS7mLK
	 /v/VXDtZ1vM7HLSF/8gHXUhr02mmx9OZb9r2C5CJELlH757IqBB6tE7cxycKCj+L4L
	 6O5lKanT+PjrEcm2SOiTXHyHpOnPzlZCmY91YoGGK5SLxG/DpfkxuFgbjQgXO3Jrb0
	 3jnfp5w08FFrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E5B4121F;
	Fri, 12 Jun 2026 11:24:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A0BF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE88460F33
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvnCEDdjkqqi for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF0460F1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF0460F1E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA982880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:41:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 15c475247374873e5b8b307ece6e70b33b1b7071
X-Git-Newrev: 69b4c798318af51f5dc48951c6e01c4140871378
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.EA982880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sane-backends:
 update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69b4c798318af51f5dc48951c6e01c4140871378
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE 'sane-backends_project:sane-backends' only has a single CVE
assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
[1].

See the package CVE history at [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
[2] https://security-tracker.debian.org/tracker/source-package/sane-backends

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41e76b356ceb3dbf8aeec5597e70d7a64605af47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
