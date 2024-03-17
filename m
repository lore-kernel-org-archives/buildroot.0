Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D491BC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919CB40017;
	Sun, 17 Mar 2024 21:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60rZJ93v0_sY; Sun, 17 Mar 2024 21:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF4440079
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF4440079;
	Sun, 17 Mar 2024 21:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45C3B1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334C56060B
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9JZEWknjc2d for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2846605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2846605C7
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2846605C7
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:54:22 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lySQrZonbG5xllySQrS4kS; Sun, 17 Mar 2024 22:54:18 +0100
Message-ID: <e8b948a3-300f-4ba5-ad6f-a1250372b454@benettiengineering.com>
Date: Sun, 17 Mar 2024 22:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240317105901.157006-1-giulio.benetti@benettiengineering.com>
 <57d14ffb-b884-45f5-8cd7-92eafa841d81@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <57d14ffb-b884-45f5-8cd7-92eafa841d81@mind.be>
X-CMAE-Envelope: MS4xfG3AAkegS+mkc0Yxjh0ZhxXLqsUg8TjYsGxbqzPcMGJEZosaaN1Xy+P2oL3U5rhFXrVcq3bejCGHy0NhcN5PGd1JgIFHRoh6Lj7WpIF+iTm0AvnLLm00
 J5YROsLW3qvZQ1OkLMvXKY6IJV/QnVUImU9MlPpwXdqIjtjwPSaZeMyt5Ixsa9gC7GM31Pxhk4wQ8DPJNEUiJE7ahztzCQjhUVI9XZMaJMAmDT5RMyoHVz4t
 8X7uTxpXYHps7Jl8Yk+c4SABcqR1HvufHjSLvFesX+Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1710712458; bh=GhdqAszOdvbYXW2/gYt5yl07M9x1BlOI22N0NXzpTCQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DQ44KxTSEgWt20Xo8pyeNm++4zqd7NdlgpKPSAyKju21Qo2jqnqhu5Qc2HiKRNHpV
 cvXvFBjMT45DuIUi5pbd/k8IUJM30O6damIEiiqKmUdm9/8IgkbwrH3JWcAVaquS9m
 tievdNPl1XRDZt2hzMghzL6LsbGAoe5giOSWYk72ZSEAsNXwgoem18AAKdnBYPh302
 /HCj62zKEJI2fn58fZidl9E3cWNjXc4fdV+XtdZwb2OWtCcsOI5ylOFiYo8iZCPb5A
 FEcR7bQj62xI3+kpC89nhEgskD16oU+ts2rsXJhZYXJJZ8fBZSn2xrowhhHRqeYCle
 nKJHHhjgvWEzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DQ44KxTS
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.99
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMDMvMjQgMjI6NDcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgoKWyBTTklQIF0K
Cj4gCj4gIMKgVGhlIGJ1bXAgdG8gMy45OCB3YXNuJ3QgY29tbWl0dGVkIHlldC4gUGxlYXNlIGJh
c2UgeW91ciBwYXRjaGVzIG9uIAo+IG1hc3RlciA6LSkKPiAKPiAgwqBJIGZpeGVkIGl0IHVwIGFu
ZCBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKT29wcywgdGhhbmsgeW91IQoKQmVzdCByZWdh
cmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
