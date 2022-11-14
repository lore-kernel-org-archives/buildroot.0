Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77190C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DBC813E1;
	Mon, 14 Nov 2022 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8DBC813E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrR0yyCT7vfG; Mon, 14 Nov 2022 21:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205F381359;
	Mon, 14 Nov 2022 21:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205F381359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D8E1BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF074035C
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF074035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCsX6BUsZ2yt for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:31:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 702C14035B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 702C14035B
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:31:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FB78FF803;
 Mon, 14 Nov 2022 21:31:41 +0000 (UTC)
Date: Mon, 14 Nov 2022 22:31:40 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221114223140.49169eef@windsurf>
In-Reply-To: <20221012202317.2898868-1-thomas.petazzoni@bootlin.com>
References: <20221012202317.2898868-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668461501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxaEy787sqniyOd8g51z+Kb2p8I43MlATGFYk1POhi0=;
 b=OLCymyRCavnN2BV+sbEg8iULpOKCz7JF11gO0dqkuZ/B4X8Ps21Rbh0kHO5UQ9v5ECRYix
 QljfYsv4VnXzL5AHya7w4q+7Xr3tnaygEUXbTdL2nFRdsFOoH7ENa9iuJunWmATEPGA41i
 fa7HyYRUH6/mAvCr3rKAdu1KWS25IZGCeFEUxyAvLwoRJLhWjCtgF7w6H1YnH/rlgcD7fk
 QgzZTfVsykC5+axkdjn5aTTT4Qp37ZCqZBU3lZ4LBMoZFF69hi0dyeyWh6035C8kq/3uDi
 b1nuAjsIzReLznwGLtJri+e1E2wwl/MXgkiHskjxQks7WD16xNQ+wZJ1kP+62g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OLCymyRC
Subject: Re: [Buildroot] [PATCH 1/2] package/lttng-modules: enable
 CONFIG_FTRACE in kernel configuration
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
Cc: =?UTF-8?B?Q2zDqW1l?= =?UTF-8?B?bnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMiBPY3QgMjAyMiAyMjoyMzoxNiArMDIwMApUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gVGhlIGJ1aWxkIG9m
IGx0dG5nLW1vZHVsZXMgd2lsbCBmYWlsIGlmIHRoZSBrZXJuZWwgZG9lcyBub3QgaGF2ZQo+IENP
TkZJR19UUkFDRVBPSU5UUyBlbmFibGVkLiBIb3dldmVyLCBDT05GSUdfVFJBQ0VQT0lOVFMgaXMg
YQo+IHByb21wdC1sZXNzIG9wdGlvbiwgYW5kIHRoZSBtb3N0IGdlbmVyaWMgb3B0aW9uIHRoYXQg
ZG9lcyBlbmFibGUKPiBDT05GSUdfVFJBQ0VQT0lOVFMgaXMgQ09ORklHX0ZUUkFDRS4KPiAKPiBJ
biBhZGRpdGlvbiwgQ09ORklHX0ZUUkFDRSB3aWxsIGFsc28gZW5hYmxlIENPTkZJR19TVEFDS1RS
QUNFLCB3aGljaAo+IGlzIG5lZWRlZCBvbiBDUFUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IHBy
b3ZpZGUgdGhlIFNUQUNLV0FMSwo+IG1lY2hhbmlzbSBpbiB0aGUga2VybmVsLCBhcyBpcyB0aGUg
Y2FzZSBvbiBBUk0gMzItYml0IGZvciBleGFtcGxlLgo+IAo+IFRoZXJlZm9yZSwgbGV0J3MgZW5h
YmxlIENPTkZJR19GVFJBQ0Ugd2hlbiBidWlsZGluZyBsdHRuZy1tb2R1bGVzLgo+IAo+IENjOiBD
bMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gUmVwb3J0ZWQtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0t
LQo+ICBwYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tayB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkJvdGggYXBwbGllZCB0byBuZXh0IQoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
