Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C547DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D9F60B7C;
	Mon,  7 Mar 2022 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3WPoPprMFd2; Mon,  7 Mar 2022 22:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BFC60B1B;
	Mon,  7 Mar 2022 22:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 989951BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C2E60B62
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BrqY0ScwpZE for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B796070A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 114A882DD8; Mon,  7 Mar 2022 22:19:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 23:15:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4adbfaf2e6153ad0e811b4debcf945ff5788c76
X-Git-Newrev: 4dc48e8b9d832889edbeeed28c2dcf0a7bf01718
X-Patchwork-Hint: ignore
Message-Id: <20220307221917.114A882DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_mk.py: check
 CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc48e8b9d832889edbeeed28c2dcf0a7bf01718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As already done for {FOO}_DEPENDENCIES in commit
4910a175b3f1f4b55ff257a75945d8ffb14a4ceb, check that {FOO}_CONF_OPTS are
never overridden in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 153754b6f1..b50a19ac62 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -90,6 +90,7 @@ class OverriddenVariable(_CheckFunction):
         r"_SOURCE\s*=\s*",
         r"_VERSION\s*=\s*"])))
     FORBIDDEN_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
+        r"_CONF_OPTS\s*=\s*",
         r"_DEPENDENCIES\s*=\s*"])))
 
     def before(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
