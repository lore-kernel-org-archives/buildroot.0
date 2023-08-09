Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF4C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1563C4021E;
	Wed,  9 Aug 2023 17:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1563C4021E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHf-eTaGTPRq; Wed,  9 Aug 2023 17:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD36A41B74;
	Wed,  9 Aug 2023 17:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD36A41B74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40CE51BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1987F61241
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1987F61241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWPny1P6r7HO for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ECC460E5C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ECC460E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21ACCFF803;
 Wed,  9 Aug 2023 17:40:36 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:40:36 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230809194036.49f09e36@windsurf>
In-Reply-To: <20230809074916.305728-1-clement.ramirez@bootlin.com>
References: <20230809074916.305728-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/gtSyOU+ukg4J86agLwebWp4fsCBcdioyZ5X6mYY8A=;
 b=RKm5lUTQERyoBBBXngBZ/fkZfOyxjmV9nQvSLW9RHfnlNjnyhJ44YzCmalEda9MffNdhA5
 fVdA33GJ0VF14TvIrS42Z0AuMccPe8JvrsFKYoPBXxYoFKcbJvzg26/5PgctqSt46D9Zdy
 zbpvmRlgPNNJsvzS8gDyyVy/0rMblT1j4fjkFmva3gWfM7utynrAdP+9D25CUF8iVoVUzk
 9mQ4dhWtk7fp7BS9TmlcHPOkLN7zXa/PWcLRLRan6KqkPB9cNNGwwOCmBh5jTmJvSTjWSo
 efcyLm0JbggvmxFGQ2R+Dw3cBGkSzmQ7yR13PqJtbt+/Fenv4b9iXMpJnIbjJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RKm5lUTQ
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: add DAV1D_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgOSBBdWcgMjAyMyAwOTo0OToxNiArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOnZp
ZGVvbGFuOmRhdjFkIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKPiB0aGlzIHBhY2thZ2U6Cj4g
aHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP25hbWluZ0Zv
cm1hdD0yLjMma2V5d29yZD1kYXYxZAo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJhbWly
ZXogPGNsZW1lbnQucmFtaXJlekBib290bGluLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9kYXYxZC9k
YXYxZC5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
