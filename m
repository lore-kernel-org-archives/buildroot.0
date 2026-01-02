Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EBFA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2862081E0D;
	Fri,  2 Jan 2026 22:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-H7HdnI6tTl; Fri,  2 Jan 2026 22:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8C781E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393889;
	bh=F+gHB33DEsSE+RieajDVsCRh/hx3dsCvsEsGlstBdEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qmIyQcfLtMCOyJAoaRxbv2CVcFEMMnYyf2FuG8EeO+CSh+B1dxk2yYw9jhbX2bWXZ
	 WsoxSxpf9KBmRzFy6yOfFpUXK2ICoyneOXnuq+BhC1L+BZo4jrPWVjZIRRopiZXFZe
	 LI5Bp8l9On5nQy8katDgGJlr/PcROJglZLKhWT5q1s1UMnuO4MCAX38b33Cv+UoIjE
	 yHT+MXTREMWlz5GKK3aqUYnUhM6dHqZivjatWoKM3h4o6U4RHlvNGhdT9OP8O0NH6X
	 fcgxS9gVRmpaCRmZ6HrmL6dp8N1YCgpe0bpaUxWedv/K8S6r04mlcOdYg2+Cumios3
	 u1jBDI65wzB7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8C781E17;
	Fri,  2 Jan 2026 22:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24BF5249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ABCE81E17
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJmpUEdjpDub for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53AB81E0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B53AB81E0D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F2A2880A4; Fri,  2 Jan 2026 22:44:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:43:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b403dfe54a178a8477b347a50f9614ebfcd2be4a
X-Git-Newrev: 8ed41994e4aa47b0f37dacab19fe01c8ce27b042
X-Patchwork-Hint: ignore
Message-Id: <20260102224446.9F2A2880A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-context: bump to
 version 6.0.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ed41994e4aa47b0f37dacab19fe01c8ce27b042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.context/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.context/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index d638965772..3f65a6275a 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-context/json
-md5  bb22ef027077b1fa8528ef1d9840b838  jaraco_context-6.0.1.tar.gz
-sha256  9bae4ea555cf0b14938dc0aee7c9f32ed303aa20a3b73e7dc80111628792d1b3  jaraco_context-6.0.1.tar.gz
+md5  b75fd0eeed9134ba598bad534244b984  jaraco_context-6.0.2.tar.gz
+sha256  953ae8dddb57b1d791bf72ea1009b32088840a7dd19b9ba16443f62be919ee57  jaraco_context-6.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index d33521afdd..27cfd7467c 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 6.0.1
+PYTHON_JARACO_CONTEXT_VERSION = 6.0.2
 PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/df/ad/f3777b81bf0b6e7bc7514a1656d3e637b2e8e15fab2ce3235730b3e7a4e6
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/8d/7d/41acf8e22d791bde812cb6c2c36128bb932ed8ae066bcb5e39cb198e8253
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
-PYTHON_JARACO_CONTEXT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
