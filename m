Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E71C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 07:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B46040608;
	Mon, 14 Sep 2026 07:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0yQ-ep-jDFX; Mon, 14 Sep 2026 07:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E87BA405F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789372384;
	b=hpNX9J3Ps5Y6URiGcSs3GG6eDj9zs4Fabez74cofVgLDeX6zqXQwpXnH4KBOEpuShKce
	 L9tK/mUqNZ7abaoy8QN0SKPyJje72qnEt++Tjpjh+99Lmtgyrikhyc7PpWQIQW5/9j0IN
	 XyPkY1c3NKIKLYyJvo3G2uVGUnYYoSQqE3aNqNcmd6HZsWJUSENpqn+L8JuQ3SwDudiex
	 nQuXn9Vrl46umU5wQBPGmPtii5wNTuC3A97nauqGMeJarDVuUgNBNTtMjyZKOzDnSCuaH
	 5mixphho7aZTGhmZpxEiSDrPWjmP49fzB0F9lv8msCte1AQf/s9dW1IB6X29NMb82iQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789372384;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=NqzJJovztWfhpX/xsDGRhkqrY+3NmYc9OvBI8ycVhnM=;
	b=fSTZjzYy1kIzEhG03h0TKahcAXvtZ/FZ/KF8bTgZLS+DOuJpE/HopKc0ZCmiFg9qhto6
	 CmMSfjX7jPT2o/MXq3WFIWeubQ7We85CcWVdXqI4ZQv9cEpXjpWSxsaviE03saIhfa+jK
	 BsANtk1cSwPOGGZVyQ/wJ9gXE5QONj42DHZ4jgUyOZT1IcOnQhObiLSGWjeQ8ENL8zKWt
	 X7LN/qETVa7rcgqO2nb0pK9B2yH9Z82I2AH4P4juL9ZtI/U2Yhoha//PtnLttUwENUQhR
	 TZJGTGcvhB0pDVDEq3lcdATt0ZvfR2QiYuHhpHUXANbCxXMix/9D9s/8lgMibIIffkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789372384;
	bh=NqzJJovztWfhpX/xsDGRhkqrY+3NmYc9OvBI8ycVhnM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UqEBZyo9eL2eebGROS+l1kyy4YQFAxeQi3DeN7Cx9rJTC26PiO+g0enDqzgyax8Jf
	 x7BTZaTdFuUbQkogqvFnPOQuQNQSB+QpNIKsIIImfq6mK9WkmCmPqArBa1PC79XQNR
	 9tbqQMXS65vNK2RA9UvOM36YnGyHG7ZLlJ/uoc6Jp0yEf5kC6sLV4TPeixGVTZJpu2
	 4sSMS84Q4I+LTHrp7J+qS2hyGFBe/AFJXqbJSakPhMz588ZtlyPd94SSKBAP2AMfqM
	 oO0QnJFPD2X5GNhjgpzrotdKLgJ4E6WI0Irv/MFlm0ZfuxAnhfkkLy01V13Hvs8tte
	 pBtFWbKaYkjDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E87BA405F4;
	Mon, 14 Sep 2026 07:53:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67541224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 596C4400E2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0Ar6uZ2cI7f for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 07:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2DE0A4007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789372382;
 b=b3rRm1Fmo1K0ESNn6RpEzf1pzHPq2wkHucm3xBXwrininy+8XTbHkbil4CmBXQd8whmb
 7APL3t5mYFW8JqTQ1Bn2E+uLAImQDZj5X+KxhLpJdJ5Eu0x5beRKYNNvgJcQ1Gts4EHvq
 tCfUmWMHxlfPmYfjmEw2nVb+ZrdnneOG4IZ7xMKHrZu1AMF1hkHr40yQ8pUCunVe9KWz1
 SicpLG0yS1a54fnLY/jA/jiqo3/i6iMMvc8IBJQ+l9oEglM+c/bymHpE//e4wrbpY0SNo
 ZDvgw/cOyKpwr1gJtRF0SSm5+thuUKVzKP5gwQQt8ayJlMT9CBorVMUZzn6ZdNuYkCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789372382;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Cw9Yeh1A37ozz4R3Ps61tPDIIUv2CoTbjq6x52VuI+g=;
 b=XBHYakYadAmAsjDs2q95eDCxdQOD8GSpihivkph5Q477TjN3DAti+yXJ3181faik8D+x
 H18CNcp9g9A/CPqfathEcm8UGHAhcwc6kbdUU5Iq7eWyj7mUGbl+XGxLp5UjvbBIiGsov
 quHDzHi2ba+3hOnh5kapbuzLA+lAWYvvGyaOJ+l1CGgZ6M/EHVlXkST+wZAsVrcx7VmMD
 i77usfVvVuyCsOn0XjjuJiva3pVk5Fz0isfBaEpozXgyB6KjNp05+3M2I6apcNZxxCW+0
 54x4LojvOK/8jIjbvd72EUnLgBpJbjDtoNB4HoRBATItJi3Fs0V91EJtNFqJUZVgXHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XTupJ1MB; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE0A4007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:53:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9C3A71A0614
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B29160323
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:52:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B41711C7AFDB; 
 Mon, 14 Sep 2026 09:52:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2026 09:52:44 +0200
Message-ID: <20260914075245.1749775-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix regexp used to
 find package infra
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

There's recently been autobuilder failures on
toolchain-external-bootlin, but I wasn't getting notified in the daily
autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
contains:

N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[...]
F:      toolchain/

And indeed, testing:

$ ./utils/get-developers -p toolchain-external-bootlin

returned nothing.

Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
used to find the package infrastructure, and ultimately decide if a
given .mk file contains a package, was a bit too strict:

"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"

This would only allow packages named <something>-package or
host-<something>-package, but the <something> should not contain any
dash ("-"). So this works fine for cmake-package,
host-autotools-package, but not for toolchain-external-package where
<something> is toolchain-external and it contains a dash.

We fix this by relaxing the regexp a bit and allowing any character in
<something>. Consider the rest of the regexp that expects $(eval
$(<host>-<something>-package)), it seems highly unlikely to match
anything else but the line we're interested in.

With this fix:

$ ./utils/get-developers -p toolchain-external-bootlin
Giulio Benetti <giulio.benetti@benettiengineering.com>
Romain Naour <romain.naour@gmail.com>
Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This issue has existed since the toolchain-external-package
infrastructure had been added.

Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: introduce toolchain-external-package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/getdeveloperlib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b5e7b89e72..4321df8bfe 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -12,7 +12,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
 # Patch parsing functions
 #
 
-FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def analyze_patch(patch):
@@ -35,7 +35,7 @@ def analyze_patch(patch):
     return (files, infras)
 
 
-FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def fname_get_package_infra(fname):
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
