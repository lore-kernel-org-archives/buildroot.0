Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E6CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A06681766;
	Wed,  7 Feb 2024 16:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8bK6mOSGfAi; Wed,  7 Feb 2024 16:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E358176D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E358176D;
	Wed,  7 Feb 2024 16:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC481BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4868841020
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSR4hEBn-8FL for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03B7340A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B7340A73
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03B7340A73
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:34:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BD7F513F8C0;
 Wed,  7 Feb 2024 17:34:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 17:34:52 +0100
Date: Wed, 7 Feb 2024 17:34:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZcOxLFt24ueZzQGo@landeda>
References: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
 <20240206175330.570115-2-dario.binacchi@amarulasolutions.com>
 <ZcNTut8WZPcPbLfl@landeda>
 <CABGWkvpyQwdGYpBaAB5dT0N8vEFBj_+9hnBJtjjoghekWPvJKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvpyQwdGYpBaAB5dT0N8vEFBj_+9hnBJtjjoghekWPvJKA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707323697;
 bh=AGcaHW944XrXneXzqFOQDE/qJbDQRVkEDfix1Z1RkaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vCFMsknlir3s4oMumW25x6T8Ows50d2nLiorvvtgbpqgmc5ugPmjGEcpMXt0MxMkp
 74KICjOdFunDNrQWGyaSYoPkXLptw5X3sTE2vwad3ui/DyxdFguxsHwMxutFIwy94A
 uz3lw8/tzBkbo2lY2XQPZmmqsxjsMyVeeQb0ucAor5HQ415DSiG6HRpdxdmr3gSxAk
 eLG633WfaFNVvE0q3Y2qZnPwCE2iQoZWH2/zfZSXra1Wks/Y+1B2wpOT0W5olVUwIJ
 tE7WNOcu5lpB+ZDOuhTBfcpQPRwu6olBa2z5Opq146RFS2xZK1mLmS3WpiJ+xAcDml
 hzOalYLhL3pUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCFMsknl
Subject: Re: [Buildroot] [PATCH 2/2] package/uuu: bump to version 1.5.165
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDItMDcgMTc6MjggKzAxMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBXZWQsIEZlYiA3LCAyMDI0IGF0IDEwOjU24oCvQU0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gSSB3b25kZXIgaWYgaXQg
cmVhbGx5IG1ha2VzIHNlbnNlIHRvIGtlZXAgdXNpbmcgdGhlIFJFQURNRSBmaWxlIGFzIGEKPiA+
IGxpY2Vuc2UgZmlsZSBpbiBCdWlsZHJvb3QuCj4gSSBhZ3JlZSB3aXRoIHlvdS4gVGhlIGxpY2Vu
c2Ugb2YgdGhlIHBhY2thZ2UgaXMgbG9jYXRlZCBpbiB0aGUgZmlsZSBMSUNFTlNFLgo+IEFkZGl0
aW9uYWxseSwgYnkgcmVtb3ZpbmcgdGhlIGZpbGUgUkVBRE1FLm1kIGZyb20gdGhlIGxpY2Vuc2Ug
ZmlsZXMsIHdlCj4gc2ltcGxpZnkgdGhlIGJ1bXAgdG8gbmV3IHZlcnNpb25zLgo+IFNvLCBpZiB5
b3UgYWdyZWUsIEkgd2lsbCBzdWJtaXQgYSBwYXRjaCBmb3IgdGhlIHJlbW92YWwgb2YgUkVBRE1F
Lm1kIGZyb20KPiB0aGUgbGljZW5zZSBmaWxlcy4KClllcywgcGxlYXNlIGdvIGFoZWFkISBKdXN0
IHN1bWFyaXNlIHRoZSBzaXR1YXRpb24gaW4gdGhlIGNvbW1pdCBsb2cuCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
