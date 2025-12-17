Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A909D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 506866111E;
	Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwJIcapCaV-D; Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12DD61117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007899;
	bh=I61W/nhE9JW/KmjM2FcIRHYh2bGvpDtD3Qlic7XgYzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HcYIj1hitf7RKTeRcHDA4Y2e+dfzzPOCvO40M5CYQO7qK6DTmvfKDgOdbXPatxCs2
	 iT6PvwBGUJr2EwPgnKYO6cqRN64uKrdQpeWi3OoRmLQt97InNQpw7c846S+M49qwhf
	 hpo8DYHLgd9adBAeWbmyGvqkgKMeNnEtIGvE07q7dH9fd/U8K4Tii3+lphvK/4XplJ
	 koWNYQGqVf7jISn+g7gE2FI/8IFwvR7gHt7hRerLLKMgSKtPJ9WSrmFT9joVf+Ki2e
	 Datyo9Pop+uHhB1IclMOmHOPixaFvs97H36YQX31JpOUgdp/ECEHOYyHK7cTJbDjPO
	 2D/8OH8NFHB1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12DD61117;
	Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C48FE375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B14F440617
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm3Z4qFCUbXI for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90D84050C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90D84050C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D884E86198; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8888ab7ee70b05dd2a741d5dba7bff6b08f5edf
X-Git-Newrev: f26e29ee5bc6b2d78eedcf17eede9ec4d345e37c
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.D884E86198@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: bump version to
 0.13.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f26e29ee5bc6b2d78eedcf17eede9ec4d345e37c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-poetry/tomlkit/blob/0.13.3/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 21e61dd5fc..1e6fe31c0a 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  0db1a3750c64b141720f05430df9b433  tomlkit-0.13.2.tar.gz
-sha256  fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79  tomlkit-0.13.2.tar.gz
+md5  b77382a3de2e0c1ab715ad456139e260  tomlkit-0.13.3.tar.gz
+sha256  430cf247ee57df2b94ee3fbe588e71d362a941ebb545dec29b53961d61add2a1  tomlkit-0.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 79138d69e8..51e6e40483 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.13.2
+PYTHON_TOMLKIT_VERSION = 0.13.3
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/cc/18/0bbf3884e9eaa38819ebe46a7bd25dcd56b67434402b66a58c4b8e552575
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
