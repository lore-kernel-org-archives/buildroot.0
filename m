Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62788C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 11:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0503B80BDE;
	Mon, 25 Mar 2024 11:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BDExY541clz; Mon, 25 Mar 2024 11:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1469181403
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1469181403;
	Mon, 25 Mar 2024 11:51:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2D741BF909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 11:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF92A4054E
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 11:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEZKQUEd16gf for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 11:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D53284053C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D53284053C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D53284053C
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 11:51:20 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 363A82C80C87;
 Mon, 25 Mar 2024 12:51:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 12:51:14 +0100
Message-Id: <20240325115114.140028-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711367477; bh=LZIL7qZxyhbgcug7gqe4g8UE+aG99oRn6DSquK1FWes=;
 h=From:To:Cc:Subject:Date;
 b=h5vbgfljBkZpS63kK2Z7voD2S7RquEZQZ+pXrybwOJLPtZjkfk4NlKdk71Hg/Pgwl
 /55DWORwbyQoYxbuPh4A+spGwTngSVc2+3y9ccJWLL57Bqc8gLYeK/HawVqh/C58oP
 E4VSC58wokC0uyYTkMPSbQ1Iy/blTtissls/rtaQgepHns+kNaT9sf3w5H1NElPTo+
 uPDJLsmDvoM3DtesHYqlA/vQwddN3lv68GdcteP9BvoB3QcBJBaI8BzMJCpLyv0H3+
 jKTpBWH7z8q3Jvt+3xqN9gfUajGrZ7wKVLR1tID0AnoPCaxwrIubsVMYSFSQZHhbsP
 loT8LDu08f28Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=h5vbgflj
Subject: [Buildroot] [PATCH] package/python-hatchling: bump to version 1.22.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://hatch.pypa.io/dev/history/hatchling/#hatchling-v1.22.4

Remove now optional editables dependency [1].

[1] https://github.com/pypa/hatch/pull/1255

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index df703088e4..d49bee8bfc 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  d40aaea58a04a36a2b641f6efe99e362  hatchling-1.21.1.tar.gz
-sha256  bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc  hatchling-1.21.1.tar.gz
+md5  63a3c6480c0805c55ce396e1ad246e78  hatchling-1.22.4.tar.gz
+sha256  8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e  hatchling-1.22.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 550dbf0beb..91f6597dfc 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.21.1
+PYTHON_HATCHLING_VERSION = 1.22.4
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/d8/a1/7dd1caa87c0b15c04c6291e25112e5d082cce02ee87f221a8be1d594f857
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/4f/2a/c34d71531d1e1c9a5029bb73eb3816285befd0fffd7c63ffa0544253dca8
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
 HOST_PYTHON_HATCHLING_DEPENDENCIES = \
-	host-python-editables \
 	host-python-packaging \
 	host-python-pathspec \
 	host-python-pluggy \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
