Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF86C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 12:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC9E4140D;
	Wed, 29 Jan 2025 12:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwQGlivlviB8; Wed, 29 Jan 2025 12:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A9E41410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A9E41410;
	Wed, 29 Jan 2025 12:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2842AF7
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924CA413E7
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tciOQw5BffO for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 12:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D79A413E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D79A413E5
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D79A413E5
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D31497;
 Wed, 29 Jan 2025 04:54:42 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.111.200])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D99293F694;
 Wed, 29 Jan 2025 04:54:15 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 =?UTF-8?q?=C3=89tienne=20Carri=C3=A8re?= <etienne.carriere@foss.st.com>,
 Julien Olivain <ju.o@free.fr>
Date: Wed, 29 Jan 2025 13:54:07 +0100
Message-ID: <20250129125410.250820-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 0/3] add options to optee-* to use same version
 as optee-os
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

SGksCgpUbyBmb2xsb3cgdXAgd2l0aCB0aGUgb3B0ZWUtb3MgZGlzY3Vzc2lvbiBbMV0sIGhlcmUg
aXMgYSBwYXRjaCBzZXJpZXMKYWRkaW5nIGFuIG9wdGlvbiB0byB0aGUgb3B0ZWUtY2xpZW50LCBv
cHRlZS1leGFtcGxlcyBhbmQgb3B0ZWUtdGVzdApwYWNrYWdlcywgdG8gYWxsb3cgc2VsZWN0aW5n
IHRoZSBzYW1lIHZlcnNpb24gYXMgb3B0ZWUtb3MsIHdoZW4gdGhlCmxhdGVyIHVzZXMgYSBjdXN0
b20gdmVyc2lvbi4KVGhlIGdvYWwgaGVyZSBpcyB0byBhbGxvdyBrZWVwaW5nIGFsbCBvcHRlZS0q
IHBhY2thZ2VzIHZlcnNpb25zIGluIHN5bmMKZWFzaWx5LgoKQmVzdCByZWdhcmRzLApWaW5jZW50
LgoKWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIw
MjUtSmFudWFyeS83NzAyMzQuaHRtbAoKVmluY2VudCBTdGVobMOpICgzKToKICBwYWNrYWdlL29w
dGVlLWNsaWVudDogYWRkIG9wdGlvbiB0byB1c2Ugc2FtZSB2ZXJzaW9uIGFzIG9wdGVlLW9zCiAg
cGFja2FnZS9vcHRlZS1leGFtcGxlczogYWRkIG9wdGlvbiB0byB1c2Ugc2FtZSB2ZXJzaW9uIGFz
IG9wdGVlLW9zCiAgcGFja2FnZS9vcHRlZS10ZXN0OiBhZGQgb3B0aW9uIHRvIHVzZSBzYW1lIHZl
cnNpb24gYXMgb3B0ZWUtb3MKCiBwYWNrYWdlL29wdGVlLWNsaWVudC9Db25maWcuaW4gICB8ICA4
ICsrKysrKysrCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL0NvbmZpZy5pbiB8ICA4ICsrKysrKysr
CiBwYWNrYWdlL29wdGVlLXRlc3QvQ29uZmlnLmluICAgICB8IDExICsrKysrKysrKystCiAzIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjQ1LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
