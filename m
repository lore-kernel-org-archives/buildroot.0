Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5F1C87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 22:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA9A82366;
	Fri, 25 Jul 2025 22:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qEUCflo89qq; Fri, 25 Jul 2025 22:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C82983E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C82983E11;
	Fri, 25 Jul 2025 22:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2BD1D9
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3293240980
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5_zFNgv4B9Z for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 22:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 535B9408B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535B9408B5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 535B9408B5
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:36:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 06B735FF88;
 Sat, 26 Jul 2025 00:36:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Sat, 26 Jul 2025 00:36:13 +0200
Message-ID: <20250725223613.1401870-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753482989;
 bh=Ugn51Z9wyyq8XBx/F/Tb4OtF59rzFCbpgJTGvYftRu8=;
 h=From:To:Cc:Subject:Date:From;
 b=COT0hITpJEuA8XT2v/9rXPVdcaDg+Q3opsyFRBLGkKs9ZNXG3vxlx3lRMyMUBB6iQ
 7eeHnj5IfmU+yDGVvha1OdtpnhqACCGM77+VekvPoZ8KJ2KYrRRQK/ssnjWqKF67+l
 0GaLACdjQq+f9TuDhBI2stJfwIVkOqztrefbT+He83UrB9xM3AJgYOgue089nXghPm
 8S/13+u3J2LPAFY1Osw0A18zsXBuXkZmUC41HAsWiLsinp2hEp4GjkyZpcuc9Xozj7
 ob5Whrf2rgEX613xrhNN0KRWii5AHtKwN+z6vEy/48iqurwh4qNMBefbbYeuDnwVCM
 kvVazUdZOGTTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=COT0hITp
Subject: [Buildroot] [PATCH 1/1] support/testing: test_xen: rename TestXen
 to TestXenAarch64
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IFsxXSBpbnRyb2R1Y2VkIGFuIEFybXY3IHRlc3QgY2FzZSBmb3IgWGVuIG5hbWVkIFRl
c3RYZW5Bcm12NywKbmV4dCB0byB0aGUgb3JpZ2luYWwgQWFyY2g2NCB0ZXN0IGNhc2Ugd2hpY2gg
d2FzIHNpbXBseSBuYW1lZCBUZXN0WGVuLgoKVGhlIHRlc3QgbGlzdCBzaG93cywgZm9yIGV4YW1w
bGUgd2l0aCB0aGUgY29tbWFuZAoic3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtbCI6CgogICAg
dGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuCiAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVu
LlRlc3RYZW5Bcm12NwoKSW4gb3JkZXIgdG8gbWFrZSB0aGlzIHRlc3QgbGlzdCBhIGJpdCBtb3Jl
IGV4cGxpY2l0LCB0aGlzIGNvbW1pdApyZW5hbWVzIHRoZSBUZXN0WGVuIHRvIFRlc3RYZW5BYXJj
aDY0LiBXaXRoIHRoYXQgY2hhbmdlLCB0aGUgbGlzdApiZWNvbWVzOgoKICAgIHRlc3RzLnBhY2th
Z2UudGVzdF94ZW4uVGVzdFhlbkFhcmNoNjQKICAgIHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVz
dFhlbkFybXY3CgpbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0LzUzNDY4MjRhODM0ODhmODQwMDA4ZWIyNGY4NDg2NjQzNWFjMzJhMTIKCkNjOiBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF94ZW4ucHkgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3hlbi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5
CmluZGV4IDQyNzhiOTU2M2UuLjg4MTMyN2I5YjkgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfeGVuLnB5CkBAIC04OSw3ICs4OSw3IEBAIGNsYXNzIFRlc3RYZW5CYXNlKGlu
ZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAgICAgIHNlbGYuYXNzZXJ0TnVtVk0oMikKIAogCi1j
bGFzcyBUZXN0WGVuKFRlc3RYZW5CYXNlKToKK2NsYXNzIFRlc3RYZW5BYXJjaDY0KFRlc3RYZW5C
YXNlKToKICAgICAjIFRlc3QgWGVuIG9uIDY0YiBBcm0uCiAgICAgIyBCb290IGZsb3c6IFFlbXUg
RGV2aWNldHJlZSAtPiBVLUJvb3QgLT4gWGVuIFVFRkkgLT4gTGludXgKICAgICAjIFdlIG5lZWQg
dG8gYm9vdCBYZW4gaW4gVUVGSSB0byByZWFkIHhlbi5jZmcuCi0tIAoyLjUwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
