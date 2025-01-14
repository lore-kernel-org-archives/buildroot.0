Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8887DC02184
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE6880B9A;
	Tue, 14 Jan 2025 11:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8KJbTWKDKuy; Tue, 14 Jan 2025 11:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EFD680CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EFD680CF2;
	Tue, 14 Jan 2025 11:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D1294B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95D6940B0D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvDxbNcyMFyZ for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DFB340B2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFB340B2A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DFB340B2A
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1tR9ry3isy-013Oh7; Tue, 14
 Jan 2025 12:32:23 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:07 +0100
Message-ID: <20250114113212.1791033-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114113212.1791033-1-fiona.klute@gmx.de>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jyFhvFue/MuQ+3wD3rYyjPJZ8CAgNDdcG90t5iIXrSkws8T4wMG
 t3fSfNagBLSKWujG7qqgu9UCaEdpKTFmKUb47YBMce7Z1sg5S0o0VJfUsD6mwZp220EkfWj
 nc4KNgM1WACIHTmQ9eYHRFi9YZ3gXBfOYWGuPA+A7ilNvEKoedxpVWl7ztwEef+SxsApwGV
 58nDWxmoaI5WZTfO/+RAw==
UI-OutboundReport: notjunk:1;M01:P0:gVVsneeR5UQ=;xgqrV7gfJFopS40sC8hz3AvyU8+
 p2Ob/k5+2iqiZDp0vIWdXiWVf7t7Q/sbzLEWDvGZv8rYzOBLaUw/1qjGzvSIhXvH3m8gFLMsF
 JzKmr464ay8lTYj4lzTO5TK1p+mocYiiICREShDZnvRAxm5iANkqgpEZ6PXL6cCaRGexd9GvK
 M74dJHtdmVtzW6bN9UYy7XKOoM8u7JSJc3Brtl6zgJc9BHftLtB8dG/oCuiuLcOG4StQURfT9
 mV++O6VAdXWrMh51JwtNAIL/Xj6r4RSMIU7y9OTVNlP2FJ/xxxAHkK60SJkecaJ1uH/EFqtQe
 9hmGG4OhPKQbWsgWR8Eh4LfDQVnGWH9HXmbEQb8Zg6vaPUj7F2u+gihCd8Tv5XGWlsTRqvljm
 nL83yxv88NTYZORZiRjjilog1wXb2P9DzffGOA4vyyRYe4fBvuJObw3xwXjih0yuzRM6cQWUP
 SsNRBjz1+ish45bHgOKJBfinDWgpmux34VUsCAYJhrfKtOHYUVIskXVy61avKsyxItY7rxqLS
 x4hAl8TZSyUAgVd12lfS8bNnUAB8VgXr/m28A1HeLlzKBtrBwiyyfzbThL24FzUCYriBjWArD
 Rtiqk8LZ1nqXIvmmUDEl7mIECdwc+4ADUwZcCOJPZ6WjbpBWV21qCm0kZZTdkpQruyim4R6iH
 JXgY/6TBDJxJLZUUtLoKfqWMdDkEV+dtpkq1pHey8W5ZA1Z6GB2Uxi6ydaqmJPSHxhHsRauIm
 vZqlWYyathIg/HM/8gi9E2Au7+RZTpoQN5+1T/JbJ5Dnib7u7k8iBRe8R/OKjs2UHg0wcEYp/
 E7BknCY7pJ85/hsMZmlArLj3E9dmfGciLTaSU+bJcqs0koofdCYyy77R3FJX4cMqat0vsVRwA
 9k/nBKRBfIwexPIW+sNICma2S8jvf5/pFxqBkbeRpFBBwZ1Ofg0zURnWwylCAYH5iVuQPNBi3
 V/QPt55vk8QHssElitXXK/8aLIsCFCqRBz3msS31nLDyV2kELbCl7ZLrdBrJCqIPkIBHbDpRN
 4vtJ5+xKdknh/Uuynd5LkF+M+h/H6E8YSg71w1+6JWYYXTT81mWrjfX3ZXrTtRe50WImj3Lmg
 8ObaDsu4apohi0tl+Xgc4d70uLSSMs
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854343; x=1737459143; i=fiona.klute@gmx.de;
 bh=Pw6iDlXSdul3gsNhkXCY7z0uvZkRLgY7wpksoCTtw44=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=D5TxI83qIQRRSYW0432qMW+1wkqdKoAo5pyflzOBSi5nAnIKeneKkD//fjeSxXIg
 sITRRA0H04Xv5r/Oz3rDEbLDQfL4f9bCEPAnnfOQHBeahbQTQY9ZnsHn+L8rUfm+D
 pV1YHKO2MERIqbBky7UjJPc4kTsVJlmHSnfXwjlT/OAHxWRxn6iYQsbXI2ztpZh+G
 wwp/60VDPhYzQZ+HMKeaxxd8Xs4czi7IrZPHtsi6Nrov7DL0luTIN+igEDgV85bfS
 GLRO/5xYFAqXgchsD/k05YFZ9MYvVeiVVf5dS4XVl94A6zCyOgUTAiHqCZQngfbxa
 EzCX25hA2U5yzqtpEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=D5TxI83q
Subject: [Buildroot] [PATCH v8 1/6] package/json-glib: bump to version 1.10.6
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Required to build with gobject-introspection >= 1.82.0, to be bumped
in a later commit.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v7 -> v8 (Fiona):
* Move json-glib bump to start of series, to avoid broken state after
  GOI bump

Changes v6 -> v7 (Fiona):
* Bump json-glib to version 1.10.6

 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b78d708391..0c0b2cbb73 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
-sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
+sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
 
 # Hash for license file:
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index e216af20b1..04d696987b 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.8
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
+JSON_GLIB_VERSION_MAJOR = 1.10
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
