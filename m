Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33522C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A29C70E6A;
	Mon, 19 May 2025 11:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsAOIKPDwJI7; Mon, 19 May 2025 11:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C8E70E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C8E70E61;
	Mon, 19 May 2025 11:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 291BDD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F1A41A15
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TekvwSId8W6F for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C23F41A26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C23F41A26
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 097088348A; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:46:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 70d5bac305792c9c008eb11dfdc793778a5f6ba3
X-Git-Newrev: b15cd1d8fee1fe9c253ffaf6a112532fe9a8f092
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.097088348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 docs/manual/adding-packages-python.adoc: clarify how _BUILD_OPTS work
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b15cd1d8fee1fe9c253ffaf6a112532fe9a8f092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

PYTHON_FOO_BUILD_OPTS are passed to the build module call of the package
build, this allows passing options to the python build *backend* by
using the --config-setting= option. setup.py is no longer involved since
even the setuptools backend now used the pep517 build method.

The note about the options being passed to
support/scripts/pyinstaller.py seems to be no longer accurate.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Arnout: also mention -C (suggested by James)]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/manual/adding-packages-python.adoc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index b42c06e54c..d6bae299a0 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -128,10 +128,9 @@ therefore only use a few of them, or none.
   and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
 
 * +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to
-  the Python +setup.py+ script during the build step, this generally
-  only makes sense to use for setuptools based packages as flit/pep517
-  based packages do not pass these options to a +setup.py+ script but
-  instead pass them to +support/scripts/pyinstaller.py+.
+  the Python +python -m build+ call. To pass additional options to the
+  build backend use the +--config-setting=+ (+-C+) flag of the +build+
+  module.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
