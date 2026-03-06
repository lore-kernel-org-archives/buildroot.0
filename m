Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA9FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AFC541E81;
	Fri,  6 Mar 2026 19:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgXeaCeJA8gf; Fri,  6 Mar 2026 19:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0959C41F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826694;
	bh=q/vSA84anAFA7uxrE9NhqojqqE8f0dcRLye5IuPqVsA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OKsYxVUoBQfJLspr9qMIa0xXnsZ0aHucrrSwztsP3KxQw6BeVis3DKUKt5fbM+owB
	 Z6EmrPr0BXcFth+PO93vr4vh5hzvn9r2HAz0EDZot+09w33OQbpX2K5nRb5bcfukxJ
	 SySYOWDxp/NQx/9l/MAELMje/I+zo9kBjD7FKCmbTMWh0nCO3uYLBjuG3Cb7J/P3Li
	 bg+ExAPkEoAw+4YRfcIG8vfbzLzIUT3kw3NEM2ks8E64zDaK6MhOISxK4PWmAK0npO
	 AG1q5DwqvmixYf8mcY3IYewyoXedKdfTXorrHENBuA1SUmmrKkvAgU9rMh1ts4V22N
	 QvBsNXFcsnEPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0959C41F2D;
	Fri,  6 Mar 2026 19:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBC925B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA0F613C5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5BnmHTv30IG for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6037613E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6037613E4
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB4D480090; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:09:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f746e8a93418a7b54c1f517dffe85f470040b864
X-Git-Newrev: 75b021969c4c8bd7187415a4a1a433cd175290fd
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.EB4D480090@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-multipart:
 security bump to version 0.0.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75b021969c4c8bd7187415a4a1a433cd175290fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

For release notes, see:
https://github.com/Kludex/python-multipart/releases/tag/0.0.22

Fixes:
https://www.cve.org/CVERecord?id=CVE-2026-24486

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
[Julien: reword commit log to mark the commit as a security bump]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7756b39d64f97b386dc993080e1ec4c90f18eddc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index ed01763cd7..a5bc988b02 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
-sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
+md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
+sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 6921d935eb..cdaae6ef67 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.21
+PYTHON_MULTIPART_VERSION = 0.0.22
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
