Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D52F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8C340AB2;
	Sun, 15 Mar 2026 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IKRWiP6Tqfg; Sun, 15 Mar 2026 22:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1214133F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613100;
	bh=kTrgV5rFj4M/hk1DIDzOE0MYE/f3V/MDRYj3FSjur+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DXCrK5do99zHnOzWir+OcYszjJwcoCM4bsuz7OxYlni216veGVdJkxy5L98aZMzso
	 pS84CginT+rYR0Bv229yldi+dCMgrQdRHnm2KBfkUaa1iujlsaxaskTIRZQTy0Arn/
	 IQpluwNaghiQq0+RnmKjldRJAqP4eP577bUe0bigwv7Ufot6aWW3YgeOqOn16uoATd
	 N7SNFDLn+ILVfm2wZE1dWDTus1UVhdWsTzzioezckYdISrp+lXJf0pqI0fU/twWM9F
	 3dQDn1z+VMqp8hpXsKaP+ZS6SSZ3K2XvjusaY3rs7n1eEDRIzQa4w5vSzxDRVOcJnf
	 G1E2iZns+KI/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F1214133F;
	Sun, 15 Mar 2026 22:18:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5401B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2CFE40724
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03jkbLhjSVwW for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCDB40725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDCDB40725
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C0FA828BC; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c68fdbf4dda3a75debe2a73045b0ec1111ce2c2
X-Git-Newrev: cc079e8457a17fe81b1a82e41b0e39296bf84181
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.3C0FA828BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meson-python: bump version
 to 0.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc079e8457a17fe81b1a82e41b0e39296bf84181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mesonbuild/meson-python/blob/0.19.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index fa1ac831c7..1bab8285eb 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  b4d7f9ef6f09deb8dc8a7e5cbf16778e  meson_python-0.18.0.tar.gz
-sha256  c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d  meson_python-0.18.0.tar.gz
+md5  36c0a47464398008ea3939bbef334f31  meson_python-0.19.0.tar.gz
+sha256  9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553  meson_python-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index 542b64943d..af8f26f9a8 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.18.0
+PYTHON_MESON_PYTHON_VERSION = 0.19.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/26/bd/fdb26366443620f1a8a4d4ec7bfa37d1fbbe7bf737b257c205bbcf95ba95
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/32/98/7fe5d1bf741c03c6eea04b6245737dbd79657d4f9200e82fcbb4cc12637b
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
