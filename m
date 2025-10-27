Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195DDCCF9EB
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 20:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC99A81510;
	Mon, 27 Oct 2025 20:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1e_3z4r6PTYv; Mon, 27 Oct 2025 20:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F041B815D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F041B815D8;
	Mon, 27 Oct 2025 20:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 980E7939
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A26481510
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0L6NJtrUUED for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 20:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84123813F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84123813F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84123813F6
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:38:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 761465FFC0;
 Mon, 27 Oct 2025 21:38:51 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 21:38:46 +0100
Message-ID: <20251027203847.1466516-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761597535;
 bh=WSagruMSQqZ94FcB29GDqjTYyPd0qq5VE/x55aFf5pk=;
 h=From:To:Cc:Subject:Date:From;
 b=o9+XH6GRIM/h1a1Na6ztK1NAPp2b92BMbpCIOvao1gsZFZt/QIwbji99+RYCkmWAF
 r2abmpxr/KwEdZnVhQbU0i+sCoBZfFo2mATakigYII/ctW0l1jajzjowkg9G66v5sE
 ZioGa/M6wJLLYSKyLxo65G6mHR7YFmUk9C82k9cqX7RthQiekIrieOGkvVQ2K4TtH6
 nwk1gj44mQPtyZYKwzQUmwKFBgQplZxdqdISlc17/OOgdLWRE3kkQnCuMop8em1UgD
 QpQYnIsp98VVEKLfWCJmD+uI7b2ewl95d3yNssvXg+ItMlCeHy9XIRIVhE2zRAfkJN
 uz/mpwKSu4myw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o9+XH6GR
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 6.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://github.com/lxml/lxml/releases/tag/lxml-6.0.2

This new version fixes the compilation with libxml2 2.15.0
(not yet in Buildroot).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This patch should preferably be applied before the libxml2 bump:
https://patchwork.ozlabs.org/project/buildroot/patch/20251013210940.511743-2-bernd@kuhls.net/
---
 package/python-lxml/python-lxml.hash | 4 ++--
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 27dd4ab979..a58aa720b5 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/lxml/json
-md5  2aab7842d05041c68f8a83547e034bfd  lxml-6.0.1.tar.gz
-sha256  2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690  lxml-6.0.1.tar.gz
+md5  ac9a945976227fd854d3e9e034e52ca1  lxml-6.0.2.tar.gz
+sha256  cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62  lxml-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index f09b5a5682..d12f65dd8c 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 6.0.1
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/8f/bd/f9d01fd4132d81c6f43ab01983caea69ec9614b913c290a26738431a015d
+PYTHON_LXML_VERSION = 6.0.2
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
