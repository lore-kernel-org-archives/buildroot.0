Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA47BC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 632F540608;
	Mon, 15 Jul 2024 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6PpXW4w7WIA; Mon, 15 Jul 2024 14:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4731A40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4731A40650;
	Mon, 15 Jul 2024 14:18:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E206E1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5F04064E
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHx72wFkulLZ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAA8340608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA8340608
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA8340608
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:18:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73A8FDA7;
 Mon, 15 Jul 2024 07:18:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.10.123])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 970E53F766;
 Mon, 15 Jul 2024 07:18:03 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:17:56 +0200
Message-ID: <20240715141756.522303-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] Makefile: fix make help
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG1pc3NpbmcgJyB0byBmaXggYG1ha2UgaGVscCcuCgpUaGlzIGZpeGVzIHRoZSBmb2xsb3dp
bmcgZXJyb3I6CgogIC9iaW4vYmFzaDogLWM6IGxpbmUgMTogdW5leHBlY3RlZCBFT0Ygd2hpbGUg
bG9va2luZyBmb3IgbWF0Y2hpbmcgYCcnCiAgbWFrZTogKioqIFtNYWtlZmlsZToxMTgwOiBoZWxw
XSBFcnJvciAyCgpGaXhlczogY2E2Yzg5NmJkZDc1Y2YzMzRhYzlhMDJhNmRkNzg2NDE1MjIxZjU1
ZQpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
CkNjOiBTdGV2ZSBIYXkgPG1lQHN0ZXZlbmhheS5jb20+Ci0tLQogTWFrZWZpbGUgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGZhYWYwZjE2NWMuLjA0MzJhMDE0YWIgMTAwNjQ0
Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMTc3LDcgKzExNzcsNyBAQCBoZWxw
OgogCUBlY2hvICcgIDxwa2c+LWdyYXBoLXJkZXBlbmRzICAgLSBHZW5lcmF0ZSBhIGdyYXBoIG9m
IDxwa2c+J1wnJ3MgcmV2ZXJzZSBkZXBlbmRlbmNpZXMnCiAJQGVjaG8gJyAgPHBrZz4tZ3JhcGgt
Ym90aC1kZXBlbmRzJwogCUBlY2hvICcgICAgICAgICAgICAgICAgICAgICAgICAgLSBHZW5lcmF0
ZSBhIGdyYXBoIG9mIGJvdGggPHBrZz4nXCcncyBmb3J3YXJkIGFuZCcKLQlAZWNobyAnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV2ZXJzZSBkZXBlbmRlbmNpZXMuCisJQGVjaG8gJyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldmVyc2UgZGVwZW5kZW5jaWVzLicKIAlAZWNobyAnICA8
cGtnPi1kaXJjbGVhbiAgICAgICAgIC0gUmVtb3ZlIDxwa2c+IGJ1aWxkIGRpcmVjdG9yeScKIAlA
ZWNobyAnICA8cGtnPi1yZWNvbmZpZ3VyZSAgICAgIC0gUmVzdGFydCB0aGUgYnVpbGQgZnJvbSB0
aGUgY29uZmlndXJlIHN0ZXAnCiAJQGVjaG8gJyAgPHBrZz4tcmVidWlsZCAgICAgICAgICAtIFJl
c3RhcnQgdGhlIGJ1aWxkIGZyb20gdGhlIGJ1aWxkIHN0ZXAnCi0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
