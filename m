Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2182FCE7AB0
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 08:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEA8A400F9;
	Mon,  9 Sep 2024 08:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCNMtWaKZTZH; Mon,  9 Sep 2024 08:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B4A40328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B4A40328;
	Mon,  9 Sep 2024 08:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A95C1BF3AF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBDC8400F9
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHB0TRKH1Wi1 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 08:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EFCF40328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EFCF40328
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EFCF40328
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 08:05:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD7BDFF80A
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 08:05:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1snZOP-00Fl2c-1V
 for buildroot@buildroot.org; Mon, 09 Sep 2024 10:05:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 09 Sep 2024 10:05:01 +0200
Message-ID: <877cbli76a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.05.3 released
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
MDI0LjA1LjMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDUuMy50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjA1LjMudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjA1LjMgdGFnKQoKQnVpbGRyb290IDIwMjQuMDUuMyBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wNS4yIHJlbGVhc2UuCgpOb3RpY2UgdGhh
dCB0aGlzIHdpbGwgYmUgdGhlIGxhc3QgdXBkYXRlIG9mIHRoZSAyMDI0LjA1LnggYnJhbmNoLiBQ
bGVhc2UKbWlncmF0ZSB0byAyMDI0LjA4LnggaW5zdGVhZC4gQ2hhbmdlczoKCi0gQSBsYXJnZSBu
dW1iZXIgb2YgR0NDIDE0LnggY29tcGlsYXRpb24gZml4ZXMgYW5kIGFkZGl0aW9uYWwgcnVudGlt
ZQogIHRlc3RzLgoKLSBJbmZyYXN0cnVjdHVyZToKICAtIEJlIG1vcmUgcm9idXN0IGFnYWluc3Qg
dGV4dCBmaWxlcyAoZm9yIHBhY2thZ2UgaGFzaGVzIGFuZCB1c2VycykKICAgIGluY29ycmVjdGx5
IG1pc3NpbmcgYSB0ZXJtaW5hdGluZyBuZXdsaW5lLgoKICAtIEZpeCB2YXJpb3VzIGlzc3VlcyB3
aXRoIHRoZSBwa2cta2NvbmZpZyBpbmZyYXN0cnVjdHVyZSBhbmQKICAgIHBlci1wYWNrYWdlLWRp
cmVjdG9yaWVzIGJ1aWxkcyAoQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTKS4KCi0gU2VjdXJp
dHkgZml4ZXMgZm9yIGFwYWNoZSwgZnJlZXJkcCwgZ251dGxzLCBpbnRlbC1taWNyb2NvZGUsIGlw
ZXJmMywKICBsaWJjdXJsLCBsaWJndGszLCBsaWJ4bWwyLCBuZ2lueCwgbm9kZWpzLCBwcm9jcHMt
bmcsIHB5dGhvbi1kamFuZ28sCiAgdW5ib3VuZAoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGls
YXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhZXItaW5qZWN0LAogIGFtMzM1eC1wcnUt
cGFja2FnZSwgYXByLCBhcHItdXRpbCwgYXR0ciwgYXVnZWFzLCBhdXRvc3NoLCBiYW5kd2lkdGhk
LAogIGJjdXNkaywgYm9vc3QsIGJyY20tcGF0Y2hyYW0tcGx1cywgYnRyZnMtcHJvZ3MsIGJ1c3li
b3gsIGNhbi11dGlscywKICBjb3JldXRpbHMsIGNwdWxvYWQsIGNyeXB0c2V0dXAsIGN3aWlkLCBk
aHJ5c3RvbmUsIGR2Yi1hcHBzLCBlbGZ1dGlscywKICBmYWlmYSwgZmV0Y2htYWlsLCBmZm1wZWcs
IGZsdWVudC1iaXQsIGZsdWlkc3ludGgsIGdjYywgZ2NjLWJhcmUtbWV0YWwsCiAgZ2RiLCBncHNk
LCBoaWF3YXRoYSwgaG9zdGFwZCwgaHRvcCwgaWJtLXN3LXRwbTIsIGlwcm91dGUyLAogIGtzbWJk
LXRvb2xzLCBsaWJjbGksIGxpYmNvYXAsIGxpYmVzdCwgbGliZnJlZWZhcmUsIGxpYm5ncywKICBs
aWJwd3F1YWxpdHksIGxpYnJlc3NsLCBsaWJ1cG5wLCBsaWJ4c2x0LCBscnpzeiwgbWRpby10b29s
cywKICBtaWNyb3B5dGhvbiwgbWpwZy1zdHJlYW1lciwgbW9rdXRpbCwgbXBpciwgbmNmdHAsIG9k
Yiwgb3Blbi1pc2NzaSwKICBvcGVubGRhcCwgb3BlbnN3YW4sIG9wZW52cG4sIHBpc3RhY2hlLCBx
dW90YXRvb2wsIHJ0dHksIHJ1YnksCiAgc2NvbmVzZXJ2ZXIsIHNwZWV4LCBzd2F5YmcsIHRhciwg
dGZ0cGQsIHRpbnlzc2gsIHVjbGliYywKICB1Y2xpYmMtbmctdGVzdCwgdXV1LCB2b3JidXMtdG9v
bHMsIHdwZXdlYmtpdCwgemZzLCB6c2gKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdF
UyBmaWxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxv
Yi8yMDI0LjA1LjMvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBz
dHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBl
b3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIw
MjQuMDUuMi4uCgogICAgNDMgIEZhYnJpY2UgRm9udGFpbmUKICAgIDE3ICBCZXJuZCBLdWhscwog
ICAgMTYgIEp1bGllbiBPbGl2YWluCiAgICAxMCAgVGhvbWFzIFBldGF6em9uaQogICAgIDggIFdh
bGRlbWFyIEJyb2Rrb3JiCiAgICAgNiAgTWFyY3VzIEhvZmZtYW5uCiAgICAgNiAgWWFubiBFLiBN
T1JJTgogICAgIDQgIEJyYW5kb24gTWFpZXIKICAgICAzICBEYXJpbyBCaW5hY2NoaQogICAgIDMg
IEZyYW5jb2lzIFBlcnJhZAogICAgIDMgIEouIE5ldXNjaMOkZmVyCiAgICAgMiAgQWRyaWFuIFBl
cmV6IGRlIENhc3RybwogICAgIDIgIEJhcnVjaCBTaWFjaAogICAgIDIgIEdpdWxpbyBCZW5ldHRp
CiAgICAgMiAgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvCiAgICAgMiAgTWljaGFlbCBOb3N0aG9m
ZgogICAgIDEgIEFsZWtzYW5kciBNYWthcm92CiAgICAgMSAgRGFub21pIE1hbmNoZWdvCiAgICAg
MSAgRG1pdHJ5IENoZXN0bnlraAogICAgIDEgIEV0aWVubmUgQ2FycmllcmUKICAgICAxICBGaW9u
YSBLbHV0ZSAoV0lXQSkKICAgICAxICBGbMOhdmlvIFRhcGFqw7NzCiAgICAgMSAgRnJlZCBMZWZy
YW5jCiAgICAgMSAgR2VybyBTY2h3w6RyaWNrZQogICAgIDEgIEphbWVzIEtuaWdodAogICAgIDEg
IEpvYWNoaW0gV2liZXJnCiAgICAgMSAgS2lsaWFuIFppbm5lY2tlcgogICAgIDEgIE1hcnRpbiBX
ZXR0ZXJ3YWxkCiAgICAgMSAgTmVhbCBGcmFnZXIKICAgICAxICBQZXRlciBLb3JzZ2FhcmQKICAg
ICAxICBSb2JlcnQgTWFya28KICAgICAxICBTdGVmZmVuIFBlcnN2b2xkCiAgICAgMSAgVGhvbWFz
IEJvbm5lZmlsbGUKICAgICAxICBZZWdvciBZZWZyZW1vdgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
