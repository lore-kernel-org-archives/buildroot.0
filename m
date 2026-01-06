Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C6D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EEA4156F;
	Wed,  7 Jan 2026 18:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdTEPSUYEQqj; Wed,  7 Jan 2026 18:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 830C141571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808984;
	bh=npZjKQxC6oCBsLSvFPmdMGwx8E7/PvbheWJ6HBeMqbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUn4vuq0r52WHJEJjqQgEum6L/5RF6xW3OES07+B2Ro0SD7XdPFh43kdQFWdVzvNs
	 2ac3E3AjngyN8blct8cjUiQJz9h1lFx/KhURPkAH+sRICTn6N1hpsW05FzpYdg3z8z
	 zmXJr2mzxRiMk4oADzBa3/x66wIdgjKuHKukAo006VoH61omEFfkoMDT/Z0TIlOzMi
	 IAi3PmzEqVvMfqHYeOakTbW33XTfXaVgPaV2z+yn30y2a+Tx2lf9pCJrOlQIi5Yvdo
	 YYkHxvIRTLUMeRhn4exjUzjQZvql5QIHtljUjk/rG9gbsB8C0qwrP6HImDL0TrFiiw
	 UnAiz/gR2Snmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830C141571;
	Wed,  7 Jan 2026 18:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED9AA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D8940B6D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWFqIMFLOE17 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF03409EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF03409EA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F210811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:45 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7d33e2668b443a0efc56062705dd2d269c54d71b
X-Git-Newrev: 67ab9c832a45461cb03771f33646fbf026d819ad
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.5F210811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-dockerpty:
 update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=67ab9c832a45461cb03771f33646fbf026d819ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3b0683d66ed9984fd265b2109df774fd857cbcf8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-dockerpty/python-dockerpty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
index e6fe6e3b49..7ad98c6b94 100644
--- a/package/python-dockerpty/python-dockerpty.mk
+++ b/package/python-dockerpty/python-dockerpty.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKERPTY_VERSION = 0.4.1
 PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
-PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
+PYTHON_DOCKERPTY_SITE = https://files.pythonhosted.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
 PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
 PYTHON_DOCKERPTY_LICENSE = Apache-2.0
 PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
