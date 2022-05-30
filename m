Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56959C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F3A61243;
	Mon, 30 May 2022 21:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXFmcIGmDDnK; Mon, 30 May 2022 21:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B67C61240;
	Mon, 30 May 2022 21:40:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D13421BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B907061240
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvcr7wSTgBRy for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:40:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DB9B6123C
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:40:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86F3E240006
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:40:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nvn7b-006uGF-LC
 for buildroot@buildroot.org; Mon, 30 May 2022 23:40:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:40:19 +0200
Message-ID: <877d624s3g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.05-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyMi4wNS1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4wNS1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIy
LjA1LXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciB3ZWVrLWFuZC1hLWhhbGYsIGFub3RoZXIgcmVsZWFzZSBj
YW5kaWRhdGUuCgpQbGVhc2UgZ2l2ZSBpdCBhIHNwaW4gYW5kIHJlcG9ydCBhbnkgcHJvYmxlbXMg
dG8gdGhlIG1haWxpbmcgbGlzdCBvcgpidWcgdHJhY2tlci4gTWFueSB0aGFua3MgdG8gdGhlIHBl
b3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIy
LjA1LXJjMS4uCgogICAgMTYgIEZhYnJpY2UgRm9udGFpbmUKICAgICA2ICBKYW1lcyBIaWxsaWFy
ZAogICAgIDUgIFJvbWFpbiBOYW91cgogICAgIDMgIEJhcnVjaCBTaWFjaAogICAgIDMgIFBldGVy
IEtvcnNnYWFyZAogICAgIDIgIEdpdWxpbyBCZW5ldHRpCiAgICAgMSAgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDEgIEJlcm5kIEt1aGxzCiAgICAgMSAgQ8OpZHJp
YyBMZSBHb2F0ZXIKICAgICAxICBKYXJra28gU2Fra2luZW4KICAgICAxICBKb2VsIFN0YW5sZXkK
ICAgICAxICBNYXJrdXMgTWF5ZXIKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBm
aWxlOgoKaHR0cDovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lk
PTIwMjIuMDUtcmMyCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
