Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF5C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 16:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9BA419CA;
	Mon, 15 Jan 2024 16:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C9BA419CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3nKowqGQlsz; Mon, 15 Jan 2024 16:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D04419B8;
	Mon, 15 Jan 2024 16:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D04419B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B98021BF370
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 916B5419B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 916B5419B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFPylh8pMr5a for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 16:04:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0741F419B3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 16:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0741F419B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2426520005
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 16:04:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rPPRh-00EiYA-1z
 for buildroot@buildroot.org; Mon, 15 Jan 2024 17:04:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 17:04:17 +0100
Message-ID: <87cyu2k2gu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.11.1 released
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
MjMuMTEuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjExLjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjExLjEgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MTEgcmVsZWFzZS4KCi0gSW5mcmFzdHJ1Y3R1cmU6CgogIC0gRG93bmxvYWQ6IFJldmVydCBhIHBl
cm1pc3Npb24gZml4dXAgc3RlcCBpbiB0aGUgdGFyYmFsbAogICAgY3JlYXRpb24gbG9naWMsIHdo
aWNoIGxlYWQgdG8gYSBoYXNoIG1pc21hdGNoIGlzc3VlIGluIHR3bwogICAgY2FyZ28tdmVuZG9y
ZWQgcGFja2FnZXMsIHJpcGdyZXAgYW5kIHNlbnRyeS1jbGkuCgogIC0gQnVpbGQ6IFBhc3MgR0lU
X0RJUj0uIGluIHRoZSBlbnZpcm9ubWVudCAodGhyb3VnaAogICAgSE9TVF9NQUtFX0VOVi9UQVJH
RVRfTUFLRV9FTlYpIHRvIHRoZSBidWlsZCBzdGVwcyB0bwogICAgd29ya2Fyb3VuZCBwYWNrYWdl
cyB0cnlpbmcgdG8gZGV0ZWN0IGlmIHRoZXkgYXJlIGJ1aWxkaW5nIGluCiAgICBhIGdpdCBjaGVj
a291dCBhbmQgZ2V0dGluZyBjb25mdXNlZCB3aGVuIGJ1aWxkaW5nIGluIGEgc3ViCiAgICBkaXJl
Y3Rvcnkgb2YgYSBCdWlsZHJvb3QgZ2l0IGNoZWNrb3V0LgoKLSBTZWN1cml0eSBmaXhlcyBmb3Ig
Y2pzb24sIGRyb3BiZWFyLCBleGltLCBmYWFkMiwgZnJlZXN3aXRjaCwgZ2lmbGliLAogIGdvLCBn
c3QxLXBsdWdpbnMtYmFkLCBqcSwga3NtYmQtdG9vbHMsIGxpYmN1cmwsIGxpYmRlMjY1LCBsaWJl
Ym1sLAogIGxpYmhlaWYsIGxpYnNzaCwgbGlic3NoMiwgbGlidWV2LCBtaWNyb3B5dGhvbiwgbXA0
djIsIG9wZW5zYywgb3BlbnNzaCwgcGhwLAogIHByb2Z0cGQsIHB1dHR5LCBweXRob24td2Vya3pl
dWcsIHNoaW0sIHNxdWlkLCBzdHJvbmdzd2FuLCB0aW55c3NoLAogIHRvciwgdWZ0cCwgd2lyZXNo
YXJrLCB3b2xmc3NsLCB4c2VydmVyX3hvcmctc2VydmVyLCB4d2F5bGFuZAoKLSBGaXhlcyBmb3Ig
ZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhcGN1cHNkLAog
IGFybS10cnVzdGVkLWZpcm13YXJlLCBib3RhbiwgY3JpdSwgY3J5cHRvZGV2LWxpbnV4LCBjdXBz
LCBkYWhkaS1saW51eCwKICBkYWhkaS10b29scywgZGJ1cywgZG9ja2VyLCBkdWt0YXBlLCBlZGsy
LCBlcmxhbmcsIGdjYywgZ2RhbCwgZ2RiLAogIGdsaWJjLCBnbnVwbG90LCBnbnV0bHMsIGdvLCBn
b29nbGUtYnJlYWtwYWQsIGdzdC1vbXgsIGdzdGQsCiAgZ3N0MS1kZXZ0b29scywgZ3N0MS1saWJh
diwgZ3N0MS1wbHVnaW5zLWJhZCwgZ3N0MS1wbHVnaW5zLWJhc2UsCiAgZ3N0MS1wbHVnaW5zLWdv
b2QsIGdzdDEtcGx1Z2lucy11Z2x5LCBnc3QxLXB5dGhvbiwgZ3N0MS1ydHNwLXNlcnZlciwKICBn
c3QxLXZhYXBpLCBnc3RyZWFtZXIxLCBnc3RyZWFtZXIxLWVkaXRpbmctc2VydmljZXMsIGlwY2Fs
YywKICBqc29uLWZvci1tb2Rlcm4tY3BwLCBsaWJhaW8sIGxpYmFyY2hpdmUsIGxpYmNhbWVyYSwg
bGliY2FtZXJhLWFwcHMsCiAgbGliY2FwLW5nLCBsaWJjZ3JvdXAsIGxpYmd0azMsIGxpYmllYzYx
ODUwLCBsaWJsZG5zLCBsaWJvc3RyZWUsCiAgbGlicmF3LCBsaWJzaWdzZWd2LCBsaWJ3ZWJzb2Nr
ZXRzLCBsaWJ6ZW5vaC1waWNvLCBsaXF1aWQtZHNwLCBsdm0yLAogIG1hZHBsYXksIG1lc2EzZCwg
bWljcm9weXRob24sIG1pbml6aXAsIG51c2hlbGwsIG9uZXZwbC1pbnRlbC1ncHUsCiAgb3B0ZWUt
Y2xpZW50LCBvcmMsIHBpcGV3aXJlLCBwb3N0Z2lzLCBwb3N0Z3Jlc3FsLCBweXRob24tYnJvdGxp
LAogIHB5dGhvbi1weXNlbnNvcnMsIHB5dGhvbi1zaXAsIHJuZy10b29scywgc3dheSwgdHJhbnNt
aXNzaW9uLCB0cmVlLAogIHVkZXYsIHZhbGlqc29uLCB3bHJvb3RzLCB4d2F5bGFuZAoKRm9yIG1v
cmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjMuMTEuMQoKVXNlcnMgb2YgdGhlIGFm
ZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55
IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoK
Z2l0IHNob3J0bG9nIC1zbiAyMDIzLjExLi4KCiAgICA2MyAgRmFicmljZSBGb250YWluZQogICAg
MzkgIFBldGVyIEtvcnNnYWFyZAogICAgMTUgIEJlcm5kIEt1aGxzCiAgICAxMyAgQWRhbSBEdXNr
ZXR0CiAgICAgOSAgVGhvbWFzIFBldGF6em9uaQogICAgIDQgIFBldGVyIFNlaWRlcmVyCiAgICAg
MyAgQmFydWNoIFNpYWNoCiAgICAgMyAgQ2hyaXN0aWFuIFN0ZXdhcnQKICAgICAzICBSb21haW4g
TmFvdXIKICAgICAzICBZYW5uIEUuIE1PUklOCiAgICAgMiAgQWxleGV5IEJyb2RraW4KICAgICAy
ICBDaHJpc3RpYW4gSGl0egogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIEtpbGlhbiBa
aW5uZWNrZXIKICAgICAyICBNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMSAgR2l1bGlvIEJlbmV0dGkK
ICAgICAxICBKYW1lcyBIaWxsaWFyZAogICAgIDEgIEp1bGllbiBPbGl2YWluCiAgICAgMSAgTG91
aXMgQ2hhdXZldAogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIE5lYWwgRnJhZ2VyCiAg
ICAgMSAgUmFsZiBEcmFnb24KICAgICAxICBTZWJhc3RpYW4gQmF1ZXIKICAgICAxICBTw6liYXN0
aWVuIFN6eW1hbnNraQogICAgIDEgIFRob21hcyBEZXZvb2dkdAoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
