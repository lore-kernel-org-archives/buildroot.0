Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A55D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F00880AF9;
	Thu,  8 Jan 2026 11:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzZKlZ3aLXiS; Thu,  8 Jan 2026 11:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D0380AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870658;
	bh=0C8mIPEk49EqYDTZhZj2PusDvRzM77IFde0XaHkI4iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cY+TeURZoGCVAo4kLYQEWhUhtk53w1NRlaIa70D+IB93lMiNkAYb4ftZWgaDIDOAn
	 HsR4z8f9WEupfsvI0K8WxblPr3oDp9JeXfeXjd5uagjDFqoVX7ydYibKpuZerqN4UH
	 Mk1jdjl5fGeZY8Y61w9KCJbchOOoGURJqjLiO68N20erDluQ4oV2pD/kFbqme5Sl9f
	 jiMrL2td3BZjtQTnpOJNGoHSnpbSosXuhyFjB7683HZvVme8D4VCgcWaLEsu9txJAb
	 /Pe7h+dp+rOqemNctmrHuNEzjJ5gg9dQiF4NbPy1Xr2F3+Gf9hfaKWSk/X1x3g/6NG
	 uhOLVUoiU0PgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D0380AFD;
	Thu,  8 Jan 2026 11:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A24F62C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 894C14048F
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kLXR4OdhtX1 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB22E403DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB22E403DC
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B580F88494; Thu,  8 Jan 2026 11:10:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 12:07:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a1f5fd5925c73640475722ca2c405a5dc42c23c
X-Git-Newrev: 028a4b02368b3172b476e7d09a044922b5677507
X-Patchwork-Hint: ignore
Message-Id: <20260108111055.B580F88494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: bump to version
 1.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=028a4b02368b3172b476e7d09a044922b5677507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index b530d93b49..a92307d53b 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
+sha256  f4d2f9955b1b1d1ca71558ce969b65345056ef8db643cea33bc4aa124fb248df  python-maturin-1.11.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index e4d91a6545..dba5e8bbce 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.10.2
+PYTHON_MATURIN_VERSION = 1.11.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/02/44/c593afce7d418ae6016b955c978055232359ad28c707a9ac6643fc60512d
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
