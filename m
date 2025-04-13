Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C197BC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42AB84083F;
	Sun, 13 Apr 2025 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id domwlDQbS4Rq; Sun, 13 Apr 2025 16:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671DC40638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671DC40638;
	Sun, 13 Apr 2025 16:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 813D2108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72A8340148
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PulOa6xYrqpx for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 16:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5387340BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5387340BB2
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5387340BB2
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:57:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 21202580EB5
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 16:25:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 241401FCE7;
 Sun, 13 Apr 2025 16:25:34 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 13 Apr 2025 18:25:32 +0200
Message-ID: <20250413162533.1737077-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudekudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepiedvvdetjeevvdfhueffheffvdeliedukeettefffefgtdegleetudfhvdfggfdtnecuffhomhgrihhnpehptgdrihhnpdgsuhhilhgurhhoohhtrdhorhhgpdhsqhhlihhtvgdrohhrghenucfkphepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744561535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uLvYY9qUsYbA5YrJ77+GY6WYF+JjhJ1lmrUKHECngBI=;
 b=Ukq/n6oowiqtHfM+lfvZxAIxsYGXEbmzIdDmjaEaGM5TgwXVTYqCclf8l4KE2nOCvY6dUd
 LqTiaPrDhPIECzsxrt0Z8B7VJM4715GqhcWatWF3jyKvQD6C6FsrxZsqgbXFUzN9WcwWBm
 2CfUfc4Loryi2m80G7j2Pqneoqj/aJPMW5qFKU5h0Mwsb1hNs8F4W5QEit7rErvV7mdQJF
 yTICD2sKprhw5kM8hpfH/oGsRMwMAAh3uvvHGlGPsHz4o2WZO2G5aBA9tHYpSAyZKba8eC
 fF0ZJbeky6uzqkoMnqaVyLt6iHmWlQsWx/xjRSiCzd9bDawrrpLSLMhw55cjMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ukq/n6oo
Subject: [Buildroot] [PATCH] package/sqlite: revert upstream change causing
 build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream did a change in sqlite3.pc.in that does work with their
default build system, but not with the autoconf-based amalgamation
that we use. This issue has been reported and fixed upstream, but the
fix is not yet in any new release.

For the time being, we just revert the upstream change. We don't do a
direct revert ("git revert") as multiple upstream commits touched this
very line, so we simply revert to what it was prior to the different
changes, and to what the upstream fix ends up doing.

This issue is causing build issue for all packages that use sqlite's
pkg-config file, in a static-linking configuration.

Fixes:

  https://autobuild.buildroot.org/results/1824a76eee4a877a2f19c1fd19a710ef9f059168/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...vert-upstream-commits-causing-build-.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch

diff --git a/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
new file mode 100644
index 0000000000..f35c8b8ddd
--- /dev/null
+++ b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
@@ -0,0 +1,48 @@
+From f70123a40193c2056755117aa291582f42db5f35 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 13 Apr 2025 17:47:53 +0200
+Subject: [PATCH] sqlite3.pc.in: revert upstream commits causing build issues
+
+This reverts upstream commit a2d88f6a03c9ebde3d037b0e297f47216c685381
+and a number of following commits related to the same commit. The
+sqlite build system is indeed upstream not based on autoconf, but the
+project "generates" an "autoconf-based amalgamation":
+
+  https://www3.sqlite.org/src/dir?ci=tip&name=autoconf
+
+Unfortunately commit a2d88f6a03c9ebde3d037b0e297f47216c685381 broke
+the build with the autoconf amalgamation because while @LIBS@ gets
+replaced by the autoconf machinery, @LDFLAGS_*@ do not, causing build
+failures such as:
+
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_MATH@: No such file or directory
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ZLIB@: No such file or directory
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ICU@: No such file or directory
+
+This issue has been reported at
+https://sqlite.org/forum/info/e40b9b424a, and upstream says that the
+issue has been fixed in the amalgamation script by basically doing the
+same as what this commit does:
+
+  https://sqlite.org/src/info/fe47154799bfe
+
+Upstream: https://sqlite.org/forum/info/e40b9b424a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ sqlite3.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.pc.in b/sqlite3.pc.in
+index a9f941b1e4..3799671e61 100644
+--- a/sqlite3.pc.in
++++ b/sqlite3.pc.in
+@@ -9,5 +9,5 @@ Name: SQLite
+ Description: SQL database engine
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lsqlite3
+-Libs.private: @LDFLAGS_MATH@ @LDFLAGS_ZLIB@ @LDFLAGS_ICU@
++Libs.private: @LIBS@
+ Cflags: -I${includedir}
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
