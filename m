Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7913AD0E6C0
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 07:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE0880B62;
	Mon, 21 Oct 2024 07:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqGAYBRkuhBq; Mon, 21 Oct 2024 07:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213C880C9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213C880C9C;
	Mon, 21 Oct 2024 07:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1602427D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2428401AE
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIWD2xXT79L6 for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 07:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2382E401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2382E401A2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2382E401A2
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:34:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDDBF1BF213
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:34:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2mvW-00FGPt-0q
 for buildroot@buildroot.org; Mon, 21 Oct 2024 09:34:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 09:34:06 +0200
Message-ID: <87h695ap01.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.7 released
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
MDI0LjAyLjcgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuNy50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjcudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjAyLjcgdGFnKQoKQnVpbGRyb290IDIwMjQuMDIuNyBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIg
b2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0
aGUgMjAyNC4wMi42IHJlbGVhc2UuCgotIFBlci1wYWNrYWdlLWRpcmVjdG9yaWVzIGZpeGVzIGZv
ciB0aGUgLmdkYmluaXQgZmlsZSBhbmQgUlBBVEgKICBmaXh1cHMgZm9yIFNESy4KCi0gTmV3IHBh
Y2thZ2U6IGdvLWJvb3RzdHJhcC1zdGFnZTMgKGZvciB0aGUgbW92ZSB0byBnbyAxLjIyLngpCgot
IFNlY3VyaXR5IGZpeGVzIGZvciBhc3RlcmlzaywgYmluZCwgYm90YW4sIGNsYW1hdiwgY3Vwcywg
ZG92ZWNvdCwKICBleHBhdCwgZ28sIGxpYmFyY2hpdmUsIGxpYmN1cmwsIGxpYm9wZW5zc2wsIGxp
YnBjYXAsIG1vc3F1aXR0bywgbmdpbngsCiAgcGhwLCBwb3N0Z3Jlc3FsLCBweXRob24tZGphbmdv
LCBweXRob24tc3FscGFyc2UsIHB5dGhvbjMsIHF0NmJhc2UsCiAgcXQ2c3ZnLCB1bmJvdW5kLCB3
cGV3ZWJraXQsIHhzZXJ2ZXJfeG9yZy1zZXJ2ZXIKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBp
bGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYWVyLWluamVjdCwKICBhcm1hZGlsbG8s
IGF1bWl4LCBiYWJlbGQsIGJvdGFuLCBjYWNoZS1jYWxpYnJhdG9yLCBjb21peC1jdXJzb3JzLAog
IGNyeXB0c2V0dXAsIGRvdmVjb3QtcGlnZW9uaG9sZSwgZmJzZXQsIGdlbnBhcnQsIGdsaWJjLCBn
bnV0bHMsCiAgZ251LWVmaSwgZ3J1YjIsIGxpYmN1ZWZpbGUsIGxpYmdsb2IsIGxpYmdwZy1lcnJv
ciwgbGliaWxiYywgbGlicGNhcCwKICBsaWJ1ZWNjLCBsaW51eC1wYW0sIG50cHNlYywgcDkxMG5k
LCBwcm9jcHMtbmcsIHByb2Z0cGQsIHB1cmUtZnRwZCwKICBweXRob24taHVlcHksIHB5dGhvbi11
bml0dGVzdC14bWwtcmVwb3J0aW5nLCBycC1wcHBvZSwgc29maWEtc2lwLAogIHN0cm9uZ3N3YW4s
IHN6aXAsIHRsbGlzdCwgdW5ib3VuZCwgd3BlYmFja2VuZC1mZG8sIHgyNjQsIHhlbm9tYWksCiAg
emFiYml4CgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wMi43L0NIQU5H
RVMKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdl
ZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5n
IHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI0LjAyLjYuLgoKICAgMTQ0
ICBQZXRlciBLb3JzZ2FhcmQKICAgIDI0ICBXYWxkZW1hciBCcm9ka29yYgogICAgMjIgIFRob21h
cyBQZXRhenpvbmkKICAgIDE0ICBCZXJuZCBLdWhscwogICAgMTAgIERhcmlvIEJpbmFjY2hpCiAg
ICAgOSAgSnVsaWVuIE9saXZhaW4KICAgICA5ICBZYW5uIEUuIE1PUklOCiAgICAgNyAgQ2hyaXN0
aWFuIFN0ZXdhcnQKICAgICAyICBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMiAgQWtoaWxl
c2ggTmVtYQogICAgIDIgIEJhcnVjaCBTaWFjaAogICAgIDIgIEJyYW5kb24gTWFpZXIKICAgICAy
ICBGcmFuY29pcyBQZXJyYWQKICAgICAyICBKLiBOZXVzY2jDpGZlcgogICAgIDIgIEphbWVzIEhp
bGxpYXJkCiAgICAgMiAgTWFyY3VzIEhvZmZtYW5uCiAgICAgMiAgU2NvdHQgRmFuCiAgICAgMSAg
RGFtaWVuIFRow6liYXVsdAogICAgIDEgIEVkZ2FyIEJvbmV0CiAgICAgMSAgRmFicmljZSBGb250
YWluZQogICAgIDEgIEdlb3JnZSBLaWFnaWFkYWtpcwogICAgIDEgIEdpdWxpbyBCZW5ldHRpCiAg
ICAgMSAgSHVnbyBDb3JuZWxpcwogICAgIDEgIE1hdHRpYSBOYXJkdWNjaQogICAgIDEgIE1pY2hh
ZWwgRmlzY2hlcgogICAgIDEgIFJvbWFpbiBOYW91cgogICAgIDEgIFJveSBLb2xsZW4gU3ZlbmRz
ZW4KICAgICAxICBUYW4gRW4gRGUKICAgICAxICBUaG9tYXMgSHV0aAogICAgIDEgIFl1cml5IEtv
bGVyb3YKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
