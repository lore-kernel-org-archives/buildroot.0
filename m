Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F29C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3089D419A2;
	Wed,  1 Mar 2023 21:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3089D419A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfPZCPVCHR6j; Wed,  1 Mar 2023 21:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23ABF419A3;
	Wed,  1 Mar 2023 21:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23ABF419A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313D51BF357
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 182E281E86
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 21:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182E281E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpkyYoeoFuPJ for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 21:40:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8646181E83
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8646181E83
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 21:40:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 782CF40002
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 21:40:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pXUBo-00BxIx-D0
 for buildroot@buildroot.org; Wed, 01 Mar 2023 22:40:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 01 Mar 2023 22:40:44 +0100
Message-ID: <87cz5sf8v7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.10 released
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
MjIuMDIuMTAgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4wMi4xMC50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjIuMDIuMTAudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxk
cm9vdCAyMDIyLjAyLjEwIGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0
ZXJtCnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxh
dGVkIGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIyLjAyLjkgcmVsZWFzZS4KCi0gRml4
IG1ha2UgTz0uLi5fZGVmY29uZmlnIGJ1aWxkcyAocmVncmVzc2lvbiBpbiAyMDIyLjAyLjkpLgoK
LSBBIG51bWJlciBvZiBhZGRpdGlvbmFsL3N0cmljdGVyIGNoZWNrcyBoYXZlIGJlZW4gYWRkZWQg
dG8KICAuL3V0aWxzL2NoZWNrLXBhY2thZ2UuCgotIEJ1aWxkIGhvc3QgZGVwZW5kZW5jaWVzIGNo
ZWNrIGV4dGVuZGVkIHRvIGNoZWNrIGZvciBhIG51bWJlciBvZgogIHNwZWNpZmljIHBlcmwgbW9k
dWxlcyB0byBiZXR0ZXIgaGFuZGxlIGRpc3RyaWJ1dGlvbnMgKGxpa2UgRmVkb3JhKQogIHdpdGgg
dmVyeSBmaW5lIGdyYWluZWQgcGVybCBwYWNrYWdlcy4gQWxzbyBlbnN1cmUgYnVpbGQgaG9zdCBo
YXMKICBnaXQgPj0gMi4wLjAgd2hlbiB1c2luZyBwYWNrYWdlcyB3cml0dGVuIGluIGdvL3J1c3Qg
YmVjYXVzZSB0aGUKICB2ZW5kb3JpbmcgbWF5IG5lZWQgaXQuCgotIERlZmNvbmZpZ3M6IEFTVVMg
dGlua2VyIHJrMzI4ODogRml4IGJvb3QgaXNzdWUgcmVsYXRlZCB0byBUUEwKCi0gU2VjdXJpdHkg
Zml4ZXMgZm9yIGFwYWNoZSwgYy1hcmVzLCBmcmVlc3dpdGNoLCBnaXQsIGxpYmdpdDIsCiAgbGli
b3BlbnNzbCwgbHhjLCBtb2RzZWN1cml0eTIsIG9wdXNmaWxlLCBweXRob24tZnV0dXJlLCBzZGwy
LCBzdWRvLAogIHVweCwgdmltLCB3ZWJraXRndGssIHdwZXdlYmtpdCwgeGxpYl9saWJYcG0sIHhz
ZXJ2ZXJfeG9yZy1zZXJ2ZXIKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRp
bWUvbGljZW5zZSBpc3N1ZXMgaW4gYWZib290LXN0bTMyLAogIGJhcmVib3gsIGVsZjJmbHQsIGdj
Yywga29kaSwgbGlia3MsIGxpdmU1NTUsIGx1YSwgbWVzYTNkLWhlYWRlcnMsCiAgbmV0b3BlZXIy
LCBvcGVuamRrLCBvcGVucG93ZXJsaW5rLCBvcGVudnBuLCBwb3N0Z3Jlc3FsLCBwdWdpeG1sLCBx
dDUsCiAgc29maWEtc2lwLCBzc2RwLXJlc3BvbmRlciwgc3VueGktbWFsaS11dGdhcmQsIHRpLXNn
eC1rbSwgdG11eCwgdWJvb3QsCiAgd29sZnNzbCwgeHhoYXNoLCB4eiwgeWFqbCwgemFiYml4CgpG
b3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxk
cm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4wMi4xMAoKVXNlcnMgb2Yg
dGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUu
CgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxl
YXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIyLjAyLjkuLgoKICAgIDIxICBSaWNhcmRvIE1hcnRp
bmNvc2tpCiAgICAxOCAgRmFicmljZSBGb250YWluZQogICAgMTYgIFBldGVyIEtvcnNnYWFyZAog
ICAgMTMgIEJlcm5kIEt1aGxzCiAgICAgNiAgVGhvbWFzIFBldGF6em9uaQogICAgIDUgIEFkcmlh
biBQZXJleiBkZSBDYXN0cm8KICAgICA1ICBOaWNvbGFzIENhdmFsbGFyaQogICAgIDQgIEdpdWxp
byBCZW5ldHRpCiAgICAgMyAgSm9hY2hpbSBXaWJlcmcKICAgICAyICBBcm5vdXQgVmFuZGVjYXBw
ZWxsZQogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIFZpbmNlbnQgRmF6aW8KICAgICAy
ICBZYW5uIEUuIE1PUklOCiAgICAgMSAgQW5kcsOpIFp3aW5nCiAgICAgMSAgQmVuIEh1dGNoaW5n
cwogICAgIDEgIENhc2V5IFJlZXZlcwogICAgIDEgIEZyYW5rIFZhbmJldmVyCiAgICAgMSAgTmlr
bGFzIENhc3NlbAogICAgIDEgIFBldGVyIFNlaWRlcmVyCiAgICAgMSAgU2VyZ2V5IE9yZ2Fub3YK
ICAgICAxICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEgIFRob21hcyBEZXZvb2dkdAogICAg
IDEgIFlhaXIgQmVuLUF2cmFoYW0KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
