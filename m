Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7211EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D505983EDB;
	Tue, 12 Apr 2022 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5Dpjc5xX1h7; Tue, 12 Apr 2022 15:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA20183E6B;
	Tue, 12 Apr 2022 15:02:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74E0A1BF30B
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60CFC40AF8
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QV5EGX0SkFMy for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 15:02:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C120740AFA
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 15:02:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99D0B20008
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 15:02:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1neI2O-008sU6-Ld
 for buildroot@buildroot.org; Tue, 12 Apr 2022 17:02:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 17:02:36 +0200
Message-ID: <87pmlme44z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.1 released
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
MjIuMDIuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjEgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIgcmVsZWFzZS4KCi0gR3JhcGhzOiBB
bHNvIGdlbmVyYXRlIGEgYnVpbGQgdGltZSB0aW1lbGluZSBncmFwaCAoZm9yIHRvcCBsZXZlbAog
IHBhcmFsbGVsIGJ1aWxkcykuCgotIHNjcmlwdHMvcGtnLXN0YXRzOiBPcHRpbWl6ZSBtZW1vcnkg
Y29uc3VtcHRpb24gZm9yIENQRSBwYXJzaW5nCgotIEZpeCBjb21wYXRpYmlsaXR5IGlzc3VlIHdp
dGggdGhlIGZha2Vyb290IHNjcmlwdCBsb2dpYyBhbmQgbW9kZXJuCiAgdmVyc2lvbnMgb2YgZGFz
aC4KCi0gQ2hhbmdlIGdpdDovLyBVUkxzIHBvaW50aW5nIHRvIEdpdGh1YiB0byBodHRwczovLywg
bm93IHRoYXQgR2l0aHViIGhhcwogIHR1cm5lZCBvZmYgc3VwcG9ydCBmb3IgZ2l0Oi8vCgotIFNl
Y3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGFwciwgYmluZCwgY29udGFpbmVyZCwgaGFwcm94eSwK
ICBsaWJpZWM2MTg1MCwgbGlib3BlbnNzbCwgbGlicmVzc2wsIGxpYnpsaWIsIG1hdGlvLCBtaW5p
ZGxuYSwgbmJkLAogIG5ldGF0YWxrLCBvcGVudnBuLCBweXRob24tcGFyYW1pa28sIHB5dGhvbi1w
aWxsb3csIHB5dGhvbi10d2lzdGVkLAogIHF0NWJhc2UsIHJhcHRvciwgcnRsXzQzMywgdGltZXNj
YWxlZGIsIHVyYW5kb20tc2NyaXB0cywgdmltLCB3YXZwYWNrCgotIEZpeGVzIGZvciBkb3dubG9h
ZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFjZSwgYmVsciwKICBibHVl
ejVfdXRpbHMsIGJvaW5jLCBicGZ0b29sLCBidXN5Ym94LCBjbG9vcCwgY29nLCBjcHBjbXMsIGRh
djFkLAogIGRoY3AsIGRpZWhhcmRlciwgZG5zbWFzcSwgZG9ja2VyLWNsaSwgZG9ja2VyLWVuZ2lu
ZSwgZWZsLCBlbGwsCiAgZmFrZXJvb3QsIGZsYWMsIGZsdWlkc3ludGgsIGdkay1waXhidWYsIGds
aWItbmV0d29ya2luZywgZ251dGxzLAogIGdzdC1vbXgsIGdzdDEtZGV2dG9vbHMsIGdzdDEtbGli
YXYsIGdzdDEtcGx1Z2lucy1iYWQsCiAgZ3N0MS1wbHVnaW5zLWJhc2UsIGdzdDEtcGx1Z2lucy1n
b29kLCBnc3QxLXBsdWdpbnMtdWdseSwgZ3N0MS1weXRob24sCiAgZ3N0MS1ydHNwLXNlcnZlciwg
Z3N0MS12YWFwaSwgZ3N0cmVhbWVyMSwgZ3N0cmVhbWVyMS1lZGl0aW5nLXNlcnZpY2VzLAogIGh0
b3AsIGludGVsLWdtbWxpYiwgaXBtaXV0aWwsIGl3ZCwgamFjazEsIGphY2syLCBsZnRwLCBsaWJh
YnNlaWwtY3BwLAogIGxpYmJsdXJheSwgbGliY2FtZXJhLWFwcHMsIGxpYmNvYXAsIGxpYmN1cmws
IGxpYmVzdCwgbGliZ2VlLCBsaWJnbGliMiwKICBsaWJndGszLCBsaWJrcmI1LCBsaWJtaW5pdXBu
cGMsIGxpYm9kYiwgbGlib2RiLWJvb3N0LCBsaWJwMTEsIGxpYnBzbCwKICBsaWJyc3RwLCBsaWJy
dGxzZHIsIGxpYnVyaW5nLCBsaWJ5YW5nLCBsdWFzZWMsIGx4YywgbWVzb24sIG1pbml6aXAsCiAg
bXBkLCBtdG9vbHMsIG9kYiwgb3BlbmJsYXMsIG9wZW5zc2gsIG9wdGVlLW9zLCBvcHVzLCBwYWhv
LW1xdHQtYywKICBwYW5nbywgcGhwLCBwaXBld2lyZSwgcGtjczExLWhlbHBlciwgcG9zdGdyZXNx
bCwgcHBwZCwgcHJvdG96ZXJvLAogIHB5dGhvbi1haW9jb25zb2xlLCBweXRob24tYnJvdGxpLCBw
eXRob24tZ3JlZW5sZXQsIHB5dGhvbi1ycGktZ3BpbywKICBweXRob24tdHJlcSwgcHl0aG9uLXVq
c29uLCBweXRob24td2Vhc3lwcmludCwgcXQ1YmFzZSwgcXQ1d2F5bGFuZCwKICBycGktZmlybXdh
cmUsIHJwaS11c2VybGFuZCwgcnVuYywgcnVzdCwgcnlnZWwsIHNhbWJhNCwgc2hhaXJwb3J0LXN5
bmMsCiAgc3BpY2UsIHNwaWRldl90ZXN0LCBzdHVubmVsLCBzeXN0ZW1kLCB0cmFjZS1jbWQsIHRy
b3VzZXJzLAogIHRzNDkwMC1mcGdhLCB0dmhlYWRlbmQsIHVkcGNhc3QsIHVuYm91bmQsIHVwb3dl
ciwgdXNiZ3VhcmQsIHZhbGdyaW5kLAogIHZhbGlqc29uLCB3Z2V0LCB3aXJlcGx1bWJlciwgd2ly
ZXNoYXJrLCB4bXJpZywgemFiYml4LCB6bGliLW5nLAogIHp5bmFkZHNmeCwgenppcGxpYgoKRm9y
IG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjIuMDIuMQoKVXNlcnMgb2YgdGhl
IGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpN
YW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNl
OgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIyLjAyLi4KCiAgIDExMCAgRmFicmljZSBGb250YWluZQog
ICAgMjggIFBldGVyIFNlaWRlcmVyCiAgICAxMiAgSmFtZXMgSGlsbGlhcmQKICAgICA5ICBUaG9t
YXMgUGV0YXp6b25pCiAgICAgOCAgQmVybmQgS3VobHMKICAgICA4ICBQZXRlciBLb3JzZ2FhcmQK
ICAgICA1ICBGcmFuY29pcyBQZXJyYWQKICAgICA1ICBRdWVudGluIFNjaHVsegogICAgIDUgIFJv
bWFpbiBOYW91cgogICAgIDMgIEFuZ2VsbyBDb21wYWdudWNjaQogICAgIDMgIENocmlzdGlhbiBT
dGV3YXJ0CiAgICAgMiAgQW5kcmVhcyBaaWVnbGVyCiAgICAgMiAgQXJub3V0IFZhbmRlY2FwcGVs
bGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDIgIEp1bGllbiBPbGl2YWluCiAgICAgMiAgS3JpcyBC
YWhuc2VuCiAgICAgMiAgTmVhbCBGcmFnZXIKICAgICAyICBWaW5jZW50IFN0ZWhsw6kKICAgICAx
ICBDbMOpbWVudCBMw6lnZXIKICAgICAxICBKYW4gSGF2cmFuCiAgICAgMSAgSmFzb24gQS4gRG9u
ZW5mZWxkCiAgICAgMSAgSm9lbCBTdGFubGV5CiAgICAgMSAgSm9obiBLZWVwaW5nCiAgICAgMSAg
S2FtZWwgQm91aGFyYQogICAgIDEgIEt5bGUgSGFyZGluZwogICAgIDEgIE1hcmt1cyBNYXllcgog
ICAgIDEgIE1hdGhpZXUgTWlybW9udAogICAgIDEgIE1pcnphIEthcGV0YW5vdmljCiAgICAgMSAg
UGV0ciBWb3JlbAogICAgIDEgIFLDqW1pIER1cmFmZm9ydAogICAgIDEgIFNhc3NlbiwgUnV0Z2Vy
CiAgICAgMSAgVGhvbWFzIEh1dGgKICAgICAxICBZYW5uIEUuIE1PUklOCiAgICAgMSAgWWFubmlj
ayBCcm9zc2VhdQogICAgIDEgIFl1bmhhbyBUaWFuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
