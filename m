Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0907D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EC040F86;
	Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ipj_-7lew8U; Wed, 17 Dec 2025 21:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE94C40FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007917;
	bh=XSco9I2+fqkaWqi883q5DZLSzJVlJ9vH4S4CHb1HGXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sqf1HQHvyso8Ui0vdN7A+fgatQkY8w/9A0dw/gggJjzhFT0fiTkejJtazNISlUqm7
	 fdt18NZm9PqXq9rJ5Mz/l460TxVCDVMd1FFLXlTaZrFVY4OYSpDgceEL/bR1jLott3
	 W27cF7HglPEBxYWblDXQhLNzNe2haRa+M2SuMZ66rLJw9OO7Vw7/qVi5vkQQACOExa
	 0ewDsmJFDWsbj81cH0TdiimmbYiEVLTNFj+fOwIFVuw4OjXOT7dgvmzBzv3RHvvudz
	 u8dGngpV+wO+FU+K0bIis2of5U8dc1Ryvx2uvw+NWWCryUtOYpY4Owbp+FUMK4fHFD
	 BZwMZKuacH7cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE94C40FA3;
	Wed, 17 Dec 2025 21:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE31375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552AF40F7F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2w-M3vreFee for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD16840F87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD16840F87
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC226822F9; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6104d7fe226c45746bc4f4432cf00073d38fd452
X-Git-Newrev: 7074ac656a7aa484c7d25e3d7f6532829efb5292
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.AC226822F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump version to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7074ac656a7aa484c7d25e3d7f6532829efb5292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/aio-libs/yarl/blob/v1.22.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 43ba31f81f..62b78010f1 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
-sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
+md5  21bde2ca6df9bfc66b1810461e0ded05  yarl-1.22.0.tar.gz
+sha256  bebf8557577d4401ba8bd9ff33906f1376c877aa78d1fe216ad01b4d6745af71  yarl-1.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 4f25394c8b..dea4e34739 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.20.1
+PYTHON_YARL_VERSION = 1.22.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/57/63/0c6ebca57330cd313f6102b16dd57ffaf3ec4c83403dcb45dbd15c6f3ea1
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
