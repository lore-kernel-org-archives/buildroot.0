Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD91FC54F30
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233D280BCE;
	Sun, 25 May 2025 20:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAJ5oVRjKTdo; Sun, 25 May 2025 20:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A8480BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A8480BD5;
	Sun, 25 May 2025 20:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 633A128B
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4935040399
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CVbiQ6OOour for <buildroot@buildroot.org>;
 Sun, 25 May 2025 20:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7EC340390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EC340390
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7EC340390
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:45:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ED25CB0051E;
 Sun, 25 May 2025 22:45:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 25 May 2025 22:44:48 +0200
Message-ID: <20250525204448.438138-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748205906;
 bh=CJi3p305q7T9IxNGYLTxuvVpvlsdL8he1JF3K74wUk8=;
 h=From:To:Cc:Subject:Date:From;
 b=XA9hPIJ8VSb8IcIHHvIaYAnPwJZprdjd+iOGI6Ht6LaoCWWAnYJzRs4pr08y05xp1
 Q7HVKwIOjAipNN//QoxlNVBOHsskmKsP64y4g9lBc6WBYM1Ib6dF1XUyukkCt27QIH
 gvndDevZYEx0dndx9Yf/Sc0Ox87SG6GS0pWQCu0K4EjGj6kQCyL+XGo/ATy64nUaIj
 X7k5loHsMvCstZWJovI6dDit286y7+5aTfc+2DXqdiT/HIoS9B8SDna2/bpjLhltDQ
 KCR7O4VbB1IZ6U42uJAXzjJZuFlodBYnP0pTmHiTl98Yu4yq6XagFjG5QNbf68dhb/
 NRu7Dfke8e5KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XA9hPIJ8
Subject: [Buildroot] [PATCH next 1/1] package/bpftrace: bump version to
 0.23.3
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

For change log since 0.19.1, see:
https://github.com/bpftrace/bpftrace/blob/v0.23.3/CHANGELOG.md

Note that since commit [1] updating llvm to 20.1.5, bpftrace is
failing to build at configuration time, with error message:

    CMake Error at CMakeLists.txt:184 (message):
      Unsupported LLVM version found via
      /buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
      20

    CMake Error at CMakeLists.txt:185 (message):
      Only versions between 6 and 17 are supported

This is because bpftrace version 0.19.1 does not support this
newer llvm version. This update to bpftrace to 0.23.3 resolve this
issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e29dae109a217636381acd4f7be615a8744fe675

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index c2ecc927da..a3d62e072f 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b520340f28ce4d6f2fb2355f1675b6801ff8498ed9e8bff14abbbf6baff5a08e  bpftrace-0.19.1.tar.gz
+sha256  3b374c3618ff055d279ddd2fcf4393feb88b4b03284b8b6f69f1e0dedd20662c  bpftrace-0.23.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index dc4c9728cc..7ff0508486 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.19.1
-BPFTRACE_SITE = $(call github,iovisor,bpftrace,v$(BPFTRACE_VERSION))
+BPFTRACE_VERSION = 0.23.3
+BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
 BPFTRACE_DEPENDENCIES = \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
