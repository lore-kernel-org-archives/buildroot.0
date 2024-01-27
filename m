Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3BC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5726B821DE;
	Sat, 27 Jan 2024 18:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5726B821DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlQLwa_UICfI; Sat, 27 Jan 2024 18:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9684682062;
	Sat, 27 Jan 2024 18:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9684682062
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A60A11BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B344416FA
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B344416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VD7NC1t4_SIi for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:22:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76C48416BA
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C48416BA
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9824BA4C06CF;
 Sat, 27 Jan 2024 19:22:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42096)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rTnJu-000000004sy-1Q4p;
 Sat, 27 Jan 2024 19:22:22 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:22:22 +0100
Message-Id: <20240127182222.17574-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706379742;
 bh=KTFfD9EfGvpVWlPmmsj5W3hvkYCLiGCdf9txaRGGMwY=;
 h=From:To:Cc:Subject:Date:From;
 b=fPW1ASka09osB/w/gfZFVQKetdxuWe7VTp6cIskChQLBc+ym9nV/XDCNCYp3wA0c6
 8hKjixQrolRyt8+JqkIXygHhuL91z64tXJqFp/WR2rkNC9rp1wGdvIGQ8PUGa1rG7/
 v0UmlwWotq6nrN8CT4TjjDcvAwZTikPHyQ4tPwfzKPcjD/l455ROIKLEGR33gDZ6Wy
 AGBgjE0Pco7kVNpAjrBR4tf0aKgdWeqKjVLGldF+BaOk9Bj9Qc1acvhYje12GoJUS+
 q5wv6bHzS8xl6aEXL7ZfwxgDa9aZ2Fh8ksleAHOFLaIt4BteBG8PQmE6k9HGZFjjC3
 FstlJ//EMssVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=fPW1ASka
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.3.17
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 6154ce636d..9527cb9a56 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  083b86fd65ec9515971723872e56e1ba72e83ff75a9737d41a55938c0f2d4ac2  intel-gmmlib-22.3.16.tar.gz
+sha256  5fa23407d4780c4ee8acd68e9ec9186e1721238150dc36ca9ab469a335891d2a  intel-gmmlib-22.3.17.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 2244f5755e..5502687a4a 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.16
+INTEL_GMMLIB_VERSION = 22.3.17
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
