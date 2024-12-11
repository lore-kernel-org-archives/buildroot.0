Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD7EE77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 12:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3144160A7B;
	Wed, 11 Dec 2024 12:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aamk75SFPxxe; Wed, 11 Dec 2024 12:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4887660BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4887660BC5;
	Wed, 11 Dec 2024 12:46:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD2F6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A6C260BD0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWyCbu9inrqY for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 12:46:52 +0000 (UTC)
X-Greylist: delayed 397 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Dec 2024 12:46:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30ACC60BD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ACC60BD2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30ACC60BD2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:46:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F933169E;
 Wed, 11 Dec 2024 04:40:41 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.2.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3F1B3F5A1;
 Wed, 11 Dec 2024 04:40:12 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 13:40:08 +0100
Message-ID: <20241211124009.2234768-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] configs/aarch64_efi: bump Linux to 6.11.11
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBMaW51eCBrZXJuZWwgdmVyc2lvbiB0byA2LjExLjExIGFuZCB1cGRhdGUgdGhlIGhhc2gg
YWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Ci0tLQoKSGksCgpU
aGlzIGhhcyBiZWVuIHRlc3RlZCBvbiB0aGUgZm9sbG93aW5nIHN5c3RlbXM6CgogICAgICAgICAg
IFFlbXUgRUJCUiAgRGV2aWNldHJlZQogICAgICAgICAgIFFlbXUgU0JTQSAgQUNQSQogICAgICAg
ICAgIFJELU4yIEZWUCAgQUNQSQogICAgIGkuTVg4TSBQbHVzIEVWSyAgRGV2aWNldHJlZQogICBD
b3JzdG9uZS0xMDAwIEZWUCAgRGV2aWNldHJlZQogIEZWUCBCYXNlIFJldkMgRUJCUiAgRGV2aWNl
dHJlZQoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKIGJvYXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMv
bGludXgvbGludXguaGFzaCB8IDIgKy0KIGNvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnICAg
ICAgICAgICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoIGIvYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNo
CmluZGV4IDIwOTQxYTI2OWIuLjUwOTgzZWI0MmIgMTAwNjQ0Ci0tLSBhL2JvYXJkL2FhcmNoNjQt
ZWZpL3BhdGNoZXMvbGludXgvbGludXguaGFzaAorKysgYi9ib2FyZC9hYXJjaDY0LWVmaS9wYXRj
aGVzL2xpbnV4L2xpbnV4Lmhhc2gKQEAgLTEsMiArMSwyIEBACiAjIEZyb20gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y2Lngvc2hhMjU2c3Vtcy5hc2MKLXNoYTI1NiAg
NTI0ODU4ODUyZjU4NjlhOWVmMTdkZThiMWU2ZTdmYWYwNWJjYjJjNDYyYmM5NmIzYzI0ZGJmODJl
ZGUzNzNjZiAgbGludXgtNi4xMC4xMi50YXIueHoKK3NoYTI1NiAgNjIxNDhlN2UxN2Y1NGM0YTVh
YjVlNzVhZDQ4ODI2ODJjNTRiZWU4MTg5NDhiZTYxYTU5NjMyMzRmYzA4NDlmYyAgbGludXgtNi4x
MS4xMS50YXIueHoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnIGIv
Y29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKaW5kZXggOWYyODRmZjc0Yi4uM2FhNjQ5Y2Y5
YyAxMDA2NDQKLS0tIGEvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKKysrIGIvY29uZmln
cy9hYXJjaDY0X2VmaV9kZWZjb25maWcKQEAgLTEsNSArMSw1IEBACiBCUjJfYWFyY2g2ND15Ci1C
UjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTA9eQorQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzExPXkKIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJi
b2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzIgogQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hF
Uz15CiBCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKQEAgLTcsNyAr
Nyw3IEBAIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL2FhcmNoNjQtZWZpL3Bv
c3QtaW1hZ2Uuc2ggc3VwcG9ydC9zY3JpcHRzL2dlCiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FS
R1M9Ii1jIGJvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmciCiBCUjJfTElOVVhfS0VS
TkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMC4xMiIKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjYuMTEuMTEiCiBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFV
TFRfQ09ORklHPXkKIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKIEJSMl9M
SU5VWF9LRVJORUxfTkVFRFNfSE9TVF9QWVRIT04zPXkKLS0gCjIuNDUuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
