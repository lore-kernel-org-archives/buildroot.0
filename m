Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52189C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B986784251;
	Fri, 25 Mar 2022 13:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XpVTja7HN2f; Fri, 25 Mar 2022 13:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDDF81A18;
	Fri, 25 Mar 2022 13:02:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 226231BF36C
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 13:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1061360BD6
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 13:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWhh4s-EXjUw for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 13:02:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A40860BD3
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 13:02:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B9E84005E
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 13:02:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nXja4-00BpEU-Qk
 for buildroot@buildroot.org; Fri, 25 Mar 2022 14:02:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 14:02:16 +0100
Message-ID: <87fsn6chif.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.11 released
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
MjEuMDIuMTEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMS4wMi4xMS50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjEuMDIuMTEudGFyLmJ6MgoKT3Ig
Z2V0IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWls
ZHJvb3QgMjAyMS4wMi4xMSBpcyBhIGJ1Z2ZpeCByZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcg
dGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVs
YXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyMS4wMi4xMCByZWxlYXNlLgoKLSBT
ZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hlLCBleGVtcGksIGV4cGF0LCBmbGFjLCBnbnV0bHMsIGdv
LAogIGxpYmllYzYxODUwLCBsaWJvcGVuc3NsLCBsaWJwanNpcCwgbGlicmVzc2wsIGxpYnhtbDIs
IGxpYnhzbHQsCiAgbWFyaWFkYiwgbWluaWRsbmEsIG9wZW52cG4sIHBocCwgcHl0aG9uLWlweXRo
b24sIHB5dGhvbi10d2lzdGVkLAogIHJhcHRvciwgc2FtYmE0LCB0aW1lc2NhbGVkYiwgdXRpbC1s
aW51eCwgdmltLCB3YXZwYWNrLCB3aXJlc2hhcmssCiAgd29sZnNzbCwgeHRlcm0sIHpzaAoKLSBG
aXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbgog
IGF6dXJlLWlvdC1zZGstYywgZGJ1cywgZGlyZWN0ZmIsIGRvY2tlci1lbmdpbmUsIGdkay1waXhi
dWYsIGhhcHJveHksCiAgbGliY3VybCwgbGlibWluaXVwbnBjLCBsaWJvZGIsIGxpYm9kYi1ib29z
dCwgbGlicnN2ZywgbGlic3J0cCwgbHhjLAogIG9kYiwgb3BlbmJsYXMsIG9wcm9maWxlLCBwcHBk
LCBweXRob24tdHJlcSwgcHl0aG9uLXR4ZGJ1cywKICBweXRob24tdHh0b3Jjb24sIHJwaS1maXJt
d2FyZSwgd2lyZWxlc3MtcmVnZGIsIHhzY3JlZW5zYXZlciwKCi0gUmVtb3ZlZCBwYWNrYWdlczog
cHl0aG9uLWNvaGVyZW5jZQoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6
CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIw
MjEuMDIuMTEKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5j
b3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJp
YnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMS4wMi4xMC4uCgog
ICAgMzMgIEZhYnJpY2UgRm9udGFpbmUKICAgIDE1ICBQZXRlciBLb3JzZ2FhcmQKICAgICA3ICBC
ZXJuZCBLdWhscwogICAgIDYgIE1heGltIEtvY2hldGtvdgogICAgIDUgIEZyYW5jb2lzIFBlcnJh
ZAogICAgIDUgIFRob21hcyBQZXRhenpvbmkKICAgICA0ICBQZXRlciBTZWlkZXJlcgogICAgIDIg
IEFkYW0gRHVza2V0dAogICAgIDIgIEp1bGllbiBPbGl2YWluCiAgICAgMiAgUm9tYWluIE5hb3Vy
CiAgICAgMSAgQW5kcmVpIEdoZXJnaGVzY3UKICAgICAxICBBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpCiAgICAgMSAgS2FtZWwgQm91aGFyYQogICAgIDEgIEtyaXMgQmFobnNl
bgogICAgIDEgIFNhc3NlbiwgUnV0Z2VyCiAgICAgMSAgU2ltb24gRG9wcGxlcgogICAgIDEgIFRJ
QU4gWXVhbmhhbwogICAgIDEgIFRow6lvIExlYnJ1bgogICAgIDEgIFlhbm5pY2sgQnJvc3NlYXUK
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
