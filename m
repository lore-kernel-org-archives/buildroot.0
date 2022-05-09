Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9979FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2141041504;
	Mon,  9 May 2022 06:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hMULMrVo-D4; Mon,  9 May 2022 06:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FBC414C9;
	Mon,  9 May 2022 06:50:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E26551BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF50C81A65
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4MlWvWtbk3V for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:50:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D643A81A39
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:50:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8B59E100004;
 Mon,  9 May 2022 06:50:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nnxEK-001hJQ-Jg; Mon, 09 May 2022 08:50:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alex <earthquake.de@freenet.de>
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
 <874k221y8l.fsf@dell.be.48ers.dk>
 <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de>
 <87zgjsxujk.fsf@dell.be.48ers.dk>
 <fec240d1-19eb-93fa-24b3-e1292d471605@freenet.de>
 <87a6brhlo3.fsf@dell.be.48ers.dk>
 <7f010cd1-dd28-f72c-7218-623bcdffa4f1@freenet.de>
Date: Mon, 09 May 2022 08:50:52 +0200
In-Reply-To: <7f010cd1-dd28-f72c-7218-623bcdffa4f1@freenet.de> (Alex's message
 of "Mon, 9 May 2022 08:46:56 +0200")
Message-ID: <87wnevfbcj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot host builds with g++
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

Pj4+Pj4gIkFsZXgiID09IEFsZXggIDxlYXJ0aHF1YWtlLmRlQGZyZWVuZXQuZGU+IHdyaXRlczoK
CkhpLAoKID4+ID4gZysrIGlzIGluc3RhbGxlZCBvbiBteSBidWlsZCBtYWNoaW5lIHdoZXJlIEkg
Y3JlYXRlIG15IGJ1aWxkcm9vdCBzeXN0ZW0uCiA+PiA+IFRoZSBwcm9qZWN0IGNvbXBpbGVzIG91
dHNpZGUgb2YgYnVpbGRyb290IG9uIG15IGJ1aWxkIG1hY2hpbmUuCiA+PiA+IERvZXMgYnVpbGRy
b290IGVudmlyb25tZW50IG5lZWQgYSBsaW5rL3ZhcmlhYmxlIHRvIHRoZSBnKysgb24gdGhlCiA+
PiA+IGJ1aWx0IG1hY2hpbmU/CiA+PiAKID4+IEFyZSB5b3Ugc3VyZT8gQmFzZWQgb24gdGhlIGFi
b3ZlLCBpdCBkb2Vzbid0IHNvdW5kIGxpa2UgeW91IGhhdmUgYQogPj4gL3Vzci9iaW4vZysrPwoK
ID4gSW0gc3VyZTogJD53aGljaCBnKysKID4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIC91
c3IvYmluL2crKwoKID4gZysrIGlzIGEgbGluayB3aGljaCBwb2ludHMgb3ZlciBldGMvYWx0ZXJu
YXRpdmVzIHRvCiA+IC91c3IvYmluL3g4Nl82NC1saW51eC1nbnUtZysrLTcKCk9rLCB0aGVuIHlv
dSB3aWxsIG5lZWQgdG8gbG9vayBjbG9zZXIgYXQgdGhlIGJ1aWxkIHN5c3RlbSBvZiB0aGF0CnBh
Y2thZ2UgdG8gdW5kZXJzdGFuZCB3aGF0IGlzIGdvaW5nIG9uLiBQZXJoYXBzIGl0IHBsYXlzIGFy
b3VuZCB3aXRoCkxEX0xJQlJBUllfUEFUSCBvciBzaW1pbGFyPwoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
