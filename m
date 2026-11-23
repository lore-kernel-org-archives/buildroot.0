Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CD606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kwoHHv5Z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16EBB80CB2;
	Mon, 23 Nov 2026 09:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWKbY6WNYg01; Mon, 23 Nov 2026 09:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BF5D80C81
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427654;
	b=lib1jxflEylD/JFszZhG/dMHx0QJOIjvsUIzeckV/BSVSvs5qmniA14lvPtmJh4rbmVr
	 8j2QfKKgXDbDDXaR14mBJsPxo9ffIVFCPxt5YF8wIbaM6KjelueQffBqu3k4yDCAnT8bn
	 g7jW/ZhSXRSut7Cz28kQa6i4vdMdIjgM9ZoA8K6T/T/9lSnIAJRg8TBV+Wp/HszaWBiZ7
	 H2fdCdZ/1MrIVicx6W6482FRlVKzhwWKbIXK+Y7GHoc1xQ4lPZUk+IhZt+RAw8q7THhX1
	 rp5RQDNhDRcLbGi9yzn0qe7PFYyZ01xRN7AwcOTEYN/R5JGoEH8KB75J2eCMBtDknOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hhij0xZHIzl9aW4btjb/R9Ia/PnkX8SubLUhzUblHF8=;
	b=JOsCG2CdxPJxTApKP/E2/Kv6uH/tL2XMZ1/PIxfNNQhOaKVSUTVPJGfHoEjTlCPfUYR6
	 gsT07yDeMbvbDX55qX0Xp7ln//58A13rFBQO2Y2OgJoQwvhEYvdobNkXU7doCFIvjMo59
	 3qyqUgEGpjR0/75JbBlb7sZKUNNWCS7/d7l/kdQIy2YxXY/BagRLA55nfC+lvnf5Ik3qr
	 NXHtAgt6aZA6T8FDlRBqD7eY9hTeyUYzDE1vYoWhfjOZ3Y9vY54D6mXYMwsfdRszriUf5
	 Ccdviq6/sQRxu/NfIqYSGsoHQ72+c+iXriUH+212eDaLKzr9MWVpAD240foWH9zALIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427654;
	bh=Hhij0xZHIzl9aW4btjb/R9Ia/PnkX8SubLUhzUblHF8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwoHHv5Zo+VvzS7PX6zFlZlbmTBA17lFOj+60L7as0I+xytdjMMx6jRx+isuWROAL
	 kwL8keqmKlWQeFrYknstLyqhxG7EiUUVf6ewOF/BY9qs/WsIQYCfK+/MOIq2RzGdMY
	 Vdk9lTuUxbyEvR/IwdAcL7sic53iJXWuq9+DxcMlmWKV8tuORUs3iqQXOIMntzupwa
	 0gZ8FjbcRdO1rXH28R4V4kdodZK9ti17mfObFUwwAxfkoiZ0m4jrulNCTxsNrN4Fy/
	 e1/5FKYhJUiB6gY1qd2N3eBRpfGOqnCTIGn3UQEHmwxbJyHKQUXeLrSpfRbSYweChI
	 HN3sFUWO2Z5iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5D80C81;
	Mon, 23 Nov 2026 09:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1101B1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC29401BE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX2sUFYtZCOh for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D28024005D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.128.49
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.49;
 helo=mail-wm1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D28024005D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso23442515e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427642; x=1796032442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZN/P3fVTlk9OWVwVlslWFBpTHt37aFkrq5akkr/P0uw=;
 b=wa7r9xwGRyLzT/XqLaqJqjvIbZUj/K1bE9qGxdIPV5l46unD8mihk02PAZZvucwoBI
 SrgzPZrXmsojKAlkjL0cZp9bhifXxg0fl/+NB4jvmejTqPyzLy94JYkpgPdEcTBCvlxE
 n5RPE6t7g9+P5pwnUwcQ/O6Pru25rp6FVfykrjUditHl5Sc6UPoZBq7p1VpQSyRCzcp/
 4DqwJbSA+2uzjc+7cLZp+2yxaxLj2AHfDcieGuXumYYDBPE80SzGiHggCFe/t0m58CDF
 F5/oD25+lN8cNvmRl+t8hUBOVaSSJTGCk2UH6Qy+OgoTRSdG89S5LG94uvwXp7nTpYll
 p/Og==
X-Gm-Message-State: APuU4Z+sN8Pa/65vqe8JsiQL3mteHtOGJDf/8N9UK3uLnwThCvgC3PMt
 eiLO9SQgb8c4EZI2aLAgfmSSAgKI07okN7gED0fLyWlXAtt7PMkk61iLO63PVyNs
X-Gm-Gg: AZFdTZceCF92/j14sZq0X4FXxdRrxY/mrzR4QoyWeWx9J6Nwqkdu3f5NL8zvNdZ1ROe
 Hs8yy39+Mkn4DDh8pLRJnaVHJxmdCEHHPJi/JAqPIeKewY+7NFstRuZD8DY7nR7uSGB9w46ut7D
 aJlKWqth5v9Wn8Yd5S5tDLw8zM5Bs2Sdn8BSFS/2BJhlEvNrafq3nrmUAYFrOsYWMM72sYxxGf4
 9HhsEUTqvfzT8vQNALU9YGMg1e2vBVJOBO7tvCiXZJJK5V/LqwYbVDG2ZpJq/uRg10/+Zpbgzso
 DhJSTfTkCfgZjhtCCBHJpXErUc2oTrFHDU0nPxZtgvIFS3Hi4LL2EftWRKL9u0snPmSBDIoCsFU
 fcPoSZniKWnZSSyv3UBd3OOz8mG+hSn8FeC6a1IrpNzXwxyCcecZKcKCOHaUipLlxzVmIssAaXK
 ar3xMj0u00xE5uRJwCXIFTWZMyo8cFo8d3ea57fG+wTro0wks4J7J3dewzltQsQkLGb0bMF7Ri/
 MplNbo3p+Kiyo72NcGohLTSlhy9n86pt04xfi3COaN7eGb4CIgU9LUs8IFEEb9QfYvqAesDw68h
 4jjFxgb7WO4uVG2daCfo5LjGBuP+rXMqSjWg1SE2qUbwbnEtCIoBr+PUiD6q79YaqtL89YihTdT
 eu3gAhsqyaotq2GCt1l4sG4ujbDaYuJWVmslFAF8LAVYsZQkjIZE7FA6PgPsn+i5GkpiOz1MaKK
 9R/NDRsfAXKNg8dCeoa+0adcD77nl/0ss=
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id
 5b1f17b1804b1-4bb9de0d5ffmr2648115e9.25.1795427641603; 
 Mon, 23 Nov 2026 01:54:01 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:54:01 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:36 +0100
Message-ID: <20261123095339.1566394-8-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 08/11] package/syslog-ng: bump to version
 4.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.13.0

Update the installed configuration header to match the new version.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 3 ++-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index f6d0e834339..4dc4baffd47 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.8
+@version: 4.13
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 04f33926d50..050d20bc167 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,6 @@
+# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.13.0
+sha256  e82daa3139d1cd790f2d8f2699c70b56a521d8e5218f7e52633dfad1b1f63297  syslog-ng-4.13.0.tar.gz
 # Locally computed
-sha256  f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7  syslog-ng-4.8.3.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fa2881b0d0e..9725cf463ef 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.8.3
+SYSLOG_NG_VERSION = 4.13.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
