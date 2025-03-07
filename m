Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C58C28B28
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 21:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B301641694;
	Fri,  7 Mar 2025 21:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBDhjaxJud0M; Fri,  7 Mar 2025 21:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEB141695
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEB141695;
	Fri,  7 Mar 2025 21:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD15E26
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EB8840451
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhWjExhuu0JH for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 21:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71E85403AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E85403AA
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71E85403AA
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:24:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id qfB8tUD7Q1ugbqfB8trku0; Fri, 07 Mar 2025 22:24:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  7 Mar 2025 22:24:22 +0100
Message-Id: <20250307212422.502634-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDWMPoWuTs29W8hA96e5h5wU9TDe30rUuQqZtxnhanLyRCBvALrZQ3MNp+UYTjWXA8pBIpp2bn/uAiu45rADYfn842RDkR9/7da75HmqrFjKdkCtMj14
 ceawo8QyvzQjhm1yz39ct6HvQV9clGtaCgVMVpU80PFUmKl6epz1+4zvo4DYk5EhRdoMP+NDR05YUmCiI9AkX3AF4jdRP5Qi/1kSvklOQR6TW7SWsS/Y1unA
 rE83RlqzCC4J7TY2SMAUgscOyV1o0oxBNeaSUHYkhqM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1741382662; bh=X+LHKXOSSytzAey6rnZLQ29P//fn7a64TuF/SuAhzCk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hlym4a9BcfHmg7eJNoidoYWI3YsczoiZqkdE4Vv0nO/4iPea7IBU5kImK6Lw7CD+w
 GN6i1v2JRl3gAQ/CaOFJO0xkSbuwnd40bMrgXTmhsfGAfmy5EQXb2YRljxKj5rL2mP
 vJaN93Hn5XRyurQjxeKyIleYhHCE5lQvx9ABLikXQ25BCKmn25Z0RgFyj47ezQYHuF
 khzLAOKea7ysoU36YV0tIRjKJi1HfgX0HhreDs8GJcvMm9n2W+9bMa4rzvrXkY1AzV
 n4trnn2+PjAK9xzO1MTw73mZxHNJyJIPX3Y4r/vdx3VG281zCZ8NwjuwSF6N+qGPPT
 IH4VCzpVll8TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Hlym4a9B
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/10.4.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 561b9089e0..abe7440259 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd63fc3cbae32622588e46e0670fabf78ee6cff44a6348ca7f037dae9a32f9ea  harfbuzz-10.3.0.tar.xz
+sha256  480b6d25014169300669aa1fc39fb356c142d5028324ea52b3a27648b9beaad8  harfbuzz-10.4.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index db99199278..45168a0e02 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 10.3.0
+HARFBUZZ_VERSION = 10.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
