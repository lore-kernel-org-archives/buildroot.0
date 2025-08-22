Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4634CCA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0736840A43;
	Fri, 22 Aug 2025 21:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgRE1Qc4WBRd; Fri, 22 Aug 2025 21:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2469E40A34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2469E40A34;
	Fri, 22 Aug 2025 21:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19672D8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B4854084E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5agNsAU3Ik2 for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4822D4083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4822D4083E
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4822D4083E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:28:27 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id A8740E001D9;
 Fri, 22 Aug 2025 23:28:24 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Larysch <fl@n621.de>
Date: Fri, 22 Aug 2025 23:27:54 +0200
Message-ID: <20250822212816.15241-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755898104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mEGvAkx/OBtbs18QwYZjzYQYekdFjuGu8+WFt8J4Z8A=;
 b=WZqX+B7TnNdF7nOmACOT1ft3K6EQyn+fP3uJWVO3h5igqYfMcZg+B9Hb7+qh6qmtDTg0et
 TNrlRLuVmvV5rkYC+3CzcULqc4CWRkloj0MwCLCATGnvN9WInQsphWCzRYRXSNnz3kVRI7
 FhD4xrd2fMI2vy4gDzuOd9FJPLyVkpI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=WZqX+B7T
Subject: [Buildroot] [PATCH 1/1] docs/manual: mention checkpackageignore file
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

Currently, the manual doesn't mention the checkpackageignore file at
all, leaving the user under the assumption that running "make
check-package" and running utils/check-package directly on the package
they have touched would be equivalent, when the former evaluates the
checkpackageignore file while the latter does not. This could cause them
to forget to remove stale entries from that file.

Point out this difference in behavior.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 docs/manual/contribute.adoc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index ffaff6f857..b484f8b524 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -321,9 +321,11 @@ Now check the coding style for the changes you committed:
 $ utils/docker-run make check-package
 ----
 
-Now, you are ready to generate then submit your patch set.
+This command (unlike calling +utils/check-package+ directly) will also warn
+about any stale entries in the +.checkpackageignore+ file that your patches
+might have resolved.
 
-To generate it, run:
+Now, you are ready to generate then submit your patch set. To generate it, run:
 
 ----
 $ git format-patch -M -n -s -o outgoing origin/master
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
