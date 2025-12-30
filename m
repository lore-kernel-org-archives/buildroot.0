Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45562E95A86
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19382807F7;
	Tue, 30 Dec 2025 13:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuMr0apwbZxr; Tue, 30 Dec 2025 13:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2923780802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099647;
	bh=UjdGB+Xmh2SHQVPN6wK7f7u2FC7Y6VaRJxW/hEhN2Cg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GeII5dyC6VNMHC3AfTDF9FrvW+6grR0AFir35Zo2XDkGcxYXxTx5xfEucCt1u0aoy
	 Gka6GT0KEKigPzS/JWT8LW1t0xdMCZETGtw/7gTQpLu0in7f7QqKLNiXK5FWa52saQ
	 Uxj1qyWw6Pgn/PU+0uasBJ3jsMysNFeSgvp2mlQ1bFGC/HvvuAwisRl449xEWNu5BQ
	 87JjY0gy09y6Nc3N6H0ISg5kogUDLyEPIXs+0pFIaUjP+GNuEeslfW21uElEM5QWzP
	 hAek3ofgqMpduhA7N6HhXXQG8xPRnjRe1FRaGGREb2cbBLswBiWVoXiu1Usq1ThoQo
	 OczDbPh4X9qjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2923780802;
	Tue, 30 Dec 2025 13:00:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5FE372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A759160879
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABE6Vg_r1NIS for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C18C760B15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C18C760B15
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0B1C87A70; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aab73b085516d634032982f52a3a8c5450d526f
X-Git-Newrev: e90002d6fe9aaf6e8672e01c0110126ab7b85a9d
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.C0B1C87A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.39.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e90002d6fe9aaf6e8672e01c0110126ab7b85a9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 47a5b7be67..97978c0995 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  b5a238e9712d8f41c78c27759ec14c761acecc14505399c020b69de8bc38e51c  python-selenium-4.35.0-cargo4.tar.gz
+sha256  c2518c75784290095739e386b4deb9f192b11dab3dce152452e6763918dd6c18  python-selenium-4.39.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 2dc3b9fa22..8308325ffe 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.35.0
+PYTHON_SELENIUM_VERSION = 4.39.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/75/67/9016942b5781843cfea6f5bc1383cea852d9fa08f85f55a0547874525b5c
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/af/19/27c1bf9eb1f7025632d35a956b50746efb4b10aa87f961b263fa7081f4c5
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
