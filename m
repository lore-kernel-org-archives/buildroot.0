Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722A9C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 11:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE1D640153;
	Wed, 17 Jul 2024 11:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1N41TGyWQMN; Wed, 17 Jul 2024 11:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA6940177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADA6940177;
	Wed, 17 Jul 2024 11:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEBB1BF3AE
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 11:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B6240153
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 11:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcz9-nESTNd6 for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 11:52:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D827E40E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D827E40E05
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D827E40E05
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 11:52:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([176.5.0.61]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6qM-1s4asO3N1g-00nSon; Wed, 17
 Jul 2024 13:52:17 +0200
Date: Wed, 17 Jul 2024 13:52:13 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZpewbZIQTIENQGmg@probook>
References: <20240704-ztext-v3-1-9195d06c8bd0@gmx.net>
 <50c04b02-5140-4c0c-b06d-e80eca7564af@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50c04b02-5140-4c0c-b06d-e80eca7564af@mind.be>
X-Provags-ID: V03:K1:JoeZAJ30GSf+P86vDPfiDDYKbsAH288K0la97g8k4AP3eKcXien
 0hNNl8I3Gs1bisRh1lVmzJ4o5tDg+1bxoMDqZ7iD1sSAMVI+fNpJ9BBHBKnn8I0xCfJ3voD
 1/fyFMVEB1zRbE5pQLkPcCXzU1epI1aBxnpYstpEaV5Ywcgln7u5H2EYbEiqXck7mJXw0NT
 NmsSHEpfsVTtU/C7l4bXg==
UI-OutboundReport: notjunk:1;M01:P0:zAFPehoF+vk=;r0M0ooFw61jl6pCTaFDTLrtkCcB
 3VVOXk+YDBJInnMHanrIGHlL3I73mIE7gRUD6qHrYJKNNQaYnv1/OG7lgrkTnyPsnnW3DdfAb
 mVfMDS2Ad1IDPZZhLlxZmyyf1Yultz7j5Sw+MQ8sZL6CHCC1+TdcEV8iEIXr1bbjioD9vw//4
 7m544tPYjj8YgxiW5/XlfpgkYh7GzfhmvnPRJLZeMTtdUXShTXzhBBEyUo6YOJbDHpgl0H6kC
 3DtevFHttXfTEJvD/5bXClNhvRn0wxANYs0LcsUycJJvB9A35V5pgga3ob6O9ej2tCPiPm+nz
 YKSgwm5H+kq4aXs9jxzXVoSeQLpiOyBLlcD7l4HK5WJIK9+9JiKsOgAUzd6gYA5u769+M6qdb
 /DNe9QjEyEssmtA1j01+J4FkLAYqkXI69M7TPx4HX9YFSVD/p8xWke65s50qvIxjpFt2g35Ba
 Asmih4KFqnXlV3sDWhTBvZZT6OfIe+7Pt8tda+WUkcpA9PzLjXog/b9RgM+42G5fpWZ2btwHp
 0qi6PU+K8Sp3ES/7tNvtluj51tmRXDIZS70KpUwNWdpfMUnv2r71MNw2RRPQjSimv0uKMFS3j
 RkwxkHoPdzX3y5iQKt6PbUDAHoAUCkJ30v4txgTDiZvF2DBIfPeo1vb2vOSdhiodOl5Tq7TMV
 a2hem1/5SXykCMdGdHufAfjpB4/APXwX92m/pZk0vqTi7j2XOAHNZ/QXytKOMsujHWXiNrNvf
 cbo5YRlyp6ft3kc7kOyrKyKfUVfhOMW9eXF1hdYUOpcDf7rcTyf3F0QHKIozjT+h3/x0d/h7x
 F84OCUkB2tsi2m4dWg0Od1kw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721217137; x=1721821937; i=j.neuschaefer@gmx.net;
 bh=YgOk9aidcTJ8dy4m5phQjz9c1SO7JXgJ4sWVmuYy/P4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NK3xVSt3ZM1xgpqldkhsOqnuFanGBsKEWcvUMrqCKtjw+i7i4BHRXX4ZZT4dA0N6
 5PbDyIp5JxyCEZPE4Boa+FW6OLtiw5uL2rW14gabrC+1yV2K+9aWNC/CK1g1/MfW6
 6DuRJ44ihQuEBgtuqGfaw1lrtw1u5ja2j03kd+Yo93dWTCtpZeob+hYCkwXSfu5A1
 yQAdtB1OBxFRsFbtkKOFUpA/GwpfwTdQQ23WiWT2OGkmFZyz+e83MWJQ0eN+F2DMZ
 C9QWC7YeQiU/2GSlBbuTtlZEEe2cE75/9hk5Ng8Emx3h6R78kfuV3GmnP1jeEl2hw
 a6DrfzJdALFRl8RNQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NK3xVSt3
Subject: Re: [Buildroot] [PATCH v3] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMTUsIDIwMjQgYXQgMTA6NTE6MDNBTSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4gIEhpIEouLAo+Cj4gIFtCVFcgYXJlIHlvdSBPSyB3aXRoIG1lIGNhbGxp
bmcgeW91ICJKLiI/IEl0IGZlZWxzIGEgYml0IHdlaXJkLi4uXQoKSXQncyBvaywgYXMgd2VsbCBh
cyBqbiAoImpheS1lbm4iKS4gd2hpY2ggaXMgYWxzbyBvay4KCj4KPiBPbiAwNC8wNy8yMDI0IDIw
OjA1LCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3RlOgpbLi4uXQo+ID4gK2lmZXEg
KCQoQlIyX0xJTktfQUxMT1dfVEVYVFJFTCksKQo+ID4gK1RBUkdFVF9MREZMQUdTICs9IC16IHRl
eHQKPiA+ICtlbmRpZgo+Cj4gIEFmdGVyIHNvbWUgZGlzY3Vzc2lvbiwgd2UgY29uY2x1ZGVkIHRo
YXQgd2UgZG9uJ3Qgc2VlIHRoZSBwb2ludCBvZiBtYWtpbmcKPiB0aGlzIGEgdXNlci1zZXR0YWJs
ZSBDb25maWcuaW4gb3B0aW9uLiBJdCBzaG91bGQgYmUgY29tcGxldGVseSBpbiB0aGUKPiBNYWtl
ZmlsZS5pbiwgd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkuIFNvIHNvbWV0aGluZyBsaWtl
IHRoaXMKPiAodW50ZXN0ZWQhKToKPgo+ICMgbXVzbCdzIGR5bmFtaWMgbG9hZGVyIGRvZXNuJ3Qg
c3VwcG9ydCBEVF9URVhUUkVMLCB3aGljaCByZXN1bHRzIGluIGEgcnVudGltZQo+ICMgY3Jhc2gg
aWYgaXQgZ2V0cyB1c2VkLiBUaGUgIi16IHRleHQiIGxpbmtlciBvcHRpb24gaXNzdWVzIGEgYnVp
bGQtdGltZSBlcnJvcgo+ICMgd2hlbiBEVF9URVhSRUwgaXMgdXNlZCwgc28gd2UgY2FwdHVyZSB0
aGUgcHJvYmxlbSBlYXJsaWVyLgo+IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpJChC
UjJfU1RBVElDX0xJQlMpLHl5KQo+IFRBUkdFVF9MREZMQUdTICs9IC0jbCwteix0ZXh0Cj4gZW5k
aWYKPgo+ICBOb3RlIGFsc28gdGhhdCB3ZSB1c2UgLVdsLC16LC4uLiBldmVyeXdoZXJlIGVsc2Ug
dG8gcGFzcyB0aGUgLXogb3B0aW9ucyB0bwo+IHRoZSBsaW5rZXIuIE1heWJlIHRoYXQncyBiZWNh
dXNlIG9sZGVyIEdDQyBkb24ndCB1bmRlcnN0YW5kIC16LiBCdXQgYW55d2F5LAo+IHRvIGJlIGNv
bnNpc3RlbnQsIGxldCdzIGRvIHRoZSBzYW1lIGhlcmUuCj4KPiAgQ2FuIHlvdSB0ZXN0IHRoZSBh
Ym92ZSB2ZXJzaW9uIGFuZCByZXN1Ym1pdD8gT2gsIGFuZCBwbGVhc2UgYWxzbyBpbiB0aGUKPiBj
b21taXQgbWVzc2FnZSBnaXZlIGFuIGV4YW1wbGUgb2YgaG93IHlvdSBjYW4gdGVzdCBpdCAoZS5n
LiBieSByZW1vdmluZyB0aGUKPiBtaWNyb3B5dG9uIHBhdGNoIGFuZCBidWlsZGluZyBtaWNyb3B5
dG9uIHVuZGVyIG11c2w/KQoKWWVwLCB3aWxsIGRvIQpUaGFua3MgYWdhaW4gZm9yIHlvdXIgcmV2
aWV3LgoKCmpuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
