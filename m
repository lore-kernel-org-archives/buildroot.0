Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8040C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 14:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54AB1404E9;
	Wed, 22 May 2024 14:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDpbOXm44s7G; Wed, 22 May 2024 14:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 510174050C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 510174050C;
	Wed, 22 May 2024 14:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 929261C5C5F
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C9684050C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 14:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKpEaNuOmcEm for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 14:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65AA6404E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65AA6404E9
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65AA6404E9
 for <buildroot@buildroot.org>; Wed, 22 May 2024 14:42:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F25339;
 Wed, 22 May 2024 07:42:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.4.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F58C3F766;
 Wed, 22 May 2024 07:42:15 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 16:42:11 +0200
Message-ID: <20240522144211.464748-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] configs/arm_foundationv8_defconfig: bump to
 Linux 6.8.10
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni44LjEwLgotIEJ1bXAgdGhlIEZWUCBpbiB0aGUgcmVh
ZG1lIHRvIHZlcnNpb24gMTEuMjUgYnVpbGQgMTUuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFk
YS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgotLS0KIGJvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3Jl
YWRtZS50eHQgfCAyICstCiBjb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnIHwgNiAr
KystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQgYi9ib2FyZC9h
cm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0CmluZGV4IGNiMGZlMDhiODcuLjcwMWNmM2NlYjAg
MTAwNjQ0Ci0tLSBhL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQKKysrIGIvYm9h
cmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dApAQCAtMyw3ICszLDcgQEAgQVJNIHNvZnR3
YXJlIHNpbXVsYXRvciBvZiB0aGUgQUFyY2g2NCBhcmNoaXRlY3R1cmUuCiAKIEZpcnN0LCBvbmUg
aGFzIHRvIGRvd25sb2FkIHRoZSBBQXJjaDY0IHNvZnR3YXJlIHNpbXVsYXRvciBmcm9tOgogCi0g
IGh0dHBzOi8vYXJta2VpbC5ibG9iLmNvcmUud2luZG93cy5uZXQvZGV2ZWxvcGVyL0ZpbGVzL2Rv
d25sb2Fkcy9lY29zeXN0ZW0tbW9kZWxzL0ZvdW5kYXRpb25fUGxhdGZvcm1fMTEuMjBfMTVfTGlu
dXg2NC50Z3oKKyAgaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS8tL21lZGlhL0ZpbGVzL2Rvd25s
b2Fkcy9lY29zeXN0ZW0tbW9kZWxzL0ZNXzExXzI1L0ZvdW5kYXRpb25fUGxhdGZvcm1fMTEuMjVf
MTVfTGludXg2NC50Z3oKIAogVGhlbiwgdXNlIHRoZSBhcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZp
ZyBjb25maWd1cmF0aW9uIHRvIGJ1aWxkIHlvdXIKIEJ1aWxkcm9vdCBzeXN0ZW0uCmRpZmYgLS1n
aXQgYS9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnIGIvY29uZmlncy9hcm1fZm91
bmRhdGlvbnY4X2RlZmNvbmZpZwppbmRleCAxMDJmZThmZDA5Li5kNTM5ZDBiNzMxIDEwMDY0NAot
LS0gYS9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYXJt
X2ZvdW5kYXRpb252OF9kZWZjb25maWcKQEAgLTEsMTAgKzEsMTAgQEAKIEJSMl9hYXJjaDY0PXkK
LSMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEgc2VyaWVzCi1CUjJfUEFDS0FH
RV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CisjIExpbnV4IGhlYWRlcnMgc2FtZSBh
cyBrZXJuZWwsIGEgNi44IHNlcmllcworQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NV
U1RPTV82Xzg9eQogQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eUFNQTAiCiBCUjJf
TElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjEzIgorQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi44LjEwIgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJD
SF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKIEJSMl9M
SU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91bmRhdGlvbi12OC1naWN2My1wc2Np
IgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
