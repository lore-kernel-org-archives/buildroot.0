Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099CDFCC056
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28BE83D8D;
	Fri,  6 Mar 2026 18:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVRzIGOtKwKJ; Fri,  6 Mar 2026 18:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0027783D96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772821136;
	bh=4G7cCe8ZX1YYTuAih9FGg+JJfxtIKLW99JW2TnR4k50=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s2gbH9+1a7Ddbz/NGQpl4RLnWTgpET7ZoELDtNTfnWD07TYdE0LwtVOH5HjziPGpr
	 6H0tBJ7aVIBXeadx2QRUJkC6mOpvWL3iuVr2zyz/iTMUiloyvJR6l1b7EyP0hVFWJw
	 zphyL0IvvCfwlaCIATUDOgFsIgMipbW2xBGRx5YNLiGZB3kaM/8SR/pxdsXQkFgW4t
	 oep0f8bCXNyNqaZtZR7erOiq40Lgeh8ldnCHwo+2bX6k3uO1YtzyVl70Id+M2QX4qc
	 bnD1M5dYeVC9LeSo8nRc2e2Oz+XJFXq6b3xOlIPonxgC+mph+OnGpSPr2+oS+NPwu/
	 kCiUEX1ykJVaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0027783D96;
	Fri,  6 Mar 2026 18:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEA525B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F2EA40754
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7neqRqq3e689 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5B74074D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F5B74074D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35E3284D86; Fri,  6 Mar 2026 18:18:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:17:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2093bfa0aa48e8803bc93634beca9e0b176fecbb
X-Git-Newrev: 8313d8a2faf8423cacef7acc88bc385201beb05d
X-Patchwork-Hint: ignore
Message-Id: <20260306181854.35E3284D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra: update artifacts
 URL to https and .org domain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8313d8a2faf8423cacef7acc88bc385201beb05d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
