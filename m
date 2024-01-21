Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DB2C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 11:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8E9409AA;
	Sun, 21 Jan 2024 11:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8E9409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA2NSjC8wXIF; Sun, 21 Jan 2024 11:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EAF3404F8;
	Sun, 21 Jan 2024 11:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EAF3404F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B65D1BF352
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 11:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E55C840515
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 11:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55C840515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZeFx0Uc_P5S for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 11:22:51 +0000 (UTC)
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA2F94045C
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 11:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA2F94045C
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id RVuZrs48oiR5JRVuZrBGgK; Sun, 21 Jan 2024 12:22:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 21 Jan 2024 12:22:46 +0100
Message-Id: <7E2BA7C4-0A2C-40FF-AF48-25BD637CFB7A@benettiengineering.com>
References: <PH0PR19MB540925F1A9987E1D7F58BB0DD0762@PH0PR19MB5409.namprd19.prod.outlook.com>
In-Reply-To: <PH0PR19MB540925F1A9987E1D7F58BB0DD0762@PH0PR19MB5409.namprd19.prod.outlook.com>
To: franco ariel <fran.millocs@live.com.ar>
X-Mailer: iPhone Mail (21C66)
X-CMAE-Envelope: MS4xfDBWIEp4yriAiOaRtXF+aC+oXY07oqgCvh6AUrWGtlsO6mIutJtQxhQQwB4P7vqn0IJ7ufOKeYR++Ks3tgVfKPQCErp+bmrYQfAegeV83K8ckP4S51SZ
 kC722znbA872y2HJwVyf1VtvPIwSKj3zMBMzmy6sPUM7Nj96brzVQNRgTEdhODLC9RyQAF9UljPLWBOZ47Y7cRh7iAysSMZmoSRtaXhnEPFwJ9syjVfyyIm0
 9U6XDmdQ4xQSuEfXr37uuA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705836167; bh=e7hGSEzRn2AJiW+qh6SMP67JI8cuk1vGSJPxBacij1c=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=S6MZJfvmyViT/83Pk4HBJ3E9gsmz62w6WaboJywdZzSIjdwRZ6Q45IixxjqVrYwG7
 Sjnv4Pc026Uj/w1tE93KCP7EB0RUzzyh+633Us4faOvkeRR3J1TcuuRZTleABhvZZr
 Xr4/bZpbw9h5uruBjYGQ0AgPtV+/R+kWuhWUrwDe2yN3AxlfafMzMzcBfwTcu0sf3O
 QFh29EB6C9rMgvydK6Ppn+mH6/+UNcMLXpQr71lopPdAA/AQqM8AX1ziMBxl/CWXW8
 Xb27U8ovNqKaU6gZkidU+Zsrg8X9KTDII0hEOKMO5WfFRURnq2J1Hro5nbSByusYAj
 qKI5mQHypDjEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S6MZJfvm
Subject: Re: [Buildroot] [Help] Run Chocolate-doom
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhbmNvLAoKPiBJbCBnaW9ybm8gMjEgZ2VuIDIwMjQsIGFsbGUgb3JlIDA3OjQ4LCBmcmFu
Y28gYXJpZWwgPGZyYW4ubWlsbG9jc0BsaXZlLmNvbS5hcj4gaGEgc2NyaXR0bzoKPiAKPiDvu78K
PiBIZWxsbywKPiBJJ20gdHJ5aW5nIHRvIHRha2UgbXkgZmlyc3Qgc3RlcHMgb24gYnVpbGRyb290
IHVzaW5nIG15IFJhc3BiZXJyeSBwaSA0IGFuZCBJJ20ganVzdCB0cnlpbmcgdG8gZmlndXJlIG91
dCBob3cgdG8gcnVuIHRoZSBDaG9jb2xhdGUtRG9vbSwgSSBhbHJlYWR5IGluc3RhbGxlZCBhbmQg
d2hlbiBJIHRyeSB0byBydW4gaXQsIGl0IHRocm93cyB0aGUgZm9sbG93aW5nIGVycm9yOgo+IEZh
aWxlZCB0byBpbml0aWFsaXplIHZpZGVvOiBObyBhdmFpbGFibGUgdmlkZW8gZGV2aWNlLgoKSSB0
aGluayB5b3UgaGF2ZSBubyByZWdpc3RlcmVkIHZpZGVvIG91dHB1dC4KWW91IGNhbiBjaGVjayB0
aGlzIGJ5IGNoZWNraW5nIGRtZXNnLgpUaGlzIGNvdWxkIGhhcHBlbiBpZiB5b3UgZG9u4oCZdCBi
dWlsZCBldWRldiBvciBtZGV2IHRvIGxldCBidXN5Ym94IHRvIGF1dG9tYXRpY2FsbHkgcmVnaXN0
ZXIgZGV2aWNlIGRyaXZlcnMgd2hlbiBkZXZpY2VzIGFyZSBmb3VuZC4KU28geW91IGNvdWxkIHRy
eSB0byByZWJ1aWxkIGZyb20gc2NyYXRjaCB1c2luZyBhIGR5bmFtaWMgZGV2aWNlIGhhbmRsaW5n
KGV1ZGV2KS4KCk90aGVyd2lzZSBjYW4geW91IHBhc3RlYmluIHlvdXIgZGVmY29uZmlnPwoKQmVz
dCByZWdhcmRzCkdpdWxpbwoKPiAKPiBJIGFscmVhZHkgaW5zdGFsbGVkIGFsbCB0aGUgR3JhcGhp
Y3MgbGlicmFyaWVzLCBTREwyLCBkaXJlY3RmYiwgZXRjLgo+IE1heWJlIEkgYW0gbWlzc2luZyBz
b21ldGhpbmcuCj4gCj4gVGhhbmsgeW91LAo+IEZyYW5jby4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
