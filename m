Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC2C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C18160901;
	Tue, 14 Jul 2026 09:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXD5oPZoUBwe; Tue, 14 Jul 2026 09:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E68B608A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021914;
	bh=czebAr1YxGNvyiKAbLE+RehE91jDFo+ENTRHvcy/JuU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FmeCNDqdsmUJxfOtH7M1+1wohff2kkTQSytzG5qjtSW1yKQCDBiX2GTqZAeSpqRWd
	 p0/ePlE+Ib1DIBDdMl1rlYOHx4C+tagMVSFVoJioIazKYA+MeIMorekFE+woSYLc9t
	 tAumQqtpz6qaxSahGx4L/GJmNww+5h6KRbDNGV70xAhGolpThyyCdH3fhf5qhxcqHC
	 6s2uIjxnkCV0K9v9C38XuA11D3vXwhwLlKcrx2MF9oPpAEtLMZ2Kxl1OZATf1l/TmZ
	 Q2kUm5hL1N00BKcMJn8OkVdIRLLsdt/JkxcfZloOtEBxpjJlpOynj1S/EeXE+7FMfW
	 R/HRCpIKkGh2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E68B608A8;
	Tue, 14 Jul 2026 09:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4D59CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD0B80E69
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9n1-NcEGm_P for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B5180CB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41B5180CB2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E6B988860; Tue, 14 Jul 2026 09:37:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:36:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d952c5e206c4fe92bce426eb02c628f2e92c2b
X-Git-Newrev: b7266597bc179db6b258368519afe1eedeada5da
X-Patchwork-Hint: ignore
Message-Id: <20260714093755.8E6B988860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-web2py: fix CPE_ID_VERSION
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7266597bc179db6b258368519afe1eedeada5da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45158

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-web2py/python-web2py.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 5b473698a6..68847a2385 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.1.1
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
+PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
@@ -12,6 +13,7 @@ PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
 PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
+PYTHON_WEB2PY_CPE_ID_VERSION = $(PYTHON_WEB2PY_VERSION_UPSTREAM)
 PYTHON_WEB2PY_DEPENDENCIES = host-python3 python3 \
 	host-python-pydal host-python-yatl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
