Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A64ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 15:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1DF4045A;
	Mon,  9 Sep 2024 15:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tj32K1hZa1jk; Mon,  9 Sep 2024 15:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BA7404D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BA7404D3;
	Mon,  9 Sep 2024 15:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DCBE1BF947
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B741607B4
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkRtW-Q0hezq for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 15:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E76AA60598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E76AA60598
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E76AA60598
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:14:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5103EE000A
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:14:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sng62-00GFBO-2n
 for buildroot@buildroot.org; Mon, 09 Sep 2024 17:14:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 09 Sep 2024 17:14:30 +0200
Message-ID: <87zfoghnah.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.6 released
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
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjAyLjYgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuNi50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjYudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjAyLjYgdGFnKQoKQnVpbGRyb290IDIwMjQuMDIuNiBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIg
b2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0
aGUgMjAyNC4wMi41IHJlbGVhc2UuCgotIEFkZGVkIGEgbGFyZ2UgbnVtYmVyIG9mIGFkZGl0aW9u
YWwgcnVudGltZSB0ZXN0cy4KCi0gSW5mcmFzdHJ1Y3R1cmU6CiAgLSBCZSBtb3JlIHJvYnVzdCBh
Z2FpbnN0IHRleHQgZmlsZXMgKGZvciBwYWNrYWdlIGhhc2hlcyBhbmQgdXNlcnMpCiAgICBpbmNv
cnJlY3RseSBtaXNzaW5nIGEgdGVybWluYXRpbmcgbmV3bGluZS4KCiAgLSBGaXggdmFyaW91cyBp
c3N1ZXMgd2l0aCB0aGUgcGtnLWtjb25maWcgaW5mcmFzdHJ1Y3R1cmUgYW5kCiAgICBwZXItcGFj
a2FnZS1kaXJlY3RvcmllcyBidWlsZHMgKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykuCgot
IFNlY3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGRyb3BiZWFyLCBmcmVlcmRwLCBnbnV0bHMsIGlu
dGVsLW1pY3JvY29kZSwKICBpcGVyZjMsIGxpYmN1cmwsIGxpYmd0azMsIGxpYnhtbDIsIG5naW54
LCBub2RlanMsIHByb2Nwcy1uZywKICBweXRob24tZGphbmdvLCB1bmJvdW5kCgotIEZpeGVzIGZv
ciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFlci1pbmpl
Y3QsCiAgYW0zMzV4LXBydS1wYWNrYWdlLCBhcHIsIGFwci11dGlsLCBhdHRyLCBib29zdCwgYnRy
ZnMtcHJvZ3MsIGJ1c3lib3gsCiAgY3J5cHRzZXR1cCwgZWxmdXRpbHMsIGZldGNobWFpbCwgZmZt
cGVnLCBmbHVpZHN5bnRoLCBmcmVlcmRwLCBnY2MsCiAgZ2RiLCBncHNkLCBoaWF3YXRoYSwgaG9z
dGFwZCwgaHRvcCwga3NtYmQtdG9vbHMsIGxpYmNvYXAsIGxpYmVzdCwKICBsaWJwd3F1YWxpdHks
IGxpYnJlc3NsLCBsaWJ1cG5wLCBsaWJ4c2x0LCBscnpzeiwgbWRpby10b29scywKICBtaWNyb3B5
dGhvbiwgbWpwZy1zdHJlYW1lciwgbXBpciwgbmNmdHAsIG9wZW4taXNjc2ksIG9wZW5sZGFwLAog
IG9wZW52cG4sIHBpc3RhY2hlLCBydWJ5LCBzcGVleCwgc3dheWJnLCB0aW55c3NoLCB1Y2xpYmMs
CiAgdWNsaWJjLW5nLXRlc3QsIHV1dSwgd3Bld2Via2l0LCB6ZnMKCkZvciBtb3JlIGRldGFpbHMs
IHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vYmxvYi8yMDI0LjAyLjYvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVk
IHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5r
cyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNo
b3J0bG9nIC1zIC1uIDIwMjQuMDIuNS4uCgogICAgMTcgIEJlcm5kIEt1aGxzCiAgICAxNyAgRmFi
cmljZSBGb250YWluZQogICAgMTcgIEp1bGllbiBPbGl2YWluCiAgICAgNiAgTWFyY3VzIEhvZmZt
YW5uCiAgICAgNiAgVGhvbWFzIFBldGF6em9uaQogICAgIDUgIFdhbGRlbWFyIEJyb2Rrb3JiCiAg
ICAgNSAgWWFubiBFLiBNT1JJTgogICAgIDQgIEJyYW5kb24gTWFpZXIKICAgICAzICBGcmFuY29p
cyBQZXJyYWQKICAgICAzICBKLiBOZXVzY2jDpGZlcgogICAgIDIgIEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8KICAgICAyICBCYXJ1Y2ggU2lhY2gKICAgICAyICBEYXJpbyBCaW5hY2NoaQogICAgIDIg
IEdpdWxpbyBCZW5ldHRpCiAgICAgMiAgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvCiAgICAgMiAg
TWljaGFlbCBOb3N0aG9mZgogICAgIDIgIFBldGVyIEtvcnNnYWFyZAogICAgIDEgIEFsZWtzYW5k
ciBNYWthcm92CiAgICAgMSAgRGFub21pIE1hbmNoZWdvCiAgICAgMSAgRG1pdHJ5IENoZXN0bnlr
aAogICAgIDEgIEVkZ2FyIEJvbmV0CiAgICAgMSAgRXRpZW5uZSBDYXJyaWVyZQogICAgIDEgIEZp
b25hIEtsdXRlIChXSVdBKQogICAgIDEgIEZsw6F2aW8gVGFwYWrDs3MKICAgICAxICBHZXJvIFNj
aHfDpHJpY2tlCiAgICAgMSAgSmFtZXMgS25pZ2h0CiAgICAgMSAgSm9hY2hpbSBXaWJlcmcKICAg
ICAxICBLYWRhbWJpbmkgTmVtYQogICAgIDEgIEtpbGlhbiBaaW5uZWNrZXIKICAgICAxICBNYXJ0
aW4gV2V0dGVyd2FsZAogICAgIDEgIFJvYmVydCBNYXJrbwogICAgIDEgIFRob21hcyBCb25uZWZp
bGxlCiAgICAgMSAgWWVnb3IgWWVmcmVtb3YKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
