Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A52CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F152885AC8;
	Tue,  9 Jun 2026 13:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgSJZhdMEgvE; Tue,  9 Jun 2026 13:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0AAF85556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010232;
	bh=4JN/SGmEfNSmukT/OVMm9NvS9DZDrqSrm3Wsj6ynN3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UdBFheMJWrfHl2g6X3jg598De5QZGnh2KrRbDg7Lli+yhZZTcV7Ps7Ar4DACaZpRf
	 Qn1i0Mq36qHL6zp8AiItMsF2of437M+b+F4RTTd+KqB/4AQwgBs0Afjev5eRke2inn
	 vHqYisROtcyNDLEvKx5ptjLWLCUWxP06lMUg/3iJvwkzD1zpxd1HaJN0Fl6hZH5kw0
	 hJuqYQjmECwcMvNLM77hHZupR7qV/5OBRvl2ZZkLAvvAM5OcaDvX/xxEoFZGax6Lcy
	 HpS68AJ+6PiHhNqJomKGJghkRHnlz0YBCbatHYtTU17Uhh1ipXki85yY+1VqjN2z/y
	 u0wPi7ix2oyNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0AAF85556;
	Tue,  9 Jun 2026 13:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5417190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D322E4270F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqW9LOej59re for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F000E426E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F000E426E4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 375DC87E7E; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 13:42:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a630ba2e32c324f08cefb3a810215450f6e4167a
X-Git-Newrev: c9e5b93f78228c9bcaa210eaa99332000c9bf86d
X-Patchwork-Hint: ignore
Message-Id: <20260609130118.375DC87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: bump version to 1.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9e5b93f78228c9bcaa210eaa99332000c9bf86d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/oetiker/rrdtool-1.x/blob/v1.10.2/CHANGES

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rrdtool/rrdtool.hash | 3 ++-
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 1b16b8226e..ce1186cb18 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,4 +1,5 @@
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.2
+sha256  9787114551ee9b5db7c72722736388dcc54bf00ded51b5dd47feed11fb179fe4  rrdtool-1.10.2.tar.gz
 # Locally calculated
-sha256  5e65385e51f4a7c4b42aa09566396c20e7e1a0a30c272d569ed029a81656e56b  rrdtool-1.9.0.tar.gz
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index fd9883077c..73832cb635 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.9.0
+RRDTOOL_VERSION = 1.10.2
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
