Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58EDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8949860AD7;
	Sun, 20 Mar 2022 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YHo10axLyvU; Sun, 20 Mar 2022 18:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23F060BE5;
	Sun, 20 Mar 2022 18:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52CC61BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F8DB60601
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_p9G_vQRhVd for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:24:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CEC7605EE
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:24:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43A4C200004;
 Sun, 20 Mar 2022 18:24:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW0EO-00FFRw-G1; Sun, 20 Mar 2022 19:24:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= via buildroot <buildroot@buildroot.org>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-2-clement.leger@bootlin.com>
Date: Sun, 20 Mar 2022 19:24:44 +0100
In-Reply-To: <20220314153111.1390512-2-clement.leger@bootlin.com>
 (=?utf-8?Q?=22Cl=C3=A9ment=09L=C3=A9ger?= via buildroot"'s message of "Mon,
 14 Mar 2022 16:31:04 +0100")
Message-ID: <8735jco51v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/8] boot/optee-os: add option to select
 DTC dependency
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNsw6ltZW50IiA9PSBDbMOpbWVudCBMw6lnZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRy
b290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IFNvbWUgcGxhdGZvcm1zIChzdG0zMiwgc2Ft
KSBuZWVkcyBEVEMgdG8gYnVpbGQgdGhlIHBsYXRmb3JtCiA+IGRldmljZS10cmVlcy4gQWRkIEJS
Ml9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDIGNvbmZpZ3VyYXRpb24KID4gb3B0aW9uIHRvIHNl
bGVjdCBob3N0LWR0YyBwYWNrYWdlIHdoZW4gYnVpbGRpbmcuCgogPiBTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+CgpDb21taXR0ZWQgdG8g
MjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
