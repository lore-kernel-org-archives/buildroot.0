Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6396CC369A2
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 15:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC5580A6F;
	Thu, 10 Apr 2025 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpx_CRRDP5j1; Thu, 10 Apr 2025 15:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 127B58217C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 127B58217C;
	Thu, 10 Apr 2025 15:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE303108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAA8741306
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOzfV9t6UVUl for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 15:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0F184143A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F184143A
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F184143A
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:31:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92155106F;
 Thu, 10 Apr 2025 08:31:18 -0700 (PDT)
Received: from localhost.localdomain (X72Y076X74-2.nice.arm.com [10.34.129.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 D58593F6A8; Thu, 10 Apr 2025 08:31:17 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Dick Olsson <hi@senzilla.io>
Date: Thu, 10 Apr 2025 17:31:14 +0200
Message-ID: <20250410153114.1374261-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] boot/edk2: drop dependency on tf-a for
 macchiatobin
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBidWlsZGluZyBhIGZpcm13YXJlIGZvciB0aGUgTUFDQ0hJQVRPYmluIHdpdGggZWRrMiBh
bmQKYXJtLXRydXN0ZWQtZmlybXdhcmUsIHRoZSBidWlsZCBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcgbWFrZSBlcnJvcjoKCiAgbWFrZVsxXTogQ2lyY3VsYXIgb3V0cHV0L2J1aWxkL2VkazItZWRr
Mi1zdGFibGUyMDI0MTEvLnN0YW1wX2NvbmZpZ3VyZWQgPC0gYXJtLXRydXN0ZWQtZmlybXdhcmUg
ZGVwZW5kZW5jeSBkcm9wcGVkLgoKSW4gZmFjdCwgb25seSBURi1BIGRlcGVuZHMgb24gRURLIElJ
IChwYXNzZWQgYXMgQkwzMykgZm9yIGJ1aWxkaW5nIGFuZApub3QgdmljZSB2ZXJzYS4gWzFdCgpE
cm9wIHRoZSBmYWxzZSBkZXBlbmRlbmN5IG9uIFRGLUEgdG8gZml4IHRoZSBidWlsZC4KClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vU2VtaWhhbGYvZWRrMi1wbGF0Zm9ybXMvd2lraS9CdWlsZF9maXJt
d2FyZQoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgpDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgotLS0KCgpIaSwKCldlIGhhdmUg
bm90aGluZyBpbi10cmVlIHRvIGJ1aWxkIGVkazIgZm9yIHRoZSBNQUNDSElBVE9iaW47IGhlcmUg
aXMgYW4KYWQtaG9jIGRlZmNvbmZpZyBjYW4gYmUgdXNlZCBmb3IgYnVpbGQtdGVzdGluZzoKCiAg
QlIyX2FhcmNoNjQ9eQogIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogIEJSMl9JTklUX05PTkU9
eQogIEJSMl9TWVNURU1fQklOX1NIX05PTkU9eQogICMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBu
b3Qgc2V0CiAgIyBCUjJfUEFDS0FHRV9JRlVQRE9XTl9TQ1JJUFRTIGlzIG5vdCBzZXQKICAjIEJS
Ml9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CiAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRT15CiAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iYTgw
eDBfbWNiaW4iCiAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9FREsyX0FTX0JMMzM9
eQogIEJSMl9UQVJHRVRfQklOQVJJRVNfTUFSVkVMTD15CiAgQlIyX1RBUkdFVF9FREsyPXkKICBC
UjJfVEFSR0VUX0VESzJfUExBVEZPUk1fU09MSURSVU5fQVJNQURBODBYME1DQklOPXkKICBCUjJf
VEFSR0VUX01WX0REUl9NQVJWRUxMPXkKClRoZW4gdG8gYnVpbGQsIHR3byBvcHRpb25zOgoKMS4g
VXNlIHRoZSBpbi1mbGlnaHQgVEYtQSBidWlsZCBmaXguIFs3NzYzNzBdCjIuIEJ1aWxkIG9ubHkg
YGVkazInLgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKWzc3NjM3MF0gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNS1BcHJpbC83NzYzNzAuaHRtbAoK
CiBib290L2VkazIvZWRrMi5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9l
ZGsyL2VkazIubWsKaW5kZXggMzk0MWQwMTg4My4uYmM0MDQ5YjJkZSAxMDA2NDQKLS0tIGEvYm9v
dC9lZGsyL2VkazIubWsKKysrIGIvYm9vdC9lZGsyL2VkazIubWsKQEAgLTExNSw3ICsxMTUsNyBA
QCBlbmRlZgogCiBlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX1NPTElEUlVO
X0FSTUFEQTgwWDBNQ0JJTikseSkKIEVESzJfQVJDSCA9IEFBUkNINjQKLUVESzJfREVQRU5ERU5D
SUVTICs9IGhvc3QtZHRjIGFybS10cnVzdGVkLWZpcm13YXJlIGVkazItbm9uLW9zaQorRURLMl9E
RVBFTkRFTkNJRVMgKz0gaG9zdC1kdGMgZWRrMi1ub24tb3NpCiBFREsyX1BBQ0tBR0VfTkFNRSA9
IFBsYXRmb3JtL1NvbGlkUnVuL0FybWFkYTgweDBNY0JpbgogRURLMl9QTEFURk9STV9OQU1FID0g
QXJtYWRhODB4ME1jQmluCiBFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKS0k
KEVESzJfQVJDSCkKLS0gCjIuNDguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
