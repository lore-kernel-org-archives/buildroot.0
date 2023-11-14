Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A78C4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 17:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D2C613B3;
	Tue, 14 Nov 2023 17:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D2C613B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEE3kiLvpx09; Tue, 14 Nov 2023 17:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208196120D;
	Tue, 14 Nov 2023 17:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 208196120D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD21D1BF339
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9686F6120D
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 17:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9686F6120D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjLu-DN4Jpya for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 17:48:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F79F60E97
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 17:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F79F60E97
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7DD2240004
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 17:48:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2xWs-00CNeg-2l
 for buildroot@buildroot.org; Tue, 14 Nov 2023 18:48:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 18:48:50 +0100
Message-ID: <87h6locjjx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08.3 released
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
MjMuMDguMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA4LjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDguMiByZWxlYXNlLgoKLSBQZXItcGFja2FnZSBidWlsZHM6IFVuYnJlYWsgU0RLIHJlbG9jYXRp
b24gbG9naWMuIE9ubHkgZHJvcCB0aGUgaGFyZAogIGxpbmtzIGZvciB0aGUgZmluYWwgaG9zdCAv
IHRhcmdldCBkaXJlY3RvcnksIGZpeGluZyBhIGJ1aWxkIHRpbWUgLwogIHNpemUgcmVncmVzc2lv
biBpbiAyMDIzLjA4LjIuCgotIFBhY2thZ2VzIHdoZXJlIGEgZnJlZS1mb3JtIHZlcnNpb24vc2l0
ZSBjYW4gYmUgc3BlY2lmaWVkIChFLkcuIExpbnV4LAogIFUtQm9vdCwgLi4pIGNhbiBub3cgaGF2
ZSB0aGUgY29ycmVzcG9uZGluZyB0YXJiYWxscyBvZiB0aGVzZSBjdXN0b20KICBkb3dubG9hZHMg
Y2hlY2tlZCBieSB0aGUgZG93bmxvYWQgaW5mcmFzdHJ1Y3R1cmUgYmFzZWQgb24gLmhhc2ggZmls
ZXMKICBpbiB0aGUgZ2xvYmFsIHBhdGNoIGRpcmVjdG9yeS4gVGhlc2UgaGFzaGVzIGFyZSBvcHRp
b25hbCB1bmxlc3MKICBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTIGlzIGVuYWJsZWQu
CgogIEEgdXRpbHMvYWRkLWN1c3RvbS1oYXNoZXMgaGVscGVyIHNjcmlwdCBoYXMgYmVlbiBhZGRl
ZCB0bwogIGFzc2lzdCBpbiBtYW5hZ2luZyBzdWNoIGhhc2ggZmlsZXMuCgotIERlZmNvbmZpZ3M6
IEF2ZW5nZXI5NjogRG93bmdyYWRlIHRvIFRGLUEgdjIuNSB0byBmaXggYm9vdCBpc3N1ZSBzaW5j
ZQogIDIwMjMuMDgsIHN0bTMybXAxNTdhLWRrMSwgc3RtMzJtcDE1N2MtZGsyOiBVbmJyZWFrIFRG
LUEgYnVpbGQsCiAgc3RtMzJtcDE1N2Mtb2Rlc3NleTogVXNlIGEgZml4ZWQgVEYtQSB2ZXJzaW9u
IGZvciByZXByb2R1Y2liaWxpdHkKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGFwYWNoZSwgY2xhbWF2
LCBjdXBzLWZpbHRlcnMsIGdvLCBrc21iZC10b29scywKICBsaWJvcGVuc3NsLCBtaW5pemlwLXps
aWIsIG5naHR0cDIsIG9wZW5jdjQsIG9wZW52cG4sIHB5dGhvbi1kamFuZ28sCiAgcHl0aG9uLXVy
bGxpYjMsIHB5dGhvbi13ZWIycHksIHJhYmJpdG1xLWMsIHJlZGlzLCBzdXJpY2F0YSwgdGlmZiwg
dG9yLAogIHZpbSwgd2lyZXNoYXJrLCB3b2xmc3NsLCB4bGliX2xpYlgxMSwgeGxpYl9saWJYcG0s
IHhlbiwgemNodW5rCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xp
Y2Vuc2UgaXNzdWVzIGluCiAgYXJtLXRydXN0ZWQtZmlybXdhcmUsIGF1ZnMsIGF1ZnMtdXRpbCwg
YXp1cmUtaW90LXNkaywgY2FzeW5jLCBjanNvbiwKICBjb25tb24sIGRoY3BjZCwgZG9ja2VyLWNs
aSwgZG9ja2VyLWVuZ2luZSwgZnJlZXJhZGl1cy1zZXJ2ZXIsIGluYWR5biwKICBrdm10b29sLCBs
aWJnZW9zLCBsaWJtZGJ4LCBsaWJtZW1jYWNoZWQsIGxpYm9zbWl1bSwgbGlidG9tbWF0aCwKICBs
aWJ1cG5wLCBsaWJ6bGliLCBsaWdodG5pbmcsIGxpbnV4LXBhbSwgbHhjLCBtZW5kZXIsIG1wZCwg
bXhzbGRyLAogIG5hbm8sIG5ldHRsZSwgbmV0d29yay1tYW5hZ2VyLCBub2RlanMsIG9wZW5jdjQt
Y29udHJpYiwgb3Blbmpkay1iaW4sCiAgb3B1c2ZpbGUsIHBhaG8tbXF0dC1jLCBwYW5nbywgcGVy
bC1sd3AtcHJvdG9jb2wtaHR0cHMsIHBldGl0Ym9vdCwgcGhwLAogIHBpc3RhY2hlLCBweXRob24t
cHljcnlwdG9kb21leCwgcmVwcm9jLCByaXNjdjY0LWVsZi10b29sY2hhaW4sCiAgc2VkdXRpbCwg
c25vcnQzLCB0YXIsIHRyYWNlcm91dGUsIHdlYnNvY2tldHBwLCB4ZGctZGJ1cy1wcm94eSwgemFi
Yml4CgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0
LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMy4wOC4zCgpVc2Vy
cyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBn
cmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlz
IHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMDguMi4uCgogICAgNDkgIEZhYnJpY2Ug
Rm9udGFpbmUKICAgIDIyICBQZXRlciBLb3JzZ2FhcmQKICAgIDEwICBCZXJuZCBLdWhscwogICAg
MTAgIFlhbm4gRS4gTU9SSU4KICAgICA2ICBBZGFtIER1c2tldHQKICAgICAzICBSZXphIEFyYmFi
CiAgICAgMiAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDIgIE9sZWcgTHlvdmluCiAgICAg
MiAgU3RlZmFuIEFnbmVyCiAgICAgMiAgV29vZHJvdyBEb3VnbGFzcwogICAgIDEgIEFsZXhleSBS
b21hbm92CiAgICAgMSAgQW5kcmVhcyBaaWVnbGVyCiAgICAgMSAgQW5kcmV3IERvbm5lbGxhbgog
ICAgIDEgIEFuZ2VsbyBDb21wYWdudWNjaQogICAgIDEgIEJyYW5kb24gTWFpZXIKICAgICAxICBD
aHJpc3RpYW4gSGl0egogICAgIDEgIERhbmllbCBMYW5nCiAgICAgMSAgRmFiaWVuIFRob21hcwog
ICAgIDEgIEdpdWxpbyBCZW5ldHRpCiAgICAgMSAgSm9hY2hpbSBXaWJlcmcKICAgICAxICBLYWxw
ZXNoIFBhbmNoYWwKICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBNaWNoYWVsIE5vc3Ro
b2ZmCiAgICAgMSAgUGF1bCBDZXJjdWVpbAogICAgIDEgIFRob21hcyBQZXRhenpvbmkKICAgICAx
ICBUaXRvdWFuIENocmlzdG9waGUKICAgICAxICDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVv
bmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
