Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D519107BCFF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6620610A5;
	Sat, 14 Mar 2026 08:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRMFdcZkqhhu; Sat, 14 Mar 2026 08:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB196100D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475245;
	bh=6aFmjBYAaC7iKntGfI0G8ocipmsMLsEFthH36CoxewI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Amfk0FiYPOlrp/u9aSJof8Le0DRy4bZb8ShhGxJMozRtalNUiAXFSCsN5Is11ijYO
	 HU/D3nRaoxw85CorT2AFoVSCCpPF8GVGwP1oeZIbVHHtUOdaOF8EB0YeZtcBMoxqtq
	 G/9G9Z1jmWY3cJzNoBi3lydX9chy64+2W1Q6OSk+SGP/GrwWBOJenYdiiE9t6h3DrZ
	 s3QgWeKBrlteNeJu6hTmypW8h+OoQbzi/yIwMhKSD3cuDkls/CHKqvkn/7BSUuyfDV
	 5RaTlQAqtrx1FLFwfS9u47XAyOZda7LiLzo+XxfU45gohsXUJDYTva4Jkg4AIlo9TD
	 HfhD3OKKWwt4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB196100D;
	Sat, 14 Mar 2026 08:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 052111B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC8E60EFD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvBxAf8w1639 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E0F6101B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9E0F6101B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E03F685E16; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:06:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cc9e753211e789029dc6a3b47d9f0f950bfa130b
X-Git-Newrev: f829c4f7468de4404186098f862e16f0ec711819
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.E03F685E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing/infra:
 update artifacts URL to https and .org domain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f829c4f7468de4404186098f862e16f0ec711819
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The artifacts URL has been moved to https and domain to .org to
improve security and avoid redirection issues. This ensures that
downloads of kernels and rootfs images during runtime tests are
encrypted and verified.

The change has been tested by running a runtime test, confirming the
correct download and renaming of artifacts from the new URL:

    Downloading to .../tmpyotq8uor
    Renaming from .../tmpyotq8uor to .../kernel-versatile-5.10.202

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8313d8a2faf8423cacef7acc88bc385201beb05d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/infra/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index be61d8cc4f..98215e02ab 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -6,7 +6,7 @@ import subprocess
 from urllib.request import urlopen
 from urllib.error import HTTPError, URLError
 
-ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
+ARTIFACTS_URL = "https://autobuild.buildroot.org/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
