Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FA4EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EB860907;
	Tue, 10 Sep 2024 20:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8mLEcxSjBvj; Tue, 10 Sep 2024 20:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BAB6090B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07BAB6090B;
	Tue, 10 Sep 2024 20:51:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCB21BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 592BE608C0
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ce1091myzgOI for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764AF608B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 764AF608B6
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60A3C86F5D; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 817b22f114ab3543d69341efa7c6da5008ec419b
X-Git-Newrev: 5fca562ee88b07472cdb68e166ebc7f576d1c6f1
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.60A3C86F5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-asciidoc.adoc:
 fix resources typo in example
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fca562ee88b07472cdb68e166ebc7f576d1c6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As FOO_RESOURCES hints, the correct spelling is resources so use that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-asciidoc.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-asciidoc.adoc b/docs/manual/adding-packages-asciidoc.adoc
index d68978b1cb..c34b9ffc2a 100644
--- a/docs/manual/adding-packages-asciidoc.adoc
+++ b/docs/manual/adding-packages-asciidoc.adoc
@@ -112,7 +112,7 @@ Here is a complete example that uses all variables and all hooks:
 05: ################################################################################
 06:
 07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
-08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
+08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/resources))
 09:
 10: FOO_TOC_DEPTH = 2
 11: FOO_TOC_DEPTH_HTML = 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
