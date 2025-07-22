Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD5DC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 13:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA996F56B;
	Tue, 22 Jul 2025 13:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zk9bOCQ-jlrH; Tue, 22 Jul 2025 13:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF9C6F546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF9C6F546;
	Tue, 22 Jul 2025 13:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B53F9DA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 13:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A618783AC0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 13:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiYykOz9aSvR for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 13:40:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D526383ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D526383ADE
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id D526383ADE
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 13:40:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C694F152B;
 Tue, 22 Jul 2025 06:40:03 -0700 (PDT)
Received: from localhost.localdomain (MacBookPro.nice.arm.com [10.34.128.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 B7E343F6A8; Tue, 22 Jul 2025 06:40:08 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Jul 2025 15:39:52 +0200
Message-ID: <20250722133954.711112-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 0/2] Testing Xen on 32-bit Arm v7
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

SGksCgpXZSBoYXZlIGFuIGF1dG9tYXRlZCB0ZXN0IHRvZGF5IGZvciBYZW4gb24gQUFyY2g2NCwg
YnV0IG91ciBYZW4gcGFja2FnZQphbHNvIHN1cHBvcnRzIDMyLWJpdCBBcm0gdjcsIHdoaWNoIGlz
IGN1cnJlbnRseSB1bnRlc3RlZC4KCkhlcmUgaXMgYSBjb3VwbGUgb2YgcGF0Y2hlcyB0byBhZGQg
YSB0ZXN0IGZvciBYZW4gb24gMzItYml0IEFybToKLSBUaGUgZmlyc3QgcGF0Y2ggZG9lcyBzb21l
IHByZXBhcmF0aW9uLCB3aXRoIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgotIFRoZSBz
ZWNvbmQgcGF0Y2ggaXMgdGhlIGFjdHVhbCB0ZXN0IGFkZGl0aW9uLgoKVGhlIGV4aXN0aW5nIFRl
c3RYZW4gY2xhc3MgZm9yIDY0LWJpdCBBcm0gaXMga2VwdCAiYXMgaXMiIGZvcgpjb21wYXRpYmls
aXR5LCBidXQgcGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byBsZXQgbWUga25vdyBpZiB5b3UgdGhp
bmsKdGhhdCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmVuYW1lIGl0IGFzIGUuZy4gVGVzdFhlbkFB
cmNoNjQgZm9yIGNsYXJpdHkuCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgpWaW5jZW50IFN0ZWhs
w6kgKDIpOgogIHN1cHBvcnQvdGVzdGluZzogdGVzdF94ZW46IGFkZCBhIGJhc2UgY2xhc3MKICBz
dXBwb3J0L3Rlc3Rpbmc6IHRlc3RfeGVuOiB0ZXN0IG9uIDMyLWJpdCBBcm0gdjcKCiBzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weSAgICAgfCAxMjYgKysrKysrKysrKy0t
LS0KIC4uLi90ZXN0X3hlbi97ID0+IGFhcmNoNjR9L2dlbmltYWdlLmNmZyAgICAgICB8ICAgMAog
Li4uL3Rlc3RfeGVuL3sgPT4gYWFyY2g2NH0vbGludXguY29uZmlnICAgICAgIHwgICAwCiAuLi4v
eyA9PiBhYXJjaDY0fS9vdmVybGF5L2V0Yy94ZW4vZG9tMS5jZmcgICAgfCAgIDAKIC4uLi90ZXN0
X3hlbi97ID0+IGFhcmNoNjR9L3Bvc3QtaW1hZ2Uuc2ggICAgICB8ICAgMAogLi4uL3BhY2thZ2Uv
dGVzdF94ZW4veyA9PiBhYXJjaDY0fS94ZW4uY2ZnICAgIHwgICAwCiAuLi4vdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi9hcm0vYm9vdC5jbWQgICAgICAgfCAgMjMgKysrCiAuLi4vdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi9hcm0vZ2VuaW1hZ2UuY2ZnICAgfCAgMjUgKysrCiAuLi4vdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi9hcm0vbGludXguY29uZmlnICAgfCAxNjMgKysrKysrKysrKysrKysrKysrCiAu
Li4veyA9PiBhcm19L292ZXJsYXkvZXRjL3hlbi9kb20xLmNmZyAgICAgICAgfCAgIDIgKy0KIC4u
Li97ID0+IGNvbW1vbn0vb3ZlcmxheS9ldGMvaW5pdC5kL1M5OWN1c3RvbSB8ICAgMAogLi4uL292
ZXJsYXkvZXRjL3Byb2ZpbGUuZC9zdHR5LXJhdy5zaCAgICAgICAgIHwgICAwCiAuLi4vdGVzdF94
ZW4veyA9PiBjb21tb259L3Bvc3QtYnVpbGQuc2ggICAgICAgfCAgIDAKIDEzIGZpbGVzIGNoYW5n
ZWQsIDMwNSBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi97ID0+IGFhcmNoNjR9L2dlbmltYWdlLmNmZyAo
MTAwJSkKIHJlbmFtZSBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi97ID0+
IGFhcmNoNjR9L2xpbnV4LmNvbmZpZyAoMTAwJSkKIGNvcHkgc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF94ZW4veyA9PiBhYXJjaDY0fS9vdmVybGF5L2V0Yy94ZW4vZG9tMS5jZmcg
KDEwMCUpCiByZW5hbWUgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4veyA9
PiBhYXJjaDY0fS9wb3N0LWltYWdlLnNoICgxMDAlKQogcmVuYW1lIHN1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3sgPT4gYWFyY2g2NH0veGVuLmNmZyAoMTAwJSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9hcm0v
Ym9vdC5jbWQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi9hcm0vZ2VuaW1hZ2UuY2ZnCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4vYXJtL2xpbnV4LmNvbmZpZwogcmVuYW1lIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3sgPT4gYXJtfS9vdmVybGF5L2V0
Yy94ZW4vZG9tMS5jZmcgKDc3JSkKIHJlbmFtZSBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi97ID0+IGNvbW1vbn0vb3ZlcmxheS9ldGMvaW5pdC5kL1M5OWN1c3RvbSAoMTAw
JSkKIHJlbmFtZSBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi97ID0+IGNv
bW1vbn0vb3ZlcmxheS9ldGMvcHJvZmlsZS5kL3N0dHktcmF3LnNoICgxMDAlKQogcmVuYW1lIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3sgPT4gY29tbW9ufS9wb3N0LWJ1
aWxkLnNoICgxMDAlKQoKLS0gCjIuNTAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
