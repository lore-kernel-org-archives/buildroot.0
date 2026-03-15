Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD8F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C13D612C6;
	Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTuh2OinGa19; Sun, 15 Mar 2026 22:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17409610AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613130;
	bh=hI8xaoUXRaudgk1HgzAt+yZA90fdVlPE9nnxK69Mf9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ICrn5+Lnm5mvTlWg3G8mN8bi1S6OepR4l/P4hWBxwI0QewJ0qsG7Ma1vz99h12jEn
	 27KFCLiXMjXR33r64xllVhLQsDsBX+C+HbhuNirwShTjqUi+fuFwvN1saxM+T7Jdo5
	 9JLUd6Y6R0tRhfqrmgJpVewQVw7YoB77DEgPMNz4W6xbXrWhsD28usXUupJGC8sJSm
	 sezhd0puMaCs0pb2BXy0Un1GmRPuiE0Fsfq7CCQl7ODFUJRgA0yPD8dEfAfjSOPtxy
	 tu+WMJF4AhNRje39DgBqcx+JDmrVabHFX2avWjjdf1Z4Wk4+zTEj+b4upHAnPQxlKr
	 9p5Is0rSdIeJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17409610AC;
	Sun, 15 Mar 2026 22:18:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EC7357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A1C40AB2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bplFwE-SIK_Z for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF83440A4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF83440A4A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D50785BFF; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1d007fabd654dd0eedf83b8c79a7b22a01f31bc
X-Git-Newrev: 36bfea033f421298eec66804921076d8e8953009
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.3D50785BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyicu: bump version to
 2.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36bfea033f421298eec66804921076d8e8953009
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16.1/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 81cdd4f459..ffb89bdd84 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  00715b86c27c150f48554a863688e878  pyicu-2.16.tar.gz
-sha256  42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9  pyicu-2.16.tar.gz
+md5  1e2e506ece8f1343cb5174cfb94003a0  pyicu-2.16.1.tar.gz
+sha256  cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c  pyicu-2.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 9d3f5f6004..869f50dcd6 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.16
+PYTHON_PYICU_VERSION = 2.16.1
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/11/c3/8d558b30deb33eb583c0bcae3e64d6db8316b69461a04bb9db5ff63d3f6e
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/51/a9/b68d8fad5b830146c42f08b444c716ec50f576cbc8f01e26f4da6e89fc7a
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
