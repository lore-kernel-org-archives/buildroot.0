Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523C9D2A538
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC26261C77;
	Thu,  4 Dec 2025 20:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsNwaX6cCXx3; Thu,  4 Dec 2025 20:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F2961CBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880853;
	bh=crpGEoLzwqX/HqLU1I66SRy+OWluafIZKI0UZ/AeajM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GZiCGcGrdwaayc7+dXbjWfhACMrle9SXIGk3WxFNSc40eiK4zUNGwWh+ygo/6J7Tr
	 J+PRJLZCnnKxnfKh3nsvb+aa3cNyWwm9+oyw0XmURZfuzx8BdEvVLZpxkCh7kLYl8W
	 Yf7RCON4SCE/XPH1S9RpM/aAxMIyfoZjkIAQBQYcPbnhH2WrM1YCjLqEGm+/qHK0SP
	 lghIWJnVyjs8EHlOhppGCAWtD0qzfd+FzMAAvnllsYAVKHKKqvX1DtZjzrdvN1sxM5
	 HpyzPDH+vHaedUmoB2Vzc+o5Mo+rWr38MKRwTI4/79FKI2rKHB8G8mXbJpG1JRSiAL
	 1mg2C/Epw3/GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F2961CBB;
	Thu,  4 Dec 2025 20:40:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 013E7D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33EAE407CA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2eX3nQG0VUp for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58EC4407C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58EC4407C8
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A0DF86511; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:11:49 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 60732a6a51f42d50365b55b8255ab67757894f40
X-Git-Newrev: b85474755beee348eaa8c64414b4cb61705ed1e8
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.4A0DF86511@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python-starlette:
 security bump to 0.50.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b85474755beee348eaa8c64414b4cb61705ed1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Starlette 0.49.1 fixes the following security issue:
https://github.com/Kludex/starlette/security/advisories/GHSA-7f5h-v6xp-fcq8

Other changes:
* https://github.com/Kludex/starlette/releases/tag/0.49.0
* https://github.com/Kludex/starlette/releases/tag/0.49.1 (the security fix)
* https://github.com/Kludex/starlette/releases/tag/0.49.2
* https://github.com/Kludex/starlette/releases/tag/0.49.3
* https://github.com/Kludex/starlette/releases/tag/0.50.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 35d8a3a0ca6bbaef1c9e2ee9f7f16f1a5b056b17)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index bcc71c09c5..9b84774c86 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  9e56e4be3ee2a746ee6375fd9e81f61c  starlette-0.48.0.tar.gz
-sha256  7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46  starlette-0.48.0.tar.gz
+md5  f3479ed026aeaffb43af371d3b7db527  starlette-0.50.0.tar.gz
+sha256  a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca  starlette-0.50.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index a643623e03..af8a49e0fd 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.48.0
+PYTHON_STARLETTE_VERSION = 0.50.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/a7/a5/d6f429d43394057b67a6b5bbe6eae2f77a6bf7459d961fdb224bf206eee6
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ba/b8/73a0e6a6e079a9d9cfa64113d771e421640b6f679a52eeb9b32f72d871a1
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
