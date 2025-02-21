Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B4EC021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 14:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B7D407AA;
	Fri, 21 Feb 2025 14:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yge6DPER4-p; Fri, 21 Feb 2025 14:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA330407CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA330407CC;
	Fri, 21 Feb 2025 14:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F80E6B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03AE182145
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeMceWDrytGs for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 14:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1A3681F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A3681F00
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A3681F00
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:02:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDF9A44437
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:02:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tlTcC-003pxK-0z
 for buildroot@buildroot.org; Fri, 21 Feb 2025 15:02:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 15:02:52 +0100
Message-ID: <87zfifo0oj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufffkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhephfeivddutdfhleekjeegveefhfeuhedtvdejhfeghfeujeehleeiffdtveefgeelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.11 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjAyLjExIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQgaXQgYXQ6CgpodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjExLnRhci5negoKb3IKCmh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuMTEudGFyLnh6CgpP
ciBnZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QuZ2l0ICgyMDI0LjAyLjExIHRhZykKCkJ1aWxkcm9vdCAyMDI0LjAyLjExIGlzIGEgYnVn
Zml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJtCnJlbGVhc2UsIGZpeGluZyBhIG51
bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVkIGlzc3VlcwpkaXNjb3ZlcmVkIHNp
bmNlIHRoZSAyMDI0LjAyLjEwIHJlbGVhc2UuCgotIFNlY3VyaXR5IGZpeGVzIGZvciBhY3BpY2Es
IGFzc2ltcCwgYXN0ZXJpc2ssIGJpbmQsIGJ1c3lib3gsIGNsYW1hdiwKICBnaXQsIGdudXRscywg
Z28sIGludGVsLW1pY3JvY29kZSwgbGliY3VybCwgbGlib3BlbnNzbCwgbGlidGFzbjEsCiAgbXBn
MTIzLCBtdXNsLCBuZ2lueCwgbm9kZWpzLCBvcGVuanBlZywgb3BlbnNzaCwgcG9zdGdyZXNxbCwK
ICBweXRob24tZGphbmdvLCByZWRpcywgcnN5bmMsIHNvY2F0LCB1bmJvdW5kLCB3ZWJraXRndGss
IHpsb2cKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBp
c3N1ZXMgaW4gYXBhY2hlLAogIGJ1c3lib3gsIGN1cmxwcCwgZGlsbG8sIGVsZnV0aWxzLCBmZm1w
ZWcsIGZvb3QsIGZyZWV0eXBlLCBncHNkLAogIGhlaW1kYWwsIGltYWdlbWFnaWNrLCBsaWJic2Qs
IG1kbnNkLCBvcGVudnBuLCBzZGJ1cy1jcHAsIHRvciwgdHpkYXRhLAogIHVlbWFjcywgdXNidXRp
bHMsIHhlbiwgemljLCB6c3RkCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmls
ZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAy
NC4wMi4xMS9DSEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9u
Z2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXMgLW4gMjAyNC4w
Mi4xMC4uCgogICAgMjYgIFBldGVyIEtvcnNnYWFyZAogICAgMTYgIEJlcm5kIEt1aGxzCiAgICAg
NiAgWWFubiBFLiBNT1JJTgogICAgIDUgIEFraGlsZXNoIE5lbWEKICAgICA1ICBKdWxpZW4gT2xp
dmFpbgogICAgIDUgIFRob21hcyBQZXRhenpvbmkKICAgICA0ICBXYWxkZW1hciBCcm9ka29yYgog
ICAgIDMgIFJvbWFpbiBOYW91cgogICAgIDIgIEJhcnVjaCBTaWFjaAogICAgIDIgIERhcmlvIEJp
bmFjY2hpCiAgICAgMiAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAyICBUaG9tYXMgQm9ubmVm
aWxsZQogICAgIDIgIFZpbmNlbnQgRmF6aW8KICAgICAyICBWaW5jZW50IFN0ZWhsw6kKICAgICAx
ICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEZhYnJpY2UgRm9udGFpbmUKICAgICAxICBGaW9u
YSBLbHV0ZSAoV0lXQSkKICAgICAxICBGcmFuY29pcyBQZXJyYWQKICAgICAxICBHYcOrbCBQT1JU
QVkKICAgICAxICBKYW1lcyBIaWxsaWFyZAogICAgIDEgIE1pY2hhZWwgRmlzY2hlcgogICAgIDEg
IE5pa2xhcyBZYW5uIFdldHRlbmdlbAogICAgIDEgIFNlcmdleSBCb2JyZW5vawogICAgIDEgIFNl
cmdleSBNYXR5dWtldmljaAogICAgIDEgIFRob21hcyBEZXZvb2dkdAoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
