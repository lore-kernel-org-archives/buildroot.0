Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D9AC54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 600F640108;
	Tue, 26 Mar 2024 16:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCQeTOMQR-kE; Tue, 26 Mar 2024 16:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A9740430
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A9740430;
	Tue, 26 Mar 2024 16:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E17CF1BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF2C340832
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Opz0EUDU-9aM for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 532864083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532864083C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 532864083C
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:50:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 877F82000E
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:50:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rpA0m-009GaH-2z
 for buildroot@buildroot.org; Tue, 26 Mar 2024 17:50:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org 
Date: Tue, 26 Mar 2024 17:50:56 +0100
Message-ID: <877chp9btb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2023.11.3 released, 2023.11.x EOL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjMuMTEuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjExLjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MTEuMiByZWxlYXNlLgoKLSBEZWZjb25maWdzOiBTdGFyZml2ZSB2aXNpb25maXZlMjogVXNlIGNv
cnJlY3QgZ2VuaW1hZ2UgY29uZmlndXJhdGlvbi4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpbmQs
IGJpdGNvaW4sIGMtYXJlcywgY2xhbWF2LCBkbnNtYXNxLCBleHBhdCwKICBnaG9zdHNjcmlwdCwg
Z251cGcyLCBnbywgaXdkLCBsaWJjb2FwLCBsaWJjdXJsLCBsaWJnaXQyLAogIGxpYm1vZHNlY3Vy
aXR5LCBsaWJvcGVuc3NsLCBsaWJ1diwgbGlieG1sMiwgbHVhLWh0dHAsIG5vZGVqcywKICBwb3N0
Z3Jlc3FsLCBweXRob24tZGphbmdvLCBweXRob24zLCBzaGltLCBzdWRvLCB1bmJvdW5kLCB2aW0s
CiAgd2Via2l0Z3RrLCB3cGV3ZWJraXQKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9u
L3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYm90YW4sCiAgY2NhY2hlLCBjb25tb24sIGNvbnRh
aW5lcmQsIGN2cywgZGFzaCwgZG9ja2VyLWVuZ2luZSwgZHJhY3V0LCBlbGwsCiAgZmx1ZW50LWJp
dCwgZnJlZXR5cGUsIGdjYywgZ21wLCBnb29nbGUtYnJlYWtwYWQsIGdzdDEtcHl0aG9uLAogIGdz
dDEtdmFhcGksIGxpYmRuZXQsIGxpYmhlaWYsIGxpYmtyYjUsIGxpYm5mcywgbGlic2VsaW51eCwg
bGlidW53aW5kLAogIGxpYnVyaW5nLCBsaWJ2YSwgbHRyaXMsIGx1dmksIG1tYy11dGlscywgbmdp
bngtbmF4c2ksIG9jdGF2ZSwgb3BlbnNzaCwKICBvcGVudm10b29scywgcGFydGVkLCBwZXRpdGJv
b3QsIHBocCwgcG9jbywgcG93ZXJ0b3AsIHByaXZveHksCiAgcHVyZS1mdHBkLCBwdXR0eSwgcHl0
aG9uLWNoZXJvb3QsIHB5dGhvbi1jb25maWdzaGVsbC1mYiwKICBweXRob24tcnRzbGliLWZiLCBy
YXVjLWhhd2tiaXQtdXBkYXRlciwgcmVkaXMsIHJlZGlzLXBsdXMtcGx1cywgcnN5bmMsCiAgczM5
MC10b29scywgc2RsMiwgc3BpY2UsIHNwaXJ2LXRvb2xzLCBzcXVpZCwgc3RyYWNlLCBzdHJvbmdz
d2FuLAogIHN5c3RlbWQsIHRhcmdldGNsaS1mYiwgdWhkLCB1dGlsLWxpbnV4LCB4dmlzb3IsIHps
aWItbmcKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9n
aXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIzLjExLjMKClVz
ZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1
cGdyYWRlLgoKTm90aWNlIHRoYXQgdGhlIDIwMjMuMTEueCBzZXJpZXMgaXMgbm93IEVPTCwgcGxl
YXNlIG1pZ3JhdGUgdG8gMjAyNC4wMi54Cmluc3RlYWQgd2hpY2ggd2lsbCBiZSBzdXBwb3J0ZWQg
dW50aWwgQXByaWwgMjAyNS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1
dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMTEuMi4uCgogICAg
NTkgIEZhYnJpY2UgRm9udGFpbmUKICAgIDEyICBCZXJuZCBLdWhscwogICAgMTAgIFBldGVyIEtv
cnNnYWFyZAogICAgIDkgIFlhbm4gRS4gTU9SSU4KICAgICA1ICBKdWxpZW4gT2xpdmFpbgogICAg
IDUgIE1hcmN1cyBIb2ZmbWFubgogICAgIDQgIEplcmVteSBKLiBQZXBlcgogICAgIDIgIEFkcmlh
biBQZXJleiBkZSBDYXN0cm8KICAgICAyICBGcmFuY29pcyBQZXJyYWQKICAgICAyICBGcmFuayBW
YW5iZXZlcgogICAgIDIgIFJlemEgQXJiYWIKICAgICAyICBSb21haW4gTmFvdXIKICAgICAyICBT
ZW4gSGFzdGluZ3MKICAgICAxICBBZGFtIER1c2tldHQKICAgICAxICBCcmFuZG9uIE1haWVyCiAg
ICAgMSAgQ2hyaXN0aWFuIEhpdHoKICAgICAxICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEdp
dWxpbyBCZW5ldHRpCiAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAxICBMdWthc3ogVGVraWVs
aQogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIE5pY29sYXMgQ2F2YWxsYXJpCiAgICAg
MSAgTnVubyBHb27Dp2FsdmVzCiAgICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAxICBU
aG9tYXMgRGV2b29nZHQKICAgICAxICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMSAgVmluY2VudCBG
YXppbwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
