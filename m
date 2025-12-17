Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E126D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5636116C;
	Wed, 17 Dec 2025 21:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YPFf-1Lwt7g; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6F761161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007901;
	bh=meSYoiSaw+fcSZDJ1s/TMEeSx/pcgbSIpGfPouvcI+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nExOMmCUFxqoOaJwmw8JiaOjgS17bVNfq/c57n+JHIFxqgOTsA7e6uFUHrYM/S51U
	 klubUor5qkZ40VchNS1BBX76sG8jXGS441ZqpKhUPHoOKf5H4FWz+2Hk5vZliz+jCa
	 ZFn1N+nFbJmgqOXWg2B3StzhFi13k4EdMWFtVijiDrzny3GSeUJaESviSkrFYKUyo4
	 0s9MKgmj5djx7HPGQ5rXu3bMkj+9Y85HBCIrC2oYvuPHXLAYYRX5hA+pytuZZnxFTe
	 GYN4WsB4pgxwlFkMs+c3ycNg9SixOtT4bLDU0K7X7PUpviwKrfG2MMZ6VADqAPCfTM
	 IlH+CwPYoDRfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6F761161;
	Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B98431
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB97383B53
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjwARPwd0M_2 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D41EF83AAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D41EF83AAA
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7CDE8713D; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0cea7186f194a848c723a1ee143afc97f7b9de0
X-Git-Newrev: 8051485bbc1efcf8cc52983ac57a9b66cc21a06f
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.A7CDE8713D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-termcolor: bump version to
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8051485bbc1efcf8cc52983ac57a9b66cc21a06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/termcolor/termcolor/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 4bed487025..d73588d22c 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  26f496075070852b5d39762bbd14ec46  termcolor-2.5.0.tar.gz
-sha256  998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f  termcolor-2.5.0.tar.gz
+md5  50ce238ff23fb53077f746b751b7ba7b  termcolor-3.2.0.tar.gz
+sha256  610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58  termcolor-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index e2492ab3c4..e0a6677241 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.5.0
+PYTHON_TERMCOLOR_VERSION = 3.2.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/37/72/88311445fd44c455c7d553e61f95412cf89054308a1aa2434ab835075fc5
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/87/56/ab275c2b56a5e2342568838f0d5e3e66a32354adcc159b495e374cda43f5
 PYTHON_TERMCOLOR_SETUP_TYPE = hatch
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
