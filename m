Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A3CEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 08:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB4D3410B8;
	Sat,  5 Aug 2023 08:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4D3410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04AxNMJSLI28; Sat,  5 Aug 2023 08:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F13415BB;
	Sat,  5 Aug 2023 08:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F13415BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5E81BF303
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6163481E22
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6163481E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3tS0AcrUhjf for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 08:34:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB76781E47
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 08:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB76781E47
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B9A3A4C04D2;
 Sat,  5 Aug 2023 10:34:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45600)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSCkC-0000N4-2i;
 Sat, 05 Aug 2023 10:34:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 10:34:40 +0200
Message-Id: <20230805083440.2954531-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691224481;
 bh=42C8RmD16K6lOZyWhA7ZiPa3wAb2hsezhH5iWRvsWHs=;
 h=From:To:Cc:Subject:Date:From;
 b=rSlMKTKR741YA2s4M/wyzwKchM/1T0eyTv8QGQkWfswb0ihHrzCTvRNt5DWa5IUFP
 yqTMqueMPXuoGgsRHfQX7sPh6anafvJFeesSpZr2wLZXMbmx9r96tE9JdyVshj6Ant
 M7DEq5Gafz+lsz+oImhMcNs3dgaj2vxQHDdy7URPKGG66dy4W3VVv/W3fHoJvlSiwN
 z0NZDTPTjDDbaHwYn5EQxDITvzCb+7RRCSgWUGHdWPsapA3GJKYmRmSldGeHGOX8ay
 cFM7RnqgyN72o8uwo1bjuoHf/xGLOJcNHdb1MH6Etn7f4jniYyhWR2wtcffNDfE8NI
 RYySU5HcuCu3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=rSlMKTKR
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump version to 4.9.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/lxml/lxml/blob/master/CHANGES.txt

Added sha256 hash provided by upstream.
This release includes fixes for upcoming Python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-lxml/python-lxml.hash | 3 ++-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 72df6d0278..e34cb193f4 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,6 @@
+# From https://pypi.org/project/lxml/
+sha256  48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c  lxml-4.9.3.tar.gz
 # Locally computed
-sha256  2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67  lxml-4.9.2.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 657622a962..3ef3aabdbc 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.9.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/06/5a/e11cad7b79f2cf3dd2ff8f81fa8ca667e7591d3d8451768589996b65dec1
+PYTHON_LXML_VERSION = 4.9.3
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/30/39/7305428d1c4f28282a4f5bdbef24e0f905d351f34cf351ceb131f5cddf78
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
