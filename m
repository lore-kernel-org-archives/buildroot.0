Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08B7C6FA9D
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B8160FEA;
	Wed,  1 Mar 2023 16:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B8160FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3-VVN1r8NgD; Wed,  1 Mar 2023 16:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F5160FBD;
	Wed,  1 Mar 2023 16:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F5160FBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1D2E1BF599
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8884981586
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8884981586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjL6pmSzBbay for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:44:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C8F814B8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49C8F814B8
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:44:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 866F4240002
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:44:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pXPYv-00BpZR-A4
 for buildroot@buildroot.org; Wed, 01 Mar 2023 17:44:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 01 Mar 2023 17:44:17 +0100
Message-ID: <87ilfkfmla.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.11.2 released
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
MjIuMTEuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjExLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjExLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjExLjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MTEuMSByZWxlYXNlLgoKLSBGaXggbWFrZSBPPS4uLl9kZWZjb25maWcgYnVpbGRzIChyZWdyZXNz
aW9uIGluIDIwMjIuMTEuMSkuCgotIEEgbnVtYmVyIG9mIGFkZGl0aW9uYWwvc3RyaWN0ZXIgY2hl
Y2tzIGhhdmUgYmVlbiBhZGRlZCB0bwogIC4vdXRpbHMvY2hlY2stcGFja2FnZS4KCi0gQnVpbGQg
aG9zdCBkZXBlbmRlbmNpZXMgY2hlY2sgZXh0ZW5kZWQgdG8gY2hlY2sgZm9yIGEgbnVtYmVyIG9m
CiAgc3BlY2lmaWMgcGVybCBtb2R1bGVzIHRvIGJldHRlciBoYW5kbGUgZGlzdHJpYnV0aW9ucyAo
bGlrZSBGZWRvcmEpCiAgd2l0aCB2ZXJ5IGZpbmUgZ3JhaW5lZCBwZXJsIHBhY2thZ2VzLiBBbHNv
IGVuc3VyZSBidWlsZCBob3N0IGhhcwogIGdpdCA+PSAyLjAuMCB3aGVuIHVzaW5nIHBhY2thZ2Vz
IHdyaXR0ZW4gaW4gZ28vcnVzdCBiZWNhdXNlIHRoZQogIHZlbmRvcmluZyBtYXkgbmVlZCBpdC4K
Ci0gRGVmY29uZmlnczogQVNVUyB0aW5rZXIgcmszMjg4OiBGaXggYm9vdCBpc3N1ZSByZWxhdGVk
IHRvIFRQTAoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hlLCBjLWFyZXMsIGZyZWVzd2l0Y2gs
IGdpdCwgbGliZ2l0MiwKICBsaWJvcGVuc3NsLCBsaWJyZXNzbCwgbHhjLCBtb2RzZWN1cml0eTIs
IG9wdXNmaWxlLCBweXRob24tZnV0dXJlLAogIHNkbDIsIHN1ZG8sIHVweCwgdmltLCB3ZWJraXRn
dGssIHdwZXdlYmtpdCwgeGxpYl9saWJYcG0sCiAgeHNlcnZlcl94b3JnLXNlcnZlcgoKLSBGaXhl
cyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhZmJv
b3Qtc3RtMzIsCiAgYmFyZWJveCwgZWxmMmZsdCwgZnd0cywgZ2NjLCBnZGFsLCBnaXRsYWItcnVu
bmVyLCBpcG1pdG9vbCwga29kaSwKICBsaWJrcywgbGl2ZTU1NSwgbHVhLCBtYXJpYWRiLCBtZXNh
M2QtaGVhZGVycywgbW9uZ29vc2UsIG5ldG9wZWVyMiwKICBub2RlanMsIG9wZW5qZGssIG9wZW5w
b3dlcmxpbmssIG9wZW52cG4sIHBvc3RncmVzcWwsIHByb2Z0cGQsIHB1Z2l4bWwsCiAgcHl0aG9u
LWlkbmEsIHF0NSwgcnRsODE5MmV1LCBydGw4NzIzZHMsIHNvZmlhLXNpcCwgc3NkcC1yZXNwb25k
ZXIsCiAgc3VuaXgtbWFsaS11dGdhcmQsIHRoZXJtYWxkLCB0aS1zZ3gta20sIHRtdXgsIHVib290
LCB3b2xmc3NsLCB4eGhhc2gsCiAgeHosIHlhamwsIHphYmJpeAoKRm9yIG1vcmUgZGV0YWlscywg
c2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9wbGFpbi9DSEFOR0VTP2lkPTIwMjIuMTEuMgoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2th
Z2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBh
bGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9n
IC1zbiAyMDIyLjExLjEuLgoKICAgIDIzICBSaWNhcmRvIE1hcnRpbmNvc2tpCiAgICAxOSAgRmFi
cmljZSBGb250YWluZQogICAgMTYgIFBldGVyIEtvcnNnYWFyZAogICAgMTAgIEJlcm5kIEt1aGxz
CiAgICAgNyAgR2l1bGlvIEJlbmV0dGkKICAgICA2ICBUaG9tYXMgUGV0YXp6b25pCiAgICAgNCAg
VmluY2VudCBGYXppbwogICAgIDMgIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8KICAgICAzICBGcmFu
Y29pcyBQZXJyYWQKICAgICAzICBKb2FjaGltIFdpYmVyZwogICAgIDIgIEFybm91dCBWYW5kZWNh
cHBlbGxlCiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDEgIEFuZHLDqSBad2luZwogICAgIDEg
IEJlbiBIdXRjaGluZ3MKICAgICAxICBDYXNleSBSZWV2ZXMKICAgICAxICBGcmFuayBWYW5iZXZl
cgogICAgIDEgIEp1bGllbiBPbGl2YWluCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAg
TWljaGFlbCBGaXNjaGVyCiAgICAgMSAgTmljb2xhcyBDYXZhbGxhcmkKICAgICAxICBOaWtsYXMg
Q2Fzc2VsCiAgICAgMSAgUGV0ZXIgU2VpZGVyZXIKICAgICAxICBTZXJnZXkgT3JnYW5vdgogICAg
IDEgIFPDqWJhc3RpZW4gU3p5bWFuc2tpCiAgICAgMSAgWWFpciBCZW4tQXZyYWhhbQoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
