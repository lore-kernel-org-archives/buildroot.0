Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D41C9832F
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A036067A;
	Sat, 26 Sep 2026 20:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxTzCGEk2Rxk; Sat, 26 Sep 2026 20:04:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 52D896065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790453059;
	b=gAAU9hbaulHYv8OgJhRi9iMKVSYB7M3gtzpe2Yz8BXkhtUtZrEAS6dX1jREuikg7jcmg
	 2oA//6mooIrBoHWjpA9/2erom9HUVfuCNZnkphTYnEEBlRJ0VG97q8VYSwV/H6ATxxet7
	 jXcot4FvfpbC+6Xb6QO/xOuyLq2MXqvWr3rbq1I5PQWDhmX4GkHPyqUjnoV72Lxy5+s5K
	 wkPu0ajn6xbUiFRcy7ESzXFfEiovZxnJOoVzXg3NMMwHN+tmip49iTVzGYT/9gCZAZNFL
	 uYgjuR7KwdoAYrYOUqA81VQ7AQJaMtXTf9tKksk1ToQCmc/MMfNWk3VwoynrtSy179Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790453059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HdMtbg2i/CCC7WUcLRdkH5gsOv9hnMY7iWB6KWMB6IY=;
	b=JmvNSkLTRcyUTyrIPpPDYTbuFBANZt1DMgDOTCu5LS14635yixG/CtBCtrKbSoqZQHD2
	 k3O7+AYckD+xwuj8xVY5YonoO/0eggTBTxnQ14u3PXjFQL44ks/8VxVUkLdTCJAaTh4K0
	 zkCVS1+/AHXhtqFvM1aOTzOF/8l2bKM/Rlu6TNyx3pOXxuLpk98Xz1e+xPIUzJrnGfhGF
	 rCaOVHxr31IGaaBTprwV5JRB2J2EgcDMuFUJwnJOm2+RICYfFAXv0BWXadq07rOtuR4UL
	 FkRov/iVsZE5kJsl50iPfeXJpJ7PJHuoXd8ZAZJZcFUr7HppEJ28YFnHtTDcsPlSMRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790453059;
	bh=HdMtbg2i/CCC7WUcLRdkH5gsOv9hnMY7iWB6KWMB6IY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=shrFvGsgF4h9HE2csT3rmspbXxCN/S9vOJBmC44DeMOsS2LEWHxLK5kCBqkk/6E22
	 ho66G0Hc8m8G2ok+wn32+DFoFP03uT1WLbH+3YB1pvdoWFY6oFsQaDmuk6tpeEqrhG
	 kmDg9txnywYdE3YvGTknCnyg/bBzNl5YCSeOMgSf/y4vPQNkNdf83a2OfVmp0EaoH1
	 5LuAWYjC9yqLNNOMh0dMHYVNjiQKVnctiSpxMwEVU/YCeDNVagf8XEbyVQSHkgLSHO
	 NFhPbUJeaRqm/3eyax8C3nJIONCNVey8fFJBOQyIPPHCkLTwQu7Fqar8LrU1BADY5l
	 TD85c/bC0mkOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D896065A;
	Sat, 26 Sep 2026 20:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4A4635F
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961304009C
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qFRPtTBqpfx for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 20:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 39E0440083
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790453056;
 b=KJrHeWLYEiTuijt2Bjco986vGCdzPUlSOQaej6pSqn/r0DZ8rS9gcTN6ia809wcs4VK6
 +hsYCh7LVJSZG38qpvLz6evzJfi/fqYlCxO7WYkPORe13FRyn/4EcFc79Z7+bEhIoT6ax
 XkUssH9wJUrZxGa97DIH7wywZZ7N4wyhlPUY71vr0Dwt6E74jXn0KC/+09Af+/dYlP/VY
 9AdSVVJ05mgIYiq3KTnxmFVJcSz90Nqd2JAKEYXo81N9n/gWPoo4I5BdMMDBPdOGCwizs
 NwriafwaJB9BOKVto/cfYObUCNDeaxerHENRp8bXU7P5TC0SC6fhKlwpy/g/mmYf4kQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790453056;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=MzeQsC8ddBWJtOHcRWDZq+25oeXAYLoN9kECHkYz4D8=;
 b=YcosaeJicRl2n57elpRl+GyfbrHMBcM8DANADlR1IVixD1N4BlSSBmr+tqtQhaUKkbc0
 0IzJv6LDOo+rLx/9k3UyzsPsTmiSRQTWNTwNCEG7XW+OP/Gx1bHglfPzqrHHK/ZaRn1Yc
 QVGnc7cTcz7+oLWH0Qlw9N1yGEdrPgHCcQeNYjT6bUjKwEbrSeUyCMhObvkEpHU/VhNu4
 OuHvIlyMuTH46JAxgiLmrXZVLn6CNwH9eh9RANR9OKysK13FSi5VBjCVFAlFhriDyUjSr
 XA6LLIRPEjj83lZIN8n8EOTcqPaD5feVYJt9+ruKbjrHrALc4LidbAfnRrUkAuLttyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=gOiI6SkI; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39E0440083
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWAOQ-1xDMz11qZu-00RzMC; Sat, 26
 Sep 2026 22:04:13 +0200
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 22:04:04 +0200
Message-ID: <20260926200409.2095216-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926200409.2095216-1-ps.report@gmx.net>
References: <20260926200409.2095216-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UVcMGJW1X7vtd6WEsRuxl+rh+EDGEV9ko9E6zP9yEiYEX3zmi8w
 SG6oE2107GigwBQ587g26wkDFyGpaFhSLtj+LxBsu4gBtCtsaxelIr2B3TL/fhdSKThOT2m
 Shcog/sme5hTwXRlQjnVbsTFXf003TidfP+pwJlSvRmRoH/8DH8OB5pI+JwwXd7g8rbRtJG
 HdePT3hRT/wTPE187oAYw==
UI-OutboundReport: notjunk:1;M01:P0:earRQeGbhzg=;2vkGq/HqNTkY/lzPVBQP6hTGH0a
 +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
 bDsWatRyXfbfUDZg5CsyMSoFxOmyqyiTAFw==
Subject: [Buildroot] [PATCH v1 2/3] package/nftables: bump version to 1.1.7
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.1.7 (for details see [1])
- update coreteam gpg key URL to newer key (used since nftables-1.1.1)

[1] https://git.netfilter.org/nftables/log/?h=v1.1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nftables/nftables.hash | 8 ++++----
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index b7c65777ca..b278313e16 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,9 +1,9 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.7.tar.xz.sig
 # with key:
-# https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-# https://www.netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sha256sum
-sha256  3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86  nftables-1.1.4.tar.xz
+# https://netfilter.org/files/coreteam-gpg-key-0xD70D1A666ACF2B21.txt
+# https://www.netfilter.org/projects/nftables/files/nftables-1.1.7.tar.xz.sha256sum
+sha256  a6fbf060d8d4fff001517a2b94f356bb4366bfbf0ba366366f9d27cc38caa58f  nftables-1.1.7.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 94bf977725..63463f6725 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.1.4
+NFTABLES_VERSION = 1.1.7
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
