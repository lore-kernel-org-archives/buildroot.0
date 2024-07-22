Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6DEC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 09:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 156EE40320;
	Mon, 22 Jul 2024 09:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJmlIwaoYeus; Mon, 22 Jul 2024 09:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D24C74045B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D24C74045B;
	Mon, 22 Jul 2024 09:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8861BF28E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 094BE80FAA
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjA3KfqcPhMK for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 09:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3858680F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3858680F9F
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3858680F9F
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 09:37:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB87FEC;
 Mon, 22 Jul 2024 02:37:39 -0700 (PDT)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.125.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 E96B13F766; Mon, 22 Jul 2024 02:37:13 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 11:37:10 +0200
Message-ID: <20240722093710.1903540-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] configs/qemu_arm_ebbr: linux needs host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGtlcm5lbCBidWlsZCBuZWVkcyBob3N0LW9wZW5zc2w7IGFkZCBpdCB0byB0aGUgY29uZmln
dXJhdGlvbi4KCkluIHByYWN0aWNlIHRoZSBkb2N1bWVudGVkIGJ1aWxkIHJlY2lwZSB3b3JrcyBm
aW5lIGFuZCB0aGUgYnVpbGQgZmFpbHVyZXMKY2FuIG9ubHkgYmUgc2VlbiB3aXRoIGhpZ2hseSBw
YXJhbGxlbCBidWlsZHMgdXNpbmcgcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMuCgpUaGlzIGZpeGVz
IHRoZSBmb2xsb3dpbmcgY29tcGlsYXRpb24gZXJyb3I6CgogIGNlcnRzL2V4dHJhY3QtY2VydC5j
OjIxOjEwOiBmYXRhbCBlcnJvcjogb3BlbnNzbC9iaW8uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQoKRml4ZXM6IDcxMTVhYjM5MTg5YTZjNjYwNzQ1MjY3ZDhiZjBiZjQxY2Y4YjNkYjcKU2ln
bmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgotLS0KIGNvbmZpZ3MvcWVtdV9h
cm1fZWJicl9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcgYi9jb25maWdzL3Fl
bXVfYXJtX2ViYnJfZGVmY29uZmlnCmluZGV4IDdjNDM2NDQ5ZDcuLmJkY2Q0MWJiZGUgMTAwNjQ0
Ci0tLSBhL2NvbmZpZ3MvcWVtdV9hcm1fZWJicl9kZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11
X2FybV9lYmJyX2RlZmNvbmZpZwpAQCAtMTksNiArMTksNyBAQCBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYu
Ni4zMiIKIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQogQlIyX0xJ
TlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL3FlbXUvYXJtLWViYnIvbGlu
dXguZnJhZ21lbnQiCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAKICMg
UGFja2FnZXMKIEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVD15Ci0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
