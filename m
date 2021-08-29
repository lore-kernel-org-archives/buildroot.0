Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125BDC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:28:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B1060F42
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93B1060F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=steinkuehler.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57422400BA;
	Sun, 29 Aug 2021 15:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCRM1q4mVNH5; Sun, 29 Aug 2021 15:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6005B40108;
	Sun, 29 Aug 2021 15:28:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7DE1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2BF380E96
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FjYT26Ihbwo for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 15:28:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F16280E91
 for <buildroot@busybox.net>; Sun, 29 Aug 2021 15:28:38 +0000 (UTC)
Received: (qmail 31624 invoked from network); 29 Aug 2021 10:28:37 -0500
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 29 Aug 2021 10:28:37 -0500
To: buildroot@busybox.net
References: <f3bef982-d139-cd08-2477-33383a5d67ca@steinkuehler.net>
From: Charles Steinkuehler <charles@steinkuehler.net>
Message-ID: <3dad3dea-0886-3d4e-7ca9-728b66eb34a7@steinkuehler.net>
Date: Sun, 29 Aug 2021 10:28:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f3bef982-d139-cd08-2477-33383a5d67ca@steinkuehler.net>
Content-Language: en-US
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gOC8yOC8yMDIxIDEwOjAzIFBNLCBDaGFybGVzIFN0ZWlua3VlaGxlciB3cm90ZToKPiAKPiBT
b3JyeSB0byBqdW1wIGluLCBJJ20gbmV3IHRvIEJ1aWxkcm9vdCBhbmQgdGhpcyBsaXN0IGJ1dCBJ
IGFtIGhhdmluZyB0aGUgCj4gc2FtZSBpc3N1ZTogVXNpbmcgYSBSUGk0IHdpdGggdGhlIGxhdGVz
dCBidWlsZHJvb3QgKG1hc3RlciBwdWxsZWQgZnJvbSAKPiBnaXQpIGFuZCBubyAvZGV2L2RyaS8g
ZGV2aWNlcyBzaG93IHVwIGV2ZW4gdGhvdWdoIGNvbmZpZy50eHQgY29udGFpbnM6Cj4gCj4gIMKg
wqAgZHRvdmVybGF5PXZjNC1rbXMtdjNkLXBpNAo+IAo+IC4uLmFuZCB0aGUgb3ZlcmxheSBmaWxl
cyBhcmUgcHJlc2VudCBvbiB0aGUgZmlyc3QgKHZmYXQpIHBhcnRpdGlvbi4KPiAKPiBJIHN0YXJ0
ZWQgd2l0aCB0aGUgcmFzcGJlcnJ5cGk0XzY0X2RlZmNvbmZpZywgc3dpdGNoZWQgdG8gZ2xpYmMs
IGFuZCAKPiBhZGRlZCBhIGZldyBwYWNrYWdlcyAobWVzYSwga21zY3ViZSwgU0RMMikuCj4gCj4g
T24gYSB3aGltIEkgc3dpdGNoZWQgaW5pdCBmcm9tIHRoZSBidXN5Ym94IGRlZmF1bHQgdG8gc3lz
dGVtZCAod2hpY2ggCj4gYWxzbyBwdWxsZWQgaW4gdWRldiksIGFuZCAqUFJFU1RPKiBJIG5vdyBo
YXZlIGEgL2Rldi9kcmkvIGZvbGRlciB3aXRoIAo+IGRldmljZXMgKGFmdGVyIG9uY2UgYWdhaW4g
YWRkaW5nIHRoZSBjb25maWcudHh0IGR0b3Zlcmx5IGxpbmUgZm9yIHRoZSAKPiBrbXMgZHJpdmVy
KSEKPiAKPiBJcyB0aGVyZSBhbnkgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgbWluaW11bSBlbnZp
cm9ubWVudCBuZWVkZWQgdG8gZ2V0IAo+IHRoZSB2YzQta21zIGRyaXZlcnMgcnVubmluZz/CoCBE
byBJIG5lZWQgZnVsbCBzeXN0ZW1kL3VkZXYsIGlzIG1kZXYgCj4gZW5vdWdoLCBvciBzaG91bGQg
ZGV2dG1wZnMgYmUgd29ya2luZyBidXQgcGVyaGFwcyBJJ20gbWlzc2luZyBzb21ldGhpbmcgCj4g
ZWxzZSBpbiB0aGUgcm9vdGZzIGltYWdlP8KgIElzIGluaXQgbWF5YmUgdGhlIHByb2JsZW0gdnMu
IC9kZXYgaGFuZGxpbmc/CgpVcGRhdGUgb24gd2hhdCBkb2VzL2RvZXNuJ3Qgd29yazoKCkJ1c3li
b3ggaW5pdCArIGRldnRtcGZzID0gRkFJTApCdXN5Ym94IGluaXQgKyBkZXZ0bXBmcyArIG1kZXYg
PSBGQUlMCkJ1c3lib3ggaW5pdCArIGRldnRtcGZzICsgZXVkZXYgPSBXT1JLUwpzeXN0ZW1kICsg
dWRldiA9IFdPUktTCgpJIGRvbid0IGtub3cgZW5vdWdoIGFib3V0IG1kZXYgdG8ga25vdyBpZiBp
dCBzaG91bGQgYmUgcG9zc2libGUgdG8gZ2V0IAppdCB3b3JraW5nIHZzLiBldWRldi4gIEkgbWF5
IGxvb2sgaW50byB0aGF0IGluIHRoZSBmdXR1cmUgYnV0IHJpZ2h0IG5vdyAKSSdtIGp1c3QgaGFw
cHkgdG8gaGF2ZSBhIHN5c3RlbSB3b3JraW5nIHRoYXQgZG9lc24ndCBuZWVkIHRvIHB1bGwgaW4g
YWxsIApvZiBzeXN0ZW1kLgoKRm9yIGNsYXJpdHksICJXT1JLUyIgYWJvdmUgbWVhbnMgSSBzaW1w
bHkgYWRkIHRoZSAKImR0b3ZlcmxheT12YzQta21zLXYzZC1waTQiIHRvIGNvbmZpZy50eHQsIGJv
b3QsIGFuZCBydW5uaW5nICJrbXNjdWJlIiAKYXQgdGhlIGNvbW1hbmQgcHJvbXB0IHlpZWxkcyB0
aGUgZXhwZWN0ZWQgc3Bpbm5pbmcgY3ViZS4gIEkgYWxzbyBoYXZlIGEgCnByb3Blcmx5IHBvcHVs
YXRlZCAvZGV2L2RyaSwgYW5kIGttc2N1YmUgcmVwb3J0cyBpdCBpcyB1c2luZyBCcm9hZGNvbSAK
VjNEIDQuMiBmb3IgT3BlbkdMIEVTIHJlbmRlcmluZy4KCi0tIApDaGFybGVzIFN0ZWlua3VlaGxl
cgpjaGFybGVzQHN0ZWlua3VlaGxlci5uZXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJv
eC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
