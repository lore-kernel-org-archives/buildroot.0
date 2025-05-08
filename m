Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC77C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 06:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6841560E50;
	Thu,  8 May 2025 06:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3MPPZVI8_RT; Thu,  8 May 2025 06:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA3960E90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AA3960E90;
	Thu,  8 May 2025 06:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 569B31A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D6040D19
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMFIorA-L74i for <buildroot@buildroot.org>;
 Thu,  8 May 2025 06:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31CC940401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CC940401
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31CC940401
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:29:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.167.227]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1uXVcf0kRv-00V4T3; Thu, 08
 May 2025 08:29:30 +0200
Message-ID: <38fa4dba-afaf-4d67-87e4-49ccf703d57f@gmx.at>
Date: Thu, 8 May 2025 08:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph.kogut@gmail.com>
References: <20250407103959.2361659-2-raphael.melotte@mind.be>
 <20250501133002.1408454-1-raphael.melotte@mind.be>
Content-Language: en-US
In-Reply-To: <20250501133002.1408454-1-raphael.melotte@mind.be>
X-Provags-ID: V03:K1:gnsw1fme7CIFkTQ8sCTpn0UaFfhtqfycKtodZt8rxjLvBJ6kOvj
 aDI4NNvXiPjOgxucL7F5JcnHal+4UHoZmuFxYJP84EJTeVQb80H2U/Quc3hB2DOcvzwS+ev
 QqQoZ8tDfQvWXchZsqlQg1Mmp6x1LJnuczkSc9BAKS677NbP10uI14La1HiUA9ZmVJoFsqH
 JaM630VCECE9zOjOT1yJQ==
UI-OutboundReport: notjunk:1;M01:P0:Cua29ZVNAdo=;A5ub4apJ3H8tFoHhTm+hMmDA7N9
 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
 X04DONcpk3gHY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1746685770; x=1747290570; i=dalang@gmx.at;
 bh=lXDtWJzfuFiXscSyo+lyOOzIgnNcVVxs+NZ8rrtl97w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jaYRh2hoNMNCNnv7o/Ner+fLmoVAtZMUfkVB5gf/iJA1NYBRUyW8wFN+GpIIyJH3
 hSBaNEroEyamD8uYgOqVcT0DvwqfZ+/APTbr2U3uK1TsnHv4HncnfhOGj3PnBbdXl
 j2dqchTN0H8fQZ5bhbyjfrNJ/HrJd5BonPUlKsAc3ZAqvmLbz5/+L9Mq2mTnVQlsB
 BD8zPaW+yuAJzLs7TZkSIugJyhrheLSwIiR00ItFyCXvisAjaZeaZ94vtorcxyVTg
 n7t5nBKxBZJWqm+R+zm95mjZIx39iKBiJ3ms+xKreqUhJP0gnf0ONewJK71lAlygB
 Rf3muhLzBmjXsa8c9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=jaYRh2ho
Subject: Re: [Buildroot] [PATCH v2 1/3] package/llvm-project: add support
 for clang python bindings
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiA1LzEvMjUgMTU6MjksIFJhcGhhw6tsIE3DqWxvdHRlIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gQWRkIHR3byB1cHN0cmVhbSBwYXRjaGVzIHRoYXQgd2VyZSByZXF1
aXJlZCBmb3IgYnVpbGRpbmcgYW5kIGVuYWJsZQo+IHRoZSBiaW5kaW5ncyBmb3Igb3VyIHB5dGhv
biB2ZXJzaW9uLgo+IAo+IEl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGJlY2F1c2UgdGhlIHB5dGhv
biBiaW5kaW5ncyBoYXZlIHdyb25nIGRlZmF1bHQKPiBpbmNsdWRlIGRpcnMsIHRoZXkgYXJlIHVz
ZWxlc3MgaWYgdGhlIGluY2x1ZGVzIGFyZSBub3QgcHJvdmlkZWQKPiBleHRlcm5hbGx5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5i
ZT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBSZW1vdmUgQlIyX1BBQ0tBR0VfSE9T
VF9DTEFOR19QWVRIT05fQklORElOR1MgKHVzZQo+ICAgICBCUjJfUEFDS0FHRV9IT1NUX1BZVEhP
TjMpLgo+IC0tLQoKVGhhbmtzIGZvciB0aGUgdXBkYXRlZCB2ZXJzaW9uIQoKUmV2aWV3ZWQtYnk6
IERhbmllbCBMYW5nIDxkYWxhbmdAZ214LmF0PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
