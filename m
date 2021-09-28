Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ADDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3868361246
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3868361246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8C2281971;
	Tue, 28 Sep 2021 15:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKNFY7gGf4pw; Tue, 28 Sep 2021 15:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D92E8174C;
	Tue, 28 Sep 2021 15:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6807B1BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57CFF60AFF
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGGRBATZswms for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 15:23:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B50760777
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 15:23:22 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4B74560015;
 Tue, 28 Sep 2021 15:23:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVEww-0006ig-Fo; Tue, 28 Sep 2021 17:23:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210915211357.31028-1-ps.report@gmx.net>
Date: Tue, 28 Sep 2021 17:23:18 +0200
In-Reply-To: <20210915211357.31028-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 15 Sep 2021 23:13:57 +0200")
Message-ID: <87ee98pvvd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt5location: fix musl compile
 (pthread_getname_np)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gcHRocmVhZF9nZXRuYW1lX25wIG5vdCBhdmFpbGFibGUgd2l0aCBtdXNsIGxpYmMs
IGFkZCBwYXRjaCB0byBkaXNhYmxlCiA+ICAgdXNhZ2UgZm9yIG11c2wgKHBhdGNoIGluc3BpcmVk
L3BvcnRlZCBmcm9tIFsxXSkKCiA+IEZpeGVzOgoKID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzL2VkMzcyYTRhOGU1MGQ5ZTIwYmU1ODllZWRhNDBjOTI4ODhkNzA5
YmMKCiA+ICAgcGxhdGZvcm0vZGVmYXVsdC90aHJlYWQuY3BwOiBJbiBmdW5jdGlvbiDigJhzdGQ6
OnN0cmluZyBtYmdsOjpwbGF0Zm9ybTo6Z2V0Q3VycmVudFRocmVhZE5hbWUoKeKAmToKID4gICBw
bGF0Zm9ybS9kZWZhdWx0L3RocmVhZC5jcHA6MTQ6NTogZXJyb3I6IOKAmHB0aHJlYWRfZ2V0bmFt
ZV9ucOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJhw
dGhyZWFkX3NldG5hbWVfbnDigJk/CiA+ICAgICAgMTQgfCAgICAgcHRocmVhZF9nZXRuYW1lX25w
KHB0aHJlYWRfc2VsZigpLCBuYW1lLCBzaXplb2YobmFtZSkpOwogPiAgICAgICAgIHwgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fgogPiAgICAgICAgIHwgICAgIHB0aHJlYWRfc2V0bmFtZV9ucAoKID4g
ICAgIFsxXSBodHRwczovL2dpdGh1Yi5jb20vdm9pZC1saW51eC92b2lkLXBhY2thZ2VzL2Jsb2Iv
ZTY0ZGQ2N2Y0M2M0MDlkMmIyZGIwODIxNDA4NGU4NDJkOTJhZDYyMC9zcmNwa2dzL3F0NS9wYXRj
aGVzLzAwMTQtbXVzbC1zZXRfdGhyZWFkX25hbWVfbnAucGF0Y2gKCiA+IFNpZ25lZC1vZmYtYnk6
IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KCkNvbW1pdHRlZCB0byAyMDIxLjAy
LngsIDIwMjEuMDUueCBhbmQgMjAyMS4wOC54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
