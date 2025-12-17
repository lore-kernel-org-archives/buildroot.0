Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8CDD68BC3
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE6C611D1;
	Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNNW-uTKjb2U; Wed, 17 Dec 2025 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57957611A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007920;
	bh=rZs+aku2mRTTxPH21DzYJ86aMWQrGIC5wcK2bPbGY9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=osATSFy48oTdnAQZt72EViqQqLdCLqOuauMi44cnmevzcMrg0YPyLcB/b2tXERSZi
	 NP+6maJTLQJfIAjmBwKGhpgIkDtjxl7NLqvvS+uzHlB5zRemOOByBq4nirO+ZcVX1A
	 GLg99wlwzwujbKgg4wkFJHJYX2ffSNzZN5JAU5x/LP1kJSXODEXAprQf5tPAaMrH1D
	 escJsLkZVjNIN5rVs0yXvDoV/xtoD72RefUGCxig2eKSTniv4OertMnHdmu0+FVlXq
	 wQ+L38rtBO/tC1XYTqKy9mow/TPTn/BAL3AP34EJz+aAKXt07G/zwOMvndABzavp/5
	 6ze4wlVBmUlfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57957611A7;
	Wed, 17 Dec 2025 21:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE53361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9422040F82
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvcXWASQ6mI1 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C6C40F80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C6C40F80
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 501F28120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3ccf2a7a0271018003a2ed408a71f80296c4403
X-Git-Newrev: ca0dbff9f2482fcbba081be33cd870dcf89049f9
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.501F28120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump
 version to 80.9.0.20250822
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca0dbff9f2482fcbba081be33cd870dcf89049f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/setuptools.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index de273aa77e..45b229ece6 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  8df05b03cbdda63e797f38543483138e  types_setuptools-75.6.0.20241223.tar.gz
-sha256  d9478a985057ed48a994c707f548e55aababa85fe1c9b212f43ab5a1fffd3211  types_setuptools-75.6.0.20241223.tar.gz
+md5  c9a6190884fc8a12c93963333f205f72  types_setuptools-80.9.0.20250822.tar.gz
+sha256  070ea7716968ec67a84c7f7768d9952ff24d28b65b6594797a464f1b3066f965  types_setuptools-80.9.0.20250822.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4c7df27139..463cc3b6b5 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 75.6.0.20241223
+PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20250822
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/53/48/a89068ef20e3bbb559457faf0fd3c18df6df5df73b4b48ebf466974e1f54
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/19/bd/1e5f949b7cb740c9f0feaac430e301b8f1c5f11a81e26324299ea671a237
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
