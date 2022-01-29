Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274A4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 19:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD3640309;
	Sat, 29 Jan 2022 19:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocWJj4MH4xcb; Sat, 29 Jan 2022 19:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24A140302;
	Sat, 29 Jan 2022 19:14:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0771BF3DC
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F908249E
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uceJiBUOr8v for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 19:14:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB6438247F
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 19:14:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9CACE20004
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 19:14:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1nDtBF-0006cK-LD
 for buildroot@buildroot.org; Sat, 29 Jan 2022 20:14:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 20:14:37 +0100
Message-ID: <87ee4q2w2q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.9 released
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
MjEuMDIuOSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjkudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjkudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi45IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjggcmVsZWFzZS4KCi0gRGVmY29u
ZmlnczogQmVhZ2xlYm9uZTogU3VwcG9ydCBCZWFnbGVCb25lIGJsYWNrIHdpcmVsZXNzCgotIFNl
Y3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGNsYW1hdiwgZG9ja2VyLWNvbnRhaW5lcmQsIGV4cGF0
LAogIGZyZWVzd2l0Y2gsIGdob3N0c2NyaXB0LCBnbnVjaGVzcywgZ28sIGphbnVzLWdhdGV3YXks
IGtlZXBhbGl2ZWQsCiAgbGFwYWNrLCBsaWJqcGVnLCBsaWJwanNpcCwgbGlidXJpcGFyc2VyLCBt
YmVkdGxzLCBtb25nb2RiLCBub2RlanMsCiAgb3BlbmJsYXMsIHBvbGtpdCwgcHJpdm94eSwgcHJv
c29keSwgcHl0aG9uLWRqYW5nbywgcHl0aG9uLWx4bWwsCiAgcXQ1YmFzZSwgcnVieSwgcnVuYywg
dGFyZ2V0Y2xpLWZiLCB0Y3ByZXBsYXksIHRpbnl4bWwsIHZpbSwgd2lyZXNoYXJrLAogIHhlbiwg
eHNlcnZlcl94b3JnLXNlcnZlcgoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVu
dGltZS9saWNlbnNlIGlzc3VlcyBpbiBhbHNhLXV0aWxzLAogIGNhZ2UsIGNhcG5wcm90bywgY2l2
ZXR3ZWIsIGNvbm5tYW4sIGNvcmV1dGlscywgZGF2MWQsIGRvY2tlci1jbGksCiAgZG9ja2VyLWVu
Z2luZSwgZmxhcmUtZW5naW5lLCBmbGFyZS1nYW1lLCBmb250LWF3ZXNvbWUsIGdjYywgZ3JwYywK
ICBnc3QxLWludGVycGlwZSwgZ3N0MS1ydHNwLXNlcnZlciwgZ3VwbnAtdG9vbHMsIGhhY2tyZiwg
aWN1LAogIGltYWdlbWFnaWNrLCBsaWJvcGVuc3NsLCBsaW51eC1wYW0sIGx4YywgbXBkLW1wYywg
cGNyZTIsIHB5dGhvbi1weXF0NSwKICBweXRob24zLCBxdDVsb2NhdGlvbiwgcmhhc2gsIHNhbWJh
NCwgdmxjLCB4YXBwX3hhdXRoLCB4bGliX2xpYlgxMQoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRo
ZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFp
bi9DSEFOR0VTP2lkPTIwMjEuMDIuOQoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFy
ZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhl
IHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAy
MDIxLjAyLjguLgoKICAgIDU3ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAxNCAgUGV0ZXIgS29yc2dh
YXJkCiAgICAxMSAgQmVybmQgS3VobHMKICAgICA3ICBUaG9tYXMgUGV0YXp6b25pCiAgICAgNiAg
UGV0ZXIgU2VpZGVyZXIKICAgICA1ICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDMgIEZyYW5jb2lz
IFBlcnJhZAogICAgIDIgIEFkYW0gRHVza2V0dAogICAgIDIgIEFuZHJlYXMgWmllZ2xlcgogICAg
IDIgIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkKICAgICAyICBKYW1lcyBI
aWxsaWFyZAogICAgIDIgIFJpY2FyZG8gTWFydGluY29za2kKICAgICAyICBSb21haW4gTmFvdXIK
ICAgICAyICBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZQogICAgIDIgIFlhbm4gRS4gTU9SSU4KICAg
ICAxICBBbnNzaSBIYW5udWxhCiAgICAgMSAgQ3lyaWwgQnVyCiAgICAgMSAgRGFyaW8gQmluYWNj
aGkKICAgICAxICBGbG9yZW50IEFVTUFJVFJFCiAgICAgMSAgR2l1bGlvIEJlbmV0dGkKICAgICAx
ICBHcmVnb3J5IENMRU1FTlQKICAgICAxICBLaG9hIEhvYW5nCiAgICAgMSAgTWF4IEZpbGlwcG92
CiAgICAgMSAgTWF4aW1lIENoZXZhbGxpZXIKICAgICAxICBOdW5vIEdvbsOnYWx2ZXMKICAgICAx
ICBRdWVudGluIFNjaHVsegogICAgIDEgIFNhbnRvc2ggTXVsdGhhbGxpCiAgICAgMSAgWWVnb3Ig
WWVmcmVtb3YKICAgICAxICBZdW5oYW8gVGlhbgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
