Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB1BC41513
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6847F80D8C;
	Mon, 24 Jun 2024 07:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tL9dtaRjPBVU; Mon, 24 Jun 2024 07:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791AF80DB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791AF80DB1;
	Mon, 24 Jun 2024 07:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50D011BF4D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EF9B6085E
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpiFG92y0jwJ for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66E026082B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E026082B
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66E026082B
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 07:44:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11E92DA7;
 Mon, 24 Jun 2024 00:45:03 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.129.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0FA3F766;
 Mon, 24 Jun 2024 00:44:37 -0700 (PDT)
Date: Mon, 24 Jun 2024 09:44:34 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Znkj4szwHVXBhDH2@debian>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20240522144211.464748-1-vincent.stehle@arm.com>
 <e72e7d50-c1a1-41a6-aa10-36bddaaac66b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e72e7d50-c1a1-41a6-aa10-36bddaaac66b@mind.be>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] configs/arm_foundationv8_defconfig: bump to
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTE6MDk6NDRQTSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24gMjIvMDUvMjAyNCAxNjo0MiwgVmluY2VudCBTdGVobMOp
IHdyb3RlOgo+ID4gLSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni44LjEwLgo+ID4gLSBCdW1wIHRo
ZSBGVlAgaW4gdGhlIHJlYWRtZSB0byB2ZXJzaW9uIDExLjI1IGJ1aWxkIDE1Lgo+IAo+ICBDb3Vs
ZCB5b3UgcGxlYXNlIGFsc28gYWRkIGEgaGFzaCBmaWxlIGZvciB0aGUgY3VzdG9tIGtlcm5lbCB2
ZXJzaW9uPyBZb3UKPiBjYW4gdXNlIHV0aWxzL2FkZC1jdXN0b20taGFzaGVzLgoKSGkgQXJub3V0
LAoKVGhhbmtzIGZvciBoYXZpbmcgYSBsb29rIGFuZCBmb3IgdGhlIHRpcHM7IEkgd2lsbCBhZGQg
YSBoYXNoIGFuZCByZS1zZW5kLgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAKPiAgUmVnYXJk
cywKPiAgQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
