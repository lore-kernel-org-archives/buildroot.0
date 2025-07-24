Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD959C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 14:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFF1608DF;
	Thu, 24 Jul 2025 14:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfYZlXWgdGXt; Thu, 24 Jul 2025 14:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D2746110A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D2746110A;
	Thu, 24 Jul 2025 14:01:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1482DDA
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 068E1613E2
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcfMsSv0-yCF for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 14:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1197608DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1197608DF
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1197608DF
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 14:01:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD4E51A00;
 Thu, 24 Jul 2025 07:01:22 -0700 (PDT)
Received: from localhost.localdomain (MacBookPro.nice.arm.com [10.34.124.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 900EA3F66E; Thu, 24 Jul 2025 07:01:28 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 24 Jul 2025 16:01:24 +0200
Message-ID: <20250724140124.1276139-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux 6.15
 and model 11.29
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

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni4xNS43IGFuZCB1cGRhdGUgdGhlIGhhc2ggZmlsZS4K
LSBCdW1wIHRoZSBtb2RlbCBpbiB0aGUgcmVhZG1lIHRvIHZlcnNpb24gMTEuMjkgYnVpbGQgMjcu
CgpXaGlsZSBhdCBpdCwgYWRqdXN0IHRoZSBtb2RlbCdzIHBhdGggaW4gdGhlIHJlYWRtZSB0byB0
YWtlIHRoZSBob3N0CmFyY2hpdGVjdHVyZSBpbnRvIGFjY291bnQuCgpTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBNYXNhaGlybyBZYW1h
ZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgotLS0KIGJvYXJkL2FybS9mb3VuZGF0
aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaCB8ICAyICstCiBib2FyZC9hcm0vZm91bmRh
dGlvbi12OC9yZWFkbWUudHh0ICAgICAgICAgICAgICAgfCAxMSArKysrKysrKy0tLQogY29uZmln
cy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyAgICAgICAgICAgICAgIHwgIDQgKystLQogMyBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2Jv
YXJkL2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaAppbmRleCA0N2Ni
YjAxODFhLi5lNThhZmI3YmM3IDEwMDY0NAotLS0gYS9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9w
YXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKKysrIGIvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcGF0
Y2hlcy9saW51eC9saW51eC5oYXNoCkBAIC0xLDIgKzEsMiBAQAogIyBGcm9tIGh0dHBzOi8vY2Ru
Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92Ni54L3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYg
IDVmZjViZDg0ZWEwZTIyYzUzNDM3MzAyZGI1ZDM5NGQwYTkyZDhiOGIxYTg4Y2UyMGQxMDk4Mjk4
ZTlmNzYzMGEgIGxpbnV4LTYuMTIuMTUudGFyLnh6CitzaGEyNTYgIDM1MDdkZDEwNWIwYTBlMTEw
MWJkNDNkMjk0NDcyZmNjZjg1MzQyOWEyNTlhNWZhN2M2NzQ2N2JiYTMxOGY4ZTkgIGxpbnV4LTYu
MTUuNy50YXIueHoKZGlmZiAtLWdpdCBhL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50
eHQgYi9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0CmluZGV4IGM2NDA0OTEyMTUu
LmMyODFmYWY5ZDYgMTAwNjQ0Ci0tLSBhL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50
eHQKKysrIGIvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dApAQCAtMjIsMTIgKzIy
LDE3IEBAIFJ1bm5pbmcgb24gdGhlIHNpbXVsYXRvcgogRG93bmxvYWQgdGhlIEFBcmNoNjQgc29m
dHdhcmUgc2ltdWxhdG9yIGZyb20gb25lIG9mIHRoZSBmb2xsb3dpbmcgc291cmNlcywKIGNvcnJl
c3BvbmRpbmcgdG8geW91ciBob3N0IGNvbXB1dGVyOgogCi0tIGh0dHBzOi8vZGV2ZWxvcGVyLmFy
bS5jb20vLS9jZG4tZG93bmxvYWRzL3Blcm1hbGluay9GVlBzLUFyY2hpdGVjdHVyZS9GTS0xMS4y
Ny9Gb3VuZGF0aW9uX1BsYXRmb3JtXzExLjI3XzE5X0xpbnV4NjQudGd6Ci0tIGh0dHBzOi8vZGV2
ZWxvcGVyLmFybS5jb20vLS9jZG4tZG93bmxvYWRzL3Blcm1hbGluay9GVlBzLUFyY2hpdGVjdHVy
ZS9GTS0xMS4yNy9Gb3VuZGF0aW9uX1BsYXRmb3JtXzExLjI3XzE5X0xpbnV4NjRfYXJtdjhsLnRn
egorLSBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vY2RuLWRvd25sb2Fkcy9wZXJtYWxpbmsv
RlZQcy1BcmNoaXRlY3R1cmUvRk0tMTEuMjkvRm91bmRhdGlvbl9QbGF0Zm9ybV8xMS4yOV8yN19M
aW51eDY0LnRnegorLSBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vY2RuLWRvd25sb2Fkcy9w
ZXJtYWxpbmsvRlZQcy1BcmNoaXRlY3R1cmUvRk0tMTEuMjkvRm91bmRhdGlvbl9QbGF0Zm9ybV8x
MS4yOV8yN19MaW51eDY0X2FybXY4bC50Z3oKKworVGhlIG1vZGVsIHdpbGwgYmUgbG9jYXRlZCB1
bmRlciBvbmUgb2YgdGhlIGNvcnJlc3BvbmRpbmcgZm9sZGVyczoKKworLSBGb3VuZGF0aW9uX1Bs
YXRmb3JtcGtnL21vZGVscy9MaW51eDY0X0dDQy05LjMKKy0gRm91bmRhdGlvbl9QbGF0Zm9ybXBr
Zy9tb2RlbHMvTGludXg2NF9hcm12OGxfR0NDLTkuMwogCiBGaW5hbGx5LCBib290IHlvdXIgc3lz
dGVtIHdpdGg6CiAKLSAke0xPQ0FUSU9OX09GX0ZPVU5EQVRJT05WOF9TSU1VTEFUT1J9L21vZGVs
cy9MaW51eDY0X0dDQy05LjMvRm91bmRhdGlvbl9QbGF0Zm9ybSBcCisgRm91bmRhdGlvbl9QbGF0
Zm9ybSBcCiAgICAgLS1hcm0tdjguMCBcCiAgICAgLS1pbWFnZSBvdXRwdXQvaW1hZ2VzL2xpbnV4
LXN5c3RlbS5heGYgXAogICAgIC0tYmxvY2stZGV2aWNlIG91dHB1dC9pbWFnZXMvcm9vdGZzLmV4
dDIgXApkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKaW5kZXggOTM2MTNmNWEzNC4uOTIxZmJm
NjJjNSAxMDA2NDQKLS0tIGEvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZworKysg
Yi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCkBAIC0xLDExICsxLDExIEBACiBC
UjJfYWFyY2g2ND15Ci1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTI9
eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE1PXkKIEJSMl9HTE9C
QUxfUEFUQ0hfRElSPSJib2FyZC9hcm0vZm91bmRhdGlvbi12OC9wYXRjaGVzIgogQlIyX0RPV05M
T0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0i
dHR5QU1BMCIKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjE1Igor
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNS43IgogQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0RUU19T
VVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91bmRhdGlv
bi12OC1naWN2My1wc2NpIgotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
