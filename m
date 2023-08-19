Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926F1EE49A5
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 21:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA3BB4000B;
	Sat, 19 Aug 2023 21:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA3BB4000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFEn158N0-cV; Sat, 19 Aug 2023 21:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6096401B1;
	Sat, 19 Aug 2023 21:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6096401B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83F581BF372
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 21:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A62B80BF3
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 21:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A62B80BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRjlzBDHdEUT for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 21:18:31 +0000 (UTC)
Received: from smtpdh18-su.aruba.it (smtpdh18-su.aruba.it [62.149.155.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EFF080A64
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 21:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFF080A64
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XTL0qNyCoB4j9XTL2qWmIX; Sat, 19 Aug 2023 23:18:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 23:18:25 +0200
Message-Id: <20230819211825.60854-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819211825.60854-1-giulio.benetti@benettiengineering.com>
References: <20230819211825.60854-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfANNOMz6Y3BbSpLwD7kxRsfesuVYUfAqszNsojFrzfqIEN1zjpltLN9cy+cO7TXhO2OO/LJkXmjmGF5gLqgvWvbW0lEeWkhf9gp0WVcN3+JiSpAAA1ty
 qrv+NSLUkkNO2G1Apuq5ihzBsddDBGnNHuA3AQ+lZL6Z5PHPmRmv9QOiEX2qfUB/zstojvhsZ4RSH39vWOSwFMeYelHvmmMF9WKiKuc/g/DxlKjzwTNME0Hw
 2WWBe2kyjST1JeDzkjDksWapfLTUPbIIk3qPLtJApgDYrq2vRbK9kRX84IyIks1pJK0M5t4BFn9Ho1oXx4kj1Lu8FqjFwyAwr0Hlgk0aHB2aLXecMdrin1K5
 mDA+7+s50KbmktfjBAwb3XTeN8/Lfg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692479909; bh=HuAqSgkKll+WBUXDkSoPX4MCErR1JzdTQwq6dGmmg7w=;
 h=From:To:Subject:Date:MIME-Version;
 b=UTou+yr0kohQ/T7wvV1Y3yMZ43c6SBATbtlfKxxbIio+2Jlq0GZWRGuDtTMeknXrD
 g3b3Y90KtmhYXyLdwtZFUdc0XN7edT5F9xZvPKgqdjJ7E1Kh3aRmUxzvQ3fqs9lNv7
 kYh+DsSro9uPGYLXokLClCjiUnBNVz46Z4ZoMCM+WOBlTomth6wXT6hexA4koV3v0S
 UGrY0AfY4Oe8KhvwBk9ad+UzLpV+4AXA5kg2qfqFzriOhpD2Pve3GoeASo8mkBvtQS
 JrKjtinNNaPPEiaq8/d2rPr+duq6upDeDdOhLir9monICzq6rvJrPrZ+XO/bq1y78H
 13NK32GJ3QZpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UTou+yr0
Subject: [Buildroot] [PATCH 1/1] docs/manual: add Sponsored-by tag
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes it happens that a Company or a Physical Person sponsors the
creation and/or the upstreaming process of a patch, but at the moment
there is no way to give credits to it. In Linux there are some commit that
include a sort of tag "Sponsored by" without the dash to avoid
scripts/checkpatch.pl to complain but a real standard has not been defined.
With this patch let's try to define a method to give credits consistently.
The goal is to improve contributions from companies or physical persons
that this way should gain visibility in Buildroot and so they should be
more prone to let the work done for them for to be upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/contribute.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 94f1c64496..384fdb08c1 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -118,6 +118,11 @@ Acked-by:: Indicates that you code-reviewed the patch and you are
   Reviewed-by is thus mainly that you are prepared to take the blame on
   Acked patches, but not on Reviewed ones.
 
+Sponsored-by:: Indicates that someone sponsored the creation and/or the
+  upstreaming process of the patch. Sponsored-by can contain a company
+  name or a physical person name plus its e-mail the same way it's done
+  for the other tags listed above.
+
 If you reviewed a patch and have comments on it, you should simply reply
 to the patch stating these comments, without providing a Reviewed-by or
 Acked-by tag. These tags should only be provided if you judge the patch
@@ -128,7 +133,7 @@ that testing has been performed. To indicate that you both reviewed and
 tested the patch, provide two separate tags (Reviewed/Acked-by and
 Tested-by).
 
-Note also that _any developer_ can provide Tested/Reviewed/Acked-by
+Note also that _any developer_ can provide Tested/Reviewed/Acked-by/Sponsored-by
 tags, without exception, and we encourage everyone to do this. Buildroot
 does not have a defined group of _core_ developers, it just so happens
 that some developers are more active than others. The maintainer will
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
