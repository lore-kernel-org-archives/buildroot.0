Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC38ED0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D3182C38;
	Wed,  7 Jan 2026 18:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6MIRBKtxQ2S; Wed,  7 Jan 2026 18:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9B882C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808921;
	bh=Or66qiyfqsyBfK0edfiDdVPo6FoXbJKXx8xf/a3XSGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IydVDUMwnxjZ9kjX+xOrecsZgxSkfDSEgn8TJqK81b3DtFO1S2Jor5ETYoBEEyNbi
	 sQFlzIq0W0kPfJ1K9NbaeHdXDCamlkIk1TENF2pO8ABop3Wd0OrXORx5augFRCvUjj
	 GBrGiiD+bNqc290nyHAOkJTxrPbIRkC/Ps8BjvsPMlPqq0xQe/N2mE5SI4QqM4SnIT
	 u/8Zh5wnXuEpeTFkQzXSEZgDqt6q2xy39VP400bDSPzquiPfitiQG4AOUbu1UfjPSD
	 zOHWhDfA+Xoa7uPD6TJgkeTr6FHoQ6vyKAe4cbVqoRVLrorJxP78gnU5ijnBIkJaTp
	 l2L+80Ie4pIRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9B882C3B;
	Wed,  7 Jan 2026 18:02:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EAE525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 347E06087F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7hGkUzkoaip for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED926085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ED926085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E8C9875A1; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:27 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4beab2c92f61f7ae15cbd5fe69f01aa320717022
X-Git-Newrev: a3010c58cfdf1750d54f011123429b2ecb884090
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.7E8C9875A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-iniparse:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3010c58cfdf1750d54f011123429b2ecb884090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c62e2390e90627e2cb71c268623e980f78a95951)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-iniparse/python-iniparse.hash | 5 ++---
 package/python-iniparse/python-iniparse.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index afcfcd2ffb..747d403965 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,7 +1,6 @@
-# From https://pypi.org/project/iniparse/#copy-hash-modal-5fdd923b-0592-4d2d-8b49-03472f948290
+# md5, sha256 from https://pypi.org/pypi/iniparse/json
 md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
 sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
-
-# sha256 locally computed
+# Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 9f00cf7387..05c9b3930f 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INIPARSE_VERSION = 0.5
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
