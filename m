Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E35BFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2034605C3;
	Fri,  2 Jan 2026 15:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvcfInUP6NlY; Fri,  2 Jan 2026 15:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B68B605F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367846;
	bh=CxAC4/3x29dv+93SVUHbvGtwkagE1VrNLTYWbgIzjwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I8PzDC9rMMT9ebC/fN18Sg8hXT5U8jmJeCzAzjQdvWRUBceYN79uI7UF1n3uVcPxn
	 GpEET2tkFwgGKWxQnhm5k9X2Yf2WXNsdI8309kS66x2NdtUPwnBbk28O4t/Y6VAlGW
	 K6n/n9BKsQfa+2J14wQFyJ7F+FDUQ8mPTpo7e9Av8wkniCwSfAznFFz8SojSkUT3v+
	 dK+I3pgg8+75Bb1Yt/Mp+JQiGlNLgHFodmcd5HfjE7NmCLYxrRcKWlNnG8+pYjqufb
	 EAuZiKIrURxtzp7FInqmGsa6xQzayYTwyDQEKFlDmnTEgEf0jef2giMruxStpEMfvP
	 Ug5We7ozYLPPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B68B605F4;
	Fri,  2 Jan 2026 15:30:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89AABD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734BA605F4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR6uGcYcn9uv for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F75605C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F75605C3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA3D887F48; Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:28:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5e737e5753fe0a87f329b125a96f32ffa36d8e5
X-Git-Newrev: cf655e8091007eb697e9516e16a93311c8085de0
X-Patchwork-Hint: ignore
Message-Id: <20260102153043.AA3D887F48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: bump version to
 1.7.2.post1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf655e8091007eb697e9516e16a93311c8085de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 456fe41005..80459b3e28 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  78859f23154da8c951770f2c5287804e  pylibfdt-1.7.2.tar.gz
-sha256  b18c6c40400ed4374d0a142dcdb07e5402574ff1304454019a1fd92735b54756  pylibfdt-1.7.2.tar.gz
+md5  206a0504f3d0f5895c00f572bc367e54  pylibfdt-1.7.2.post1.tar.gz
+sha256  08ec69755f7565dc25e4e640e0315795888d4caeb7f146de4e05bf12b03c94c8  pylibfdt-1.7.2.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 7d7398a995..483ac773c4 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.2
+PYTHON_PYLIBFDT_VERSION = 1.7.2.post1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/b1/cc/54fc80135b3eb7fcbfded65eee7c71b2b970b5124e3066a158421222f191
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/a2/b8/ef881f0e76af7727ca9c5e27a121db69667c69e4e91eceaafe97f3666a6c
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
