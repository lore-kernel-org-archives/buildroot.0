Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB7E95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EB261274;
	Mon,  9 Oct 2023 15:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45EB261274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y6KAP_K4b0N; Mon,  9 Oct 2023 15:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C36061283;
	Mon,  9 Oct 2023 15:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C36061283
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8C61BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52EFC408B5
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52EFC408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WT4H0AIfrZlQ for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65DEF408B4
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DEF408B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5310D84460; Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Oct 2023 17:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfb1ced92b570cde70a53062067771225ee752c7
X-Git-Newrev: 96785cd8143d5905c7692b8b06864736c1178619
X-Patchwork-Hint: ignore
Message-Id: <20231009150615.5310D84460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: enable firewalld
 selinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=96785cd8143d5905c7692b8b06864736c1178619
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/firewalld/firewalld.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 6b2813e54d..188550d449 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -23,6 +23,8 @@ FIREWALLD_DEPENDENCIES = \
 	python3 \
 	python-gobject
 
+FIREWALLD_SELINUX_MODULES = firewalld
+
 # Firewalld hard codes the python shebangs to the full path of the
 # python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
 # Force the proper python path.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
