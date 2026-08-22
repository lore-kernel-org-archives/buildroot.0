Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B457C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC3D409C2;
	Sat, 22 Aug 2026 10:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzAe9sNk8BaJ; Sat, 22 Aug 2026 10:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787394761;
	bh=ZBQMef2JGcbT1mDtevlcUOtm+WUtzhewxg0eWcurJfk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TysTmYiiUZnzWowh+7aV8z1bGLuK6CNYTACBHLUvlZy3gGZNuWKkGNIHBpWK3Re1V
	 Y9XdeXAz9rxfOyS2pgMO19V9+Rip6yo8Js4SlunKYvG0uHRMJlOpTW0tEUt4ldzmrw
	 cXfGE8IiDKAD61vPdCdHRl5/jeZ4Cta9SJN82G5dsuHu4fzTRP48RBh9dgOq3BndKd
	 euOm5nNLda/FDiU6TTv4CAg1Q7ymP0+DqcO2NxjfFR7hCwgmjh4hxpy5VhJUKwWTaD
	 pvVBRMNQn0J90QksYOHRmuZUBq+eFWwoN12fv6xUB/1XLu3m0IXMY2/fqUqLVzAAbV
	 J1jWfvqIj182w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9931E409EC;
	Sat, 22 Aug 2026 10:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0701A476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED2BC409BE
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Izh3xRCMJOsJ for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01F12409C0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06F8788F65; Sat, 22 Aug 2026 10:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 12:20:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7810e5847b50bd509401b7f44f3c18d28162ca2
X-Git-Newrev: 50f635f8dfc67a2a14e580d250d592ea40df39bc
X-Patchwork-Hint: ignore
Message-Id: <20260822103143.06F8788F65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scp: bump version to 0.16.1
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
Content-Type: multipart/mixed; boundary="===============5667899189604150983=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5667899189604150983==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50f635f8dfc67a2a14e580d250d592ea40df39bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/jbardin/scp.py/commit/8f2a778cc6d2988b39c0523f633d27484e72f0e6

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-scp/python-scp.hash | 4 ++--
 package/python-scp/python-scp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scp/python-scp.hash b/package/python-scp/python-scp.hash
index e79c4ef4a3..a82487adbd 100644
--- a/package/python-scp/python-scp.hash
+++ b/package/python-scp/python-scp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scp/json
-md5  a72edd2cdc0fe6e14d9092065f04bfe0  scp-0.16.0.tar.gz
-sha256  1763a4b8ac424ea0c304f58b95a4a4a51d503a834ed77b4e89f1a32b30cbe662  scp-0.16.0.tar.gz
+md5  857ce2149485ec591d8c1076d8e74516  scp-0.16.1.tar.gz
+sha256  3f2b260bf9bd4c2b6857f697a1d7e8edc26fa569282b77027e849dfe1e48580a  scp-0.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2455cf0fc78e13772bf10ef5f209e7eb8625706d671b2f420cc8add37d548c1c  LICENSE.txt
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
index a4be23fb51..a2224e654e 100644
--- a/package/python-scp/python-scp.mk
+++ b/package/python-scp/python-scp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCP_VERSION = 0.16.0
+PYTHON_SCP_VERSION = 0.16.1
 PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
-PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/7f/e1/34634a89f100fcf4f014aca65621e701c5b9053cec62b6386866e3f015d5
+PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/f8/35/fcef45d52d76a6dc70778c11eea719ff0ab550594bc51e55e66d28b5f424
 PYTHON_SCP_SETUP_TYPE = setuptools
 PYTHON_SCP_LICENSE = LGPL-2.1+
 PYTHON_SCP_LICENSE_FILES = LICENSE.txt

--===============5667899189604150983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5667899189604150983==--
