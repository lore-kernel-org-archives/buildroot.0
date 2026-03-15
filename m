Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F7F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B08461350;
	Sun, 15 Mar 2026 22:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9KoR-KRRglo; Sun, 15 Mar 2026 22:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B04161389
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613161;
	bh=M2LE0JzECMxA6bUs6UstKo1xYVSo56M0+V9ICpCbnIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YDmS3RPP14en+Tgrr+gGlu9HyWpkdnX/lulpONUk904Ulb12hvCz4u11Pw+bXMDqc
	 bRdIWLmx1cZAVuTP2IWSLJ3da26ZeB/mL6U2xV2WzNDRvSwcKRBE6fVIR2lhUaMzvd
	 dH++FaV+aR2X/DVjl52Wh/84MRdp5QQZ7iR0u9OCVfVEbuQaFrV2L16G6ui6UA9CzK
	 DipcsowEB4fDZLJPixYEWOLNGo1QcjIjlCWIfuJeaFD7/J8EOoJGsTz3TTYpHkwVuH
	 eAsQH2HOM4O0N4UglAmGWEh5wjri94KeoVoOWwJeqewYvcDvNi0bVZTluYLSiFdTv+
	 PiIXE6q0bz26w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B04161389;
	Sun, 15 Mar 2026 22:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 107AA357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A919C610CF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gDZqFHKjRov for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8CFB61093
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8CFB61093
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26FB085C3A; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50007f836aacaac0f3878bf6499bbb8ade7ff4e0
X-Git-Newrev: 25867d252b92ead57d63c565f186e16dc08be134
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.26FB085C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: bump version to
 4.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25867d252b92ead57d63c565f186e16dc08be134
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jquast/telnetlib3/blob/4.0.1/docs/history.rst

Updated license hash due to upstream commit:
https://github.com/jquast/telnetlib3/commit/1af3eee85961a57be1987bd31706d443b2df7d83

Upstream switched to hatch:
https://github.com/jquast/telnetlib3/commit/c4b848893067e8a673b715550bcf179354b2e61f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-telnetlib3/python-telnetlib3.hash | 6 +++---
 package/python-telnetlib3/python-telnetlib3.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 135b985625..889a7aa428 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  effe967417ede0c7dadcc3ccd3263d5f  telnetlib3-2.0.8.tar.gz
-sha256  08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752  telnetlib3-2.0.8.tar.gz
+md5  468f4d8cd3571065d093d9abcf8b8f39  telnetlib3-4.0.1.tar.gz
+sha256  819aa9dae793d66e9fef5524ce838eabc4723589b0f81c72fccd3f2448cbc2fb  telnetlib3-4.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  df4b9fddd41b5811d9ba61952c7513ab3b0ca1d00efe611d19c51eda756f5dd1  LICENSE.txt
+sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index d8968d4f15..8d47ca44d4 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 2.0.8
+PYTHON_TELNETLIB3_VERSION = 4.0.1
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b7/12/305101cfdec4863c088e520cbb698b08ebd3396904ecfe0062612db77c66
-PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5d/57/42acb7ce2c1b3d88ab28d6b1de41a08fdd5180d262d728fd10071950566b
+PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
