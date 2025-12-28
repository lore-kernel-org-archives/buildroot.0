Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B2E8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE0881516;
	Sun, 28 Dec 2025 22:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KAt60QwYR8Y; Sun, 28 Dec 2025 22:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57CD580DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959631;
	bh=k6KtrFGEvew1vZIktwdTx6xKyn1ni4Kq0wvou8eYl1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RblkMmXVmPCPmz8SEKILVgOyIKfd7C6G56gVMi7tSFLOo7qoMQVP6AIf3RoCJ0rgA
	 IJxJe2C8biyxrFI/ahLXM4b2fo3x1FYf0ypknEtcQxkf51qYKgkfHjltVgoP/2y5tW
	 GIEHOKgcE5uGlbvrZLIp0leK0r07Ic7pTP9hoh78n1UjpMwQJ33u9ylU9KlQXKEkQm
	 2PF6lIds1W8vcg8YErjwCxkSUglvKNQ5VwVNi8iKeOzEI4tiSvYoWY6RLM2J7CDnSL
	 ul0mFts47KLBIlhUPH91LuVRyA80n2ekKzl7N/SPDKz8zsYexfuohqLDNq+PPKhSGH
	 WiF1wXpSuuG/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57CD580DF0;
	Sun, 28 Dec 2025 22:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA2F30D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A77880E33
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y2qyQSy1V2M for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50F880DF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C50F880DF0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2C6E85F80; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 424a55cffd663fcc281d6391d21bcbd09fa40ce7
X-Git-Newrev: 56be4052484dfb6e053b5ed79c807fedbbf26806
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.C2C6E85F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasyncore: update tarball
 URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=56be4052484dfb6e053b5ed79c807fedbbf26806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyasyncore/python-pyasyncore.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index 4b1e3c98b6..d86ac2cad8 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCORE_VERSION = 1.0.4
 PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
-PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
+PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
 PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
 PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
