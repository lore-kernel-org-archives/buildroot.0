Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92062C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C331845F1;
	Sat,  8 Jun 2024 19:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Web6Hxj5WBYr; Sat,  8 Jun 2024 19:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5864B845F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5864B845F6;
	Sat,  8 Jun 2024 19:12:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 117951BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1B83408D9
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EG87ngvamevJ for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:12:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D42D5408A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42D5408A7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D42D5408A7
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ED0F60002;
 Sat,  8 Jun 2024 19:12:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG1U9-003koD-32;
 Sat, 08 Jun 2024 21:12:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20240605084827.3155371-1-roy.kollen.svendsen@akersolutions.com>
 <20240605090652.3156836-1-roy.kollen.svendsen@akersolutions.com>
Date: Sat, 08 Jun 2024 21:12:17 +0200
In-Reply-To: <20240605090652.3156836-1-roy.kollen.svendsen@akersolutions.com>
 (Roy Kollen Svendsen's message of "Wed, 5 Jun 2024 11:06:51 +0200")
Message-ID: <87a5jvuu3y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.02.x v2] package/libffi: fix host build
 failure
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJveSIgPT0gUm95IEtvbGxlbiBTdmVuZHNlbiA8cm95a29sbGVuc3ZlbmRzZW5AZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBIb3N0IGJ1aWxkIGZhaWxzIG9uIHVwZGF0ZWQgQXJjaCBMaW51
eCBkZXNrdG9wLgogPiBNeSBjdXJyZW50IC91c3IvYmluL2djYyB2ZXJzaW9uIGlzIDE0LjEuMSAy
MDI0MDUyMiwgd2hlcmUKID4gaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb24gY2F1c2UgYnVp
bGQgdG8gZmFpbDoKCiA+IDIwMjQtMDYtMDVUMDc6MDM6MjAgbGlidG9vbDogY29tcGlsZTogIC9o
b21lL3JveS9oeW1hdGVrL2Nvbm5leGktdG91Y2hwYW5lbC1maXJtd2FyZS9teHhmMS9vdXRwdXQv
aG9zdC9iaW4vY2NhY2hlIC91c3IvYmluL2djYyAtREhBVkVfQ09ORklHX0ggLUkuIC1JLi4gLUku
IC1JLi4vaW5jbHVkZSAtSWluY2x1ZGUgLUkuLi9zcmMgLUkvaG9tZS9yb3kvaHltYXRlay9jb25u
ZXhpLXRvdWNocGFuZWwtZmlybXdhcmUvbXh4ZjEvb3V0cHV0L2hvc3QvaW5jbHVkZSAtV2FsbCAt
TzIgLUkvaG9tZS9yb3kvaHltYXRlay9jb25uZXhpLXRvdWNocGFuZWwtZmlybXdhcmUvbXh4ZjEv
b3V0cHV0L2hvc3QvaW5jbHVkZSAtZmV4Y2VwdGlvbnMgLWMgLi4vc3JjL3RyYW1wLmMgIC1mUElD
IC1EUElDIC1vIHNyYy8ubGlicy90cmFtcC5vCiA+IDIwMjQtMDYtMDVUMDc6MDM6MjAgLi4vc3Jj
L3RyYW1wLmM6IEluIGZ1bmN0aW9uIOKAmGZmaV90cmFtcF9nZXRfdGVtcF9maWxl4oCZOgogPiAy
MDI0LTA2LTA1VDA3OjAzOjIwIC4uL3NyYy90cmFtcC5jOjI2MjoyMjogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmG9wZW5fdGVtcF9leGVjX2ZpbGXigJkgWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiA+IDIwMjQtMDYtMDVUMDc6MDM6MjAgMjYyIHwg
ICB0cmFtcF9nbG9iYWxzLmZkID0gb3Blbl90ZW1wX2V4ZWNfZmlsZSAoKTsKID4gMjAyNC0wNi0w
NVQwNzowMzoyMCB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KCiA+
IFBhdGNoIGZyb20gbWFzdGVyIHdhcyBhZGRlZCB0byBmaXggYnVpbGQuCgogPiBTaWduZWQtb2Zm
LWJ5OiBSb3kgS29sbGVuIFN2ZW5kc2VuIDxyb3kua29sbGVuLnN2ZW5kc2VuQGFrZXJzb2x1dGlv
bnMuY29tPgogPiAtLS0KID4gbWFzdGVyIGFuZCBuZXh0IGFyZSBub3QgYWZmZWN0ZWQgYXMgdGhl
IHZlcnNpb24gd2FzIGJ1bXBlZAoKID4gQ2hhbmdlcyB2MSAtPiB2MjoKID4gICAtIFVzZSBsb3dl
cmNhc2UgbGV0dGVyIGF0IHN0YXJ0IG9mIGNvbW1pdCBtZXNzYWdlCgpDb21taXR0ZWQgdG8gMjAy
NC4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
