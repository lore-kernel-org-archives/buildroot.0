Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5DC83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BE983C2F;
	Thu,  3 Jul 2025 20:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVL3H_n5eBdK; Thu,  3 Jul 2025 20:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA0883C56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA0883C56;
	Thu,  3 Jul 2025 20:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D035C15F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD4C441084
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCJGqYmCdh-j for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66E8841002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E8841002
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E8841002
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:24 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id XQususPMNmHkSXQusuvFLO; Thu, 03 Jul 2025 22:52:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 3 Jul 2025 22:52:21 +0200
Message-Id: <02E2B42E-A238-41B0-A7D5-274BEB4C143F@benettiengineering.com>
References: <5b3010b4da5429b622aa62077e167215@free.fr>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <5b3010b4da5429b622aa62077e167215@free.fr>
To: Julien Olivain <ju.o@free.fr>
X-Mailer: iPhone Mail (22F76)
X-CMAE-Envelope: MS4xfCusd9kOF/Hn2aY58E5qfGOLydef6gNLFWCd08JthPPGFBAQMIaKdBcC2UyvVHGuBNFJUqosrNaa1+vCCIQ2vWef6KbykAVoYnd/1YrLcs6i4E3nuDj6
 UFPKcT64ZDPde8M9sXtxJooPUbJ2R1rVanDq97xvcc/ph3WaCyqVN0yZdcflAk4QE5Qh//+QQZObncmOfRUPl9OWSJubjKdi5OVuOV8P5o4MX+OUWOgIUBom
 YS3t7pKach8oqu65lAHOmfGHHgCk0DHJzbvqBfcssSU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751575942; bh=DQ/mgwxwS4VMX/knwrkQW/Vwqbxh1LCjxUB3JtcHGUc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=RDfFEFY/LG3+xTjl9RE5h4uYC8H9l3cmY+klTwYwCo8qGZMrEyR41L6pbgPmZglub
 44LQaSG7sDi1UbXzh1viuQdbLnn4mT/6fRo3R2g7k5JpNQcksUTRgXdjVK/3tn14d1
 gyAIVjGo9n/zPxAJ7YmNsvUV3qBWyiUB6GBiv4sCTTfW5XWpDIbysTK2K7WbIqodC4
 EftQRlJ8ylF8oJaa5SWNS7M9KlWokRlWXInDCw2yCYUAYIUom/p0DD++PdKlwif77R
 v7BSWRS7SWPBMj9MT5Y6akp0lWwrR72FL4IJDAHnWfvvbgyzYzA9sEyyIBIYdsNxZF
 3T5kUitte3W5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RDfFEFY/
Subject: Re: [Buildroot] [PATCH] package/libnss: security bump version to
 3.113.1
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

SGkgSnVsaWVuLAoKPiBJbCBnaW9ybm8gMyBsdWcgMjAyNSwgYWxsZSBvcmUgMjI6MjgsIEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlvLAo+
IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQo+IAo+PiBPbiAwMy8wNy8yMDI1IDIwOjM0LCBHaXVs
aW8gQmVuZXR0aSB3cm90ZToKPj4gRm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgo+PiBodHRwczovL2hn
LWVkZ2UubW96aWxsYS5vcmcvcHJvamVjdHMvbnNzL2ZpbGUvTlNTXzNfMTEzXzFfUlRNL2RvYy9y
c3QvcmVsZWFzZXMvbnNzXzNfMTEzXzEucnN0Cj4gCj4gV2h5IGRpZCB5b3UgbWFya2VkIHRoaXMg
YnVtcCBhcyAic2VjdXJpdHkgcmVsYXRlZCI/Cj4gCj4gTG9va2luZyBhdCB0aGUgYnVnIHJlZmVy
ZW5jZSBpbiB0aGUgcmVsZWFzZSBub3RlIFsxXSwgaXQgcmVmZXJzIHRvIGEgYnVnIFsyXQo+IHdo
aWNoIGZpeGVzIGEgY2VydGlmaWNhdGUuIEluIFszXSwgdGhlICJVc2VyIGltcGFjdCBpZiBkZWNs
aW5lZCIgaXMgZGVzY3JpYmVkCj4gYXMgIlVzZXJzIG1heSBzZWUgY2VydGlmaWNhdGUgZXJyb3Ig
cGFnZXMgZm9yIHZhbGlkIGNlcnRpZmljYXRlcyIuCj4gCj4gQ291bGQgeW91IHByb3ZpZGUgYSBy
ZWZlcmVuY2Ugb3IgYSBqdXN0aWZpY2F0aW9uIHdoeSB5b3UgdGhpbmsgaXQgaXMKPiBhIHNlY3Vy
aXR5IGJ1bXA/ICBPdGhlcndpc2UsIGlmIHlvdSB0aGluayBpdCdzIG5vdCwgY291bGQgeW91IHNl
bmQKPiBhbmQgdXBkYXRlZCBwYXRjaCBqdXN0IG1hcmtpbmcgaXQgYXMgYSBub3JtYWwgYnVtcD8K
CllvdeKAmXJlIGFic29sdXRlbHkgcmlnaHQuIEnigJl2ZSBiZWVuIG1pc2xlYWQgd2hpbGUgY2hl
Y2tpbmcgdGhlIDIgY29tbWl0cyBpbiBOU1NfM18xMTNf4oCmIGJyYW5jaC4gSXTigJlzIG5vdCBh
IHNlY3VyaXR5IGJyYW5jaCwgcGFyZG9uLgoKR29pbmcgdG8gc2VuZCB2MiB0b21vcnJvdy4KCktp
bmQgcmVnYXJkcwpHaXVsaW8KCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KPiAKPiBb
MV0gaHR0cHM6Ly9oZy1lZGdlLm1vemlsbGEub3JnL3Byb2plY3RzL25zcy9maWxlL05TU18zXzEx
M18xX1JUTS9kb2MvcnN0L3JlbGVhc2VzL25zc18zXzExM18xLnJzdCNsMzUKPiBbMl0gaHR0cHM6
Ly9idWd6aWxsYS5tb3ppbGxhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk3NDI5OQo+IFszXSBodHRw
czovL2J1Z3ppbGxhLm1vemlsbGEub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTc1MDI3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
