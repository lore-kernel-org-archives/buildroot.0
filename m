Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D64FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D004080BE1;
	Sun, 20 Mar 2022 18:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpOqD5HeSv5l; Sun, 20 Mar 2022 18:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F7380BC9;
	Sun, 20 Mar 2022 18:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 808DC1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC7480BC0
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CffUc_kLDaLD for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:23:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89E0480BA5
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:23:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 332EE200003;
 Sun, 20 Mar 2022 18:23:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW0DK-00FFPa-Dr; Sun, 20 Mar 2022 19:23:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
 <20220225230519.1584174-2-fontaine.fabrice@gmail.com>
Date: Sun, 20 Mar 2022 19:23:38 +0100
In-Reply-To: <20220225230519.1584174-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Feb 2022 00:05:19 +0100")
Message-ID: <877d8oo53p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/zabbix: netsnmp needs mib
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBuZXRzbm1wIHN1cHBvcnQgbmVlZHMgbWliIHRvIGF2b2lkIHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSByYWlzZWQKID4gc2luY2UgdGhlIGFkZGl0aW9uIG9m
IHRoZSBwYWNrYWdlIGluIGNvbW1pdAogPiA0MjM4MmExNzEyNzdlYWQ1OWUzNjVmNTkyMGU3NTdm
MDFjMDRhYzc3OgoKID4gY2hlY2tzX3NubXAuYzogSW4gZnVuY3Rpb24g4oCYemJ4X3NubXBfZ2V0
X29jdGV0X3N0cmluZ+KAmToKID4gY2hlY2tzX3NubXAuYzo2OTQ6MzU6IGVycm9yOiBpbnZhbGlk
IHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgdHJlZeKAmQogPiAgIDY5NCB8ICBoaW50
ID0gKE5VTEwgIT0gc3VidHJlZSA/IHN1YnRyZWUtPmhpbnQgOiBOVUxMKTsKID4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KCiA+IEZpeGVzOgogPiAgLSBObyBh
dXRvYnVpbGRlciBmYWlsdXJlcyAoeWV0KQoKID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpDb21taXR0ZWQgdG8gMjAyMi4wMi54
LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
