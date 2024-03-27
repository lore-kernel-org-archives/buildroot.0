Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A19C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 09:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F8AC80024;
	Wed, 27 Mar 2024 09:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BB_sOXaRiqeP; Wed, 27 Mar 2024 09:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB57808A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB57808A0;
	Wed, 27 Mar 2024 09:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F37C81BF297
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF938151E
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aQUEVcFbHo9 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 09:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 563B3814B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563B3814B5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 563B3814B5
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 09:18:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2C40240008
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 09:18:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rpPQS-009T4y-0Y
 for buildroot@buildroot.org; Wed, 27 Mar 2024 10:18:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 10:18:28 +0100
Message-ID: <871q7w9gnv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.11 released, 2023.02.x EOL
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
MjMuMDIuMTEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4wMi4xMS50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjMuMDIuMTEudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvCgpCdWlsZHJvb3QgMjAyMy4wMi4xMSBpcyBhIGJ1Z2ZpeCByZWxlYXNlIG9uIHRoZSBjdXJy
ZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8gc2Vj
dXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyMy4wMi4xMCByZWxl
YXNlLgoKLSBEZWZjb25maWdzOiBTdGFyZml2ZSB2aXNpb25maXZlMjogVXNlIGNvcnJlY3QgZ2Vu
aW1hZ2UgY29uZmlndXJhdGlvbi4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpbmQsIGJpdGNvaW4s
IGMtYXJlcywgY2xhbWF2LCBkbnNtYXNxLCBleHBhdCwKICBnaG9zdHNjcmlwdCwgZ251cGcyLCBp
d2QsIGxpYmNvYXAsIGxpYmN1cmwsIGxpYmdpdDIsIGxpYm1vZHNlY3VyaXR5LAogIGxpYnV2LCBs
aWJ4bWwyLCBsdWEtaHR0cCwgbm9kZWpzLCBwb3N0Z3Jlc3FsLCBweXRob24tZGphbmdvLCBweXRo
b24zLAogIHNoaW0sIHN1ZG8sIHVuYm91bmQsIHZpbSwgd2Via2l0Z3RrLCB3cGV3ZWJraXQKCi0g
Rml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4g
Ym90YW4sIGN2cywKICBkYXNoLCBlbGwsIGV4aW0sIGZyZWV0eXBlLCBnb29nbGUtYnJlYWtwYWQs
IGdzdDEtcHl0aG9uLCBnc3QxLXZhYXBpLAogIGxpYmtyYjUsIGxpYnVud2luZCwgbHV2aSwgbmdp
bngtbmF4c2ksIG9wZW5zc2gsIG9wZW52bXRvb2xzLCBwYXJ0ZWQsCiAgcGhwLCBwb2NvLCBwcml2
b3h5LCBwdXJlLWZ0cGQsIHB1dHR5LCBweXRob24tY2hlcm9vdCwKICBweXRob24tY29uZmlnc2hl
bGwtZmIsIHB5dGhvbi1ydHNsaWItZmIsIHJzeW5jLCBzZGwyLCBzcGljZSwgc3F1aWQsCiAgc3Ry
YWNlLCBzdHJvbmdzd2FuLCBzeXN0ZW1kLCB0YXJnZXRjbGktZmIsIHV2dywgeHZpc29yLCB6bGli
LW5nCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyMy4wMi4xMS9DSEFOR0VT
IGluc3RlYWQKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5j
b3VyYWdlZCB0byB1cGdyYWRlLgoKTm90aWNlIHRoYXQgdGhlIDIwMjMuMDIueCBzZXJpZXMgaXMg
bm93IEVPTCwgcGxlYXNlIG1pZ3JhdGUgdG8gMjAyNC4wMi54Cmluc3RlYWQgd2hpY2ggd2lsbCBi
ZSBzdXBwb3J0ZWQgdW50aWwgQXByaWwgMjAyNS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVv
cGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMu
MDIuMTAuLgoKICAgIDM5ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAyNCAgQmVybmQgS3VobHMKICAg
IDExICBQZXRlciBLb3JzZ2FhcmQKICAgICA3ICBZYW5uIEUuIE1PUklOCiAgICAgNiAgSnVsaWVu
IE9saXZhaW4KICAgICA0ICBKZXJlbXkgSi4gUGVwZXIKICAgICAzICBNYXJjdXMgSG9mZm1hbm4K
ICAgICAyICBBZGFtIER1c2tldHQKICAgICAyICBGcmFuY29pcyBQZXJyYWQKICAgICAyICBGcmFu
ayBWYW5iZXZlcgogICAgIDIgIE5pY29sYXMgQ2F2YWxsYXJpCiAgICAgMiAgU2VuIEhhc3Rpbmdz
CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIENocmlzdGlhbiBIaXR6CiAg
ICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAxICBMdWthc3ogVGVraWVsaQogICAgIDEgIE1heGlt
IEtvY2hldGtvdgogICAgIDEgIE51bm8gR29uw6dhbHZlcwogICAgIDEgIFJvbWFpbiBOYW91cgog
ICAgIDEgIFPDqWJhc3RpZW4gU3p5bWFuc2tpCiAgICAgMSAgVGhvbWFzIERldm9vZ2R0CgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
