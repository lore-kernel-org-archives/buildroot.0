Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7BFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257A060C2F;
	Sun, 23 Jan 2022 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJJh4mZ3YQ-0; Sun, 23 Jan 2022 19:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C97E60C2A;
	Sun, 23 Jan 2022 19:36:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75FA81BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72C9082496
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKOeew08gCAF for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:36:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7206B82419
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D46AD82973; Sun, 23 Jan 2022 19:29:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:34:32 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 9319c37a6085ccc9daf389f40f6f0382f57c05f3
X-Git-Newrev: cca59981bb2ad73675555f35c4c3f6dcbe7a1fcc
X-Patchwork-Hint: ignore
Message-Id: <20220123192954.D46AD82973@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-lxml:
 security bump to version 4.6.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cca59981bb2ad73675555f35c4c3f6dcbe7a1fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- A vulnerability (GHSL-2021-1038) in the HTML cleaner allowed sneaking
  script content through SVG images (CVE-2021-43818).
- A vulnerability (GHSL-2021-1037) in the HTML cleaner allowed sneaking
  script content through CSS imports and other crafted constructs
  (CVE-2021-43818).

https://github.com/lxml/lxml/blob/lxml-4.6.5/CHANGES.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ad6321660c91c9440c17a770505bfc1742e57d33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index dd6446e6cc..e33a8f8109 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468  lxml-4.6.3.tar.gz
+sha256  6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca  lxml-4.6.5.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 0d3775a1bd..8c2e965af6 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.6.3
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247
+PYTHON_LXML_VERSION = 4.6.5
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e6/e1/34b3ab08553fe9a30e15b2bb9d1803a49d7d907dd9f245638839190042f0
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
