Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF32C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:25:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0946D61245
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0946D61245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E52407BE;
	Fri,  5 Nov 2021 16:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXw6EE1Z5Prh; Fri,  5 Nov 2021 16:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CA8407AB;
	Fri,  5 Nov 2021 16:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37A421BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2769E827A0
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0u8EZ8GL7fy for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78DAA82730
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B22068AC05; Fri,  5 Nov 2021 16:22:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:24:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab721dc46028fdb2214a37592d5e8d1820ccf40d
X-Git-Newrev: 2d8430f36f22546565c7f83ca7a94d2d2ee5b7af
X-Patchwork-Hint: ignore
Message-Id: <20211105162201.B22068AC05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d8430f36f22546565c7f83ca7a94d2d2ee5b7af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is needed to avoid the following build failure since bump to
version 2.1.6 in commit a1f7597b4dcd60e8373040739d7abbc0f45dd5f5 and
https://github.com/gorakhargosh/watchdog/commit/86b983aa5f7bf2a65314b5dfb7ff8c1b930c10c4:

Traceback (most recent call last):
  File "setup.py", line 18, in <module>
    import importlib.util
ImportError: No module named util

Fixes:
 - http://autobuild.buildroot.org/results/9d4/9d4abcb029f4e44a9cb454faa8416d8ebccb5b2e/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-watchdog/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index 18f569ee44..6f0dd62073 100644
--- a/package/python-watchdog/Config.in
+++ b/package/python-watchdog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WATCHDOG
 	bool "python-watchdog"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ARGH # runtime
 	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PYYAML # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
