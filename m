Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE03C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 18:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9EED60F85;
	Thu,  8 May 2025 18:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzSxPb_3iVBv; Thu,  8 May 2025 18:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7AB60EE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7AB60EE4;
	Thu,  8 May 2025 18:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F4B315A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 057B24147F
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcazoOaz2yju for <buildroot@buildroot.org>;
 Thu,  8 May 2025 18:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3DE741217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3DE741217
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3DE741217
 for <buildroot@buildroot.org>; Thu,  8 May 2025 18:01:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 95EC71FCE8;
 Thu,  8 May 2025 18:01:36 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  8 May 2025 20:01:33 +0200
Message-ID: <20250508180134.93333-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746727296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WD1mGIVtDoMWTM8yc4W6wL7R72snt8NLwoQY3Ddyl8s=;
 b=JdBfaMO0ljFmmIlE/+BeZ90qGUo45INxtmPm1/OFOwhVqHEmzmlhuE1wVqUk/hJdbl9wiQ
 sZGagunnNwJIhL9t5x/Swbk5QX6EHP6uQ9n/G8KD+BFo6IDpHtftrC0EDnd/ZE5duAzLJ/
 bYys2yLguPc/zU/6EMxfvYsebZMFS2I2GkCUMiHtz1HuNdPsXAqEo1+tp5mxVljCaFxJ+a
 8p6AjdyCFFHLWg9/9/JJx8sShhKYDi9/Z3kbrkuUnjNdUnKGAlck7hm0LYJFQsDPlEKVy5
 qR5IDrfupeOsCdW7joTZohm4EiYxtOy9PLReEwHIYbeibTAAX14pzUzSzN8BgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JdBfaMO0
Subject: [Buildroot] [PATCH v2] support/dependencies/dependencies.sh: awk is
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
v1 -> v2: fix documentation syntax, spotted by Baruch
---
 docs/manual/prerequisite.adoc        | 1 +
 support/dependencies/dependencies.sh | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 5d3aa297a9..1bfcff1a4a 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -38,6 +38,7 @@ between distributions).
 ** +file+ (must be in +/usr/bin/file+)
 ** +bc+
 ** +findutils+
+** +awk+
 
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
