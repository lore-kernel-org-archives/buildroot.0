Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2881ECD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0AAF42132;
	Fri, 29 May 2026 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_o3iG6iqJzO; Fri, 29 May 2026 08:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E8C4214E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043303;
	bh=HqR+vuu7Syv+Rbr2mdr+7qPLIDsRYFBFPDALUqZOfpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNLM8wxuF+4S8ZKnQsBnZmhVMU7nCyApMj5+q/hAApJrdyRZHmjoSgtzWDeT6k02t
	 DosD1aG2kCjfybPYzGfs4R8HserJV+/LGMh5L22bpc/K0SvO7Roi+9XYsmoAmE2aYt
	 hl+5s9reNjt7hW5GFPzRSdW7ljJoLDzEqufLePeE9GiuBZDbuind6I7CWeulZTLE5T
	 A3kv1SxkjsRLwyd+PHw+PjUinW2zjaRVy2p5RcmihN8LYbe6Z4v2Rtq8q6GB0Bk/El
	 u3yANnLXE/+yQjlB8IFNGG3LRUd20XfH0uo0kW1VHtK/eeiI0w7Zrymp6YGql49n8t
	 gUtGu0E1yispw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E8C4214E;
	Fri, 29 May 2026 08:28:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0569F288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDFE76136C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGf8cizme4Zn for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BBA61355
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79BBA61355
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1789587099; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b2d223c9fc6f1bc10e5f6a8c6eec39d4c14a99c0
X-Git-Newrev: 726c6f959166ac7424eaf84673acd38b15fae26b
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.1789587099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-cbor2: add
 CPE ID
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/726c6f959166ac7424eaf84673acd38b15fae26b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
[1][2] for this package.

[1] https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 140d618567404950951afd0d26d4321c2247ed74)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cbor2/python-cbor2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 859ee4a1b5..bb8944f861 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -10,6 +10,8 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
+PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
