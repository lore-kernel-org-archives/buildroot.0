Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D84FCDB474
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 07:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26E1400DD;
	Mon, 16 Oct 2023 07:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26E1400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvqytMj0PCUQ; Mon, 16 Oct 2023 07:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA1034036F;
	Mon, 16 Oct 2023 07:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA1034036F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC5EB1BF340
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 07:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5500611C8
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 07:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5500611C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCHmYjBsZlTI for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 07:32:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39EAE611C5
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 07:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EAE611C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3640160007
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 07:32:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qsI55-009G0E-7v
 for buildroot@buildroot.org; Mon, 16 Oct 2023 09:32:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 09:32:03 +0200
Message-ID: <87edhvuioc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08.2 released
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
MjMuMDguMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA4LjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDguMSByZWxlYXNlLgoKLSBEZWZjb25maWdzOiBGcmVlc2NhbGUgQVJNOiBBZGQgQVRGIHBhdGNo
IHRvIGZpeCBidWlsZCBpc3N1ZSB3aXRoCiAgYmludXRpbHMgMi4zOSsuICBRRU1VIEFhcmNoNjQt
dmlydDogRW5hYmxlIEFDUEkgc3VwcG9ydCBmb3IKICBFREsyLiBWaXNpb25maXZlMjogQnVtcCBr
ZXJuZWwgdG8gZml4IGJ1aWxkIGlzc3VlIHdpdGggR0NDIDEzLgoKLSBQZXItcGFja2FnZSBidWls
ZHM6IERvIG5vdCB1c2UgaGFyZCBsaW5rcyBmb3IgaG9zdCAvIHRhcmdldCBkaXJzLAogIGZpeGlu
ZyBpc3N1ZXMgd2l0aCBwYWNrYWdlIHJlYnVpbGRzIG9yIHBvc3QtYnVpbGQgc2NyaXB0cwogIG1v
ZGlmaWNhdGlvbnMuCgotIEluZnJhc3RydWN0dXJlOiBFeHBsaWNpdGx5IGRpc2FibGUgc2h1ZmZs
ZSBtb2RlIGZvciBNYWtlID49IDQuNCB3aGVyZQogIG5lZWRlZC4KCi0gVXJhbmRvbS1zY3JpcHRz
OiBNb3ZlIHNlZWRybmcgaW5pdCBzY3JpcHQgdG8gUzAxIGZvciBlYXJsaWVyIHJhbmRvbQogIG51
bWJlciBlbnRyb3BoeSBpbml0aWFsaXphdGlvbi4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpbmQs
IGN1cHMsIGVubGlnaHRlbm1lbnQsIGV4aW0sIGdsaWJjLAogIGdzdDEtcGx1Z2lucy1iYXNlLCBn
c3QxLXBsdWdpbnMtZ29vZCwgZ3N0MS1wbHVnaW5zLWJhZCwKICBnc3QxLXBsdWdpbnMtdWdseSwg
Z28sIGxpYmN1ZSwgbGliY3VybCwgbGliZmFzdGpzb24sIGxpYnJzdmcsIGxpYnZweCwKICBsaWJ5
YW5nLCBtYmVkdGxzLCBuZXRzbm1wLCBzYW1iYTQsIHN1cmljYXRhLCB0YXIKCi0gRml4ZXMgZm9y
IGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4KICBhdDkxYm9v
dHN0cmFwLCBiYXRtYW4tYWR2LCBlZmwsIGdudS1lZmksIGdzdC1vbXgsIGdzdDEtZGV2dG9vbHMs
CiAgZ3N0MS1saWJhdiwgZ3N0MS1weXRob24sIGdzdDEtcnRzcC1zZXJ2ZXIsIGdzdDEtcnRzcC12
YWFwaSwKICBnc3RyZWFtZXIxLCBnc3RyZWFtZXIxLWVkaXRpbmctc2VydmljZXMsIGdvLCBncHRm
ZGlzaywgZ3J1YjIsIGd0a21tMywKICBsaWJodHAsIGxpYm1vZHBsdWcsIGxpbnV4LXBhbSwgbGlu
dXgtdG9vbHMsIG1vc3F1aXR0bywgbXV0dCwgbmVvbiwKICBubWFwLCBub2RlanMsIG9sc3IsIG9w
ZW5ibGFzLCBvcGtnLXV0aWxzLCBwaHAsIHBvdW5kLCBwb3dlcnRvcCwKICBweXRob24tbWFrbywg
cHl0aG9uMywgcmF1Yywgcm9ja2NoaXAtbWFsaSwgc3NsaCwgc3RyZXNzLW5nLCBzeXNsb2ctbmcs
CiAgc3lzdGVtZCwgdW5pZmRlZiwgdXJhbmRvbS1zY3JpcHRzLCB1c2JndWFyZCwgd2Via2l0Z3Rr
LCB3aWxjLWRyaXZlciwKICB3aXJlbGVzcy1yZWdkYiwgd3Bld2Via2l0CgpGb3IgbW9yZSBkZXRh
aWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVp
bGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMy4wOC4yCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQg
cGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtz
IHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjMuMDguMS4uCgogICAgMjIgIFBldGVyIEtvcnNnYWFyZAogICAgMTggIEZh
YnJpY2UgRm9udGFpbmUKICAgIDExICBCZXJuZCBLdWhscwogICAgIDUgIFlhbm4gRS4gTU9SSU4K
ICAgICA0ICBEYW5pZWwgTGFuZwogICAgIDMgIEJyYW5kb24gTWFpZXIKICAgICAzICBGcmFuY29p
cyBQZXJyYWQKICAgICAyICBBZGFtIER1c2tldHQKICAgICAyICBKZW5zIE1hdXMKICAgICAyICBS
b21haW4gTmFvdXIKICAgICAyICBUaG9tYXMgRGV2b29nZHQKICAgICAyICBUaG9tYXMgUGV0YXp6
b25pCiAgICAgMSAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAxICBCZW4gRG9va3MKICAgICAx
ICBCZW4gV29sc2llZmZlcgogICAgIDEgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMSAgR2HDq2wg
UE9SVEFZCiAgICAgMSAgR2l1bGlvIEJlbmV0dGkKICAgICAxICBHbGViIE1hem92ZXRza2l5CiAg
ICAgMSAgSGVydmUgQ29kaW5hCiAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAxICBKYW4gxIxl
cm3DoWsKICAgICAxICBKdWxpZW4gT2xpdmFpbgogICAgIDEgIEtvcnkgTWFpbmNlbnQKICAgICAx
ICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBTZWJhc3RpYW4gV2V5ZXIKICAgICAxICBXYWxkZW1h
ciBCcm9ka29yYgogICAgIDEgIFl1IENoaWVuIFBldGVyIExpbgoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
