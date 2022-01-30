Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D9FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 09:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7D9405CE;
	Sun, 30 Jan 2022 09:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehgynsB0jRnR; Sun, 30 Jan 2022 09:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E41AD405AA;
	Sun, 30 Jan 2022 09:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB2411BF2BF
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 938AF82A87
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 09:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7iCSR5cu1S9 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 09:45:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 303A882A7F
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:45:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CADB100002
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:45:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1nE6mL-0006SY-9X
 for buildroot@buildroot.org; Sun, 30 Jan 2022 10:45:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 10:45:49 +0100
Message-ID: <87a6fd36b6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.11.1 released
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
MjEuMDguMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIxLjExLjEgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjEu
MTEgcmVsZWFzZS4KCi0gRGVmY29uZmlnczogQmVhZ2xlYm9uZTogU3VwcG9ydCBCZWFnbGVCb25l
IGJsYWNrIHdpcmVsZXNzLAogIHN0bTMyZjQ2OV94aXBfZGlzY286IEZpeCBrZXJuZWwgYm9vdAoK
LSBTZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hlLCBjbGFtYXYsIGNvbnRhaW5lcmQsIGV4cGF0LCBm
cmVlc3dpdGNoLAogIGdob3N0c2NyaXB0LCBnbnVjaGVzcywgZ28sIGphbnVzLWdhdGV3YXksIGtl
ZXBhbGl2ZWQsIGxhcGFjaywgbGlianBlZywKICBsaWJwanNpcCwgbGlidXJpcGFyc2VyLCBtYmVk
dGxzLCBtb25nb2RiLCBub2RlanMsIG9wZW5ibGFzLCBwb2xraXQsCiAgcHJpdm94eSwgcHJvc29k
eSwgcHl0aG9uLWRqYW5nbywgcHl0aG9uLWx4bWwsIHF0NWJhc2UsIHJ1YnksIHJ1bmMsCiAgdGFy
Z2V0Y2xpLWZiLCB0Y3ByZXBsYXksIHRpbnl4bWwsIHZpbSwgd2lyZXNoYXJrLCB4ZW4sCiAgeHNl
cnZlcl94b3JnLXNlcnZlcgoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGlt
ZS9saWNlbnNlIGlzc3VlcyBpbiBhbHNhLXV0aWxzLAogIGJpbnV0aWxzLCBjYWdlLCBjYXBucHJv
dG8sIGNpdmV0d2ViLCBjb25ubWFuLCBjb3JldXRpbHMsIGRhdjFkLAogIGRvY2tlci1jbGksIGRv
Y2tlci1lbmdpbmUsIGVybGFuZywgZXJsYW5nLXJlYmFyLCBmaW5kdXRpbHMsCiAgZmxhcmUtZW5n
aW5lLCBmbGFyZS1nYW1lLCBmb250LWF3ZXNvbWUsIGdjYywgZ2xpYmMsIGdycGMsCiAgZ3N0MS1y
dHNwLXNlcnZlciwgZ3N0MS1pbnRlcnBpcGUsIGd1cG5wLXRvb2xzLCBoYWNrcmYsIGljdSwKICBp
bWFnZW1hZ2ljaywganNvbi1mb3ItbW9kZXJuLWNwcCwgbGliZGJpLCBsaWJpaW8sIGxpYm1iaW0s
IGxpYm5zcywKICBsaWJvcGVuc3NsLCBsaWJxbWksIGxpYnZpcnQsIGxpbnV4LXBhbSwgbHhjLCBt
ZW5kZXIsIG1wZC1tcGMsIG11dHQsCiAgcGNyZTIsIHBocCwgcGlwZXdpcmUsIHB5dGhvbi1weXF0
NSwgcHl0aG9uLXJlcXVlc3RzLCBweXRob24zLAogIHF0NWxvY2F0aW9uLCByaGFzaCwgcm5nLXRv
b2xzLCBydXN0Yywgc2FtYmE0LCB0b3IsIHRwbTItdHNzLAogIHV0aWwtbGludXgtbGlicywgdmxj
LCB4YXBwX3hhdXRoLCB4ZW5vbWFpLCB4bGliX2xpYlgxMQoKRm9yIG1vcmUgZGV0YWlscywgc2Vl
IHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9w
bGFpbi9DSEFOR0VTP2lkPTIwMjEuMTEuMQoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2Vz
IGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwg
dGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1z
biAyMDIxLjExLi4KCiAgICA3MyAgRmFicmljZSBGb250YWluZQogICAgMTQgIFRob21hcyBQZXRh
enpvbmkKICAgIDEyICBQZXRlciBLb3JzZ2FhcmQKICAgIDEwICBCZXJuZCBLdWhscwogICAgIDcg
IENocmlzdGlhbiBTdGV3YXJ0CiAgICAgNiAgSmFtZXMgSGlsbGlhcmQKICAgICA1ICBQZXRlciBT
ZWlkZXJlcgogICAgIDQgIEFkYW0gRHVza2V0dAogICAgIDMgIEZhYmlvIEVzdGV2YW0KICAgICAz
ICBHaXVsaW8gQmVuZXR0aQogICAgIDMgIFJvbWFpbiBOYW91cgogICAgIDMgIFlhbm4gRS4gTU9S
SU4KICAgICAyICBBbmRyZWFzIFppZWdsZXIKICAgICAyICBBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpCiAgICAgMiAgRGFyaW8gQmluYWNjaGkKICAgICAyICBGcmFuY29pcyBQ
ZXJyYWQKICAgICAyICBSaWNhcmRvIE1hcnRpbmNvc2tpCiAgICAgMSAgQW5zc2kgSGFubnVsYQog
ICAgIDEgIEN5cmlsIEJ1cgogICAgIDEgIEVyaWsgTGFyc3NvbgogICAgIDEgIEZsb3JlbnQgQVVN
QUlUUkUKICAgICAxICBHcmVnb3J5IENMRU1FTlQKICAgICAxICBLaG9hIEhvYW5nCiAgICAgMSAg
TG90aGFyIEZlbHRlbgogICAgIDEgIE1hcmt1cyBNYXllcgogICAgIDEgIE1heCBGaWxpcHBvdgog
ICAgIDEgIE1heGltZSBDaGV2YWxsaWVyCiAgICAgMSAgTWljaGFlbCBOb3N0aG9mZgogICAgIDEg
IE51bm8gR29uw6dhbHZlcwogICAgIDEgIFF1ZW50aW4gU2NodWx6CiAgICAgMSAgU2FudG9zaCBN
dWx0aGFsbGkKICAgICAxICBUSUFOIFl1YW5oYW8KICAgICAxICBUaWxtYW4gS2Vza2luw7Z6CiAg
ICAgMSAgV2FsZGVtYXIgQnJvZGtvcmIKICAgICAxICBZZWdvciBZZWZyZW1vdgogICAgIDEgIFl1
bmhhbyBUaWFuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
