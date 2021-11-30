Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 19:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1536760788;
	Tue, 30 Nov 2021 19:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9R6MfdUTmfcD; Tue, 30 Nov 2021 19:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9916072D;
	Tue, 30 Nov 2021 19:13:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2ABC1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 19:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9D7C401EF
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 19:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gr31dFi6jkGt for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 19:12:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BCFC40187
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 19:12:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5659F200003
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 19:12:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1ms8Yf-0001Wu-HM
 for buildroot@buildroot.org; Tue, 30 Nov 2021 20:12:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 20:12:53 +0100
Message-ID: <878rx5foei.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.11-rc3 released
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

SGksCgpCdWlsZHJvb3QgMjAyMS4xMS1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMS4xMS1yYzMu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIx
LjExLXJjMy50YXIuYnoyCgpPciBnZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290
Lm5ldC9idWlsZHJvb3QKCkFub3RoZXIgMiB3ZWVrcywgYW5vdGhlciByZWxlYXNlIGNhbmRpZGF0
ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBwcm9ibGVtcyB0byB0aGUg
bWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0byB0aGUgcGVvcGxlIGNv
bnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjEuMTEtcmMy
Li4KCiAgICA1NyAgRmFicmljZSBGb250YWluZQogICAgIDMgIFlhbm4gRS4gTU9SSU4KICAgICAy
ICBQZXRlciBLb3JzZ2FhcmQKICAgICAyICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEgIEJl
cm5kIEt1aGxzCiAgICAgMSAgRnJhbmNvaXMgUGVycmFkCiAgICAgMSAgR2FyeSBCaXNzb24KICAg
ICAxICBHd2VuaGFlbCBHb2F2ZWMtTWVyb3UKICAgICAxICBKb2FjaGltIFdpYmVyZwogICAgIDEg
IEx1Y2EgQ2VyZXNvbGkKICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBUaXRvdWFuIENo
cmlzdG9waGUKICAgICAxICBVcmphIFJhbm5pa2tvCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhl
IENIQU5HRVMgZmlsZToKCmh0dHA6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4v
Q0hBTkdFUz9pZD0yMDIxLjExLXJjMwoKQW5kIGV4cGVjdCB0aGUgZmluYWwgMjAyMS4xMSByZWxl
YXNlIGluIGEgZmV3IGRheXMuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
