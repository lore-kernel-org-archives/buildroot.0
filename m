Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904F3CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA6241847;
	Wed,  3 Sep 2025 16:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAzw3FE4hKJm; Wed,  3 Sep 2025 16:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0564418B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0564418B2;
	Wed,  3 Sep 2025 16:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8166E2BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E04F83D68
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnLPB7dyp_oy for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A551084142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A551084142
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A551084142
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:21:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1121711044; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:21:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqEq-0010QX-2S;
 Wed, 03 Sep 2025 18:21:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  =?utf-8?B?SsOpcsO0?=
 =?utf-8?B?bWU=?= Pouiller <jezz@sysmic.org>
References: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com>
Date: Wed, 03 Sep 2025 18:21:36 +0200
In-Reply-To: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 15:13:01
 +0200")
Message-ID: <874itjmrqn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ACGMXcX8ql3XFvQ0aBq9wYQddkJ6BfSZ68dcOryaQs0b3J6rTm5YLCyHvWm/MocrkrA4QcwF8prFbj9kuOtR/kGiv9QGaW7so6anULaea3NfKpON/gaU3BbTm0+I3xSlHZYalfSxDINVXw8UGh0Btf3Ueq3imVKwjpgj51NdAg9mnQ5PF+VtCWK4DqIFtNeh4GeId24hLD4h/K1aLn4zfeBWi4nTx7umEZjTH/9jtWs3QFe440yYhfS2R7i/inoc4YArhKA3msCQggLBfhUsAeZpPVfH58i0X5IHm09zsOl0dWxSLfBfj1Q69T28lEGfYu4KihX1wzQltuBRMx8UPQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=9qo2ibvUme4Y1Q9DFDuNbbkA/J9e1lrGxzwayzMCJiw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ACGMXcX8
Subject: Re: [Buildroot] [PATCH 1/2] package/apitrace: fix build with GCC
 15.x
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRml4ZXM6CiA+ICAgL2hvbWUvdGhvbWFzL2J1
aWxkcm9vdC9idWlsZHJvb3Qvb3V0cHV0cy9hbGwvYnVpbGQvYXBpdHJhY2UtMTAuMC9yZXRyYWNl
L21ldHJpY193cml0ZXIuY3BwOjUwOjcwOiBlcnJvcjog4oCYdWludDY0X3TigJkgZG9lcyBub3Qg
bmFtZSBhIHR5cGUKID4gICAgNTAgfCAgICAgICAgIGNhc2UgQ05UX05VTV9VSU5UNjQ6IHN0ZDo6
Y291dCA8PCAiXHQiIDw8ICoocmVpbnRlcnByZXRfY2FzdDx1aW50NjRfdCo+KGRhdGEpKTsgYnJl
YWs7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KCiA+IEZpeGVzOgoKID4gICBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82ZTQvNmU0ZTg0MWI0ZjBiZTI5OTU2
ZmRmYWQ0M2E0MDZkMmRhYjMwMDNmMy9idWlsZC1lbmQubG9nCgogPiBQYXRjaCBpcyBiYWNrcG9y
dGVkIGZyb20gdXBzdHJlYW0uCgogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
