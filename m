Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29571C54F54
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B6060689;
	Tue, 28 Jul 2026 19:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTYP_UzxpDLl; Tue, 28 Jul 2026 19:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1028D6079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785266147;
	bh=ZdmW2zF/UsdQpxUO7x5aqWrlMpWy4+Q7Y8W9V56Kvxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nxd0383jrDs4T9CLyg/OBjDfT8Fu9ggAihjXaxnx3IunDROqbyNbbqwnmUPVxA9nd
	 j8XG8J73LHRiMtULtbATKbKXz/78+fixFJd5QB9DvFFE4aG8QD74/IwRLD8+tbmMz9
	 ugyjBLYFHC9uwdeVhkMnc9Xd+WI8c4GaLnUIrdapykv0kz9tyqql9sgbZWV2hHEr89
	 fPMuS8Dwf6WTnIyjua3QvsM2mSgk0gguLCxj5+rsfvj+RbC+l1uAbHH/yIvRcCstXR
	 6g3mUNBdnPqp66Q+hKRewMJmQ7XzrBATMpQxDtgF3UzpJ9iqMNeQ2zh4H27FCbHyry
	 2SIoXChQbxA6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1028D6079A;
	Tue, 28 Jul 2026 19:15:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B94945B
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71EC58113D
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvThXijSI47C for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61EE810F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B61EE810F6
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:15:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E73238B44C; Tue, 28 Jul 2026 19:15:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 20:55:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5e6133eabd3371f999f26215ac70406530eb0d9
X-Git-Newrev: 1f92ba142c7fda465ebac7f182c5e01c0fba9b22
X-Patchwork-Hint: ignore
Message-Id: <20260728191502.E73238B44C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: bump version to 2.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f92ba142c7fda465ebac7f182c5e01c0fba9b22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release-notes, since 2.2.0:
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.0
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 6c04d4e989..1e2a8f0c7f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  567dad078f8a66d6d706ac1876b5251b688109d16974909d89ce2056d6e9f258  osm2pgsql-2.2.0.tar.gz
+sha256  e90461bd78787fd5cf82f73ac4bc0cfccbc4f498f35dce59eb4d168a380d6ac0  osm2pgsql-2.3.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 10e64e75a6..66d693bfcf 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.2.0
+OSM2PGSQL_VERSION = 2.3.1
 OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
