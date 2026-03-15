Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E4CF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7245A613FE;
	Sun, 15 Mar 2026 22:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCvpWT4Hpw1c; Sun, 15 Mar 2026 22:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EE5611C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613174;
	bh=b842G7WOOoBpfzhcFkXQPBEIGVaBSqjt1+4PIssHUxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1Fl8cGxvtZV20Q3qJgtIAAMRMw4f+yyKSllZPNLF8HyzUICoD7LaDV6udsasJLs/
	 8mARYc28XU93WoY341YLNYmuBop+fP2X4FoKrLHx76Wlh5WRGDuzkv+THC7I06tJRw
	 QSXFXis+dmxqkaX7YmuR8PnUX00WM6/jwFJ8XgRp9rmGTC9uKpOMvSZbfszvkkaCg+
	 kG08te+aob/Jp3m9Ycv14VzpyHgBn6uqbOFM7D9heXdnSCsMeyrDpNz4wonvpVIR5x
	 wiZALN0GT9dNKnYhncpzsyBQ4nuKaZAM/Kf3y8zk0JAcLHyfEljPNPz6MYW0dI4oHL
	 qx3yptHXWMRKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EE5611C1;
	Sun, 15 Mar 2026 22:19:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0889F1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C1F40A04
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcCk755qJi-I for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD5940A1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD5940A1F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED2E80FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 507242b6632e5a28acfcf52ff882ecebb47bf6ea
X-Git-Newrev: d26060f11033a24552a9adea1d594cdbc3a99e48
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.DED2E80FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump
 version to 82.0.0.20260210
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d26060f11033a24552a9adea1d594cdbc3a99e48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/setuptools.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 8283b8ec10..c0b0867998 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  64117c464d8fbeca5851c08a5c22fd56  types_setuptools-80.9.0.20251223.tar.gz
-sha256  d3411059ae2f5f03985217d86ac6084efea2c9e9cacd5f0869ef950f308169b2  types_setuptools-80.9.0.20251223.tar.gz
+md5  156a454caa6bb356bdab546a1cfa2526  types_setuptools-82.0.0.20260210.tar.gz
+sha256  d9719fbbeb185254480ade1f25327c4654f8c00efda3fec36823379cebcdee58  types_setuptools-82.0.0.20260210.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4ad09791d6..4759fae2cb 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20251223
+PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260210
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/00/07/d1b605230730990de20477150191d6dccf6aecc037da94c9960a5d563bc8
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4b/90/796ac8c774a7f535084aacbaa6b7053d16fff5c630eff87c3ecff7896c37
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
