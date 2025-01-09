Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB02E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 15:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A4E6076C;
	Thu,  9 Jan 2025 15:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5-0R1O4hKRc; Thu,  9 Jan 2025 15:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31607607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31607607D8;
	Thu,  9 Jan 2025 15:31:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B2B76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48EA86076C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4DU1qDTxzSn for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 15:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E876606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E876606F1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E876606F1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:31:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A131E1C000C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:31:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tVuUx-005TwX-2y
 for buildroot@buildroot.org; Thu, 09 Jan 2025 16:31:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 09 Jan 2025 16:31:03 +0100
Message-ID: <87y0zkhumg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.11.1 released
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
MDI0LjExLjEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMTEuMS50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjExLjEudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjExLjEgdGFnKQoKQnVpbGRyb290IDIwMjQuMTEuMSBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4xMSByZWxlYXNlLgoKLSBFbnN1cmUgQ09O
RklHX1RSSU1fVU5VU0VEX0tTWU1TIGlzIGRpc2FibGVkIHdoZW4gYnVpbGRpbmcgZXh0ZXJuYWwK
ICBMaW51eCBrZXJuZWwgbW9kdWxlcwoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXByLCBkcGRrLCBn
c3QxLXBsdWdpbnMtYmFzZSwgaXBlcmYzLCBsaWJjdXJsLAogIGxpYnNuZGZpbGUsIGxpYnNvdXAz
LCBuZXRhdGFsaywgb3BlbnNjLCBweXRob24tZGphbmdvLCBzdWJ2ZXJzaW9uLAogIHdnZXQsIHdp
cmVzaGFyawoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNl
IGlzc3VlcyBpbiBiYywKICBibHVlejVfdXRpbHMsIGMtaWNhcCwgY3J5cHRvZGV2LWxpbnV4LCBk
YWhkaS1saW51eCwgZnJlZWlwbWksIGdkYiwKICBnbnVwZzIsIGdudXBsb3QsIGdudXRscywgZ28s
IGdvYmplY3QtaW50cm9zcGVjdGlvbiwgZ3J1YjIsIGdzdC1vbXgsCiAgZ3N0MS1kZXZ0b29scywg
Z3N0MS1saWJhdiwgZ3N0MS1wbHVnaW5zLWJhZCwgZ3N0MS1wbHVnaW5zLWdvb2QsCiAgZ3N0MS1w
bHVnaW5zLXVnbHksIGdzdDEtcHl0aG9uLCBnc3QxLXJ0c3Atc2VydmVyLCBnc3QxLXZhYXBpLAog
IGdzdHJlYW1lcjEsIGdzdHJlYW1lcjEtZWRpdGluZy1zZXJ2aWNlcywgaWd0LWdwdS10b29scywg
bGlic2hhMSwKICBsaWJ2aXJ0LCBsaWJ4Y3J5cHQsIGxpYnhtbDIsIGxpYnplbm9oLXBpY28sIGxp
bnV4LCBsaW51eC1wYW0sIG5ldHRsZSwKICBvY3RhdmUsIHBlcmwsIHBocCwgcGl4bWFuLCBwb2xr
aXQsIHByb2Nwcy1uZywgcHl0aG9uLWF1dG9jb21tYW5kLAogIHB5dGhvbjMsIHF1aWNranMsIHNh
bWJhNCwgc2tlbGV0b24sIHRpLWszLXI1LWxvYWRlciwgdHpkYXRhLAogIHY0bDJsb29wYmFjaywg
d2F5bGFuZCwgd2Via2l0Z3RrLCB3ZXN0b24sIHdwZXdlYmtpdCwgeHI4MTkteHJhZGlvLAogIHh4
aGFzaCwgemZzLCB6aWMKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoK
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI0LjEx
LjEvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBl
bmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250
cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIwMjQuMTEuLgoK
ICAgIDQ4ICBQZXRlciBLb3JzZ2FhcmQKICAgIDI0ICBUaG9tYXMgUGV0YXp6b25pCiAgICAxMyAg
SnVsaWVuIE9saXZhaW4KICAgIDExICBCZXJuZCBLdWhscwogICAgIDcgIFlhbm4gRS4gTU9SSU4K
ICAgICAzICBBa2hpbGVzaCBOZW1hCiAgICAgMyAgRmlvbmEgS2x1dGUgKFdJV0EpCiAgICAgMyAg
VGhvbWFzIEJvbm5lZmlsbGUKICAgICAyICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEJhcnRv
c3ogQmlsYXMKICAgICAxICBCcmFuZG9uIE1haWVyCiAgICAgMSAgQnJ5YW4gQnJhdHRsb2YKICAg
ICAxICBEYXJpbyBCaW5hY2NoaQogICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEpvc8Op
IEx1aXMgU2FsdmFkb3IgUnVmbwogICAgIDEgIE1hcnRpbiBCw7ZoCiAgICAgMSAgTWljaGFlbCBG
aXNjaGVyCiAgICAgMSAgUmV6YSBBcmJhYgogICAgIDEgIFJveSBLb2xsZW4gU3ZlbmRzZW4KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
