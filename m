Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF4105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7994160F00;
	Sat, 14 Mar 2026 07:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfBaNbbDu3yi; Sat, 14 Mar 2026 07:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A651860F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474583;
	bh=MnSIbrSCLFxgCapxZMmk4otmPl0CNQnL5TBmCr0m+y8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/KHRJeOZyH0Kw3sCwBY4XmK4GqbIHymjUkJggqgrQ91c2WyY2rgvLFFMKqKANnwi
	 VC45Mv8BH1111Cmf1hBAIBsINs4tKvgvacWaUpzjW4rVE4uoYjNKui2GgjFL5kusv4
	 bqzN3yyg9tXHXR2K0V76LJS4jq5hCa+9l0IHUdjK4JIo8ggX6xTK3GKcLtDLkUZ7yN
	 OEYhFI+dDljyzo5GVvyGPCo7nTSkYrxn7Kovsi19T81sLqILWpKQkj7YRevPNZ9MXz
	 IpjH1vlw2j7huMGoHN/AqsALqyaq/HQYhCgFHWhnsq6v49HZqRe16xcLZTo+brFNWU
	 YjMYG90h7tpkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A651860F0E;
	Sat, 14 Mar 2026 07:49:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD8C201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2069822C0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-qH-n9WqMQO for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4B6822C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF4B6822C3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03B9D85EE5; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:06:47 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3bfce3675049bcb4ae3674817870d85ab11dbce1
X-Git-Newrev: 4e594d0eda67aeb5af0bbac803ee26967e6b7372
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.03B9D85EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing/infra:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e594d0eda67aeb5af0bbac803ee26967e6b7372
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
