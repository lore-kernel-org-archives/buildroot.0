Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4EFC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA0980E59;
	Wed,  7 May 2025 20:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZ52GD-iGXNl; Wed,  7 May 2025 20:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF6480F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF6480F53;
	Wed,  7 May 2025 20:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 939F7439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8470D80F53
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaVnx4D6ONfC for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC23A80E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC23A80E59
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC23A80E59
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:11:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 380ED43A58;
 Wed,  7 May 2025 20:11:06 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 May 2025 22:11:04 +0200
Message-ID: <20250507201105.1505495-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746648666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j4ICu46jAhAiDadDReoLyfqut4waxcJU3DDQj4OaXJU=;
 b=ZfrrDQH7IrDP3UydMvvjBR7yhngaWABHkwEECBrBch1hCbe62bwwcSi54MVnzfnSuiSnYz
 BUUnsQehiAbgiLJo/oNFcys9xtgoPJNRjXFZw4RrdueX7hLfPK2v0p5cUh4IHAr6YHGU40
 4e4ymvjrmXiVhuFSwVlzBOUcU3rIQ846NYCCl5mWHehrLlzh0PbHd9Alm0onEkxL6ENUre
 1BLzSIa8gqiIJN2/j5TfwwidyMIRxeb0Igt996Fc1WVVOCSf5l2pAdRfGn1R/n3DkuOmB7
 E4PBLoCZx4L4srLXTdAvAJLxKRVquidnrOqAOH01Rir0S9Akg28jMGf7PSYtFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZfrrDQH7
Subject: [Buildroot] [PATCH] support/dependencies/dependencies.sh: awk is
 needed by Buildroot
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

A basic Fedora 42 container does not have 'awk' installed, but it is
needed by Buildroot. First by check-host-python3.sh:

support/dependencies/check-host-python3.sh: line 6: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found

but then even building host-expat assumes awk is available:

config.status: creating Makefile
./config.status: line 1404: awk: command not found
config.status: creating expat.pc
./config.status: line 1404: awk: command not found

Since it's a pretty basic tool, make it part of the tools checked by
dependencies.sh. One minor annoyance is that check-host-python3.sh is
executed *before* dependencies.sh does its thing, so when 'awk' is not
available, we end up seeing:

support/dependencies/check-host-python3.sh: line 6: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
which: no awk in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)
You must install 'awk' on your build machine
make: *** [support/dependencies/dependencies.mk:27: dependencies] Error 1

It would be nice to have the awk check *before* it gets used in
check-host-python3.sh, but that's a topic for another patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/prerequisite.adoc        | 1 +
 support/dependencies/dependencies.sh | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 5d3aa297a9..9ccc30cca0 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -38,6 +38,7 @@ between distributions).
 ** +file+ (must be in +/usr/bin/file+)
 ** +bc+
 ** +findutils+
+**  awk
 
 * Source fetching tools:
 ** +wget+
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index fb0defd0c9..2843e3c5d5 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -154,7 +154,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc cmp find xargs awk ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
