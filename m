Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331DC77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07D783ED3;
	Thu, 11 May 2023 13:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07D783ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtBdClK8ErJj; Thu, 11 May 2023 13:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED24383E33;
	Thu, 11 May 2023 13:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED24383E33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 270431BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF9141498
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF9141498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usPB36eS_F7S for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 13:09:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F38B410B1
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F38B410B1
 for <buildroot@buildroot.org>; Thu, 11 May 2023 13:09:57 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MsIbU-1qCqNO2Rcw-00tmYX; Thu, 11 May 2023 15:04:48 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 15:04:21 +0200
Message-Id: <20230511130421.60538-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:BuLyFuOuc1bHhECC7mmumwI4Ph5bf5ORjLlNv8HONpUzf0kNsIk
 wpyG2wdUnA9U+zxeMnI6kBq2V5MphLU84tphaMS1t6zacRGOI2TYCc3ncmeYL1PRphR/2v4
 tlqFx5f2Eeth+QU39vcNJPZcSYJnpz+6tbw7kroYdG1Bor63+nGFAUwdUGOCdwCIRf6SnuZ
 mexTXgFtaM43Jkmxb3GWg==
UI-OutboundReport: notjunk:1;M01:P0:U8CmW7Gk6pU=;dKVrBVkGFC9aUegD0L+z57Bx83u
 FltPSWbtnP4FenzP8O75O7skF3ccMhOqjAyxIPtr4itQBu+QfesHu9bXodds/t4ZG+CqAscyM
 ZjTyAUzOnvKUolmjMItVL0DMbIYu3Os3kBJXF5NwnhQ/3x0EvqINhL5IR2zSacG/xUkDYEDgU
 UIQSG8Oi5m61VlEzQA8BfX/+do+y34Y/UXLMHaefkhU8jbJHq0nmWDzEYt1JD2KpfAyduW67/
 LNB8IQuUmXFZLFRyiKxVwfYymO7JfmXer8fz7nmDVYFRHt7uSP14wWjs16JIU8hMbi0VpdKnC
 32vl9qlSzzPiDgsUa9jnlKE1229xamThHYFLpydwmSAudLa7Wa5pa/kDL5MAdJqNcuSH6TqZ7
 7pKtEznL0k6mcDF7IBeAJmGlyzmNgxyX7Uk+MxTWSIBh0o+Or66vbUZ6IVrc9u6LlVynDcyPl
 gdGRFjZxCoyHKMi683DTmMHsroQfonDPHTYVxtTbWTsvjCMxixL8Q9vRaiuNGQ5RJ7d/ATOqx
 kOwASnBvFwoftzMf2NCdmLkjazfiusRuQniUaOHqOT4K5cQphPihDjdmuEJqKZ6nJHTBd/bi3
 5t/GiaBbBnrmpG9gAynLSIjoo60PBImErAGnC1Ac+dKBQuc9CFgRFD7V1ScwxqSg6DYxgR2yI
 Bp56H6uRaYgsmCItqD4BYry6exkF15FsppyBe8xplg==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 7.3.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 7e33716f78..61fe8aea2a 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  31b848cc55967c7de63fece8cd1699fc51152421d04653b859103c7391ad5bbe  v7.2.2-package.zip
+sha256  5d89c7017ca85b53bea6402a1222909dc49a061ffa351d3d1e0ac40b94dd2d38  v7.3.0-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 852f5f1dcf..37e530220a 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 7.2.2
+OPENLAYERS_VERSION = 7.3.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
