Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D96CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E5A41869;
	Sun, 24 Sep 2023 21:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E5A41869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0n21q9ZYNNn; Sun, 24 Sep 2023 21:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890A641824;
	Sun, 24 Sep 2023 21:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890A641824
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE781BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E4860E5C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E4860E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBYXeIxcCQDy for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 655BC60E1D
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 655BC60E1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5551C87642; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:17:24 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e3accf31291cdfa74d91b9637c0aa7696ba30792
X-Git-Newrev: a845cb5f1bbb7ed7139f91bd9fc7516c559c18b3
X-Patchwork-Hint: ignore
Message-Id: <20230924212149.5551C87642@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mutt: security
 bump to version 2.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a845cb5f1bbb7ed7139f91bd9fc7516c559c18b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Mutt 2.2.12 was released on September 9, 2023. This is a bug-fix
release, fixing two crash bugs. One is possible by viewing a crafted
message header, so upgrading is strongly recommended.

Fix CVE-2023-4874: Null pointer dereference when viewing a specially
crafted email in Mutt >1.5.2 <2.2.12

Fix CVE-2023-4875: Null pointer dereference when composing from a
specially crafted draft message in Mutt >1.5.2 <2.2.12

http://www.mutt.org/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2deaf046726c3ad37a7289a871f6d0c7f6d07e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 78bce76585..8c4aae3c1c 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12325cf66d5ff8ac4bd87fac8db52c869de52dd278fc301cfd57d5a1f9f465cc  mutt-2.2.11.tar.gz
+sha256  043af312f64b8e56f7fd0bf77f84a205d4c498030bd9586457665c47bb18ce38  mutt-2.2.12.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index c5e4e4a14e..09f547a091 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.11
+MUTT_VERSION = 2.2.12
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
