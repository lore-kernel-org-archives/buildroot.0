Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B5DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D06481A29;
	Wed, 16 Feb 2022 20:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9h1YMQw5FZtg; Wed, 16 Feb 2022 20:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2EEF80DC8;
	Wed, 16 Feb 2022 20:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6DA1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C3540164
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QhXHHmliXz4 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D3ED40157
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E243F835E8; Wed, 16 Feb 2022 20:40:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 09:27:47 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 168f8e4358e73037f6670e92640c0079a952a6c4
X-Git-Newrev: 7c20887e1f465ad8b2ebab995ad0fab22ecac0a8
X-Patchwork-Hint: ignore
Message-Id: <20220216204043.E243F835E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/kf5/kf5-extra-cmake-modules: do not build documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c20887e1f465ad8b2ebab995ad0fab22ecac0a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Pass needed CMake options to disable generating documentations. The
documentation is built using python-sphinx, which is not packaged in
Buildroot.

Prior to this change, if the build host would have a Python installation
with the sphinx module installed the automatic detection tried to build
documentation, which would fail in cases where the sphinxcontrib-qthelp
package is missing from the host Python installation. The error message
in this case was:

  Extension error:
  Could not import extension ecm (exception: cannot import name
    'htmlescape' from 'sphinx.util.pycompat'
    (/usr/lib/python3.10/site-packages/sphinx/util/pycompat.py))

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b341f0c91f658484f90c5addd553c579b8d210c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
index 3c4281b960..ba2748456e 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
@@ -14,4 +14,9 @@ KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf
 KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
 KF5_EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO
 
+KF5_EXTRA_CMAKE_MODULES_CONF_OPTS += \
+	-DBUILD_HTML_DOCS=OFF \
+	-DBUILD_MAN_DOCS=OFF \
+	-DBUILD_QTHELP_DOCS=OFF
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
