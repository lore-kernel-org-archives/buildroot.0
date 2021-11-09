Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1672C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DFF61037
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47DFF61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E20414022B;
	Tue,  9 Nov 2021 09:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xg_Bo4cTGS4O; Tue,  9 Nov 2021 09:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03FFD4012D;
	Tue,  9 Nov 2021 09:47:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 154481BF2B0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1015580EC4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM0sfs25MhPe for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 09:47:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29AF280EBF
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 09:47:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A7C7D10000B;
 Tue,  9 Nov 2021 09:47:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mkNjK-0000w0-Sc; Tue, 09 Nov 2021 10:47:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211106091508.29167-1-ps.report@gmx.net>
Date: Tue, 09 Nov 2021 10:47:50 +0100
In-Reply-To: <20211106091508.29167-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 6 Nov 2021 10:15:08 +0100")
Message-ID: <878rxx4q49.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gdb: fix gdb-10.2 compile for
 uclibc < v1.0.35 (getrandom related)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gZml4IGdldHJhbmRvbSBjb21waWxlIGZvciB1Y2xpYmMgPCB2MS4wLjM1LCBhZGQg
bWlzc2luZyBzdGRkZWYuaAogPiAgIGluY2x1ZGUgKGZpeGVkIGluIHVjbGliYyBzaW5jZSB2MS4w
LjM1LCBzZWUgWzFdKQoKID4gRml4ZXM6CgogPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvNmQ0YTYyYzcwM2M4NWRkOTkzZGRiMmQ5MGViZTFmNmNhZDI0ZTBiMAoK
ID4gICAuLi4vaG9zdC94ODZfNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9p
bmNsdWRlL3N5cy9yYW5kb20uaDoyNzozNTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHNp
emVfdOKAmQogPiAgICAgIDI3IHwgZXh0ZXJuIGludCBnZXRyYW5kb20odm9pZCAqX19idWYsIHNp
emVfdCBjb3VudCwgdW5zaWduZWQgaW50IGZsYWdzKQogPiAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgoKID4gWzFdIGh0dHBzOi8vY2dpdC51Y2xpYmMt
bmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD0wMDk3MmMwMmMyYjZlMGE5
NWQ1ZGVmNGE3MWJkZmIxODhlMDkxNzgydAoKID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgoKQ29tbWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4w
OC54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
