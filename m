Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46EDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:10:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CE5610FB
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20CE5610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFCBD403C9;
	Tue, 14 Sep 2021 06:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnnOYBLQZr8P; Tue, 14 Sep 2021 06:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4645E403B2;
	Tue, 14 Sep 2021 06:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 531181BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 431FC80BA3
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ShaVtSqYgtu for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB7C180B63
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 845838A657; Tue, 14 Sep 2021 06:08:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:54:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f52be858f64814a871cfafbce4750471eb4203f6
X-Git-Newrev: 128adb7a54cdadab503386f684444c96863e67f6
X-Patchwork-Hint: ignore
Message-Id: <20210914060813.845838A657@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.16.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=128adb7a54cdadab503386f684444c96863e67f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2021-33195: The LookupCNAME, LookupSRV, LookupMX, LookupNS, and
  LookupAddr functions in net, and their respective methods on the Resolver
  type may return arbitrary values retrieved from DNS which do not follow
  the established RFC 1035 rules for domain names.  If these names are used
  without further sanitization, for instance unsafely included in HTML, they
  may allow for injection of unexpected content.  Note that LookupTXT may
  still return arbitrary values that could require sanitization before
  further use

- CVE-2021-33196: The NewReader and OpenReader functions in archive/zip can
  cause a panic or an unrecoverable fatal error when reading an archive that
  claims to contain a large number of files, regardless of its actual size

- CVE-2021-33197: ReverseProxy in net/http/httputil could be made to forward
  certain hop-by-hop headers, including Connection.  In case the target of
  the ReverseProxy was itself a reverse proxy, this would let an attacker
  drop arbitrary headers, including those set by the ReverseProxy.Director

- CVE-2021-33198: The SetString and UnmarshalText methods of math/big.Rat
  may cause a panic or an unrecoverable fatal error if passed inputs with
  very large exponents

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c600074199fa49291918039fae6723be90776c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index a6676bc160..bc6147bb52 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503  go1.16.4.src.tar.gz
+sha256  7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80  go1.16.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 5b87915824..4252691343 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.4
+GO_VERSION = 1.16.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
