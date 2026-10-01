Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C2CA5FA5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 08:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2157940D07;
	Thu,  1 Oct 2026 08:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPs1D-LTu12a; Thu,  1 Oct 2026 08:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BE9540CDD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790842141;
	b=LhFQWbjHNdV3fSWLEmH9Pcif6o8I1geQW+M/Eo30t1aVpokn1F4I5rZMcfUwF+4CPhGU
	 1cc8yWlw7C616MdcRDQgojHPjJQOvkiDD39WW44dWnQljyqSuO7l1P4Oa9hB+dIwwDc/C
	 gN5ksKD/XKA7+Ef2+ZcC4VKxIGvfbi3f7voTuF5lPqKTr4vV8yCW5hnseeJ0PZf84UkoU
	 OWnwn+/Fh21xKG83S9kLWW5VtkEZeni21RGktGJVmdVKTUzyaD8UyK4Vkzh5tJk8S1Wvz
	 GQbfTVK3bIq/9Fcr9i4D3J4fDJ5BpDGAWE/T8qIfhiGgXhEMpAbh3HoTOsNO8/cj9pg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790842141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z7QNDUm9YT4Q2BsUp2HW9HvFSTEcutuWpP3QYxvUKGQ=;
	b=tgtq78Yx9F1Z0cUl8/YGJH5ulufLBgjLk1zQS0mGRrZd0WUn6INflGkm9wBTsmhj1+tX
	 uqiOEQEyq5ymYGn18yz4UXUk4nTIyCEVxhzstrFx7GiacNFSNk0difpm8CySrAHouLq7O
	 gmWWnMIGQN/9bOAbaQAv4qvFNMwOiC8yGSVeBw6Z0iI41vCtbkUFOUkFvs6AtuKWPoHQn
	 FAoaQqGGcBol99n69oTZbxyZBBWcZYv43L9VvmWBeypC9Ir5TbR07kmPMx23uxG+So4BB
	 bcBNwklqWVF75GJ92GX/MfILFJVqZaknnwS/1IK7f+TB1Goq3j7hXGUK7R0NUN4xNgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790842141;
	bh=Z7QNDUm9YT4Q2BsUp2HW9HvFSTEcutuWpP3QYxvUKGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QgtEVwnrLO1efW+IIciJukWQcS7K2N99qVN+MA37ryPo4VaVOieOq/IDaEMuSY4Cg
	 Sgazsh7L67tP//t/MCY4CkG7GLi5D/OmTNTD/At+GBzCfUBbpYY2AShQ1LfLSJZTeU
	 /tOcXY1Zp6Aq23bSw4uFyQhj4V4OVfXH7C5/idj8IfEJ/7nQFLIPOstXCpEcL5Rer+
	 hpqtNISKfvuN3DLQJD36Df3F8bBmdIzCXVbxHNYqaMnQRch5eeDh2dRDI90CZzXLHR
	 nxaH3NKvyp2kEGQ/pPYwZLFbTTbOY0W0vVLJz6PIGGDl6vl34NKUzX2m1QDxbIj1tp
	 9w1PYYqOZ8ZWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE9540CDD;
	Thu,  1 Oct 2026 08:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F89833B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 08:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCBF40CE1
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 08:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIcvD-GG-gC0 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 08:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E03A40AD1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790842133;
 b=enZaG1+CpP4j6rdqikIMz5YYixIJAQ3NsieoZkI/9VpBzCjdLE0wYd+vZ++aqyuVZPlp
 muP4z2R6Auu1qEZi7mv5ivtgHz6EEacvgk5/bAXZkcBZN7o4GMjGTF/zEhWLEQeOUVTK+
 slEnTJvLpRXWVhXTiGdEb8G9yMm8JEheFOgBu/oB8RGmwh8t0BByERw0zeqBffxuyR827
 h31UqwuzlKHvdY6BDjMeClm+nvfCaw7PZnbAX/aFdrJuaAos6/EN6UU1qQQcwCnOviJzS
 TsGODfrG+Xgp2vCJHtHT9OLota5JjHhS7/pmJvPM7egeO+xEPQfvC/kF8d4+pJ13a7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790842133;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=1ljH0EMDxdJnibfTSRK02W8OZLKcd1gS9oH8p9HXghM=;
 b=KbMjGZ98Q6f0Iees/N8WN0LDtqCH9ZLsM0YCd+fltOQxsMkbexDDmdq3ezLR/gZcb5d4
 va1XQuEGGwS6tD2Z2QhUUE/WavZFk8v0fFHg7PyfJM5xeR0IhVl7TgBazQ/Ou9KHMtjbJ
 z9fGQdwTzSA3zgK4PEDE33kguRXB0s0+PnR71j/GAcLcrwWeD2YrhDCHtnE81p3d6kGew
 IXe5yslQIEe2l4k4d9ecLjoBBI2oQdn1qKqi0/HBWgr7sE4ktuq6kdn/jrfKyUVHMpzvr
 1hQIvz0riFzsMeAJ0ghAmq11+jCeO846RjzwAx2Cka2sB5AIR4Hj8WPmjoWe7Qns8gA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=gMrADtpa; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E03A40AD1
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 08:08:52 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id CC1D2440AE8;
 Thu,  1 Oct 2026 11:07:54 +0300 (IDT)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 11:08:38 +0300
Message-ID: <37023ba12c19645b47a5ec66de43d08ce92098c2.1790842118.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.7
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/the-tcpdump-group/tcpdump/blob/tcpdump-4.99/CHANGES

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index f69b672be910..752f0cab883f 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.6.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.7.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09  tcpdump-4.99.6.tar.gz
+sha256  8be364e28d3b745ef1459b385cd2f4bc0e1ebad7a5d2ebdf70071d6c9b5b9a54  tcpdump-4.99.7.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index c3d777ca7001..31d2464fdd0f 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.6
+TCPDUMP_VERSION = 4.99.7
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
