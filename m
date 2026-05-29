Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E5CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A8F841B6;
	Fri, 29 May 2026 08:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuEHdl4mbFBj; Fri, 29 May 2026 08:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF6D841C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043323;
	bh=SaO/FGWs/ioUcjrq48/mpdDh6dQCqSlKCXbC4xFuRVM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gpQ2U/8uhJ8kxMLNXn/+sLwJh+8aSyKxZfpwmfZ3jChwqZsvvqT0e36u5GfcBOllx
	 qc7cCRIKVK9WAg/0or/zLkl744TtgMMiX/VDmD2NFAM3jp1geRLKQ/2iX2aC1qs362
	 QJRsVfysa53gnWgXOVrWkxcDKdTA6RVEEdpaWDFkH0Re1xDoe8K6MmddmWxzF7pti4
	 8YUiopDqkoBlx9wnEPu0g0cs+fpM8LKVSzZcGQ9ZYhvHaDa8I1i7kfCaSxjadIprbm
	 Tdi1GB1Q5MbyYdYybw0Qa/XpC4j0P6YIxyR7cyyk8gBjJRrYsqVH+loTrSK7vjw7CK
	 a7iev/Jna6r2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF6D841C0;
	Fri, 29 May 2026 08:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F9A288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7386160E10
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3_wqGaWgD8Y for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5926A610CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5926A610CB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA06987171; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:27:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d40bb7279334fba78a6852cfa7f05923add0ec5e
X-Git-Newrev: 815e765c1a5a25ea0510610ec499d08620d1863e
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.EA06987171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-aiodns:
 bump to version 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/815e765c1a5a25ea0510610ec499d08620d1863e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b9c60c567587dc7a9957e5ec29fe2558b76e75e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index a4a242670a..4cde1c4b1d 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
-sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
+md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
+sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 7476c76b72..6befbff203 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.6.1
+PYTHON_AIODNS_VERSION = 4.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
