Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E6D3C92C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E43180CFF;
	Sat, 19 Oct 2024 20:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnJYvbbyF6N3; Sat, 19 Oct 2024 20:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5267D80CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267D80CF2;
	Sat, 19 Oct 2024 20:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2786F3A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21E4F4041C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9qswxMf8lea for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B7AA40288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B7AA40288
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B7AA40288
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:09:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A8E1E0003;
 Sat, 19 Oct 2024 20:09:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2Fll-00BjcS-0x;
 Sat, 19 Oct 2024 22:09:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien =?utf-8?Q?Th=C3=A9bault?= <damien.thebault@gmail.com>
Cc: buildroot@buildroot.org
References: <6134c505-71a2-4a03-9117-20422d5213c8@gmail.com>
Date: Sat, 19 Oct 2024 22:09:49 +0200
In-Reply-To: <6134c505-71a2-4a03-9117-20422d5213c8@gmail.com> ("Damien
 =?utf-8?Q?Th=C3=A9bault=22's?= message of "Sat, 5 Oct 2024 18:49:44 +0200")
Message-ID: <87ldyjc0s2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-pam: remove flex dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Pj4+Pj4gIkRhbWllbiIgPT0gRGFtaWVuIFRow6liYXVsdCA8ZGFtaWVuLnRoZWJhdWx0QGdtYWls
LmNvbT4gd3JpdGVzOgoKID4gbGludXgtcGFtIDEuMi4wIHJlbW92ZWQgdGhlIHVzZSBvZiB5eXdy
YXAsIHNvIHRoZSBmbGV4IGRlcGVuZGVuY3kgaXMgbm90CiA+IG5lZWRlZCBub3cgKGhvc3QtZmxl
eCBpcyBzdGlsbCBuZWVkZWQpLgoKID4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIFRow6liYXVsdCA8
ZGFtaWVuLnRoZWJhdWx0QGdtYWlsLmNvbT4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLnggYW5kIDIw
MjQuMDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
