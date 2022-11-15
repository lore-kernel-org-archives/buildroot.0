Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7CAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 12:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5866081AA7;
	Tue, 15 Nov 2022 12:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5866081AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1M5tVEbd8Gne; Tue, 15 Nov 2022 12:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967AC8133C;
	Tue, 15 Nov 2022 12:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967AC8133C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08E441BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9308606BF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9308606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39lHAvmjYZrl for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 12:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED37C6066D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED37C6066D
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 12:55:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C06340012;
 Tue, 15 Nov 2022 12:55:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvTj-008dSR-7w; Tue, 15 Nov 2022 13:55:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= via buildroot <buildroot@buildroot.org>
References: <20221110140054.252389-1-nunog@fr24.com>
 <20221110140054.252389-2-nunog@fr24.com>
Date: Tue, 15 Nov 2022 13:55:51 +0100
In-Reply-To: <20221110140054.252389-2-nunog@fr24.com> ("Nuno =?utf-8?Q?Gon?=
 =?utf-8?Q?=C3=A7alves?= via
 buildroot"'s message of "Thu, 10 Nov 2022 14:00:54 +0000")
Message-ID: <877czwgyw8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] packages/sudo: explicitly set
 enable-tmpfiles.d
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
Cc: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RA
YnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSWYgc3lzdGVtZCBpcyB0aGUgaW5pdCBzeXN0ZW0g
dGhlIGRpciBpcyBhbHdheXMgL3Vzci9saWIvdG1wZmlsZXMuZC4KID4gT3RoZXJ3aXNlIGV4cGxp
Y2l0bHkgZGlzYWJsZSBwYXRoIGxvb2t1cCB0byBhdm9pZCBpbmNsdWRpbmcgdGhlCiA+IGhvc3Qg
cGF0aC4KCiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+
CgpDb21taXR0ZWQgdG8gMjAyMi4wOC54IGFuZCAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
