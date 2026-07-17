Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB6C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D63FE40A53;
	Fri, 17 Jul 2026 15:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCitaI8diMCK; Fri, 17 Jul 2026 15:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1239409BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303063;
	bh=LFg9A7GbWaVpywLAnnHbUmjg3ZLKjd/WMHc8WbO74Iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cNLS5Bnuq0O48fyfaf50bKIMxpWvwPOluiwLu1jlDIC0y/jqSPeZ2mcQ/mKg8SND7
	 iumEmOosOuTCiXbbdPIQDAQJv9HbO7j40gsT50y0irLCEJ7RZ4nDoaZtsJuQmYY6VG
	 09iYFQE6Vh8pa3Nwc2oHMLGPxc2FYULomgnmWJ+oA8ki2XMAox6x/5cCL0/+DdRxMk
	 a0BWuX2SdmapHkD/eEoSXdqCn4p8ECGUG1DQA/9aKiEQCRCbCukjxq7bWFi7Sne5mM
	 tD8ED3jxBKLoCLr+RfrrTzjrXlzZYD+4ZwW0WXs6ZEhcbKX7loZPFjJI/mXmi6jaIg
	 BkoXo4YuSbPtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1239409BE;
	Fri, 17 Jul 2026 15:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53075435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35A4C40291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHoSmDr-j7Bj for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CBDF40309
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CBDF40309
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE12188E53; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:12:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 487e73e976a49711d0c928ba7ca582cde03193b6
X-Git-Newrev: 0d7550c0dde165f8363a253abb600da35276af77
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.EE12188E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-web2py:
 fix CPE_ID_VERSION
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d7550c0dde165f8363a253abb600da35276af77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45158

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b7266597bc179db6b258368519afe1eedeada5da)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-web2py/python-web2py.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..ab42403a20 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.0.11
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
