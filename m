Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6854EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051C3814C7;
	Thu,  1 Jan 2026 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBYfn_09PSOP; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 603E281585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260555;
	bh=dfTmq48dO4f990kdcq4P63pwT3YCsdErR+vHxezqNt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cLywt4EccERcxQz1kPShYsL58IpMZTZqsYrbJda+08o/p8LXHQwrQdAVLoHHcUVSU
	 Jiw2mZ3r05f69cT9gULY+ymWpUBQYAWiej/T2yvwtKXJImlW8ECI+M53l+1RcvR0Zt
	 LIe4nClvMPDpnS/nnuSOfnCUu7Z/de2vljEkGTwPz1mIciyr75MyubOWK+hVravupE
	 a8gjzWxD+E+5ashgXJIYiKvmuk/In4E3IAVCf0RsG6XkXQ0Ffp+6GKszlz6SUoGrPw
	 lTZ8mNgSjnkMk/weV3OBTRJKwlrCoHubAZv3fga45NjwDc7jEinGT172IAN0P8OPEV
	 KzecoyFxxyVqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 603E281585;
	Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E15206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21BA8150C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_dbHX_T6mo6 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D54A81412
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D54A81412
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E8E486FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1115aa64a0882487d9db604cf92c0eb9cf4d90e3
X-Git-Newrev: fc6187f9dbae67c8acae207e388bec790876a206
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.2E8E486FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-psutil: bump to
 version 7.2.1.20251231
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc6187f9dbae67c8acae207e388bec790876a206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index b301237599..ac43dcce97 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  4a65c910d089e87ab722151b4ff11792  types_psutil-7.1.3.20251211.tar.gz
-sha256  2c25f8fd3a1a4aebdffb861b97755c9a2d5d8019dd6ec1a2f2a77ec796652c89  types_psutil-7.1.3.20251211.tar.gz
+md5  4c6196cba53b8b8218bc829681e82a67  types_psutil-7.2.1.20251231.tar.gz
+sha256  dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a  types_psutil-7.2.1.20251231.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 8c0d681c72..f935b28ae0 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.1.3.20251211
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.1.20251231
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/d2/d5/85165865b060fed80b5991574c2ae0ddfd4786398dc8bceddfe0a8960b74
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/09/e0/f4881668da3fcc9473b3fb4b3dc028840cf57374d72b798c0912a183163a
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
