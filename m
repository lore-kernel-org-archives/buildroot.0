Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B19C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C6A811A7;
	Fri, 17 Jul 2026 15:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvCUjhwRIqiR; Fri, 17 Jul 2026 15:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BED4811A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303177;
	bh=CFrnunc6/9ohRkiiiwytvB3Suj5IsbtDCYM31tTqb3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OrCyqHulM6RV7s4FYlGM/oInQfVAg9IMCMHlS7NoyWk8jsXtz26i89jikBfyqUduF
	 p+ZhHwnun/Hu8lU24TdooD2mGrA4rgtks1Vo8Ni4p0PoJ+Vt/19ZaDzs6mDE2+h1pS
	 chDMXyd9G6dJ8EDTT8b8IfgJyKG2/iqp6bo4AH0+JBoIcXlQvUYZum0JzF0OGfLxBk
	 hdJxvvW2KpkmRIsGW3ddIrCz+7f7CblySAxyT/zYEBC/xp3m3wrDw08vLKk3N6khxw
	 7e0zvjowbxw/2dW3iWlBHwuFKyveqHXecdpN3E1L55APE6+GvCE32ysldhxxC9TwMv
	 cdL04WFalyy5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BED4811A2;
	Fri, 17 Jul 2026 15:46:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B74181F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C88840A58
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkA9qXo1JrHJ for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7C940A5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7C940A5C
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AEF988E53; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:12:46 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ce1c0d26090c56b7a120f6d826b95759e0bd8f81
X-Git-Newrev: d7909644fe1c00dd13055e5b93c83bbdcaea91aa
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.2AEF988E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python-web2py:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7909644fe1c00dd13055e5b93c83bbdcaea91aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
