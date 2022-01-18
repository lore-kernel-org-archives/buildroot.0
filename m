Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F624C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 11:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C19D60C2E;
	Tue, 18 Jan 2022 11:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qdl9lGpce09g; Tue, 18 Jan 2022 11:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB5760A97;
	Tue, 18 Jan 2022 11:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83EEF1BF5B5
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72554408B1
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8ldGcVKPltz for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 11:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B68E40872
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 11:19:58 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e79so2588456iof.13
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3eTNSowjasakm1rHY8FOzWUYT+wKb2vA9ZU+XCas9KA=;
 b=K/pqu+92FQTHmtd/cUFr3qsDx4L5dYfhBOOiMXGRL2xLquBQNXVG9GzqeRa2+LvjtP
 NHmBvLCSiR21u+h0gIIr5XTcUgPdvfFKA1gcRoiJipL9/b42o0BqvWCryNNQPqTNzVcS
 UFjpIeV66ST4EnDXVAlZdfHAcW80yOjcLIYva/KSKoMIEy5gRvMdLw9KvL5py92fCj06
 IOiOc9ibmsMsbPAbE+OqkGb/wUEoooWk2L9GDUO1jQ38VwjMAVyXEopnw4IN46aVfw/1
 ReF7TCjyghdenGaPif+RkQsXSMHzplphptVZPA8Yx62PtVEcHIQY37cP3HS43XsVOw6E
 gfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3eTNSowjasakm1rHY8FOzWUYT+wKb2vA9ZU+XCas9KA=;
 b=KOCtzQPjffVngh0I4GGiRaJTnqXNi5WjBFuR1yHkKynk9LqCJXRGhd7rLAI5yupdj3
 XVyitOOHNkAv4SZX/Gzh62uUv9aZed8J4KQnb2YUeM+0A+VmU0Rm1Dq7s7FXyFucaIZP
 NzyVBZ89rCgxeMUzIKs+aiP0Gqcn4a4JWPcPj/P1tdSFBf0zYZISWH5J0ooq7wWE7mN4
 tI4r1VXEv0Zk6pP3xlRkJRnIYend+djLcJAkcByMmmczq1AruBYeN4yyItPSz6V0T6PV
 eG8C6bU5oqOBR6NtdJ8lwWOkVUxjT/yHaAF9K0+KFWRGJ3cUQ8B4fLrDP9gne1pyIzaI
 UZPA==
X-Gm-Message-State: AOAM532CwqjV/wwdjYDs/FMvTLKcH4QOy2B8CxaXJgmErkmwdhYpYsRZ
 Li4ozsS6bA+s/AZ0pkmDs5S4ht1B/Nh+Z6A2jS6EL1P7/yQz4g==
X-Google-Smtp-Source: ABdhPJwXKPhiIsFt8cEQ6Kjf+gqkP2j1RCuaSNgDkpwtJrHQgZk5lXJdb75fdE0YUfLy3QHaIXcEjpcAZU96adOxnig=
X-Received: by 2002:a6b:1545:: with SMTP id 66mr12146494iov.62.1642504797418; 
 Tue, 18 Jan 2022 03:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-7-patrickdepinguin@gmail.com>
In-Reply-To: <20220115200306.14037-7-patrickdepinguin@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Jan 2022 12:19:46 +0100
Message-ID: <CAAXf6LU949oVpaUvM=q8t8jZzTNXHWoLDu0gB3BdTEudK+6G7Q@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>, romain.naour@gmail.com
Subject: Re: [Buildroot] [PATCHv2 6/7] configs: add new qemu defconfig
 'x86_multilib'
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpFbCBzw6FiLCAxNSBlbmUgMjAyMiBhIGxhcyAyMTowMywgVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUKKDxwYXRyaWNrZGVwaW5ndWluQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IEZyb206
IFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5j
b20+Cj4KPiBBZGQgYSBuZXcgcWVtdSBkZWZjb25maWcgZm9yIGFuIHg4Nl82NCB0YXJnZXQgdGhh
dCB3aWxsIHJ1biBhbiB4ODZfNjQga2VybmVsCj4gYnV0IHVzZXJzcGFjZSBpbiAzMi1iaXQgKHg4
NikgbW9kZSwgdXNpbmcgQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lh
LmNvbT4KPiAtLS0KPgo+IE5vdGUgdGhhdCB0aGUgZGVmY29uZmlnIHJlZmVycyB0byBhIHRvb2xj
aGFpbiBhdAo+IGF1dG9idWlsZC5idWlsZHJvb3Qub3JnLCBidXQgaXMgbm90IHlldCBwcmVzZW50
IGF0IHRoYXQgbG9jYXRpb24uCj4gSSB1cGxvYWRlZCB0aGUgdG9vbGNoYWluIHRlbXBvcmFyaWx5
IHRvOgo+IGh0dHA6Ly9wYXRyaWNrZGVwaW5ndWluLmNvbS9jdG5nLTY3MzdjZmFhOGNlNi14ODZf
bXVsdGlsaWItZ2xpYmMtZ2NjMTEudGFyLnh6Cj4gbWQ1c3VtOmIwODVjMGQ4ZjEzN2MwNzhmOGYw
OWQxMTZkODM2NGY4Cj4gc2hhMjU2c3VtIDJhNTI0MWQ5Mjc0MjM5NTMyZTQ0ZDM3YzY1NTA5OTMx
ZmJjMTIwZGI1OTkxNDEyZjk0NmViMzgxNzZkYjRkYzIKPgo+CgpSb21haW4gTmFvdXIgbm90aWZp
ZWQgbWUgdGhhdCB0aGlzIHRvb2xjaGFpbiBkb2VzIG5vdCBydW4gb24gdGhlIEdDQwpGYXJtIChJ
bGxlZ2FsIGluc3RydWN0aW9uKSBzbyBJIG1hZGUgYSBuZXcgdmVyc2lvbiwgY3VycmVudGx5IHVw
bG9hZGVkCmF0OgpodHRwOi8vcGF0cmlja2RlcGluZ3Vpbi5jb20vY3RuZy02NzM3Y2ZhYThjZTYt
eDg2X211bHRpbGliLWdsaWJjLWdjYzExLTIudGFyLnh6Cm1kNXN1bTogIDNjZWU2NGY4MjY3NTQ0
NmFkMjU1ZjZjMTY1Nzg2ZWI1CnNoYTI1NnN1bTogNjcxNWJmYmMxOTU1ODhiNjQ4M2QzOWU5ZWM2
ZDcwNjExY2FjM2I5OWJmMmRkMzRmZWRiZWQwZDRlNmM3ZWRjMQoKQmVzdCByZWdhcmRzLApUaG9t
YXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
