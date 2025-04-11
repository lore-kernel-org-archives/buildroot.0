Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8881C369A2
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE2760A9D;
	Fri, 11 Apr 2025 17:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eauLAuaqwi1E; Fri, 11 Apr 2025 17:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52496069A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52496069A;
	Fri, 11 Apr 2025 17:29:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D54108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454FB406B2
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfLhny-kCt8g for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D6B740293
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D6B740293
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D6B740293
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA186106F;
 Fri, 11 Apr 2025 10:29:52 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.19.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78CF73F59E;
 Fri, 11 Apr 2025 10:29:52 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 11 Apr 2025 19:29:41 +0200
Message-ID: <20250411172944.1379043-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 0/3] add custom version options for all three
 edk2 packages
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

SGksCgpUaGlzIHBhdGNoIHNlcmllcyBzaG91bGQgZ2l2ZSBmaW5lciBjb250cm9sIHRvIHRoZSBk
ZWZjb25maWdzIG92ZXIgdGhlIGVkazIKdmVyc2lvbiB0byBidWlsZCwgd2hpbGUgcmV0YWluaW5n
IHRoZSBkZWZhdWx0IGJlaGF2aW91ci4KCkJlc3QgcmVnYXJkcywKVmluY2VudC4KCgpWaW5jZW50
IFN0ZWhsw6kgKDMpOgogIGJvb3QvZWRrMjogYWRkIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbgogIHBh
Y2thZ2UvZWRrMi1wbGF0Zm9ybXM6IGFkZCBjdXN0b20gdmVyc2lvbiBvcHRpb24KICBwYWNrYWdl
L2VkazItbm9uLW9zaTogYWRkIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbgoKIGJvb3QvZWRrMi9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKwogYm9vdC9l
ZGsyL2VkazIubWsgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKystCiBwYWNr
YWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4gICAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysr
KysrKysrKystCiBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICAgIHwgMTcg
KysrKysrKysrLS0KIHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvQ29uZmlnLmluICAgICAgICAgfCAz
NSArKysrKysrKysrKysrKysrKysrKysrLQogcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBs
YXRmb3Jtcy5tayB8IDE3ICsrKysrKysrKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
