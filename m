Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7C6CCFA05
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 981DE41497;
	Fri,  7 Nov 2025 17:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxGVODVFs_EX; Fri,  7 Nov 2025 17:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792A640858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 792A640858;
	Fri,  7 Nov 2025 17:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E2593E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24F6640782
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoU6BXlhqGTW for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 17:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E6EF40858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6EF40858
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6EF40858
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:26:31 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id HQEEvf8CgP2aDHQEFvLjks; Fri, 07 Nov 2025 18:26:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 7 Nov 2025 18:26:26 +0100
Message-Id: <85B04EF3-5C0C-4948-B183-50AE134CD191@benettiengineering.com>
References: <d77e0f618c15fb0b25ddc422e6bb4f7c@free.fr>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <d77e0f618c15fb0b25ddc422e6bb4f7c@free.fr>
To: Julien Olivain <ju.o@free.fr>
X-Mailer: iPhone Mail (23B85)
X-CMAE-Envelope: MS4xfHAkLZiB/vl0mheULBavNcSWPuZY3vuPvA6SJIHprzg1oTNW5QEPHi+uSsyFdtwrrEX8KnjyhamjiPUuuj2iEnDz8dPZhJXzCVPARZ5rIEm4Doqyjmoy
 Hs0qJbzgblcTC6H2NolvTHpFZ33Gxc5X1/T/S0KPbNSDTtbA4tWQrnHEsWqpv1sx8d6JMh1hVQxD6gxCen50PA861+81B3SjdZcXEgnqpt2jtxraSPWcRPy8
 AvAglXSYTnvMbDt460E5zKqbk9BfiI5/5w7xyIMFGqtAmqjUdXtzF5UYjW7AzX+V
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1762536389; bh=vtQn7Onew+MncKkbOw1uYk8zo5XICGkRa2jEBfiQNQ0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=jcsEVepT5LLRFqJrb8z2gAEkmr6r3/mejype3LrJLK8RyZVdl61uo06QUO4839s3Q
 pobBDTU3fy9vyAG0VKYwbYXce2xHf3BzAmfNyTffZP/09hinoRhWLqrjk2s4lA0FSD
 wVrYZ6m+yOtMJ1a3Y+2eZk9xSUUW1SnhDfZ04SNCwDQLhXxP9nA90e4xPcAKfnUUGP
 9EVj3y4Xg8Rt0o5WDMSy2DrS2jDODEiE+P1VSJRlOVvYoELvy8EkYF4OSP96NJz2yE
 M/jSNqXTEHbTdSwc8S1lmi5x27QO9nmzmxchl4deH+yvPvKdxDCbaQgteZ5K62rUS+
 qtdZovnHjRDZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jcsEVepT
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.0
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

Cj4gSWwgZ2lvcm5vIDcgbm92IDIwMjUsIGFsbGUgb3JlIDE4OjExLCBKdWxpZW4gT2xpdmFpbiA8
anUub0BmcmVlLmZyPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hpIEdpdWxpbywKPiAKPj4gT24gMDYv
MTEvMjAyNSAyMzoxNiwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IFJlbGVhc2Ugbm90ZXM6Cj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9zdG9yYWdlZC1wcm9qZWN0L3VkaXNrcy9yZWxlYXNlcy90YWcv
dWRpc2tzLTIuMTEuMAo+IAo+IFRoaXMgY29tbWl0IHRpdGxlIGlzIG1hcmtlZCBhcyAic2VjdXJp
dHkgYnVtcCIuIEkgZG9uJ3Qgc2VlIGFueSByZWZlcmVuY2UgYWJvdXQKPiBzZWN1cml0eSBmaXhl
cyBpbiB0aGlzIHJlbGVhc2Ugbm90ZXMuIENvdWxkIHlvdSBwcm92aWRlIGEgcmVmZXJlbmNlIHBs
ZWFzZT8KPiAob3IgY29uZmlybSBpdCBpcyBhIGNvcHktcGFzdGUgZXJyb3IgZnJvbSB0aGUgbGFz
dCBjb21taXQpLgoKUGFyZG9uLCBpdOKAmXMgZXhhY3RseSBhIGNvcHktcGFzdGUgZXJyb3IgZnJv
bSB0aGUgbGFzdCBjb21taXQuIFRoaXMgaXMgbm90IGEgc2VjdXJpdHkgYnVtcC4KRG8geW91IG1p
bmQgcmV3b3JkaW5nIHdoaWxlIGFwcGx5aW5nPwpPdGhlcndpc2UgSSBjYW4gc2VuZCBhIHYyIHdp
dGggbm8gcHJvYmxlbXMuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+PiBMZXQncyBhbHNvIGFk
ZCBzdXBwb3J0IGZvciBBVEEgU01BUlQgYWNjb3JkaW5nIHRvIGxpYmJsb2NrZGV2IHBhY2thZ2Uu
Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
