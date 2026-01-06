Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85265D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CEBD414C6;
	Wed,  7 Jan 2026 18:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yACZifaluHrD; Wed,  7 Jan 2026 18:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F5F41522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808972;
	bh=BbdTa37f7VhsBNT2iAyypk9iezIZxZ0ikIWz39DERuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QDuVXYN+oHzidATdkW/Zk9L/8eOwGj9sKGUirIrmegC9n3DyUjlLUYKUTU4jY1b39
	 2Cne9M5S3u2LRr+t1JkG8BjvavZ+y/bgr5PcJoE74/M677OkHclMnGlTRACZNMnJWd
	 eKdYdRk7BbmpFIHg1CP3V6xOkcK7/kA6+/OEe8NSHbc7rmY4n+ReGXnhXWuXgbbqyF
	 lvNRJOXW3hf9wiLPBux1DBuLBbTMQzZo9AXIwm0Y27H/KBR8iVlEQXXomzHdfnFNg4
	 P3fayk8rbOuwbMEmgvgFhoy+OULyc1l8A120HL+Q2AXyZT77dFdM/UC+oySmfgc3cj
	 3Qiu3T3bd5+GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F5F41522;
	Wed,  7 Jan 2026 18:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1BE9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD6140DD9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMRaNJ93e_Gk for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2938040A3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2938040A3C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28704811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:08 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f244566d7f1fda005fc226df1ced034f5d98626c
X-Git-Newrev: 20b7af0d01cd0258cf3e91538e9f319ea6836438
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.28704811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/python-characteristic: add md5 hash, update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=20b7af0d01cd0258cf3e91538e9f319ea6836438
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39a123b9ec3392a16304f270210714841c91cd0b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-characteristic/python-characteristic.hash | 4 ++--
 package/python-characteristic/python-characteristic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
index c91017d707..84304818c6 100644
--- a/package/python-characteristic/python-characteristic.hash
+++ b/package/python-characteristic/python-characteristic.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
+# md5, sha256 from https://pypi.org/pypi/characteristic/json
 md5  b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
-# Locally computed
 sha256  ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
index 7ea8d95cd4..dd081eacef 100644
--- a/package/python-characteristic/python-characteristic.mk
+++ b/package/python-characteristic/python-characteristic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARACTERISTIC_VERSION = 14.3.0
 PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
-PYTHON_CHARACTERISTIC_SITE = https://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_SITE = https://files.pythonhosted.org/packages/dc/66/54b7a4758ea44fbc93895c7745060005272560fb2c356f2a6f7448ef9a80
 PYTHON_CHARACTERISTIC_LICENSE = MIT
 PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
 PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
